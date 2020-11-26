use common::sense;

use EV;

use Coro;
use Coro::AnyEvent;
use Coro::Debug;

our $server = Coro::Debug->new_unix_server("/tmp/corodbd.sock");

my $max_sleep_time = 10;

my @coros;

my $coro1 = async {
    for my $i (1..$max_sleep_time) {
        warn("coro 1: ", $i);
        Coro::AnyEvent::sleep(1);
    }

    warn("coro 1 finished")
};
$coro1->desc("my coro 1");

push @coros, $coro1;

my $coro2 = async {
    for my $i (1..$max_sleep_time) {
        warn("coro 2: ", $i);
        Coro::AnyEvent::sleep(2);
    }

    warn("coro 2 finished")
};

$coro2->desc("my coro 2");

push @coros, $coro2;

$_->join for @coros;

