#!/usr/bin/env perl6

use v6;
use Test;
use Inline::Scheme::Gambit;

my $gambit = Inline::Scheme::Gambit.new();

$gambit.run(q{(define (identity x) x)});

for (   True, False, 
        0, 5, 1/3, 5.5e0,
        "gambit-c",
        [1, 2, [3, "hello"], "world"],
        { 1 => "foo", "bar" => "baz" }
    ) -> $obj {
    is-deeply $gambit.call('identity', $obj), $obj, "Can round-trip " ~ $obj.^name;
}

done-testing;
