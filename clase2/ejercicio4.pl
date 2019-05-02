#!/usr/bin/perl
use URI;
use 5.010;
my $file = "activos.txt";
my %dominios;

open(my $fh, '<', $file) or die "No se pudo abrir el archivo";
while (<$fh>)
{
    my $url = URI->new($_);
    my $domain = $url->host;
    #$dominios{$domain}='';
    push @{ $dominios{$domain} }, $url;
}
close($fh);

while (($k,$v) = each %dominios)
{
    print "$k ==> \n";
    foreach my $item (@{$dominios{$dominio}})
    {
        print "$item\n";
    }
    print "\n";
}
