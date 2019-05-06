@a = qw(hola adios mundo lmao gg ez qwerty abcd internet google twitter youtube);
$x = $ARGV[0];
$dir = $ARGV[1];
open($fh, '>', $dir."/random.txt") or die "No se pudo crear el archivo\n";
for ($i =0; $i < $x; $i++)
{
	$random = $a[rand @a];
	print "$random ";
	print $fh "$random ";
}
print "\n";
print $fh "\n";
close($fh);