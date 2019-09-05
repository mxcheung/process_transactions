#!/usr/bin/perl

#
# Unit test for
# Transactions::Settlement
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

use Transactions::Settlement;

# for test data, as would be read from CSV
my @test_data_row;

# T+1
@test_data_row = split ',', 'row4_field0,row4_field1,row4_field2,1';
ok( Transactions::Settlement::is_t_plus( \@test_data_row, 1 ) == $TRUE,
    'T+1 transaction correctly identified' );

# T+2
@test_data_row = split ',', 'row4_field0,row4_field1,row4_field2,2';
ok( Transactions::Settlement::is_t_plus( \@test_data_row, 2 ) == $TRUE,
    'T+2 transaction correctly identified' );
