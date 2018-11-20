set bmargin 4
#set xrange [0:362]
#set yrange [650:950]

#set format y "%g"
#set format x "%g"

set key top right
#set key spacing 1.5

set xlabel "Cost" font "Helvetica,22"
set ylabel "Degree of repetition" font "Helvetica,22"
set title  "Front approximations - SPEA2 - 4e8 evals." font "Helvetica-Bold,22"
set term postscript eps enhanced color solid "Helvetica,20"

#set xtics font "Helvetica,20"
#set xtics 0, 6000, 41400 
#set ytics font "Helvetica,20"

set output "frontSPEA2.eps"

plot "Bolido_Sequential_MenuPlanning_EvoComp_SPEA2_PopSize_25_pm_0.05_pc_0.8_days_20_MenuPlanning_400000000.0.front" with points pt 6 ps 1 lc rgb "red" title "SPEA2-ps-25-as-25-pm-0.05-pc-0.8", "Bolido_Sequential_MenuPlanning_EvoComp_SPEA2_PopSize_100_pm_0.05_pc_0.8_days_20_MenuPlanning_400000000.0.front" with points pt 12 ps 1 lc rgb "blue" title "SPEA2-ps-100-as-100-pm-0.05-pc-0.8"
