package rlib;  # $Id: rlib.pm,v 1.4 1998/01/13 11:30:47 aas Exp $

$VERSION = '0.01';

use strict;
use FindBin qw($Bin);
use File::Basename qw(dirname);

BEGIN {
    require lib;
    my @libs = grep -d $_, "$Bin/lib", dirname($FindBin::Bin) . "/lib";
    if (@libs) {
	import lib @libs;
    } else {
	warn "No relative lib directory found near $Bin\n" if $^W;
    }
}

1;

__END__

=head1 NAME

rlib - add library directories relative to script location

=head1 SYNOPSIS

 use rlib;
 use MyModule;

=head1 DESCRIPTION

The I<rlib> pragma module makes it easy for scripts to pick up library
modules relative to where the scripts themselves are installed.  The
I<rlib> pragma tries to add the F<SCRIPTDIR/lib> and
F<SCRIPTDIR/../lib> to @INC.  If none of these directories exists you
will get a warning if you are running perl with the C<-w> option.

Basically it does the same as:

   use FindBin;
   use lib "$FindBin::Bin/lib";
   use lib "$FindBin::Bin/../lib";

=head1 SEE ALSO

L<FindBin>, L<lib>, L<blib>

=head1 AUTHOR

Gisle Aas

=cut
