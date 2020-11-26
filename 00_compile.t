use strict;
use warnings;

use Test::More;
use Test::Compile;

my $test = Test::Compile->new();
$test->all_files_ok('lib', 'bin');
$test->done_testing();
