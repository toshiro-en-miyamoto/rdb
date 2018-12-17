/*
 * Show me the products we have never even once sold.
 * List its product IDs and product names, sorted by the product ID.
 */

select P.ProdID, ProdName
   from Products as P
      left join OrderItems using (ProdID)
   where OrderID is null
   order by P.ProdID;

select P.ProdID, ProdName
   from Products as P
      left outer join OrderItems using (ProdID)
   where OrderID is null
   order by P.ProdID;
