Feature: Field is present

  Scenario: Basic
    Given an input csv
      """
      a,b
      yes,x
      no,
      yes,_
      no," "
      """
    When you pass arguments --present b
    Then you get output
      """
      a,b
      yes,x
      yes,_
      """
