use v6;

use Panda::Common;
use Panda::Builder;
use Shell::Command;
use LibraryMake;

class Build is Panda::Builder {
    method build($dir) {
        my %vars = get-vars($dir);

        %vars<GSC> = 'gsc-script';
        %vars<LIBS> = '-lutil';
        %vars<MYEXTLIB> = '/usr/lib/gambit-c/libgambit.a';
        %vars<gambithelper> = $*VM.platform-library-name('gambithelper'.IO);

        mkpath "$dir/resources/libraries";

        %*ENV<GAMBCOMP_VERBOSE> = 1;

        process-makefile('.', %vars);

        my $goback = $*CWD;
        chdir($dir);
        shell(%vars<MAKE>);
        chdir($goback);
    }
}

