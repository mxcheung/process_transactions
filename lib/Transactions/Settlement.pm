#!/usr/bin/perl

package Transactions::Settlement;
use warnings;
use strict;

#http://perlmeme.org/faqs/datetime/comparing_dates.html
use Time::ParseDate qw(parsedate);

our $VERSION = '1.0';

use Readonly;
Readonly my $TRUE  => 1;
Readonly my $FALSE => q();

sub is_t_plus {
    my ( $row, $t_plus_param ) = @_;

# TODO: which fields contain data to determine t+?
# TODO: transaction_date in field 1
# TODO: settlement_date in field 2
# TODO: change code to account for weekends, holidays, etc.

    my $transaction_date = $row->[1];
    my $settlement_date = $row->[2];
    my $num_days_difference = (parsedate($settlement_date) - parsedate($transaction_date)) / (60 * 60 * 24);

    if ( $num_days_difference == $t_plus_param ) {
        return $TRUE;
    }
    else {
        return $FALSE;
    }
}

1;

__END__

=pod

=head1 NAME

Transactions::Settlement - Given transaction, determine if it is T+1 or T+2 or ... 

=head1 SYNOPSIS

    use Transactions::Settlement;

    # $row is array of array, read from transaction file

    if ( Transactions::Settlement::is_t_plus( $row, 1 ) ) {
        # this transaction is T+1
    }

    if ( Transactions::Settlement::is_t_plus( $row, 2 ) ) {
        # this transaction is T+2
    }

=head1 DESCRIPTION

Logic for whether a transaction is T+1, T+2 or ...

Return TRUE or FALSE

=cut


