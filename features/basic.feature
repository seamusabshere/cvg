Feature: Basic functionality

  Scenario: Field is present
    Given an input csv
      """
      a,b
      present,x
      missing,
      present,_
      missing," "
      """
    When you pass arguments --present b
    Then you get output
      """
      a,b
      present,x
      present,_
      """

  Scenario: Field is missing
    Given an input csv
      """
      a,b
      present,x
      missing,
      present,_
      missing," "
      """
    When you pass arguments --missing b
    Then you get output
      """
      a,b
      missing,
      missing,
      """
