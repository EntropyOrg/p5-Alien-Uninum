package Alien::Uninum;

use strict;
use warnings;

use parent 'Alien::Base';

sub inline_auto_include {
	[
		'unicode.h',
		'nsdefs.h',
		'uninum.h',
	];
}

sub cflags {
	my ($class) = @_;

	$class->install_type eq 'share'
		? '-I' . File::Spec->catfile($class->dist_dir, qw(include uninum))
		: $class->SUPER::cflags;
}

sub libs {
	my ($class) = @_;

	my $path = $class->install_type eq 'share'
		? '-L' . File::Spec->catfile($class->dist_dir, qw(lib))
		: $class->SUPER::cflags;

	join ' ', ( $path , '-luninum' );

}

sub Inline {
	return unless $_[-1] eq 'C'; # Inline's error message is good
	my $params = Alien::Base::Inline(@_);
}


1;
# ABSTRACT: Alien package for the libuninum library

=pod

=head1 Inline support

This module supports L<Inline's with functionality|Inline/"Playing 'with' Others">.

=head1 SEE ALSO

L<libuninum|http://billposer.org/Software/libuninum.html>, L<Unicode::Number>

=cut
