#!perl -T

use 5.010;
use strict;
use warnings;

use Test::More tests => 1;
use Lingua::IT::Ita2heb;
use charnames ':full';
use English '-no_match_vars';
use open ':encoding(utf8)';

our $VERSION = '0.01';

my $log_filename = __FILE__ . '.log';
open my $log, '>', $log_filename    ## no critic InputOutput::RequireBriefOpen
    or croak("Couldn't open $log_filename for writing: $OS_ERROR");

say {$log} 'Melazzo ' . Lingua::IT::Ita2heb::ita_to_heb('Melazzo');
ok(
    Lingua::IT::Ita2heb::ita_to_heb('Melazzo') eq "\N{HEBREW LETTER MEM}"
        . "\N{HEBREW POINT SEGOL}" # XXX should be tsere
        . "\N{HEBREW LETTER LAMED}"
        . "\N{HEBREW POINT PATAH}"
        . "\N{HEBREW LETTER TSADI}"
        . "\N{HEBREW POINT DAGESH OR MAPIQ}"
        . "\N{HEBREW LETTER VAV}"
        . "\N{HEBREW POINT HOLAM}",
    'Melazzo'
);

close $log
    or croak("Couldn't close $log_filename after writing: $OS_ERROR");

