#!/usr/bin/perl
use URI;

my $file = "activos.txt";
my %dominios;

open(my $fh, '<', $file) or die "No se pudo abrir el archivo";
while (<$fh>)
{
    my $url = URI->new($_);
    my $domain = $url->host;
    push @{ $dominios{$domain} }, $url;
}
close($fh);

open (my $reporte, '>', "reporte.txt") or die "No se pudo crear el archivo de reporte";
foreach my $key (sort{scalar(@{$dominios{$b}}) <=> scalar(@{$dominios{$a}})} keys %dominios)
{
    print $reporte "$key ==> Tiene: ", scalar @{$dominios{$key}}, " sitios\n";
    foreach my $item (@{$dominios{$key}})
    {
        print $reporte "$item\n";
    }
    print $reporte "\n";
}
close($reporte);
