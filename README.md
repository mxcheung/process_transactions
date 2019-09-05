# process_transactions

Perl5 code to demonstrate simplified implementation of reading a transaction file and write out T+1 & T+2 settlements.

For modular code, a call back function wrapping Text::CSV is used. The logic of determining settlement dates is separated from reading and writing the CSV files.

The exact format of the transaction file is not known, however implementation can be easily achieved by modifying the code in the respective libraries.

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
perl -Ilib scripts/process_transactions.pl
```

or specify input and output files:

```shell
perl -Ilib scripts/process_transactions.pl data1/transactions.csv data1/t1.csv data1/t2.csv
```

## Unit Test

Unit test if Settlment.pm is correctly identifying T+1 & T+2 transactions:

```shell
perl -Ilib t/Settlement.t
```

## Development Setup

Makefiles are in:

  * scripts/
  * lib/Transactions/
  * t/
 
to run:

  * perltidy
  * perlcritic
  * generate PDFs


## Documentation

### lib/Transactions/Reader.pm
see docs at:

  * `perldoc lib/Transactions/Reader.pm`

or

  * lib/Transactions/Reader.pdf

### lib/Transactions/Writer.pm
see docs at:

  * `perldoc lib/Transactions/Writer.pm`

or

  * lib/Transactions/Reader.pdf


### lib/Transactions/Settlement.pm
see docs at:

  * `perldoc lib/Transactions/Settlement.pm`

or

  * lib/Transactions/Settlement.pdf


