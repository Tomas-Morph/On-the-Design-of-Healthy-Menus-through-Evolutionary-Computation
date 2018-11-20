set bmargin 4
#set xrange [2.0e6:3e6]
#set yrange [0:5e4]

set format y "%g"
set format x "%g"

set key bottom right
#set key spacing 1.5

set xlabel "Function evaluations" font "Helvetica,22"
set ylabel "Mean HV" font "Helvetica,22"
set title  "NSGA2 configs. - 4e8 evals. - 10 runs" font "Helvetica-Bold,22"
set term postscript eps enhanced color solid "Helvetica,20"

set xtics font "Helvetica,20"
#set xtics 0, 6000, 41400 
set ytics font "Helvetica,20"

set output "bestHVEvolution-NSGA2.eps"

plot "Bolido_Sequential_MenuPlanning_EvoComp_NSGA2_PopSize_250_pm_0.15_pc_0.8_days_20_MenuPlanning_400000000.avgHV.evolution" with linespoints lt -1 pi -3 pt 7 ps 1.5 lc rgb "black" title "Ps: 250, pm: 0.15, pc: 0.8", "Bolido_Sequential_MenuPlanning_EvoComp_NSGA2_PopSize_25_pm_0.05_pc_0.8_days_20_MenuPlanning_400000000.avgHV.evolution" with linespoints lt -1 pi -3 pt 6 ps 1.5 lc rgb 'black' title "Ps: 25, pm: 0.05, pc: 0.8", "Bolido_Sequential_MenuPlanning_EvoComp_NSGA2_PopSize_100_pm_0.05_pc_1.0_days_20_MenuPlanning_400000000.avgHV.evolution" with linespoints lt -1 pi -3 pt 7 ps 1.5 lc rgb '#696969' title "Ps: 100, pm: 0.05, pc: 1.0"
