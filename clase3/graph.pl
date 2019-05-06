
use strict;
use GD;
use GD::Graph::Data;
use GD::Graph::mixed;

# Read in the data from a file

my $data = GD::Graph::Data->new( );
$data->read(file => 'graph.txt');
my $graph = new GD::Graph::mixed(900, 300) or die "Can't create graph!";

# Set the general attributes

$graph->set(
        title             => "Ejemplo",
        types             => [qw(area area bars)],
        dclrs             => [qw(red black blue)],
        transparent       => 0,
);

# Set the attributes for the x-axis

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
# Set the legend

$graph->set_legend(undef, undef, 'Descripcion');
$graph->set_legend_font(gdLargeFont);
$graph->set(legend_placement => 'BL');

# Plot the data

my $gd = $graph->plot( $data );
#my $logo = GD::Image->newFromPng('shempcorp.png');
#my ($w, $h) = $logo->getBounds( );
#$gd->copy(50, 25, 0, 0, 800, 600);

# Write the PNG
open(my $png, '>', 'image.png');
binmode $png;
print $png $gd->png();