Feature: Basic functionality

  Scenario: Field is present
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

  Scenario: Field is missing
    Given an input csv
      """
      a,b
      yes,x
      no,
      yes,_
      no," "
      """
    When you pass arguments --missing b
    Then you get output
      """
      a,b
      no,
      no,
      """

  Scenario: Field matches regex
    Given an input csv
      """
      a,b
      yes,1
      no,
      yes,11
      no,a
      yes,a1
      yes,1a
      """
    When you pass arguments --regex 'b:/\d+/'
    Then you get output
      """
      a,b
      yes,1
      yes,11
      yes,a1
      yes,1a
      """

  Scenario: Field is value
    Given an input csv
      """
      a,b
      yes,z
      no,a
      no,
      no,zz
      no,ZZ
      """
    When you pass arguments --value 'b:z'
    Then you get output
      """
      a,b
      yes,z
      """

  Scenario: Field one of values
    Given an input csv
      """
      a,b
      yes,z
      no,a
      no,
      no,zz
      no,ZZ
      yes,Z
      """
    When you pass arguments --value 'b:z,Z'
    Then you get output
      """
      a,b
      yes,z
      yes,Z
      """
