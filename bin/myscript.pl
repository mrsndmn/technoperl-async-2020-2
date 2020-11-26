#!/usr/bin/env perl

use common::sense;
use lib './lib';
use EV;
use Coro;
use Coro::EV;
use Coro::AnyEvent;
use AnyEvent::HTTP;
use Data::Dumper;
use Coro::Handle;

my $iters = {};
my $lens = {};
my $statuses = {};
my $lines = {};

for my $site (qw/httpbin.org info.cern.ch/) {
    $site =~ /^(?<key>[^\.]+)/;
    my $key = $+{key};
    async {
        while (1) {
            warn "get $site";
            http_get "http://" . $site, keepalive => 0, want_body_handle => 1, recurse => 1, Coro::rouse_cb;
            my ($handle, $header) = Coro::rouse_wait;
            unless ($handle) {
                warn "Wrong response: " . Dumper($header);
                next;
            }
            warn $handle;
            $iters->{$key}++;
            my $coro_handle = Coro::Handle->new_from_fh($handle->fh);
            $coro_handle->rbuf = $handle->rbuf;
            my $cur_len = $header->{'content-length'};
            my $read_len = 0;
            while (1) {
                if ($coro_handle->readable){
                    my $rbuf = $coro_handle->rbuf;
                    $coro_handle->rbuf = "";
                    $lines->{$key}+= ($rbuf =~ /\n/g);
                    $lens->{$key} += length($rbuf);
                    $read_len += length($rbuf);
                    if (!length($rbuf) || $cur_len <= $read_len) {
                        if ($cur_len < $read_len) {
                            warn "WTF???";
                        }
                        last;
                    }
                } else {
                    warn "Coro handle read fail";
                    last;
                }
                #warn $key . " " . $cur_len . " " . $read_len;
            }
            $statuses->{$key}->{$header->{Status}}++;
        }
    };
}

async {
    while (1) {
        Coro::AnyEvent::sleep(1);
        warn Dumper($iters) . Dumper($lines) . Dumper($lens) . Dumper($statuses);
    }
};

EV::run;

warn("EV stop");

