# Chapter 6. Filtering Your Data

* Who are our customers in Seattle?
* What kind of music classes do we currently offer?
* Give me a list of customers who placed orders in May?
* Give me the names of our staff members who were hired on May 16, 1985.

Predicates:

* Comparison
* BETWEEN
* IN
* LIKE
* IS NULL

## Comparison

Comparison operators:

* = equal to
* &lt;> not equal to
* &lt; less than
* &gt; greater than
* &lt;= less than or equal to
* &gt;= greater than or equal to

Comparison of data types:

* character string
* numeric
* date and time

Date and time comparison:

* EmpHireDate = '1986-04-01' is true, if the EmpHireDate is the day
* '2018-11-25' < '2018-11-26' is true

## Range

Range operator:

* value BETWEEN v1 AND v2
* value >= v1 AND value <= v2
* 4 BETWEEN 4 AND 7 is true
* 7 BETWEEN 4 AND 7 is true
* '2018-10-01' BETWEEN TaskPlannedStartDate AND TaskPlannedEndDate

Sample questions:

* Which staff members were hired in July 1986?
* Which staff members were hired between '1986-07-01' and '1986-07-31'?
* Show me all tasks that are scheduled to occur on October 1, 2018.

## Set Membership

The membership condition is to test a value against a list of explicitly defined values.

* city IN ('Sapporo', 'Fukuoka')

## Pattern Match

The LIKE predicate test whether a value matches a defined pattern string.

* value LIKE pattern-string

A pattern string can consist of any logical combination of regular string character and two special wildcard characters:

* the percent sign (%) - represents zero or more arbitrary regular characters.
* the underscore (_) - represents a single arbitrary regular character.

Samples of defined pattern strings:

* 'Sha%' - can be any length but must begin with "Sha", such as "Shannon".
* '%son' - can be any length but must end with "son", such as "Benson".
* '%han%' - can be any length but must contain "han", such as "handle" and "Johansen".
* 'Ro_' - can be only three characters in length and must begin with "Ro", such as "Ron".

## Is NULL

* Give me a list of customers who didn't specify what country they live in.
* Which goods do not yet have a retail price?

## Not, part1

* WHERE value NOT BETWEEN v1 AND v2
* WHERE value NOT IN (v1, v2,... v3)
* WHERE value NOT LIKE pattern-string
* WHERE value IS NOT NULL

Sample questions:

* I need the identification numbers of all faculty members who are not professors or associate professors.

## Multiple Conditions

* predicate1 AND predicate2
* predicate1 OR predicate2

Sample questions:

* Show me a list of vendor names for all vendors based in Washington and California.
* WHERE VendState = 'WA' OR VendState = 'CA'
* WHERE VendState IN ('WA', 'CA')

## Not, part2

* WHERE NOT predicate

Sample questions:

* Show me the employees who live outside of Fukuoka city.
* WHERE NOT EmpCity = 'Fukuoka'
* WHERE EmpCity <> 'Fukuoka'

## Order of Precedence

* 1: Positive sign (+), negative sign(-)
* 2: Multiplication (*), division (/)
* 3: Addition (+), subtraction (-)
* 4: Comparison, BETWEEN, IN, LIKE, IS NULL
* 5: NOT
* 6: AND
* 7: OR





