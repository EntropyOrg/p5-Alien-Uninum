use Test::More;

use_ok('Alien::Uninum');

my $u = Alien::Uninum->new;

like( $u->libs, /uninum/ );

done_testing;
