use lib 't/lib';
use common::sense;

use Test::Class::Moose::CLI;

Test::Class::Moose::CLI->new_with_options(
    show_timing => 1,
    statistics  => 1,
)->run;

# see also https://metacpan.org/pod/Test::Class::Moose::CLI
# prove5.28.2 -lv t/tcm.t :: --classes TestFor::Foo --tags quick --tags db --methods foobar --jobs 8
