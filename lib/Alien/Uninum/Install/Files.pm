package Alien::Uninum::Install::Files;

# allows other packages to use ExtUtils::Depends like so:
#   use ExtUtils::Depends;
#   my $p = new ExtUtils::Depends MyMod, Alien::Uninum;
# and their code will have all Uninum available at C level

use strict;
use warnings;

use Alien::Uninum qw(Inline);
BEGIN { *Inline = *Alien::Uninum::Inline }
sub deps { () }
