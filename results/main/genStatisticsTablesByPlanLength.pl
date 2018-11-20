#!/usr/bin/perl
use warnings;
use strict;
use Data::Dumper;

sub getStats {
  my $numberDays = shift;
  my $statistics = {};

  foreach my $fileName (`ls *_days_${numberDays}_*.allHV`) {
    chomp($fileName);

    my $scriptR = "data1 = scan(\\\"$fileName\\\"); summary(data1)\n";
    my @result = `echo "$scriptR" | R --silent --no-save`;

    chomp($result[2]);
    my $data = [ split /\s+/, $result[2] ];
    shift @$data;

    $statistics->{$fileName} = $data;
  }

  return $statistics;
}

sub getRankings {
  my ($numberRuns, $numberDays) = @_;
  my @fileNames = `ls *_days_${numberDays}_*.allHV`;
  my $rankings = {};

  for (my $i = 0; $i < @fileNames; $i++) {
    for (my $j = $i + 1; $j < @fileNames; $j++) {
      my $file_A = $fileNames[$i];
      my $file_B = $fileNames[$j];
      chomp $file_A;
      chomp $file_B;
      
      if (!defined($rankings->{$file_A})) {
          $rankings->{$file_A} = [0, 0, 0, 0];
      }
      if (!defined($rankings->{$file_B})) {
          $rankings->{$file_B} = [0, 0, 0, 0];
      }

      my $result = `./statisticalTests_old.pl $numberRuns $file_A $file_B`;

      if ($result =~ /Mejor: $file_A/) {
        $rankings->{$file_A}[0]++;
        $rankings->{$file_B}[1]++;
        $rankings->{$file_A}[3]++;
        $rankings->{$file_B}[3]--;
      }
      elsif ($result =~ /Mejor: $file_B/) {
        $rankings->{$file_B}[0]++;
        $rankings->{$file_A}[1]++;
        $rankings->{$file_B}[3]++;
        $rankings->{$file_A}[3]--;
      }
      elsif ($result =~ /No existe diferencia estadistica/) {
        $rankings->{$file_B}[2]++;
        $rankings->{$file_A}[2]++;
      }
      elsif ($result =~ /OJO/) {
        print "Warning: $file_A, $file_B";
      }
    }
  }
  return $rankings;
}

sub printHashSortedByValue {
  my ($statHash, $rankingHash, $field) = @_;

  foreach my $key (keys %$statHash) {
    push @{$statHash->{$key}}, @{$rankingHash->{$key}};
  }

  print "Configuration & Min. & 1st Qu. & Median & Mean & 3rd Qu. & Max. & W & L & Ranking \\\\ \\hline\n";
 
  foreach my $key (sort { $statHash->{$b}[$field] <=> $statHash->{$a}[$field] } keys %$statHash) {
    $key =~ /MainStudy_(.+)_PopSize_(.+)_pm_(.+)_pc_(.+)_days/;
    my $shortKey = "$1_ps_$2_pm_$3_pc_$4";
    print "$shortKey ";
    
    for (my $i = 0; $i < 6; $i++) {
      print "& $statHash->{$key}[$i] ";
    }

    print "& $statHash->{$key}[6] & $statHash->{$key}[7] & $statHash->{$key}[9] \\\\\n";
  }
}

my $numberRuns = shift || die "You must specify the number of runs you performed";
my $numberDays = shift || die "You must specify the number of days for which menu plans were designed";

my $statistics = getStats $numberDays;
my $rankings = getRankings $numberRuns, $numberDays;

# Print configurations sorted by mean (field number 3)
# printHashSortedByValue($statistics, $rankings, 3);

# Print configurations sorted by ranking (field number 9)
printHashSortedByValue($statistics, $rankings, 9);
