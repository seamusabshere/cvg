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

  Scenario: Less than
    Given an input csv
      """
      a,b
      yes,-1
      yes,-1.0
      no,0
      no,0.0
      no,1
      no,1.0
      no,
      no,z
      """
    When you pass arguments --lt 'b:0'
    Then you get output
      """
      a,b
      yes,-1
      yes,-1.0
      """

  Scenario: Less than or equal to
    Given an input csv
      """
      a,b
      yes,-1
      yes,-1.0
      yes,0
      yes,0.0
      no,1
      no,1.0
      no,
      no,z
      """
    When you pass arguments --lte 'b:0'
    Then you get output
      """
      a,b
      yes,-1
      yes,-1.0
      yes,0
      yes,0.0
      """

  Scenario: Greater than
    Given an input csv
      """
      a,b
      no,-1
      no,-1.0
      no,0
      no,0.0
      yes,1
      yes,1.0
      no,
      no,z
      """
    When you pass arguments --gt 'b:0'
    Then you get output
      """
      a,b
      yes,1
      yes,1.0
      """

  Scenario: Greater than or equal to
    Given an input csv
      """
      a,b
      no,-1
      no,-1.0
      yes,0
      yes,0.0
      yes,1
      yes,1.0
      no,
      no,z
      """
    When you pass arguments --gte 'b:0'
    Then you get output
      """
      a,b
      yes,0
      yes,0.0
      yes,1
      yes,1.0
      """
