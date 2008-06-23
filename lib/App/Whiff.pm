use strict;
use warnings;
package App::Whiff;

=head1 NAME

App::Whiff - find the first executable of a series of alternatives

=head1 VERSION

version 0.001

=cut

our $VERSION = '0.001';

use File::Which;

=head1 DESCRIPTION

This module implements logic used by the F<whiff> command, which takes a number
of command names and returns the first one that exists and is executable.

=head1 METHODS

=head2 find_first

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

=head2 run

This method is called by the F<whiff> program to ... well, run.

=cut

sub run {
  my ($self) = @_;

  die "usage: whiff <command ...>\n" unless @ARGV;
  my $file = $self->find_first([ @ARGV ]);
  die "no alternative found\n" unless $file;
  print "$file\n";
}

=head1 BUGS

Please report any bugs or feature requests through the web interface at
L<http://rt.cpan.org>. I will be notified, and then you'll automatically be
notified of progress on your bug as I make changes.

=head1 COPYRIGHT

Copyright 2008, Ricardo SIGNES.  This program is free software;  you can
redistribute it and/or modify it under the same terms as Perl itself.

=cut

1;
