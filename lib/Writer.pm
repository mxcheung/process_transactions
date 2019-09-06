#!/usr/bin/perl

package Writer;
use warnings;
use strict;

our $VERSION = '1.0';

use Text::CSV qw( csv );

sub write_aoa {

    my ( $output_file, $aoa ) = @_;

    csv(
        in  => $aoa,
        out => $output_file,

        # TODO: if this is default, we can omit this flag
        sep_char => q(,),
    );

    return 1;
}

1;

__END__

=pod

=head1 NAME

Writer.pm - Simplified writing of transactions file

=head1 SYNOPSIS

    use Writer;

    # write out array of array ($aoa) to $output_file
    Writer::write_aoa( $output_file, \@aoa );


=head1 DESCRIPTION

Write out array of array, by wrapping Text::CSV.

CSV settings specific to the transaction files.

=cut

