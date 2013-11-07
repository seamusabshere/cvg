# Csvgrep2

## Examples

csvgrep2 --present colA input.csv

csvgrep2 --missing colA input.csv

csvgrep2 --regex 'colA:/\d+/' input.csv

csvgrep2 --detect-missing input.csv

csvgrep2 --lt 'colA:5' input.colA

Multiple tests:

csvgrep2 --present colA --missing colB input.csv

Multi files: (different column order OK)

csvgrep2 --present colA input1.csv input2.csv

## TODO

DONE allows special "PRESENT" filter

DONE takes multiple csvs as input

DONE allows special "FALSE_OR_BLANK" filter

DONE combines tests

DONE allows single string matching

DONE allows multiple option matching

DONE allows regex matching

DONE allows > >= < <= comparisons

DONE treat as missing %w{ N/A n/a NULL null - #DIV/0 #REF! #NAME? NIL nil NA na #VALUE! #NULL! NaN #N/A #NUM! ? }

writes report (why rejected row, checks missing and extra columns across input files)

dup checks on certain cols

optionall uses minimal set of headers shared by all
