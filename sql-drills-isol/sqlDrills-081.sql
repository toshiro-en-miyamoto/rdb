/*
 * Show me all products sold.
 */

select distinct ProdName
   from Products
      inner join OrderItems using (ProdID)
   order by ProdID;

/*
 * Show me all products that have never be sold.
 */

select distinct ProdName
   from Products
      left join OrderItems using (ProdID)
   where OrderID is null
   order by ProdID;

/*
 * Show me all orders (OrderID, OrderDate, ProdID, OrderItemQuantity)
 */

select Orders.OrderID, OrderDate, ProdID, OrderItemQty
   from Orders
      inner join OrderItems using (OrderID)
   order by Orders.OrderID;

/*
 * Show me the Shops (ShopID and ShopName) that received orders on 2018-10-30,
 * followed by order IDs, sorted by the ShopID. 
 */

-- without the JOIN keyword
-- the search condition to link tables comes in the WHERE clause
-- therefore, the WHERE clause can be mixed with
-- the search conditions to link tables and those to solve your problem
select Shops.ShopID, ShopName, OrderID
   from Shops, Orders
   where Shops.ShopID = Orders.ShopID
      and OrderDate = '2018-10-30'
   order by Shops.ShopID;

-- without the JOIN keyword and table aliases
-- using table aliases shorten the search condition
select S.ShopID, ShopName, OrderID
   from Shops as S, Orders as O
   where S.ShopID = O.ShopID
      and OrderDate = '2018-10-30'
   order by S.ShopID;

-- with the JOIN and ON keywords
-- the search condition to link tables moves to the ON clause
-- search conditions to solve your problem remain in the WHERE clause
-- so that search conditions are separated according to its purposes
select Shops.ShopID, ShopName, OrderID
   from Shops
      inner join Orders on Shops.ShopID = Orders.ShopID
   where OrderDate = '2018-10-30'
   order by Shops.ShopID;

-- with the JOIN and ON keywords and table aliases
-- using table aliases shorten the search condition
select S.ShopID, ShopName, OrderID
   from Shops as S
      inner join Orders as O on S.ShopID = O.ShopID
   where OrderDate = '2018-10-30'
   order by S.ShopID;

-- with the JOIN and USING keywords
-- applicable only if the linking columns in the two tables have the same name
select Shops.ShopID, ShopName, OrderID
   from Shops
      inner join Orders using (ShopID)
   where OrderDate = '2018-10-30'
   order by Shops.ShopID;

-- with the NATURAL JOIN keyword
-- applicable only if the only common columns are the linking columns
select Shops.ShopID, ShopName, OrderID
   from Shops natural inner join Orders
   where OrderDate = '2018-10-30'
   order by Shops.ShopID;
