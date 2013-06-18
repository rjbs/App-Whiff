use strict;
use warnings;
package App::Whiff;
# ABSTRACT: find the first executable of a series of alternatives

use File::Which ();

=head1 DESCRIPTION

This module implements logic used by the F<whiff> command, which takes a number
of command names and returns the first one that exists and is executable.

=method find_first

  my $filename = App::Whiff->find_first(\@names);

Given an arrayref of command names (which should I<not> be anything other than
base filename), this method either returns an absolute path to the first of the
alternatives found in the path (using L<File::Which>) or false.

=cut

sub find_first {
  my ($self, $names) = @_;

  my $file;
  for my $name (@$names) {
    $file = File::Which::which($name);
    return $file if $file;
  }

  return;
}

=method run

This method is called by the F<whiff> program to ... well, run.

=cut

sub run {
  my ($self) = @_;

  die "usage: whiff <command ...>\n" unless @ARGV;
  my $file = $self->find_first([ @ARGV ]);
  die "no alternative found\n" unless $file;
  print "$file\n";
}

1;
