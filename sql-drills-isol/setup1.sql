
drop table if exists Orders;

create table Orders (
   OrderID char(5) not null,
   OrderDate date not null,
   primary key (OrderID));

insert into Orders (OrderID, OrderDate) values
   ('10489', '2018-10-30'),
   ('21823', '2018-10-30'),
   ('27495', '2018-10-30'),
   ('30113', '2018-10-31'),
   ('40913', '2018-10-31'),
   ('47200', '2018-11-01'),
   ('55986', '2018-11-01'),
   ('84524', '2018-11-01'),
   ('96994', '2018-11-01'),
   ('97700', '2018-11-02');

drop table if exists Products;

create table Products (
   ProdID char(3) not null,
   ProdName varchar(40) not null,
   ProdRetailPrice integer not null,
   primary key (ProdID)
);

insert into Products (ProdID, ProdName, ProdRetailPrice) values
   ('395', 'Pencil', 120),
   ('864', 'Eraser', 100),
   ('899', 'Scale', 540),
   ('413', 'Marking pen', 280),
   ('264', 'Notebook', 340),
   ('288', 'Scissors', 860),
   ('514', 'Bookend', 980);

drop table if exists OrderItems;

create table OrderItems (
   OrderID char(5) not null,
   ProdID char(3) not null,
   OrderItemQty integer not null,
   primary key (ProdID, OrderID),
   foreign key (ProdID) references Products (ProdID),
   foreign key (OrderID) references Orders (OrderID)
);

insert into OrderItems (OrderID, ProdID, OrderItemQty) values
   ('10489', '264', 2),
   ('10489', '413', 2),
   ('21823', '864', 2),
   ('21823', '264', 2),
   ('27495', '899', 1),
   ('30113', '864', 2),
   ('30113', '899', 2),
   ('30113', '264', 1),
   ('40913', '395', 1),
   ('40913', '864', 1),
   ('40913', '264', 1),
   ('47200', '899', 2),
   ('55986', '864', 1),
   ('55986', '899', 2),
   ('55986', '264', 2),
   ('84524', '864', 2),
   ('96994', '899', 1),
   ('96994', '864', 1),
   ('97700', '864', 2);


