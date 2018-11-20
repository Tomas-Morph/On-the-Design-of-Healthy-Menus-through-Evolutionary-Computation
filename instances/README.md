# Instances

**1. Courses**: there exist three different files, containing information on each type of course (starters, main courses and desserts).

**2. Number of days**: the number of days for which the meal plan will be designed has to be specified.

### File format
The format of each line of the files that contain information on a particular starter, main course or dessert is as follows:

>\<name\>,\<price\>,\<amount\>,\<allergens\>,\<incompatibilities\>,\<amount of nutrients\>,\<food groups\>, <br/>

* **\<name\>** = name of the course.
* **\<price\>** = price of the course.
* **\<amount\>** = amount in grams.
* **\<allergens\>** = \<\<cereal\>, \<nuts\>, \<legumes\>, \<shellfish\>, \<fish\>, \<egg protein\>, \<cow's milk protein\>\>. Each of the above fields takes the value 0 if the course does not include the allergen, and the value 1 if it does.
*  **\<incompatibilities\>** = \<\<celiac\>, \<diabetes\>, \<semi-vegetarianism\>, \<vegetarianism\>, \<veganism\>\>. Each of the aforementioned fields takes the value 0 if the course is not incompatible, and the value 1 if it is.
*  **\<amount of nutrients\>** = \<\<folic acid (µg)\>, \<calcium\> (mg), \<energy (kcal)\>, \<phosphorus (mg)\>, \<total fat (g)\>, \<iron (mg)\>, \<magnesium (mg)\>, \<potassium (mg)\>, \<proteins (g)\>, \<selenium (µg)\>, \<sodium (mg)\>, \<vit A (µg)\>, \<vit B1 (mg)\>, \<vit B2 (mg)\>, \<vit B6 (mg)\>, \<vit B12 (µg)\>, \<vit C (mg)\>, \<vit D (µg)\>, \<vit E (mg)\>, \<iodo (µg)\>, \<zinc (mg)\>\>. Each of the above fields has to be specified as a decimal number indicating the amount of the nutrient in question by considering its corresponding unit of measure.
*  **\<food groups\>** = \<\<others (0)\>, \<meat (1)\>, \<cereal (2)\>, \<fruit (3)\>, \<dairy (4)\>, \<legume (5)\>, \<shellfish (6)\>, \<pasta (7)\>, \<fish (8)\>, \<vegetable (9)\>\>. Only those food groups that the course in question contains have to be specified through their corresponding integer numbers.
