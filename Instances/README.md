# Instances

There are three files, each of them stores a different set of course types. There are first course, second course and dessert. Through these files the problem will create three vectors that will contain all the information stored in them.

### File format
The format that the files must follow to store each dish with its respective nutritional information is the following:

>\<name\>,\<price\>,\<amount\>,\<allergens\>,\<incompatibilities\>,\<amount of nutrients\>,\<food groups\>, <br/>
,\<name\>,\<price\>,\<amount\>,\<allergens\>,\<incompatibilities\>,\<amount of nutrients\>,\<food groups\>, <br/>
, ... 

* **\<name\>** = name
* \<price\> = price
* \<amount\> = amount in grams
* \<allergens\> = \<\<cereal\>, \<nuts\>, \<legumes\>, \<shellfish\>, \<fish\>, \<egg protein\>, \<cow's milk protein\>\>. 0 if the course does not have the allergen, 1 if it is.
*  \<incompatibilities\> = \<\<celiac\>, \<diabetes\>, \<semivegetarianism\>, \<vegetarianism\>, \<veganism\>\>. 0 if the dish course not have the incompatibilitie, 1 if it is.
*  \<amount of nutrients\> = \<\<folic acid (µg)\>, \<calcium\> (mg), \<energy (kcal)\>, \<phosphorus (mg)\>, \<total fat (g)\>, \<iron (mg)\>, \<magnesium (mg)\>, \<potassium (mg)\>, \<proteins (g)\>, \<selenium (µg)\>, \<sodium (mg)\>, \<vit A (µg)\>, \<vit B1 (mg)\>, \<vit B2 (mg)\>, \<vit B6 (mg)\>, \<vit B12 (µg)\>, \<vit C (mg)\>, \<vit D (µg)\>, \<vit E (mg)\>, \<iodo (µg)\>, \<zinc (mg)\>\>. Each field is a decimal number corresponding to the amount of each nutrient.
*  \<food groups\> = \<\<others (0)\>, \<meat (1)\>, \<cereal (2)\>, \<fruit (3)\>, \<dairy (4)\>, \<legume (5)\>, \<shellfish (6)\>, \<pasta (7)\>, \<fish (8)\>, \<vegetable (9)\>\>. Each field is a whole number corresponding to a food group. Only those food groups that the course has are written.

