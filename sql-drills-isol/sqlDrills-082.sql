select Products.ProdID, ProdName, ProdRetailPrice, OrderItemQty
   from Products
      inner join OrderItems using (ProdID)
   where OrderID = '55986'
   order by Products.ProdID;


select OrderDate, Products.ProdID, ProdName, ProdRetailPrice, OrderItemQty
   from Products
      inner join OrderItems using (ProdID)
      inner join Orders using (OrderID)
   where OrderDate = '2018-11-01'
   order by Products.ProdID;


/*
 * Show me all orders (OrderID, ProdID, ProdName, ProdRetailPrice, OrderItemQty) placed on 2018-10-31
 */

select Orders.OrderID, Products.ProdID, ProdName, ProdRetailPrice, OrderItemQty
   from Orders
      inner join OrderItems using (OrderID)
      inner join Products   using (ProdID)
   where OrderDate = '2018-10-31'
   order by Orders.OrderID;


select Shops.ShopID, ShopName, OrderDate, ProdName, ProdRetailPrice, OrderItemQty
   from Shops
      inner join Orders     using (ShopID)
      inner join OrderItems using (OrderID)
      inner join Products   using (ProdID)
   where OrderDate = '2018-10-30'
   order by Shops.ShopID;

select Shops.ShopID, ShopName, OrderDate, ProdName, ProdRetailPrice * OrderItemQty
   from Shops
      inner join Orders     using (ShopID)
      inner join OrderItems using (OrderID)
      inner join Products   using (ProdID)
   where OrderDate = '2018-10-30'
   order by Shops.ShopID;
