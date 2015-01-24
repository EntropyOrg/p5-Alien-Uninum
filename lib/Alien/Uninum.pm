package Alien::Uninum;

use strict;
use warnings;

use parent 'Alien::Base';

sub Inline {
	return unless $_[-1] eq 'C'; # Inline's error message is good
	my $self = __PACKAGE__->new;
	+{
		LIBS => $self->libs,
		INC => $self->cflags,
		AUTO_INCLUDE =>
		q/#include <unicode.h>
#include <nsdefs.h>
#include <uninum.h>

/,
	};
}


1;
# ABSTRACT: Alien package for the libuninum library

=pod

=head1 Inline support

This module supports L<Inline's with functionality|Inline/"Playing 'with' Others">.

=head1 SEE ALSO

L<libuninum|http://billposer.org/Software/libuninum.html>, L<Unicode::Number>

=cut
