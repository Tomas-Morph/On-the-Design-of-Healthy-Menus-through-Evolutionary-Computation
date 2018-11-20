set bmargin 4
#set xrange [0:362]
#set yrange [650:950]

#set format y "%g"
#set format x "%g"

set key bottom right
#set key spacing 1.5

set xlabel "Function evaluations" font "Helvetica,22"
set ylabel "Mean hypervolume" font "Helvetica,22"
set title  "SPEA2 - 4e8 evals. - 30 runs - Menu for 20 days" font "Helvetica-Bold,22"
set term postscript eps enhanced color solid "Helvetica,20"

set xtics font "Helvetica,20"
#set xtics 0, 6000, 41400 
set ytics font "Helvetica,20"

set output "meanHV_Evolution_SPEA2_days_20.eps"

plot "Bolido_Sequential_MenuPlanning_EvoComp_MainStudy_SPEA2_PopSize_100_ArchSize_100_pm_0.05_pc_0.8_days_20_MenuPlanning_400000000.avgHV.evolution" with linespoints lt -1 pt 7 ps 1.5 lc rgb 'blue' title "SPEA2-ps-100-as-100-pm-0.05-pc-0.8", "Bolido_Sequential_MenuPlanning_EvoComp_MainStudy_SPEA2_PopSize_100_ArchSize_100_pm_0.1_pc_0.8_days_20_MenuPlanning_400000000.avgHV.evolution" with linespoints lt -1 pt 7 ps 1.5 lc rgb "red" title "SPEA2-ps-100-as-100-pm-0.1-pc-0.8", "Bolido_Sequential_MenuPlanning_EvoComp_MainStudy_SPEA2_PopSize_100_ArchSize_100_pm_0.15_pc_0.8_days_20_MenuPlanning_400000000.avgHV.evolution" with linespoints lt -1 pt 7 ps 1.5 lc rgb 'black' title "SPEA2-ps-100-as-100-pm-0.15-pc-0.8"