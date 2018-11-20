set bmargin 4

set key outside right center

set xlabel "Mutation rate (pm)" font "Helvetica,22"
set ylabel "Mean hypervolume" font "Helvetica,22"
set title  "NSGA-II - 4e8 evals. - 10 runs" font "Helvetica-Bold,22"
set term postscript eps enhanced color solid "Helvetica,20"

set xtics font "Helvetica,20"
set xtics (0.05, 0.1, 0.15, )
set ytics font "Helvetica,20"

set output "meanHV_grouped_by_pm_NSGA2.eps"

plot "Bolido_Sequential_MenuPlanning_EvoComp_NSGA2_PopSize_100_pc_0.8_days_20_MenuPlanning_400000000_400000000.group" with linespoints ps 1.6 lw 3 title "ps-100-pc-0.8", "Bolido_Sequential_MenuPlanning_EvoComp_NSGA2_PopSize_100_pc_0.9_days_20_MenuPlanning_400000000_400000000.group" with linespoints ps 1.6 lw 3 title "ps-100-pc-0.9", "Bolido_Sequential_MenuPlanning_EvoComp_NSGA2_PopSize_100_pc_1.0_days_20_MenuPlanning_400000000_400000000.group" with linespoints ps 1.6 lw 3 title "ps-100-pc-1.0", "Bolido_Sequential_MenuPlanning_EvoComp_NSGA2_PopSize_250_pc_0.8_days_20_MenuPlanning_400000000_400000000.group" with linespoints ps 1.6 lw 3 title "ps-250-pc-0.8", "Bolido_Sequential_MenuPlanning_EvoComp_NSGA2_PopSize_250_pc_0.9_days_20_MenuPlanning_400000000_400000000.group" with linespoints ps 1.6 lw 3 title "ps-250-pc-0.9", "Bolido_Sequential_MenuPlanning_EvoComp_NSGA2_PopSize_250_pc_1.0_days_20_MenuPlanning_400000000_400000000.group" with linespoints ps 1.6 lw 3 title "ps-250-pc-1.0", "Bolido_Sequential_MenuPlanning_EvoComp_NSGA2_PopSize_25_pc_0.8_days_20_MenuPlanning_400000000_400000000.group" with linespoints ps 1.6 lw 3 title "ps-25-pc-0.8", "Bolido_Sequential_MenuPlanning_EvoComp_NSGA2_PopSize_25_pc_0.9_days_20_MenuPlanning_400000000_400000000.group" with linespoints ps 1.6 lw 3 title "ps-25-pc-0.9", "Bolido_Sequential_MenuPlanning_EvoComp_NSGA2_PopSize_25_pc_1.0_days_20_MenuPlanning_400000000_400000000.group" with linespoints ps 1.6 lw 3 title "ps-25-pc-1.0", "Bolido_Sequential_MenuPlanning_EvoComp_NSGA2_PopSize_50_pc_0.8_days_20_MenuPlanning_400000000_400000000.group" with linespoints ps 1.6 lw 3 title "ps-50-pc-0.8", "Bolido_Sequential_MenuPlanning_EvoComp_NSGA2_PopSize_50_pc_0.9_days_20_MenuPlanning_400000000_400000000.group" with linespoints ps 1.6 lw 3 title "ps-50-pc-0.9", "Bolido_Sequential_MenuPlanning_EvoComp_NSGA2_PopSize_50_pc_1.0_days_20_MenuPlanning_400000000_400000000.group" with linespoints ps 1.6 lw 3 title "ps-50-pc-1.0", 
