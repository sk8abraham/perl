
use strict;
use GD;
use GD::Graph::Data;
use GD::Graph::mixed;

#Leer de archivo
my $data = GD::Graph::Data->new( );
$data->read(file => 'graph.txt');
my $graph = new GD::Graph::mixed(900, 300) or die "Can't create graph!";

#Atributos

$graph->set(
        title             => "Ejemplo",
        types             => [qw(area area bars)],
        dclrs             => [qw(red black blue)],
        transparent       => 0,
);

# Atributos en x

$graph->set(
        x_label           => 'Lel',
        x_label_skip      => 5,
        x_labels_vertical => 1,
);
$graph->set(
        y_max_value       => ($data->get_min_max_y_all( ))[1]+25,
        y_tick_number     => 10,
        y_all_ticks       => 1,
        y_number_format   => sub { 'Unidades'.int(shift); },
);
# Descripcion

$graph->set_legend(undef, undef, 'Descripcion');
$graph->set_legend_font(gdLargeFont);
$graph->set(legend_placement => 'BL');

# Graficar los datos

my $gd = $graph->plot( $data );
#my $logo = GD::Image->newFromPng('shempcorp.png');
#my ($w, $h) = $logo->getBounds( );
#$gd->copy(50, 25, 0, 0, 800, 600);

# Escribir el PNG
open(my $png, '>', 'image.png');
binmode $png;
print $png $gd->png();
