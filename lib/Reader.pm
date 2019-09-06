#!/usr/bin/perl

package Reader;
use warnings;
use strict;

our $VERSION = '1.0';

use Text::CSV qw( csv );

sub read_as_aoa {
    my ($input_file) = @_;

    my $aoa = csv(
        in => $input_file,

        # TODO: if this is default to transaction file, we can omit this flag
        sep_char => q(,),

        # TODO: is white space allowed in transaction file
        # TODO: For now, turn on just in case allowed
        allow_whitespace => 1,

        # TODO: does transactions file have headers?
        #    headers          => "skip",
        #    headers          => "auto",
        # headers are converted to lower case
        #    headers          => "lc",
    );

    return $aoa;
}

1;

__END__

=pod

=head1 NAME

Reader.pm - Reading transactions file into array of array

=head1 SYNOPSIS

    use Reader;

    # read $transaction_file, returns array of array
    my $aoa = Reader::read_as_aoa($transactions_file)


=head1 DESCRIPTION

CSV settings are specific to the transaction file.

=cut

