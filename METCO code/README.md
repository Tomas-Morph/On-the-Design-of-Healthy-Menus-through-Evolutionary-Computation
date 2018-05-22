# Menu Planning code
This folder must be stored inside the directory for METCO problems.

### Notes
* In the method _set_VectoresPlatos_ of _MenuPlanning.h_  (line 95, 96 and 97) you have to write the full file path to the different instance files where the first courses (v_primerosPlatos), second courses (v_segundosPlatos) and desserts (v_postres) are stored, respectively. Example:

> set_VectoresPlatos("/home/johnsmith/metco/problems/MenuPlanning/databaseMenus/desserts.txt", v_postres);
