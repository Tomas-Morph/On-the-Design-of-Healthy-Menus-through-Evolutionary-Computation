set bmargin 4

set key outside right center

set xlabel "Crossover rate (pc)" font "Helvetica,22"
set ylabel "Mean hypervolume" font "Helvetica,22"
set title  "SPEA2 - 4e8 evals. - 10 runs" font "Helvetica-Bold,22"
set term postscript eps enhanced color solid "Helvetica,20"

set xtics font "Helvetica,20"
set xtics (0.8, 0.9, 1.0, )
set ytics font "Helvetica,20"

set output "meanHV_grouped_by_pc_SPEA2.eps"

plot "Bolido_Sequential_MenuPlanning_EvoComp_SPEA2_PopSize_100_pm_0.05_days_20_MenuPlanning_400000000_400000000.group" with linespoints ps 1.6 lw 3 title "ps-100-pm-0.05", "Bolido_Sequential_MenuPlanning_EvoComp_SPEA2_PopSize_100_pm_0.15_days_20_MenuPlanning_400000000_400000000.group" with linespoints ps 1.6 lw 3 title "ps-100-pm-0.15", "Bolido_Sequential_MenuPlanning_EvoComp_SPEA2_PopSize_100_pm_0.1_days_20_MenuPlanning_400000000_400000000.group" with linespoints ps 1.6 lw 3 title "ps-100-pm-0.1", "Bolido_Sequential_MenuPlanning_EvoComp_SPEA2_PopSize_250_pm_0.05_days_20_MenuPlanning_400000000_400000000.group" with linespoints ps 1.6 lw 3 title "ps-250-pm-0.05", "Bolido_Sequential_MenuPlanning_EvoComp_SPEA2_PopSize_250_pm_0.15_days_20_MenuPlanning_400000000_400000000.group" with linespoints ps 1.6 lw 3 title "ps-250-pm-0.15", "Bolido_Sequential_MenuPlanning_EvoComp_SPEA2_PopSize_250_pm_0.1_days_20_MenuPlanning_400000000_400000000.group" with linespoints ps 1.6 lw 3 title "ps-250-pm-0.1", "Bolido_Sequential_MenuPlanning_EvoComp_SPEA2_PopSize_25_pm_0.05_days_20_MenuPlanning_400000000_400000000.group" with linespoints ps 1.6 lw 3 title "ps-25-pm-0.05", "Bolido_Sequential_MenuPlanning_EvoComp_SPEA2_PopSize_25_pm_0.15_days_20_MenuPlanning_400000000_400000000.group" with linespoints ps 1.6 lw 3 title "ps-25-pm-0.15", "Bolido_Sequential_MenuPlanning_EvoComp_SPEA2_PopSize_25_pm_0.1_days_20_MenuPlanning_400000000_400000000.group" with linespoints ps 1.6 lw 3 title "ps-25-pm-0.1", "Bolido_Sequential_MenuPlanning_EvoComp_SPEA2_PopSize_50_pm_0.05_days_20_MenuPlanning_400000000_400000000.group" with linespoints ps 1.6 lw 3 title "ps-50-pm-0.05", "Bolido_Sequential_MenuPlanning_EvoComp_SPEA2_PopSize_50_pm_0.15_days_20_MenuPlanning_400000000_400000000.group" with linespoints ps 1.6 lw 3 title "ps-50-pm-0.15", "Bolido_Sequential_MenuPlanning_EvoComp_SPEA2_PopSize_50_pm_0.1_days_20_MenuPlanning_400000000_400000000.group" with linespoints ps 1.6 lw 3 title "ps-50-pm-0.1", 
