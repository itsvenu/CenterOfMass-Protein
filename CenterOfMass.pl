#!/usr/bin/perl -w
#Calculates the Center of Mass of a protein
#also the distance of every residue from the Center of Mass.

use strict;
use warnings;

my $chain = 'A';
my $s1 = 0;
my $s2 = 0;
my $s3 = 0;

my $cx=0;
my $cy=0;
my $cz=0;

my @pdb;

while(<>){
	my @col = split;
	next unless $col[0] eq 'ATOM' and $col[4] eq $chain;
	push @pdb, [@col[2,3,5,6,7,8]];
}

for (my $i=0;$i<=$#pdb;$i++){
	my($a, $r, $n, $x, $y, $z) = @{$pdb[$i]};
	
	$s1 = $s1+$x;
	$cx++;

	$s2 = $s2+$y;
	$cy++;

	$s3 = $s3+$z;
	$cz++;
}

my $X = sprintf "%0.3f", $s1/$cx;
my $Y = sprintf "%0.3f", $s2/$cy;
my $Z = sprintf "%0.3f", $s3/$cz;
print "Coordinates of COM: $X\t$Y\t$Z\n\n";
print "Residue\tNumber\tdistanceFromCOM(A)\n";
print "-------\t------\t---------------\n";

for my $j(0..$#pdb){
	my($a1, $r1, $n1, $x1, $y1, $z1) = @{$pdb[$j]};
	my $dist = sprintf "%0.3f", sqrt(($X-$x1)**2 + ($Y-$y1)**2 + ($Z-$z1)**2);
	if($a1 eq 'CA'){
		print "  $r1\t  $n1\t  $dist \n";
	}
}
