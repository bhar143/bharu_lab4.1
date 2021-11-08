create table Supplier(SUPP_ID int auto_increment primary key,SUPP_NAME varchar(50),
SUPP_CITY varchar(20), SUPP_PHONE bigint);

create table Customer(CUS_ID int auto_increment primary key,CUS_NAME varchar(50),CUS_PHONE bigint,
CUS_CITY varchar(20), CUS_GENDER varchar(1),SUPP_PHONE bigint);

create table Category(CAT_ID int auto_increment primary key, CAT_NAME varchar(50));

create table Product(PRO_ID int auto_increment primary key, PRO_NAME varchar(50), PRO_DESC varchar(50),
CAT_ID int, foreign key(CAT_ID)references category(CAT_ID));

create table ProductDetails(PROD_ID int auto_increment primary key, PROD_AMOUNT varchar(30),
 PRO_ID int, foreign key(PRO_ID)
references product(PRO_ID),
SUPP_ID int,foreign key(SUPP_ID)references supplier(SUPP_ID), PRICE int);

create table Order_Details(ORD_ID int auto_increment primary key, ORD_AMOUNT int,DATE date,
CUS_ID int, foreign key(CUS_ID)references customer(CUS_ID), PROD_ID int,foreign key(PROD_ID)
references productdetails(PROD_ID));

create table Rating(RAT_ID int auto_increment primary key, CUS_ID int,
foreign key(CUS_ID)references customer(CUS_ID),SUPP_ID int,
foreign key(SUPP_ID)references supplier(SUPP_ID),RAT_RATSTARS int);


insert into supplier(SUPP_ID,SUPP_NAME,SUPP_CITY,SUPP_PHONE)
values(1,'Rajesh Retails','Delhi',1234567890);
insert into supplier(SUPP_ID,SUPP_NAME,SUPP_CITY,SUPP_PHONE)
values(2,'Appario Ltd','Mumbai',2589631470);
insert into supplier(SUPP_ID,SUPP_NAME,SUPP_CITY,SUPP_PHONE)
values(3,'Knome products','Banglore',9785462315);
insert into supplier(SUPP_ID,SUPP_NAME,SUPP_CITY,SUPP_PHONE)
values(4,'Bansai Retails','Kochi',8975463285);
insert into supplier(SUPP_ID,SUPP_NAME,SUPP_CITY,SUPP_PHONE)
values(5,'Mittal Ltd','Lucknow',7898456532);

insert into customer(CUS_ID,CUS_NAME,SUPP_PHONE,CUS_CITY,CUS_GENDER)
values(1,'Aakash',9999999999,'Delhi','M');
insert into customer(CUS_ID,CUS_NAME,SUPP_PHONE,CUS_CITY,CUS_GENDER)
values(2,'Aman',9785463215,'Noida','M');
insert into customer(CUS_ID,CUS_NAME,SUPP_PHONE,CUS_CITY,CUS_GENDER)
values(3,'Neha',9999999999,'Mumbai','F');
insert into customer(CUS_ID,CUS_NAME,SUPP_PHONE,CUS_CITY,CUS_GENDER)
values(4,'Megha',9994562399,'Kolkata','F');
insert into customer(CUS_ID,CUS_NAME,SUPP_PHONE,CUS_CITY,CUS_GENDER)
values(5,'Pulkit',7895999999,'Lucknow','M');


insert into category(CAT_ID,CAT_NAME)values(1,'BOOKS');
insert into category(CAT_ID,CAT_NAME)values(2,'GAMES');
insert into category(CAT_ID,CAT_NAME)values(3,'GROCERIES');
insert into category(CAT_ID,CAT_NAME)values(4,'ELECTRONICS');
insert into category(CAT_ID,CAT_NAME)values(5,'CLOTHES');

insert into Product(PRO_ID,PRO_NAME,PRO_DESC,CAT_ID)values(1,'GTA V','DFJDJFDJFJF',2);
insert into Product(PRO_ID,PRO_NAME,PRO_DESC,CAT_ID)values(2,'TSHIRT','DFDFJDFJDKFD',5);
insert into Product(PRO_ID,PRO_NAME,PRO_DESC,CAT_ID)values(3,'ROG LAPTOP','DFNTTNTNTERND',4);
insert into Product(PRO_ID,PRO_NAME,PRO_DESC,CAT_ID)values(4,'OATS','REURENTBTOTH',3);
insert into Product(PRO_ID,PRO_NAME,PRO_DESC,CAT_ID)values(5,'HARRY POTTER','NBEMCTHTJTH',1);

insert into ProductDetails(PROD_ID,PRO_ID,SUPP_ID,PRICE)values(1,1,2,1500);
insert into ProductDetails(PROD_ID,PRO_ID,SUPP_ID,PRICE)values(2,3,5,30000);
insert into ProductDetails(PROD_ID,PRO_ID,SUPP_ID,PRICE)values(3,5,1,3000);
insert into ProductDetails(PROD_ID,PRO_ID,SUPP_ID,PRICE)values(4,2,3,2500);
insert into ProductDetails(PROD_ID,PRO_ID,SUPP_ID,PRICE)values(5,4,1,1000);

insert into Order_Details(ORD_ID,ORD_AMOUNT,DATE,CUS_ID,PROD_ID)values(20,1500,'2021-10-12',3,5);
insert into Order_Details(ORD_ID,ORD_AMOUNT,DATE,CUS_ID,PROD_ID)values(25,30500,'2021-09-16',5,2);
insert into Order_Details(ORD_ID,ORD_AMOUNT,DATE,CUS_ID,PROD_ID)values(26,2000,'2021-10-05',1,1);
insert into Order_Details(ORD_ID,ORD_AMOUNT,DATE,CUS_ID,PROD_ID)values(30,3500,'2021-08-16',4,3);
insert into Order_Details(ORD_ID,ORD_AMOUNT,DATE,CUS_ID,PROD_ID)values(50,2000,'2021-10-06',2,1);

insert into Rating(RAT_ID,CUS_ID,SUPP_ID,RAT_RATSTARS)values(1,2,2,4);
insert into Rating(RAT_ID,CUS_ID,SUPP_ID,RAT_RATSTARS)values(2,3,4,3);
insert into Rating(RAT_ID,CUS_ID,SUPP_ID,RAT_RATSTARS)values(3,5,1,5);
insert into Rating(RAT_ID,CUS_ID,SUPP_ID,RAT_RATSTARS)values(4,1,3,2);
insert into Rating(RAT_ID,CUS_ID,SUPP_ID,RAT_RATSTARS)values(5,4,5,4);

--- 3) Dsplay the number of the customer group by their genders who have placed any order of amount greater than or equal to 3000.

select * from customer c inner join `order_details` o on o.CUS_ID = c.CUS_ID where o.ORD_AMOUNT >= 3000;

select cus_gender from customer c inner join `order_details` o on o.CUS_ID = c.CUS_ID where o.ORD_AMOUNT >= 3000;

select cg.cus_gender, COUNT(cus_gender) from (select cus_gender from customer c inner join `order_details`
o on o.CUS_ID=c.CUS_ID where o.ORD_AMOUNT>=3000) as cg group by cus_gender;

select CUS_GENDER,COUNT(CUS_GENDER) from customer c inner join `order_details` o 
on o.CUS_ID = c.CUS_ID where o.ORD_AMOUNT >= 3000 group by CUS_GENDER;

--- 4) Display all the orders along with the product name ordered by a customer having Customer_id=2.
select * from `order_details` where CUS_ID=2;

select * from `order_details` o inner join product p on o.PROD_ID = p.PRO_ID where o.CUS_ID = 2;

select o.ORD_ID,o.ORD_AMOUNT,o.DATE,o.CUS_ID,o.PROD_ID,p.PRO_NAME from `order_details` o inner join
 product p on o.PROD_ID=p.PRO_ID where o.CUS_ID=2; 
 
 select o.ORD_ID,o.ORD_AMOUNT,o.DATE,o.CUS_ID,o.PROD_ID,p.PRO_NAME from `order_details` o inner join
 product p on (o.PROD_ID = p.PRO_ID and o.CUS_ID=2);
 
 select * from `order_details`;

select * from productdetails;

select * from product;

select `order_details`.*,product.PRO_NAME from `order_details`,productdetails,product
where `order_details`.CUS_ID = 2 and `order_details`.PROD_ID = productdetails.PROD_ID 
and productdetails.PRO_ID = product.PRO_ID;

--- 5) Display the Supplie details can supply more than one product.
select * from productdetails;
select SUPP_ID,COUNT(PROD_ID) from productdetails group by SUPP_ID;
select SUPP_ID,COUNT(PROD_ID) as no_of_products from productdetails group by SUPP_ID;
select SUPP_ID from (select SUPP_ID,COUNT(PROD_ID) as no_of_products from productdetails  group by SUPP_ID)
as pd where pd.no_of_products >= 2;

select * from supplier where SUPP_ID in (select SUPP_ID from productdetails group by SUPP_ID HAVING COUNT(SUPP_ID) > 1);

select s.* from supplier s join (select SUPP_ID, COUNT(SUPP_ID) from productdetails 
group by SUPP_ID HAVING COUNT(SUPP_ID) > 1) as pd on pd.SUPP_ID = s.SUPP_ID;

--- 6)Find the category of the product whose order amount is minimum.
select MIN(ORD_AMOUNT) from `order_details`;
select category.*  from `order_details` inner join productdetails on `order_details`.PROD_ID=
 productdetails.PRO_ID inner join product on product.PRO_ID=productdetails.PRO_ID inner join
 category on category.CAT_ID=product.CAT_ID where `order_details`.ORD_AMOUNT=(select min(ORD_AMOUNT)from `order_details`);

--- 7)Display the id and name of the product ordered after "2021-10-05".

select * from order_details where DATE > '2021-10-05';
select PROD_ID,PRO_NAME from product p inner join order_details o on o.PROD_ID = p.PRO_ID 
where o.DATE > '2021-10-05';

--- 8)Print the top 3 supplier name and id and their rating on the basis of their rating along with the customer name who has given the rating.

select * from supplier s  inner join rating r on s. SUPP_ID = r.SUPP_ID order by r.RAT_RATSTARS DESC LIMIT 3;
select SUPP_ID, SUPP_NAME, CUS_NAME, SUPP.RAT_RATSTARS from (select supplier.SUPP_ID,
supplier.SUPP_NAME,rating.CUS_ID,rating.RAT_RATSTARS  from supplier inner join rating on
 supplier.SUPP_ID = rating.SUPP_ID order by rating.RAT_RATSTARS desc limit 3) as SUPP inner join
 customer on customer.CUS_ID = SUPP.CUS_ID;
 
 --- 9)Display customer name and gender whose names start or end with character 'A'. 

 select * from customer where CUS_NAME like 'A%' or CUS_NAME like '%A';
 select * from customer where CUS_GENDER = 'M';
 
 --- 10)Display the total order amount of the male customer.
 select sum(ORD_AMOUNT) from `order_details` o inner join customer c on o.CUS_ID = c.CUS_ID
 and c.CUS_GENDER = 'M';
 
 select sum(ORD_AMOUNT) from `order_details` o inner join customer c on o.CUS_ID = c.CUS_ID
 where c.CUS_GENDER = 'M';
 
 --- 11)Displayall the customer left outer join with the orders.
 select c.CUS_ID,CUS_NAME,ORD_ID from customer c left OUTER join order_details o on o.CUS_ID = c.CUS_ID
 order by ORD_ID;
 select * from customer left OUTER join `order_details` on customer.CUS_ID = `order_details`.CUS_ID;
 
 
 ---- 12) Create a stored procedure to display the Rating for a Supplie if any along with the Verdict on that rating if any like if rating > 4 then "Genuine Supplie" if rating > 2 "Average Supplie" else "Supplie should not be considered".
      
      CREATE PROCEDURE `supplierRatings` ()
BEGIN
select s.SUPP_ID,s.SUPP_NAME, r.RAT_RATSTARS,
case
when r.RAT_RATSTARS > 4 then 'Genuine Supplier'
when r.RAT_RATSTARS > 2 then 'Average Supplier'
else 'Supplier should not be considered'
end as verdict from rating r inner join supplier s on r.SUPP_ID = s.SUPP_ID;
END

 call supplierRatings();
 
 
