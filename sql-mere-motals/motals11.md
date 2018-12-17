# Subqueries

Three types of subqueries:

* Row subquery
* Table subquery
* Scalar subquery

## Row Value Constructors

The SQL Standard allows you to build a search condition that compares multiple values as a logical row with another set of values as a logical row (two row value constructors).

    select Orders.OrderID, OrderDate, ProdID, OrderItemQty
       from OrderItems inner join Orders using (OrderID)
       where (OrderDate, ProdID) = ('2018-11-01', '864');

You can enter the list of comparison values by making a list in parentheses such as
(ProdID, ProdRetailPrice) and (395, 120).

    select Orders.OrderID, OrderDate, ProdID, OrderItemQty
       from OrderItems inner join Orders using (OrderID)
       where OrderDate = '2018-11-01' and ProdID = '864';

## Row Subqueries

A **row subquery** is an embedded SELECT expression that returns more than one column but only one row. Fetching a single row from one of your tables, a row subquery can build a row value constructor.

## Table Subqueries

A **table subquery** is an embedded SELECT expression that returns one or more columns and zero to many rows.

## Scalar Subqueries

A ** scalar subquery** is an embedded SELECT expression that returns only one column and only one row.

## Subqueries as Column Expressions

"Show me all the orders received on 2018-10-31 and each orders's related shop name."

    select OrderID,
           OrderDate,
           (select ShopName from Shops as S where S.ShopID = O.ShopID)
       from Orders as O
       where OrderDate = '2018-10-31'
       order by OrderID;

Right now I'm focusing on the concept of using a subquery to create an output column with a very simple example. In truth, you probably should solve this particular problem with the following query using an INNER JOIN:

    select OrderID, OrderDate, ShopName
       from Orders inner join Shops using (ShopID)
       where OrderDate = '2018-10-31'
       order by OrderID;

"List all the shop ID, shop name and a count of the orders they received, sorted by the shop ID."

    select ShopID,
           ShopName,
           (select count(*) from Orders where Orders.ShopID = Shops.ShopID)
      from Shops
      order by ShopID;

The proceeding problem also can be solved by using the GROUP BY clause:

    select S.ShopID as SID, ShopName, count(*)
       from Shops as S inner join Orders using (ShopID)
       group by S.ShopID
    union
    select S.ShopID as SID, ShopName, 0
       from Shops as S left join Orders using (ShopID)
       where OrderID is null
    order by SID;

"List all the product ID, product name and a count of the orders for each product, sorted by the product ID."

    select ProdID,
           ProdName,
           (select count(*) from OrderItems as OI where OI.ProdID = P.ProdID)
       from Products as P
       order by ProdID;

"List all the product ID, product name and a count of the products sold, sorted by the product ID."

    select ProdID,
           ProdName,
           (select sum(OrderItemQty) from OrderItems as OI where OI.ProdID = P.ProdID)
       from Products as P
       order by ProdID;

The SUM function in the proceeding SQL statement returns NULL for the products that have even once been sold. Therefore, you have to use the CASE expression:

    select ProdID,
           ProdName,
           case when exists (select * from OrderItems as OI where OI.ProdID = P.ProdID)
                then (select sum(OrderItemQty) from OrderItems as OI where OI.ProdID = P.ProdID)
                else 0
           end
       from Products as P
       order by ProdID;

The LEFT JOIN also can solve the problem:

    select P.ProdID,
           ProdName,
           case when count(OrderItemQty) = 0
                then 0
                else sum(OrderItemQty)
           end
       from Products as P left join OrderItems using (ProdID)
       group by P.ProdID
       order by P.ProdID;

Or, you can use the UNION:

    select P.ProdID as PID, ProdName, sum(OrderItemQty)
       from Products as P inner join OrderItems using (ProdID)
       group by ProdID
    union
    select P.ProdID as PID, ProdName, 0
       from Products as P left join OrderItems using (ProdID)
       where OrderID is null
    order by PID;

## Subqueries as Filters

Predicates that work well with subqueries:

* exp. ope. (subquery)
* EXISTS (subquery)
* exp. IN (subquery)
* exp. NOT IN (subquery)
* exp. ope. ANY (subquery)
* exp. ope. SOME (subquery)

### Operators

"Give me a list of the product ID, its names and retail prices with a greater retail price than the overall average retail price, sorted by the product ID."

    select ProdID, ProdName, ProdRetailPrice
       from Products
       where ProdRetailPrice > (select avg(ProdRetailPrice) from Products)
       order by ProdID;

### The EXISTS predicate

    EXISTS (subquery)

If the subquery returns at least one row, the result of EXISTS is "true";
if the subquery returns no rows, the result of EXISTS is "false".

"Display the product IDs and its names that have never even once been sold."

    select ProdID, ProdName
       from Products as P
       where not exists (
          select ProdID from OrderItems as OI where OI.ProdID = P.ProdID
          )
       order by ProdID;

    select P.ProdID, ProdName
       from Products as P
          left join OrderItems using (ProdID)
       where OrderID is null
       order by P.ProdID;

### The IN and NOT IN predicates

    exp. IN (subquery)
    exp. NOT IN (subquery)

The right-hand side is a parenthesized subquery, which must return exactly one column.
The left-hand expression is evaluated and compared to each row of the subquery result.

The result of IN is "true" if any equal subquery row is found.
The result is "false" if no equal row is found 
(including the case where the subquery returns no rows).

The result of NOT IN is "true" if only unequal subquery rows are found
(including the case where the subquery returns no rows).
The result if "false" if any equal row is found.

"Display the product IDs that have been sold together with 'Eraser'."

    select distinct ProdID
       from OrderItems
       where
          OrderID in (
             -- order IDs that include 'Eraser'
             select OrderID from OrderItems where ProdID = '864'
             )
          and ProdID <> '864'
       order by ProdID;

    select distinct ProdID
       from OrderItems
          inner join (
             select OrderID from OrderItems where ProdID = '864'
             ) as OI864 using (OrderID)
       where ProdID <> '864'
       order by ProdID;

"Display the product IDs and product names that have been sold together with 'Eraser'."

    select ProdID, ProdName
       from Products
       where ProdID in (
          select ProdID
             from OrderItems
             where
                OrderID in (
                   -- order IDs that include 'Eraser'
                   select OrderID from OrderItems where ProdID = '864'
                   )
                and ProdID <> '864'
          )
       order by ProdID;

### The ANY and SOME predicates

    exp. ope. ANY (subquery)
    exp. ope. SOME (subquery)

The right-hand side is a parenthesized subquery, which must return exactly one column.
The left-hand expression is evaluated and compared to each row of the subquery result
using the given operator, which must yield a boolean result.

The result of ANY is "true" if any true result is obtained.
The result is "false" if no true result is found
(including the case where the subquery returns no rows)

The predicate 'some' is a synonym for 'any'.
The predicate 'in' is equivalent to '= any'.

"Find the product IDs and product names that have sold less than 2,000, sorted by the product ID."

    select ProdId, ProdName
       from Products as P
       where 2000 > any (
          select sum(OrderItemQty * ProdRetailPrice)
             from OrderItems
                inner join Products using (ProdID)
             where P.ProdID = OrderItems.ProdID
          )
       order by ProdID;

However, the proceeding problem should've been solved by the HAVING:

    select P.ProdID, ProdName
       from Products as P
          inner join OrderItems using (ProdID)
       group by P.ProdID
       having 2000 > sum(OrderItemQty * ProdRetailPrice)
       order by P.ProdID;

### Problems

    SELECT Recipes.RecipeTitle, Ingredients.IngredientName
       FROM Recipes
          INNER JOIN Recipe_Ingredients using (RecipeID)
          INNER JOIN Ingredients using (IngredientID)
       WHERE Recipes.RecipeID IN (
          SELECT Recipe_Ingredients.RecipeID
             FROM Ingredients
                INNER JOIN Recipe_Ingredients using (IngredientID)
             WHERE Ingredients.IngredientName = 'carrot'
          )

