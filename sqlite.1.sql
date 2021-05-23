create TABLE orders(
 ord_no varchar (100),
 purch_amt  decimal(8,2),
 ord_date varchar (100),
 customer_id varchar (100),
 salesman_id int PRIMARY KEY
 );
 --add values to table 1
 INSERT INTO orders (ord_no, purch_amt,ord_date,customer_id,salesman_id)
 VALUES('170001','150.5', '2012-10-05',  '3005,5002'),
       ('70009', '270.65', '2012-09-10', '3001', '5005'),
       ('70002','65.26', '2012-10-05','3002', '5001'),
       ('70004' ,'110.5', '2012-08-17', '3009','5003'),
       ('70007','948.5', '2012-09-10', '3005', '5002'),
       ('70005', '2400.6', '2012-07-27', '3007', '5001'),
       ('70008', '5760', '2012-09-10', '3002', '5001'),
       ('70010', '1983.43', '2012-10-10', '3004','5006'),
       ('70003', '2480.4', '2012-10-10', '3009', '5003'),
       ('70012', '250.45', '2012-06-27', '3008', '5002'),
       ('70011','75.29', '2012-08-17', '3003', '5007'),
       ('70013', '3045.6', '2012-04-25', '3002', '5001')
       ;
       
 --create table 2      
     CREATE TABLE customer(
  customer_id varchar (100),
  cust_name varchar (100),
  city varchar (100),
  grade varchar (100),
  salesman_id int PRIMARY Key
  );
  
  --add values on table 2
  INSERT INTO customer (customer_id, cust_name, city, grade, salesman_id)
  VALUES ('3002', 'Nick Rimando','New York', '100', '5001'),
         ('3007', 'Brad Davis', 'New York', '200',  '5001'),
         ('3005', 'Graham Zusi', 'California', '200','5002'),
         ('3008', 'Julian Green', 'London', '300', '5002'),
         ('3004', 'Fabian Johnson', 'Paris', '300', '5006'),
         ('3009', 'Geoff Cameron','Berlin', '100', '5003'),
         ('3003', 'Jozy Altidor', 'Moscow', '200', '5007'),
         ('3001', 'Brad Guzan', 'London', '100','5005')
         ;
--join tables 

SELECT ord_date
FROM orders
INNER JOIN customer
ON orders.salesman_id = customer.salesman_id; 

SELECT ord_no,purch_amt
FROM orders
LEFT JOIN customer
ON orders.salesman_id = customer.salesman_id;

SELECT cust_name,city
FROM customer
RIGHT JOIN orders
ON orders.salesman_id = customer.salesman_id;

--join with alias
SELECT cust_name,city
FROM customer as CR
INNER JOIN orders AS OD
ON OD.salesman_id = CR.salesman_id;    
