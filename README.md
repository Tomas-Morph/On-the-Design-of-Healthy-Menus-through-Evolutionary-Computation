# On the Design of Healthy Menus through Evolutionary Computation

**Coromoto León** (cleon@ull.edu.es) </br>
Departamento de Ingeniería Informática y de Sistemas, Universidad de La Laguna, Spain.

**Gara Miranda** (gmiranda@ull.edu.es) </br>
Departamento de Ingeniería Informática y de Sistemas, Universidad de La Laguna, Spain.

**Eduardo Segredo** (e.segredo@napier.ac.uk / esegredo@ull.edu.es) </br>
School of Computing, Edinburgh Napier University, United Kingdom. </br>
Departamento de Ingeniería Informática y de Sistemas, Universidad de La Laguna, Spain.

**Casiano Rodríguez** (crguezl@ull.edu.es) </br>
Departamento de Ingeniería Informática y de Sistemas, Universidad de La Laguna, Spain.

**Juan Manuel Ramos** (jramospe@ull.edu.es) </br>
Departamento de Ingeniería Informática y de Sistemas, Universidad de La Laguna, Spain.

</br></br>
### Abstract

In this paper we propose a novel multi-objective formulation for the Menu Planning Problem (MPP).

Menu planning has great interest in the field of health due to the importance of correct nutrition in today's society, and particularly, at school canteens.

Most of the related literature in menu planning deal with single-objective formulations of the problem, mainly focused on the minimisation of the menu cost, while a set of constraints have to be satisfied.

In the current work, in addition to consider the cost as an objective, we also introduce a second objective function aimed to minimise the degree of repetition of the courses that shape the final planning.

The motivation behind the above is to offer a planning that is not only economic, but also varied and balanced from the nutritional point of view. In general people need non-repetitive meals not only for health reasons but also in order to avoid detesting certain foods.

The planning is designed for a given number of days and ensures that the particular nutritional requirements of children are satisfied.

Furthermore, other special circumstances, such as allergies, food intolerances and specific constraints regarding religion or lifestyle habits---vegetarians and vegans, for instance---are also taken into account.

In order to solve the problem, we applied well-known multi-objective evolutionary algorithms which have shown competitive results in the related literature: NSGAII, SPEAII and IBEA.

The computational results attained by a set of well-known multi-objective evolutionary algorithms show that suitable menu plannings, in terms of their nutritional values, are provided.

In addition, the multi-objective nature of our novel formulation is also demonstrated.

The cheapest menu plannings are those with the lowest variety of courses.

In opposition, the largest variety of courses is given by the most expensive plannings.

Finally, we should note that the novel formulation may be adapted, with little effort, to deal with the particular nutritional requirements of other groups of people, such as patients in hospitals or convicts in prisons, among others.
As a result, our proposal provides a set of non-dominated solutions from which the final user can choose the one which better suits to the children needs and the canteen features.
