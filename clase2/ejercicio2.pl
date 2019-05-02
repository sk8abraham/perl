#!/usr/bin/perl
use strict;
use warnings;
use LWP::Simple;

my $fl1 = 'urls.txt';
my $fl2 = 'activos.txt';

open(my $fh2, '>', $fl2) or die "El archivo no pudo ser abierto\n";
close($fh2);
open(my $fh1, '<', $fl1) or die "El archivo no pudo ser abierto\n";
while(<$fh1>)
{
    open(my $fh2, '>>', $fl2) or die "El archivo no pudo ser abierto\n";
    if(! defined head($_))
    {
        print "No activo: $_"
    }
    else
    {
        print $fh2 $_;
    }
    close ($fh2);
}
close ($fh1);
