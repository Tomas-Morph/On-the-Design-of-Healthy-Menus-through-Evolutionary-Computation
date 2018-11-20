set bmargin 4

set key outside right center

set xlabel "Population size (ps)" font "Helvetica,22"
set ylabel "Mean hypervolume" font "Helvetica,22"
set title  "NSGA-II - 4e8 evals. - 10 runs" font "Helvetica-Bold,22"
set term postscript eps enhanced color solid "Helvetica,20"

set xtics font "Helvetica,20"
set xtics (25, 50, 100, 250, )
set ytics font "Helvetica,20"

set output "meanHV_grouped_by_PopSize_NSGA2.eps"

plot "Bolido_Sequential_MenuPlanning_EvoComp_NSGA2_pm_0.05_pc_0.8_days_20_MenuPlanning_400000000_400000000.group" with linespoints ps 1.6 lw 3 title "pm-0.05-pc-0.8", "Bolido_Sequential_MenuPlanning_EvoComp_NSGA2_pm_0.05_pc_0.9_days_20_MenuPlanning_400000000_400000000.group" with linespoints ps 1.6 lw 3 title "pm-0.05-pc-0.9", "Bolido_Sequential_MenuPlanning_EvoComp_NSGA2_pm_0.05_pc_1.0_days_20_MenuPlanning_400000000_400000000.group" with linespoints ps 1.6 lw 3 title "pm-0.05-pc-1.0", "Bolido_Sequential_MenuPlanning_EvoComp_NSGA2_pm_0.15_pc_0.8_days_20_MenuPlanning_400000000_400000000.group" with linespoints ps 1.6 lw 3 title "pm-0.15-pc-0.8", "Bolido_Sequential_MenuPlanning_EvoComp_NSGA2_pm_0.15_pc_0.9_days_20_MenuPlanning_400000000_400000000.group" with linespoints ps 1.6 lw 3 title "pm-0.15-pc-0.9", "Bolido_Sequential_MenuPlanning_EvoComp_NSGA2_pm_0.15_pc_1.0_days_20_MenuPlanning_400000000_400000000.group" with linespoints ps 1.6 lw 3 title "pm-0.15-pc-1.0", "Bolido_Sequential_MenuPlanning_EvoComp_NSGA2_pm_0.1_pc_0.8_days_20_MenuPlanning_400000000_400000000.group" with linespoints ps 1.6 lw 3 title "pm-0.1-pc-0.8", "Bolido_Sequential_MenuPlanning_EvoComp_NSGA2_pm_0.1_pc_0.9_days_20_MenuPlanning_400000000_400000000.group" with linespoints ps 1.6 lw 3 title "pm-0.1-pc-0.9", "Bolido_Sequential_MenuPlanning_EvoComp_NSGA2_pm_0.1_pc_1.0_days_20_MenuPlanning_400000000_400000000.group" with linespoints ps 1.6 lw 3 title "pm-0.1-pc-1.0", 
