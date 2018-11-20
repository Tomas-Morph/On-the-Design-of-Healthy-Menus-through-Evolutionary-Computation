set bmargin 4
#set xrange [0:362]
#set yrange [650:950]

#set format y "%g"
#set format x "%g"

set key bottom right
#set key spacing 1.5

set xlabel "Function evaluations" font "Helvetica,22"
set ylabel "Mean hypervolume" font "Helvetica,22"
set title  "IBEA - 4e8 evals. - 30 runs - Menu for 40 days" font "Helvetica-Bold,22"
set term postscript eps enhanced color solid "Helvetica,20"

set xtics font "Helvetica,20"
#set xtics 0, 6000, 41400 
set ytics font "Helvetica,20"

set output "meanHV_Evolution_IBEA_days_40.eps"

plot "Bolido_Sequential_MenuPlanning_EvoComp_MainStudy_IBEA_Adapt_PopSize_250_pm_0.025_pc_0.8_sFactor_0.002_days_40_MenuPlanning_400000000.avgHV.evolution" with linespoints lt -1 pt 7 ps 1.5 lc rgb 'blue' title "IBEA-ps-250-pm-0.025-pc-0.8-sFactor-0.002", "Bolido_Sequential_MenuPlanning_EvoComp_MainStudy_IBEA_Adapt_PopSize_250_pm_0.05_pc_0.8_sFactor_0.002_days_40_MenuPlanning_400000000.avgHV.evolution" with linespoints lt -1 pt 7 ps 1.5 lc rgb "red" title "IBEA-ps-250-pm-0.05-pc-0.8-sFactor-0.002", "Bolido_Sequential_MenuPlanning_EvoComp_MainStudy_IBEA_Adapt_PopSize_250_pm_0.075_pc_0.8_sFactor_0.002_days_40_MenuPlanning_400000000.avgHV.evolution" with linespoints lt -1 pt 7 ps 1.5 lc rgb 'black' title "IBEA-ps-250-pm-0.075-pc-0.8-sFactor-0.002"