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
      no,x
      yes,
      no,_
      yes," "
      """
    When you pass arguments --missing b
    Then you get output
      """
      a,b
      yes,
      yes,
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
    When you pass arguments --match 'b:/\d+/'
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
    When you pass arguments --match 'b:z'
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
    When you pass arguments --match 'b:z,Z'
    Then you get output
      """
      a,b
      yes,z
      yes,Z
      """

  Scenario: Mixed regex and literals
    Given an input csv
      """
      a,b
      yes,z
      yes,a
      yes,Z
      no,
      """
    When you pass arguments --match 'b:a,/Z/i'
    Then you get output
      """
      a,b
      yes,z
      yes,a
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

  Scenario: Field is one of common null/missing values
    Given an input csv
      """
      a,b
      yes,x
      yes,
      yes,"  "
      yes,N/A
      yes,n/a
      yes,NULL
      yes,null
      yes,-
      yes,#DIV/0
      yes,#REF!
      yes,#NAME?
      yes,NIL
      yes,nil
      yes,NA
      yes,na
      yes,#VALUE!
      yes,#NULL!
      yes,NaN
      yes,#N/A
      yes,#NUM!
      yes,?
      yes,z
      """
    When you pass arguments --detect-missing
    Then you get output
      """
      a,b
      yes,x
      yes,
      yes,  
      yes,
      yes,
      yes,
      yes,
      yes,
      yes,
      yes,
      yes,
      yes,
      yes,
      yes,
      yes,
      yes,
      yes,
      yes,
      yes,
      yes,
      yes,
      yes,z
      """

  Scenario: Dup check one field
    Given an input csv
      """
      a,b
      yes,x
      yes,y
      no,x
      """
    When you pass arguments --dedup b
    Then you get output
      """
      a,b
      yes,x
      yes,y
      """

  Scenario: Dup check multiple fields
    Given an input csv
      """
      a,b,c
      yes,x,1
      yes,y
      yes,x,2
      no,x,1
      """
    When you pass arguments --dedup b,c
    Then you get output
      """
      a,b,c
      yes,x,1
      yes,y,
      yes,x,2
      """

  Scenario: Output certain fields
    Given an input csv
      """
      a,b,c
      aa,bb,cc
      aaa,bbb,ccc
      """
    When you pass arguments --output-fields b,a
    Then you get output
      """
      b,a
      bb,aa
      bbb,aaa
      """

  Scenario: Any of fields is present
    Given an input csv
      """
      a,b,c,d
      yes,x,
      yes,,x,
      no,,,x
      yes,_,,
      yes,,_,
      no," ",,
      """
    When you pass arguments --any-present b,c
    Then you get output
      """
      a,b,c,d
      yes,x,,
      yes,,x,
      yes,_,,
      yes,,_,
      """
