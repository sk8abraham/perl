#!/usr/bin/perl
use strict;
use warnings;
use LWP::Simple;

my $file = 'activos.txt';
my @wordlist = qw(label invoice post document postal calculations copy fedex statement financial dhl usps notification irs ups no delivery ticket password pass email user login send name account serial credit);
open(my $fh, '<', $file) or die "El archivo no pudo ser abierto";
my @zeldas = <$fh>;
for (my $i = 0; $i < 5; $i++)
{
    my $cont = 0;
    my $random_zelda = $zeldas[rand @zeldas];
    chomp($random_zelda);
    print " URL: $random_zelda\n";
    foreach my $word (@wordlist)
    {
        #print "\t--Buscando: $word\n";
        my $resp = get($random_zelda);
        if($resp =~/$word/)
        {
            $cont ++;
            print "\t--Coincidencia con $word\n";
        }
    }
    print "Coincidencias encontradas: $cont\n";
}
