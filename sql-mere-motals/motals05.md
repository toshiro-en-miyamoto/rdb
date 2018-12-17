# Chapter 5. Getting More Than Simple Columns

## Data Types

Data-type categories defined by the SQL Standard:

* character
* national character
* binary
* numeric
* boolean
* date and time
* interval

The character data type:

* CHAR - fixed-length character
* VARCHAR - varying-length character
* CLOB - large character

The national character data type:

* NCHAR - fixed-length national character
* NCHAR VARYING - varying-length national character
* NCLOB - large national character

Binary data such as images and complex documents

* BLOB

Exact number data type:

* NUMERIC (precision.scale)
* DECIMAL (scale)
* SMALLINT
* INTEGER
* BIGINT

Approximate numeric type (decimal places and exponential numbers):

* FLOAT (precision)
* REAL
* DOUBLE PRECISION

Boolean type:

* BOOLEAN

Date and time type:

* DATE
* TIME
* TIMESTAMP - date and time

Interval data type:

* INTERVAL

## CAST function

* CAST(literal AS data-type-or-domain-name)
* CAST(column  AS data-type-or-domain-name)

## Literals

* 'character string literal'
* 425.987
* -1.3E-3
* '1960-08-09'
* '2018-11-01 15:24:08'

## Expressions

Concatenation:

* EmpFirstName || ' ' || EmpLastName || ' belongs to ' || DeptName
* ProdName || ' sells for ' || CAST(OrderRetailPrice AS CHAR(8))
* ProdName || ' was ordered on ' || CAST(OrderDate AS CHAR(10))

Mathematical expressions:

* (OrderRetailPrice - ProdCostPrice) * OrderQuantity

Date and time expressions:

* EmpResignedDate - EmpHiredDate
* StartDate + DaysRequired
* '12:00' + '00:45'
* ArrivalTime - DepartureTime

## select items as name from a table

* Give me a list of employee's legal names and their home addresses, sorted by ZIP code.
* What is the inventory value of each product?
* How many days elapsed between the order date and the ship date for each order?


