use strict;
use warnings;
use Test::More;
use Acme::Want;

&main;exit;

sub main {
    my $s = test();
    is $s, 'S';

    my @a = test();
    is join(',', @a), 'A,B,C';

    done_testing;
}

sub test {
    my $ret = wrap_context { foo() };
    # some stuff
    $ret->get();
}

sub foo {
    wantarray ? (qw/A B C/) : 'S'
}
