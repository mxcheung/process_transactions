#!/usr/bin/perl

package Transactions::Reader;
use warnings;
use strict;

our $VERSION = '1.0';

use Text::CSV qw( csv );

sub process_file {

    my ( $input_file, $func ) = @_;

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

        # callback function for each line of csv
        callbacks => {
            after_parse => $func,
        }
    );

    return;
}

1;

__END__

=pod

=head1 NAME

Transactions::Reader - Simplified reading and line processing of transactions file

=head1 SYNOPSIS

    use Transactions::Reader;

    # read $transaction_file, execute process_line() on every line
    Transactions::Reader::process_file( $transactions_file, \&process_line );

    sub process_line {
        my ( $csv, $row ) = @_;

        # do something with $row
        my $string = join(',', @{$row});
        print $string . "\n";
    }


=head1 DESCRIPTION

Simplify processing of each line of transaction file CSV.

Implement callback function for each line of a CSV, by wrapping Text::CSV.

CSV settings are specific to the transaction file.

=cut

