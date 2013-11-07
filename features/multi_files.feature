Feature: Multi files

  Scenario: Same field order
    Given an input csv
      """
      a,b
      a1,b1
      a2,b2
      """
    And an input csv
      """
      a,b
      a3,b3
      a4,b4
      """
    Then you get output
      """
      a,b
      a1,b1
      a2,b2
      a3,b3
      a4,b4
      """

  Scenario: Different field order
    Given an input csv
      """
      a,b
      a1,b1
      a2,b2
      """
    And an input csv
      """
      b,a
      b3,a3
      b4,a4
      """
    Then you get output
      """
      a,b
      a1,b1
      a2,b2
      a3,b3
      a4,b4
      """

  Scenario: Extra field somewhere (filled in with nulls)
    Given an input csv
      """
      a,b
      a1,b1
      a2,b2
      """
    And an input csv
      """
      b,a,c
      b3,a3,c3
      b4,a4,c4
      """
    Then you get output
      """
      a,b,c
      a1,b1,
      a2,b2,
      a3,b3,c3
      a4,b4,c4
      """
