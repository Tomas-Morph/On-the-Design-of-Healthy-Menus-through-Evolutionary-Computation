set bmargin 4
#set xrange [0:362]
#set yrange [650:950]

#set format y "%g"
#set format x "%g"

set key top right
#set key spacing 1.5

set xlabel "Cost" font "Helvetica,22"
set ylabel "Degree of repetition" font "Helvetica,22"
set title  "Front approximations - 4e8 evals. - 40 days" font "Helvetica-Bold,22"
set term postscript eps enhanced color solid "Helvetica,20"

#set xtics font "Helvetica,20"
#set xtics 0, 6000, 41400 
#set ytics font "Helvetica,20"

set output "fronts_40days.eps"

plot "Bolido_Sequential_MenuPlanning_EvoComp_MainStudy_SPEA2_PopSize_100_ArchSize_100_pm_0.025_pc_0.8_days_40_MenuPlanning_400000000.front" with points pt 12 ps 1 lc rgb "blue" title "SPEA2-ps-100-as-100-pm-0.025-pc-0.8", "Bolido_Sequential_MenuPlanning_EvoComp_MainStudy_IBEA_Adapt_PopSize_250_pm_0.075_pc_0.8_sFactor_0.002_days_40_MenuPlanning_400000000.front" with points pt 6 ps 1 lc rgb "red" title "IBEA-ps-250-pm-0.075-pc-0.8-sFactor-0.002"