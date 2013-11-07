Feature: Composition of tests

  Scenario: Present and missing
    Given an input csv
      """
      a,b,c
      yes,x,
      no,,
      no,x,x
      yes,z," "
      no," "," "
      """
    When you pass arguments --present b --missing c
    Then you get output
      """
      a,b,c
      yes,x,
      yes,z,
      """

  Scenario: Field is one of common null/missing values and you don't want those
    Given an input csv
      """
      a,b
      yes,x
      no,
      no,"  "
      no,N/A
      no,n/a
      no,NULL
      no,null
      no,-
      no,#DIV/0
      no,#REF!
      no,#NAME?
      no,NIL
      no,nil
      no,NA
      no,na
      no,#VALUE!
      no,#NULL!
      no,NaN
      no,#N/A
      no,#NUM!
      no,?
      yes,z
      """
    When you pass arguments --detect-missing --present b
    Then you get output
      """
      a,b
      yes,x
      yes,z
      """
