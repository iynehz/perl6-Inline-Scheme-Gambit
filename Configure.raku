#!/usr/bin/env raku

use v6;
use LibraryMake;

use lib ($*PROGRAM.dirname);

use Build;
my $build = Build.new();
$build.build($*PROGRAM.dirname);

