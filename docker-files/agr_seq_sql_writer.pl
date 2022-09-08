#!/usr/bin/perl
use strict;
use warnings;

my $FILE_IN = "XENLA_9.2_genome.fa";

my $FILE_OUT = "$FILE_IN.sql";

my $id = 1010000;
my $org_id = 920918; #laevis

my ($name, $sequence);

open IN, $FILE_IN or die "couldn't open $FILE_IN";
while(<IN>) {
  chomp;
  if (/>/) {
    if ($name) {
      &make_sql_line($name, $sequence);
    }
    $name = substr($_,1);
    $sequence = '';
  }
  elsif (/\S/) {
    $sequence = $sequence . $_;
  }
} 

make_sql_line($name, $sequence);


sub make_sql_line() {
  my $n = shift;
  my $seq = shift;
  $id++;
  print(join("\t",
  $id,
  0,
  length($seq),
  length($seq),
  $name,
  $org_id,
  80000,
  0),"\n");

  return;
}
