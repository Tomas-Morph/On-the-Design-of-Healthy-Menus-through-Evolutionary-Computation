#!/usr/bin/perl
use warnings;
use strict;

foreach my $numDays (qw/5 10 20 40/) {

  my $pm_1 = 1 / $numDays;
  my $pm_2 = 1 / $numDays * 2;
  my $pm_3 = 1 / $numDays * 3;

  my $script = qq{set bmargin 4
#set xrange [0:362]
#set yrange [650:950]

#set format y "%g"
#set format x "%g"

set key bottom right
#set key spacing 1.5

set xlabel "Function evaluations" font "Helvetica,22"
set ylabel "Mean hypervolume" font "Helvetica,22"
set title  "IBEA - 4e8 evals. - 30 runs - Menu for ${numDays} days" font "Helvetica-Bold,22"
set term postscript eps enhanced color solid "Helvetica,20"

set xtics font "Helvetica,20"
#set xtics 0, 6000, 41400 
set ytics font "Helvetica,20"

set output "meanHV_Evolution_IBEA_days_${numDays}.eps"

plot "Bolido_Sequential_MenuPlanning_EvoComp_MainStudy_IBEA_Adapt_PopSize_250_pm_${pm_1}_pc_0.8_sFactor_0.002_days_${numDays}_MenuPlanning_400000000.avgHV.evolution" with linespoints lt -1 pt 7 ps 1.5 lc rgb 'blue' title "IBEA-ps-250-pm-${pm_1}-pc-0.8-sFactor-0.002", "Bolido_Sequential_MenuPlanning_EvoComp_MainStudy_IBEA_Adapt_PopSize_250_pm_${pm_2}_pc_0.8_sFactor_0.002_days_${numDays}_MenuPlanning_400000000.avgHV.evolution" with linespoints lt -1 pt 7 ps 1.5 lc rgb "red" title "IBEA-ps-250-pm-${pm_2}-pc-0.8-sFactor-0.002", "Bolido_Sequential_MenuPlanning_EvoComp_MainStudy_IBEA_Adapt_PopSize_250_pm_${pm_3}_pc_0.8_sFactor_0.002_days_${numDays}_MenuPlanning_400000000.avgHV.evolution" with linespoints lt -1 pt 7 ps 1.5 lc rgb 'black' title "IBEA-ps-250-pm-${pm_3}-pc-0.8-sFactor-0.002"};

  open FILE, "> meanHV_Evolution_IBEA_days_${numDays}.plot";
  print FILE $script;
  close FILE;
}
