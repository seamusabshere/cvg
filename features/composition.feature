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
