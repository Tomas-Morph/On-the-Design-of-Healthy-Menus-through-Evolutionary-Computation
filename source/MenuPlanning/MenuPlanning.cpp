
#include "MenuPlanning.h"

int MenuPlanning::nDias;
int MenuPlanning::nParam;
int MenuPlanning::nObj;

vector< pair<double, double> > MenuPlanning::ingRecomendada;
vector<double> MenuPlanning::penalizaciones;

vector<infoPlatos> MenuPlanning::v_primerosPlatos;
vector<infoPlatos> MenuPlanning::v_segundosPlatos;
vector<infoPlatos> MenuPlanning::v_postres;
vector< pair<int, int> > MenuPlanning::gruposAl;
vector< vector< vector<double> > > MenuPlanning::v3_compatibilidadPlatos;

vector<string> MenuPlanning::alergenosPlan;
vector<string> MenuPlanning::incompatibilidadesPlan;
vector<int> MenuPlanning::gruposAlPlan;
vector<double> MenuPlanning::infoNPlan;

int MenuPlanning::i_max = numeric_limits<int>::max();


/*-------------------------------------*/
/*---------- INICIALIZACION -----------*/
/*-------------------------------------*/
bool MenuPlanning::init(const vector<string> &params) {
	
	if (params.size() != 1) {
		cout << "Error Menu Planning: numero incorrecto de parametros." << endl;
		return false;
	}
	
	nDias = atoi((params[0]).c_str());
	nParam = nDias * num_tipoPlato;						//Multiplicar nDias por tipos de platos (3)
	setNumberOfVar(nParam);
	nObj = num_obj;								//Numero de objetivos (2: precio, grado de repeticion)
	setNumberOfObj(nObj);
	
	set_penalizaciones();
	set_gruposAl();
	set_ingestaRecomedada();
	set_Platos();
	//mostrarPlatos();
	set_vectorCompatibilidad();
	
	infoNPlan.assign(num_nutr, 0);
	alergenosPlan.assign(num_alerg, "0");
	incompatibilidadesPlan.assign(num_incomp, "0");
	
	return true;
}


/*-------------------------------------*/
/*---------- PENALIZACIONES -----------*/
/*-------------------------------------*/
void MenuPlanning::set_penalizaciones(void)
{
	penalizaciones.push_back(p_otros);			//otros
	penalizaciones.push_back(p_carnes);			//carnes
	penalizaciones.push_back(p_cereales);		//cereales	
	penalizaciones.push_back(p_frutas);			//frutas	
	penalizaciones.push_back(p_lacteos);		//lacteos	
	penalizaciones.push_back(p_legumbres);		//legumbres
	penalizaciones.push_back(p_marisco);		//mariscos
	penalizaciones.push_back(p_pasta);			//pastas
	penalizaciones.push_back(p_pescado);		//pescados
	penalizaciones.push_back(p_verdura);		//verduras
	penalizaciones.push_back(p_1d);				//1 dia
	penalizaciones.push_back(p_2d);				//2 dias
	penalizaciones.push_back(p_3d);				//3 dias
	penalizaciones.push_back(p_4d);				//4 dias
	penalizaciones.push_back(p_5d);				//5 dias
	penalizaciones.push_back(p_pp);				//primer platos
	penalizaciones.push_back(p_sp);				//segundo plato
	penalizaciones.push_back(p_p);				//postre
}

/*------------------------------------------*/
/*---------- GRUPOS ALIMENTICIOS -----------*/
/*------------------------------------------*/
void MenuPlanning::set_gruposAl(void)
{
	pair<int,int> ga;
	ga.first = i_max;
	ga.second = i_max;
	
	gruposAl.assign(num_gAl, ga);
}


/*-----------------------------------------*/
/*---------- VECTORES DE PLATOS -----------*/
/*-----------------------------------------*/
void MenuPlanning::set_VectoresPlatos(const char* c_filename, vector<infoPlatos> &v_vecP)
{
	ifstream ifs;
	int i;
	int cont = 1;
	
	ifs.open(c_filename, ifstream::in);
	if (ifs.is_open())
	{
		while (ifs.good())
		{
			string str;
			infoPlatos ip;
			
			getline(ifs, str, ','); ip.nombre = str;															//Nombre del plato
			getline(ifs, str, ','); ip.precio = atof(str.c_str());												//Precio
			getline(ifs, str, ','); ip.cantidad = atof(str.c_str());											//Cantidad
			ip.diasRep = i_max;																					//Dias desde que se repitio
			
			for(i = 0; i < num_alerg; i++)	{ getline(ifs, str, ','); ip.alg.push_back(str); }							//Alergenos
			for(i = 0; i < num_incomp; i++)	{ getline(ifs, str, ','); ip.inc.push_back(str); }							//Incompatibilidades
			for(i = 0; i < num_nutr; i++)	{ getline(ifs, str, ','); ip.infoN.push_back(atof(str.c_str())); }			//Informacion nutricional
			
			getline(ifs, str, ','); 
			while(str != "*" && !ifs.eof())
			{ 
				ip.gruposAl.push_back(atoi(str.c_str()));	
				getline(ifs, str, ',');	
				
				for(int x = 0; x < str.size(); x++)
					if(str.at(x) == '\n')
					str = "*";
			}
			
			v_vecP.push_back(ip);
		}
		ifs.close();
	}
	else
	{
		cout << "\n\nError. No se han podido leer los archivos de platos.";
		cin.get();
		exit(0);
	}
}

/*------------------------------------------*/
/*---------- INGESTA RECOMENDADA -----------*/
/*------------------------------------------*/
void MenuPlanning::set_ingestaRecomedada(void)
{
	pair<double,double> ir;
	
	ir.first = ir.second = ingR_acFol; 	ingRecomendada.push_back(ir);			//acido folico
	ir.first = ir.second = ingR_cal; 	ingRecomendada.push_back(ir);			//calcio
	ir.first = ir.second = ingR_en; 	ingRecomendada.push_back(ir);			//energia
	ir.first = ir.second = ingR_fos; 	ingRecomendada.push_back(ir);			//fosforo
	ir.first = ir.second = ingR_gra; 	ingRecomendada.push_back(ir);			//grasa
	ir.first = ir.second = ingR_hie; 	ingRecomendada.push_back(ir);			//hierro
	ir.first = ir.second = ingR_mag; 	ingRecomendada.push_back(ir);			//magnesio
	ir.first = ir.second = ingR_pot; 	ingRecomendada.push_back(ir);			//potasio
	ir.first = ir.second = ingR_pro; 	ingRecomendada.push_back(ir);			//proteinas
	ir.first = ir.second = ingR_sel; 	ingRecomendada.push_back(ir);			//selenio
	ir.first = ir.second = ingR_sod; 	ingRecomendada.push_back(ir);			//sodio
	ir.first = ir.second = ingR_vA; 	ingRecomendada.push_back(ir);			//vitA
	ir.first = ir.second = ingR_vB1; 	ingRecomendada.push_back(ir);			//vitB1
	ir.first = ir.second = ingR_vB2; 	ingRecomendada.push_back(ir);			//vitB2
	ir.first = ir.second = ingR_vB6; 	ingRecomendada.push_back(ir);			//vitB6
	ir.first = ir.second = ingR_vB12; 	ingRecomendada.push_back(ir);			//vitB12
	ir.first = ir.second = ingR_vC; 	ingRecomendada.push_back(ir);			//vitC
	ir.first = ir.second = ingR_vD; 	ingRecomendada.push_back(ir);			//vitD
	ir.first = ir.second = ingR_vE; 	ingRecomendada.push_back(ir);			//vitE
	ir.first = ir.second = ingR_yod; 	ingRecomendada.push_back(ir);			//yodo
	ir.first = ir.second = ingR_zin; 	ingRecomendada.push_back(ir);			//zinc
	
	
	for(int i = 0; i < ingRecomendada.size(); i++)
	{
		ir.first = (ingRecomendada[i].first - ingRecomendada[i].first/ingR_rangMin) * nDias;
		ir.second = (ingRecomendada[i].second * ingR_rangMax) * nDias;
		ingRecomendada[i] = ir;
	}
}


/*--------------------------------------------*/
/*---------- COMPATIBILIDAD PLATOS -----------*/
/*--------------------------------------------*/
void MenuPlanning::set_vectorCompatibilidad(void)
{
	vector<double> sz(v_postres.size(), 0.0);                                     	//Vector de postres
	vector< vector<double> > sz2(v_segundosPlatos.size(), sz);                 		//Plano de postres y segundos platos
	v3_compatibilidadPlatos.assign(v_primerosPlatos.size(), sz2);                   //Prisma rectangular de primeros, segundos platos y postres
	
	vector<bool> gaElegidos;
	
	for(int y = 0; y < v_primerosPlatos.size(); y++)
		for(int x = 0; x < v_segundosPlatos.size(); x++)
			for(int z = 0; z < v_postres.size(); z++)
			{
				gaElegidos.clear();
				gaElegidos.assign(num_gAl,false);
				set_GAElegidos(v_primerosPlatos[y].gruposAl, gaElegidos);
				v3_compatibilidadPlatos[y][x][z] = set_penalizacionVC(v_segundosPlatos[x].gruposAl, gaElegidos);
				set_GAElegidos(v_segundosPlatos[x].gruposAl, gaElegidos);
				v3_compatibilidadPlatos[y][x][z] += set_penalizacionVC(v_postres[z].gruposAl, gaElegidos);
			}
}

void MenuPlanning::set_GAElegidos(vector<int> gal, vector<bool> &galE)
{
	for(int i = 0; i < gal.size(); i++)
		galE[gal[i]] = true;
}

double MenuPlanning::set_penalizacionVC(vector<int> &gal, vector<bool> galE)
{
	double resultado = 0.0;
	for(int i = 0; i < gal.size(); i++)
	{
		if(galE[gal[i]])
			switch(gal[i])
			{
				case 0:	resultado += penalizaciones[0]; break;
				case 1:	resultado += penalizaciones[1]; break;
				case 2: resultado += penalizaciones[2]; break;
				case 3:	resultado += penalizaciones[3]; break;
				case 4:	resultado += penalizaciones[4]; break;
				case 5:	resultado += penalizaciones[5]; break;
				case 6:	resultado += penalizaciones[6]; break;
				case 7:	resultado += penalizaciones[7]; break;
				case 8:	resultado += penalizaciones[8]; break;
				case 9:	resultado += penalizaciones[9]; break;
			}
	}
	return resultado;
}



/*--------------------------------------------------------*/
/*---------- GENERACION ALEATORIA DE INDIVIDUO -----------*/
/*--------------------------------------------------------*/
void MenuPlanning::restart(void)
{	
	for(int i = 0; i < nParam; i++)
		setVar(i, (double)(rand() % (int)getMaximum(i)));
}


/*---------------------------------------------*/
/*---------- CLONACION DE INDIVIDUO -----------*/
/*---------------------------------------------*/
Individual* MenuPlanning::clone(void) const 
{
	return new MenuPlanning();
}

/*----------------------------------------*/
/*---------- OPERADOR DE CRUCE -----------*/
/*----------------------------------------*/
void MenuPlanning::dependentCrossover(Individual* ind)
{
	crossover_uniform(ind);
	((MenuPlanning*)ind)->repair();
	repair();
}

/*-------------------------------------------*/
/*---------- OPERADOR DE MUTACION -----------*/
/*-------------------------------------------*/
void MenuPlanning::dependentMutation(double pm)
{
	int x;
	bool mod = false;
	for(int i = 0; i < nDias; i++)
	{
		x = rand() % 100;
		if(x < (pm*100))
		{
			setVar(i*num_tipoPlato, 	rand() % v_primerosPlatos.size());
			setVar(i*num_tipoPlato+1, 	rand() % v_segundosPlatos.size());
			setVar(i*num_tipoPlato+2, 	rand() % v_postres.size());
			mod = true;
		}
	}
	if(mod)
		repair();
}


/*----------------------------------------------*/
/*---------- REPARACION DE INDIVIDUO -----------*/
/*----------------------------------------------*/
void MenuPlanning::repair(void)
{
	bool mod = false;	
		
	while(!checkInfoN2())
	{
		for(int i = 0; i < nDias; i++)
		{
			setVar(i*num_tipoPlato, 	rand() % v_primerosPlatos.size());
			setVar(i*num_tipoPlato+1, 	rand() % v_segundosPlatos.size());
			setVar(i*num_tipoPlato+2, 	rand() % v_postres.size());
		}
		mod = true;
	}

	if(mod)
		evaluate();	
}

/*-----------------------------------------------------------------*/
/*---------- COMPRUEBA EL CUMPLIMIENTO DE RESTRICCIONES -----------*/
/*-----------------------------------------------------------------*/
bool MenuPlanning::checkInfoN(const int i)
{
	double aux;
	for(int j = 0; j < num_nutr; j++)
	{
		aux = v_primerosPlatos[getVar(i*num_tipoPlato)].infoN[j] + v_segundosPlatos[getVar(i*num_tipoPlato+1)].infoN[j] + v_postres[getVar(i*num_tipoPlato+2)].infoN[j];
		if(aux < ingRecomendada[j].first || aux > ingRecomendada[j].second)
			return false;
	}
	return true;
}

bool MenuPlanning::checkInfoN2(void)
{
	double aux;
	for(int j = 0; j < num_nutr; j++)
	{
		aux = 0;
		for(int i = 0; i < nDias; i++)
		{
			aux += v_primerosPlatos[getVar(i*num_tipoPlato)].infoN[j] + v_segundosPlatos[getVar(i*num_tipoPlato+1)].infoN[j] + v_postres[getVar(i*num_tipoPlato+2)].infoN[j];
		}
		if(aux < ingRecomendada[j].first || aux > ingRecomendada[j].second)
			return false;
	}
	return true;
}


/*-----------------------------------------------*/
/*---------- EVALUACION DEL INDIVIDUO -----------*/
/*-----------------------------------------------*/
void MenuPlanning::evaluate(void)
{
	double precioTotal = 0;
	double valPP, valSP, valP, valTabla, valGAFirst;
	double numPP = penalizaciones[15];
	double numSP = penalizaciones[16];
	double numP = penalizaciones[17];
	
	double  valTotal = 0;
	vector<int> gaElegidos;                                                                                //Vector que guarda los grupos alimenticios pertenecientes a los platos elegidos
	vector<int> gaElegidosAnterior;                                                                        //Vector que guarda los ga pertenecientes al menu de la iteracion anterior
	vector<vector<int> > ultimos5GA; 
	int x = 0;
	
	for(int i = 0; i < nDias; i++)
	{
		x = i*num_tipoPlato;
		
		//- PRECIO -------------------------------------------------------------------------------------------------------------
		precioTotal += v_primerosPlatos[getVar(x)].precio + v_segundosPlatos[getVar(x+1)].precio + v_postres[getVar(x+2)].precio;
		
		//- INFORMACION NUTRICIONAL --------------------------------------------------------------------------------------------
		for(int j = 0; j < infoNPlan.size(); j++)
			infoNPlan[j] +=  v_primerosPlatos[getVar(x)].infoN[j] + v_segundosPlatos[getVar(x+1)].infoN[j] + v_postres[getVar(x+2)].infoN[j];
	}
	setObj(0,precioTotal);
	

		//- GRADO DE REPETICION -----------------------------------------------------------------------------------------------------
	for(int i = 0; i < nDias; i++)
	{
		x = i*num_tipoPlato;
		
		//PRIMER PLATO
		valPP = setValorPP(getVar(x));                                          //Numero de dias desde que se repitio el plato seleccionado
		for(int j = 0; j < v_primerosPlatos[getVar(x)].gruposAl.size(); j++)                      //Numero de dias desde que se repitio el grupo alimenticio
		{
			//comprueba si ya habia aparecido en el menu el grupo alimenticio j, si no lo a�ade al vector gaElegidos
			if(gaElegidosPorIteracion(gaElegidos, v_primerosPlatos[getVar(x)].gruposAl[j]))
				gaElegidos.push_back(v_primerosPlatos[getVar(x)].gruposAl[j]);
		}
		
		//SEGUNDO PLATO
		valSP = setValorSP(getVar(x+1));
		for(int k = 0; k < v_segundosPlatos[getVar(x+1)].gruposAl.size(); k++)
		{
			if(gaElegidosPorIteracion(gaElegidos, v_segundosPlatos[getVar(x+1)].gruposAl[k]))
				gaElegidos.push_back(v_segundosPlatos[getVar(x+1)].gruposAl[k]);
		}
		
		//POSTRE
		valP = setValorP(getVar(x+2));
		for(int l = 0; l < v_postres[getVar(x+2)].gruposAl.size(); l++)
		{
			if(gaElegidosPorIteracion(gaElegidos, v_postres[getVar(x+2)].gruposAl[l]))
				gaElegidos.push_back(v_postres[getVar(x+2)].gruposAl[l]);
		}

		valTabla = v3_compatibilidadPlatos[getVar(x)][getVar(x+1)][getVar(x+2)];							//Obtener el valor de la tabla de platos de compatibilidad entre primeros y segundos platos
		valGAFirst = set_ValorGAFirstAlternativa(ultimos5GA, gaElegidos);									//Obtener el valor total del numero de dias desde que se repitieron grupos alimenticios
		valTotal += valTabla + numPP/valPP + numSP/valSP + numP/valP + valGAFirst;
		
		sumValorPP();                                                                                       //Suma los valores de platos y grupos alimenticios elegidos para el siguiente dia
		sumValorSP();
		sumValorP();
		sumValorGA();
		
		set_ultimos5GA(ultimos5GA, gaElegidos);
		gaElegidosAnterior = gaElegidos;
		gaElegidos.clear();
	}
	
	ultimos5GA.clear();
	gaElegidosAnterior.clear();
	
	
	setObj(1,valTotal);
}


/*----------------------------------------------------------------------*/
/*---------- METODOS PARA EL CALCULO DEL GRADO DE REPETICION -----------*/
/*----------------------------------------------------------------------*/

bool MenuPlanning::gaElegidosPorIteracion(vector<int> vec, int valor)
{
	bool resultado = true;
	for(int i = 0; i < vec.size(); i++)
		if(vec[i] == valor)
		resultado = false;
	return resultado;
}

int MenuPlanning::setValorPP(int id)
{
	int valor = i_max;                       				//Tengo que retornar el numero de dias desde que se eligio el plato por ultima vez
	if(v_primerosPlatos[id].diasRep != i_max)                //Si el numero de dias es i_max, significa que nunca se ha elegido, por lo que retorno 0
		valor = v_primerosPlatos[id].diasRep;               //Si el numero de dias es distinto a i_max, retorno el valor y reseteo el numero de dias a 0
	v_primerosPlatos[id].diasRep = 0;
	
	return valor;
}

int MenuPlanning::setValorSP(int id)
{
	int valor = i_max;
	if(v_segundosPlatos[id].diasRep != i_max)
		valor = v_segundosPlatos[id].diasRep;
	v_segundosPlatos[id].diasRep = 0;
	
	return valor;
}

int MenuPlanning::setValorP(int id)
{
	int valor = i_max;
	if(v_postres[id].diasRep != i_max)
		valor = v_postres[id].diasRep;
	v_postres[id].diasRep = 0;
	
	return valor;
}

void MenuPlanning::sumValorPP(void)
{
	for(int i = 0; i < v_primerosPlatos.size(); i++)
		if(v_primerosPlatos[i].diasRep != i_max)
		v_primerosPlatos[i].diasRep++;
}

void MenuPlanning::sumValorSP(void)
{
	for(int i = 0; i < v_segundosPlatos.size(); i++)
		if(v_segundosPlatos[i].diasRep != i_max)
		v_segundosPlatos[i].diasRep++;
}

void MenuPlanning::sumValorP(void)
{
	for(int i = 0; i < v_postres.size(); i++)
		if(v_postres[i].diasRep != i_max)
		v_postres[i].diasRep++;
}

void MenuPlanning::sumValorGA(void)
{
	for(int i = 0; i < gruposAl.size(); i++)
	{
		if(gruposAl[i].first != i_max)
			gruposAl[i].first++;
		gruposAl[i].second = i_max;
	}
}

//METODO PARA ANIADIR LOS GA DE UN DIA EN EL VECTOR DE GAS DE LOS ULTIMOS 5 DIAS
void MenuPlanning::set_ultimos5GA(vector<vector<int> > &ultimos5GA, vector<int> vec)
{
	if(ultimos5GA.size() < 5)
		ultimos5GA.push_back(vec);
	else
	{
		ultimos5GA.erase(ultimos5GA.begin());
		ultimos5GA.push_back(vec);
	}
}

double MenuPlanning::set_ValorGAFirstAlternativa(vector<vector<int> > &ultimos5GA, vector<int> vec)
{
	/* 0 Otros, 1 Carne, 2 Cereal, 3 Fruta, 4 Lacteo, 5 Legumbre, 6 Marisco, 7 Pasta, 8 Pescado, 9 Verdura */
	double penalizacionPorGA[10] = {penalizaciones[0],penalizaciones[1],penalizaciones[2],penalizaciones[3],penalizaciones[4],penalizaciones[5],penalizaciones[6],penalizaciones[7],penalizaciones[8],penalizaciones[9]};
	double penalizacionPorDias[5] = {penalizaciones[10],penalizaciones[11],penalizaciones[12],penalizaciones[13],penalizaciones[14]};
	bool pen[5] = {false, false, false, false, false};
	double resultado = 0;
	
	if(ultimos5GA.size() > 0)
	{
		for(int i = 0; i < vec.size(); i++)
		{
			for(int j = 0; j < ultimos5GA.size(); j++)
				for(int k = 0; k < ultimos5GA[j].size(); k++)
			{
				if(vec[i] == ultimos5GA[j][k])
				{
					pen[j] = true;
					resultado += penalizacionPorGA[vec[i]];
				}
			}
		}
		for(int x = 0; x < 5; x++)
			if(pen[x])
		{
			resultado += penalizacionPorDias[x];
			pen[x] = false;
		}
	}
	
	return resultado;
}
