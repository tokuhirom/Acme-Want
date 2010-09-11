package Acme::Want;
use strict;
use warnings;
use 5.00800;
our $VERSION = '0.01';
use base 'Exporter';

our @EXPORT = qw/wrap_context/;

sub wrap_context(&) {
    my $code = shift;
    my $wantarray = [caller(1)]->[5];
    if ($wantarray) {
        my @ret = $code->();
        bless {ret => \@ret, wantarray => $wantarray}, 'Acme::Want';
    } elsif (defined $wantarray) {
        my $ret = $code->();
        bless {ret => $ret, wantarray => $wantarray}, 'Acme::Want';
    } else {
        { ; $code->(); } # void context
        bless {wantarray => $wantarray}, 'Acme::Want';
    }
}

sub get {
    my $self = shift;
    if ($self->{wantarray}) {
        return @{ $self->{ret} };
    } elsif (defined $self->{wantarray}) {
        return $self->{ret};
    } else {
        return;
    }
}


1;
__END__

=encoding utf8

=head1 NAME

Acme::Want -

=head1 SYNOPSIS

  use Acme::Want;

=head1 DESCRIPTION

Acme::Want is

=head1 AUTHOR

Tokuhiro Matsuno E<lt>tokuhirom AAJKLFJEF GMAIL COME<gt>

=head1 SEE ALSO

=head1 LICENSE

Copyright (C) Tokuhiro Matsuno

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut
