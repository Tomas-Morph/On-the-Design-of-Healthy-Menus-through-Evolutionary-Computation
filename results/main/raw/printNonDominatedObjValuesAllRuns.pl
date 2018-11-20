#!/usr/bin/perl
use warnings;
use strict;

die "Incorrect number of arguments: fileName numberOfRuns finalStep numObj" if (@ARGV != 4);

my ($fileName, $numberOfRuns, $finalStep, $numObj) = @ARGV;
my $front = [];

for my $currentRun (0..$numberOfRuns - 1) {
  system "gzip -d $fileName.$currentRun.gz";
  open EVOF, "$fileName.$currentRun" or die "File $fileName.$currentRun cannot be opened";

  # Reads the input file and stores all the individuals belonging to every step into a dynamic data structure
  while (<EVOF>) {
    chomp;
    if ((m/Current Evaluation = (\d+)/) && ($1 == $finalStep)) {
      my $frontSizeLine = <EVOF>;
      chomp $frontSizeLine;
      $frontSizeLine =~ m/Front Size = (\d+)/;

      my $frontSize = $1;
      
      for (my $i = 0; $i < $frontSize; $i++) {
        my $individual = <EVOF>;
        chomp $individual;
     
        # This is the individual. We must discard the values for the decision variables
        # and keep those values belonging to the objective functions
        my @individual = split / /, $individual;
        my @objValues = @individual[@individual - $numObj .. @individual - 1];
        
        # The individual is included into the front in case it is not dominated by any other individual in the front
        push @$front, \@objValues if (!isDominated($front, \@objValues));
      }
      $finalStep += $finalStep;
    }
  }
  close EVOF;
  system "gzip $fileName.$currentRun";
}

printFront($front);

sub printFront {
  my $front = shift;
  foreach my $ind (@$front) {
    print "@$ind\n";
  }
}

sub isDominated {
  my ($front, $individual) = @_;
  my $isDominated = 0;

  foreach my $ind (@$front) {
    if (($ind->[0] <= $individual->[0]) && ($ind->[1] < $individual->[1])) {
      $isDominated = 1;
    }
    if (($ind->[0] < $individual->[0]) && ($ind->[1] <= $individual->[1])) {
      $isDominated = 1;
    }
  }
  return $isDominated;
}
