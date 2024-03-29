#!/usr/bin/perl

#
# Unit test for
# Settlement.pm
#

use warnings;
use strict;
use Test::Simple tests => 2;

our $VERSION = '1.0';

# use modules in ../lib relative to this script if script is not run with -I option
#use FindBin;
#use File::Spec;
#use lib File::Spec->catdir( $FindBin::Bin, q(..), q(lib) );

use Readonly;
Readonly my $TRUE  => 1;
Readonly my $FALSE => q();

use Settlement::Settlement;

main();

sub main {
    test_t_plus_1();
    test_t_plus_2();

    return 1;
}

sub test_t_plus_1 {

    # T+1
    # <settlement_date> is 1 day after <transaction_date>
    #
    # test data is a row of:
    #   <transaction_id>, <transaction_date>, <settlement_date>
    #
    my @test_data_row = split ',', '12345,05-SEP-2019,06-SEP-2019';
    ok( Settlement::Settlement::is_t_plus_1( \@test_data_row ) == $TRUE,
        'T+1 transaction correctly identified' );

    return 1;
}

sub test_t_plus_2 {

    # T+2
    # <settlement_date> is 2 days after <transaction_date>
    #
    # test data is a row of:
    #   <transaction_id>, <transaction_date>, <settlement_date>
    #
    my @test_data_row = split ',', '12345,05-SEP-2019,07-SEP-2019';
    ok( Settlement::Settlement::is_t_plus_2( \@test_data_row ) == $TRUE,
        'T+2 transaction correctly identified' );

    return 1;

}
