# Chapter 7. Thinking in Sets

## Intersection

INTERSECT or JOIN:

* Find all the customers who ordered a bicycle and also ordered a helmet.
* Find the bowlers who are on the same team.

WHERE product IN ('bicycle', 'helmet') gives all the customers who ordered a bicycle OR a helmet. 

    select CustID where ProdID in (bicycle', helmet')

Use INTERSECT instead:

    select CustID where ProdID = 'bicycle'
    intersect
    select CustID where ProdID = 'helmet'


## Difference

EXCEPT or OUTER JOIN:

* Find all the customers who ordered a bicycle but did not order a helmet.
* Display all the ingredients for recipes that do not have carrots.


