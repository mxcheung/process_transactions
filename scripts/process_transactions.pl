#!/usr/bin/perl

#
# Using transactions file (.csv) as input
# Write out transactions T+1, T+2, into CSVs
#

use warnings;
use strict;

our $VERSION = '1.0';

# use modules in ../lib relative to this script if script is not run with -I option
#use FindBin;
#use File::Spec;
#use lib File::Spec->catdir( $FindBin::Bin, q(..), q(lib) );

use Readonly;
Readonly my $TRUE  => 1;
Readonly my $FALSE => q();

# modules to read, write CSV, determine if settlement is T+1, T+2
use Reader;
use Writer;
use Settlement;

main();

sub main {

    # input file (argv[1] or use default)
    # TODO:$transactions_file specifics are not known
    my $transactions_file = $ARGV[0] || 'data/transactions.csv';

    # output files (argv[2] and argv[3] or use defaults)
    my $t_plus_1_file = $ARGV[1] || 'data/t1.csv';
    my $t_plus_2_file = $ARGV[2] || 'data/t2.csv';

    # read $transaction_file, execute process_line() on every line
    printf "Reading transactions from: %s\n", $transactions_file;

    # buffers for t_plus_* transactions
    my @t_plus_1;
    my @t_plus_2;

    # process each line of the transaction file
    Settlement::process_lines( Reader::read_as_aoa($transactions_file),
        \@t_plus_1, \@t_plus_2 );

    # write out t_plus_1, t_plus_2 transactions
    printf "Writing T+1 to: %s\n", $t_plus_1_file;
    Writer::write_aoa( $t_plus_1_file, \@t_plus_1 );
    printf "Writing T+2 to: %s\n", $t_plus_2_file;
    Writer::write_aoa( $t_plus_2_file, \@t_plus_2 );

    return 1;
}
