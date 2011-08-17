#!/usr/bin/perl

# Liu Lantao ( http://www.liulantao.com  liulantao@gmail.com )

use Getopt::Std;
use GraphViz;

getopt("io");

if($opt_i) {
    open(STDIN, "<$opt_i") or die("cannot open $opt_i");
}
if(!$opt_o) { die("USAGE:\t$0 [-i INPUT] -o OUTPUT\n\t-i:\tinput filename (when not provided, STDIN will be used)\n\t-o:\toutput filename\n"); }


my $g = GraphViz->new();
while ( my $line = <STDIN> ) {
    my ($clients, $need, $servers, $for, $relation) = split(/\s+/, $line);
    foreach my $client ( split(',', $clients) ) {
        $g->add_node("$client", shape => "box");
        foreach my $server ( split(',', $servers) ) {
            $g->add_node("$server", shape => "ellipse");
            $g->add_edge("$client" => "$server", label => "$relation");
        }
    }
}

close(INPUT);

$g->as_jpeg($opt_o);
