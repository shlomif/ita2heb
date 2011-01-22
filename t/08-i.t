#!perl -T

use 5.010;
use strict;
use warnings;

use Test::More tests => 1;
use charnames ':full';

use lib './t/lib';
use CheckItaTrans qw(start_log check_ita_tr);

start_log(__FILE__);

# TEST
check_ita_tr(
    ['Rubiana'],
    "\N{HEBREW LETTER RESH}"
        . "\N{HEBREW LETTER VAV}"
        . "\N{HEBREW POINT DAGESH OR MAPIQ}"
        . "\N{HEBREW LETTER BET}"
        . "\N{HEBREW POINT DAGESH OR MAPIQ}"
        . "\N{HEBREW POINT SHEVA}"
        . "\N{HEBREW LETTER YOD}"
        . "\N{HEBREW POINT QAMATS}"
        . "\N{HEBREW LETTER NUN}"
        . "\N{HEBREW POINT QAMATS}"
        . "\N{HEBREW LETTER HE}",
    'Rubiana',
);