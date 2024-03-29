# process_transactions

Perl5 code to demonstrate simplified implementation of reading a transaction file and write out T+1 & T+2 settlements.

The logic of determining settlement dates is separated from reading and writing the CSV files.

The format of the transaction file is not known, however implementation can be easily achieved by modifying the code in the respective libraries.

## Installation

## Clone

Clone this repo to your local machine using `https://github.com/stock90/process_transactions.git`

## Dependencies

CPAN modules

  * **Text::CSV**
  * **Test::Simple**
  * **Time::ParseDate**

To verify installation, these should run without errors:

```shell
perl -e 'use Text::CSV;'
perl -e 'use Test::Simple;'
perl -e 'use Time::ParseDate;'
```

## Usage

To separate transaction file into T+1 & T+2 settlements:

```shell
perl -I lib scripts/process_transactions.pl
```

or specify input and output files:

```shell
perl -I lib scripts/process_transactions.pl <transaction_file> <t+1_file> <t+2_file>
```

## Unit Test

Unit test for Settlement.pm 

Test if correctly identifying T+1 & T+2 transactions:

```shell
perl -I lib t/Settlement/Settlement.t
```

## Development Setup

Makefiles are in:

  * scripts/
  * lib/
  * t/
 
to run:

  * perltidy
  * perlcritic
  * generate PDFs


## Documentation

### lib/Settlement/Reader.pm
see docs at:

  * `perldoc lib/Settlement/Reader.pm`

or

  * lib/Settlement/Reader.pdf

### lib/Settlement/Writer.pm
see docs at:

  * `perldoc lib/Settlement/Writer.pm`

or

  * lib/Settlement/Writer.pdf


### lib/Settlement/Settlement.pm
see docs at:

  * `perldoc lib/Settlement/Settlement.pm`

or

  * lib/Settlement/Settlement.pdf


