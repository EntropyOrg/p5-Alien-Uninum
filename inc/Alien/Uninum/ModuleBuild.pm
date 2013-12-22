package Alien::Uninum::ModuleBuild;

# based off <https://metacpan.org/source/PLICEASE/Alien-Libarchive-0.10/inc/Alien/Libarchive/ModuleBuild.pm>
# @ <https://github.com/plicease/Alien-Libarchive/blob/f2546c32ff338abb420808bf9212ffc97145a019/inc/Alien/Libarchive/ModuleBuild.pm>
 
use strict;
use warnings;
use base qw( Alien::Base::ModuleBuild );
use FindBin ();
use Text::ParseWords qw( shellwords );
 
sub new
{
  my $class = shift;
  if($^O eq 'MSWin32')
  {
    return Module::Build->new(@_);
  }
  else
  {
    return $class->SUPER::new(@_);
  }
}
 
my $cflags;
my $libs;
   
sub alien_do_commands
{
  my($self, $phase) = @_;
 
  #unless(defined $cflags)
  #{
    #my $first = 1;
    #foreach my $dep (qw( Alien::GMP ))
    #{
      #my @dep = ref $dep ? @$dep : ($dep);
      #foreach my $name (@dep)
      #{
        #my $alien = eval qq{ require $name; $name->new };
        #next if $@;
        #print "\n\n" if $first; $first = 0;
        #print "  trying to use $name: ";
       
        #require ExtUtils::CChecker;
        #require Capture::Tiny;
       
        #my $cc = ExtUtils::CChecker->new;
        #$cc->push_extra_compiler_flags(shellwords ' ' . $alien->cflags);
        #$cc->push_extra_linker_flags(shellwords  ' ' . $alien->libs);
        #my $ok;
        #my $out = Capture::Tiny::capture_merged(sub {
          #$ok = $cc->try_compile_run("int main(int argc, char *argv[]) { return 0; }");
        #});
        #if($ok)
        #{
          #print "ok\n";
          #$cflags .= ' ' . $alien->cflags;
          #$libs   .= ' ' . $alien->libs;
          #last;
        #}
        #else
        #{
          #print "failed\n";
          #print $out;
        #}
      #}
    #}
    #print "\n\n" unless $first;
  #}
 
  #local $ENV{CFLAGS} = $cflags;
  #local $ENV{LIBS}   = $libs;
   
  $self->SUPER::alien_do_commands($phase);
}
 
 
package
  main;
 
sub alien_patch ()
{
    print system("ls");
    #open my $in,  '<', 'libarchive/archive_crypto_private.h';
    #open my $out, '>', 'libarchive/archive_crypto_private.h.tmp';
    #while(<$in>)
    #{
	    #if(/^#include \<wincrypt.h\>/)
	    #{
		    #print $out "#if defined(__CYGWIN__)\n";
		    #print $out "#include <windows.h>\n";
		    #print $out "#endif\n";
	    #}
	    #print $out $_;
    #}
    #close $in;
    #close $out;
    #unlink 'libarchive/archive_crypto_private.h';
    #rename 'libarchive/archive_crypto_private.h.tmp', 'libarchive/archive_crypto_private.h';
}
 
1;
