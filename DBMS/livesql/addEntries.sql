INSERT INTO employees VALUES (100, 'Steven', 'King', 'SKING', '515.123.4567', TO_DATE('2000-06-17','YYYY-MM-DD'), 'PRESIDENT', 24000.00, NULL, 103, 90);
INSERT INTO employees VALUES (101, 'Neena', 'Kochhar', 'NKOCHHAR', '515.123.4568', TO_DATE('2012-06-18','YYYY-MM-DD'), 'VICE PRESIDENT', 17000.00, 0.00, 100, 90);
INSERT INTO employees VALUES (102, 'Lex', 'De Haan', 'LDEHAAN', '123.515.4569', TO_DATE('2017-06-19','YYYY-MM-DD'), 'VICE PRESIDENT', 17000.00, NULL, 100, 90);
INSERT INTO employees VALUES (103, 'Alexander', 'Hunold', 'AHUNOLD', '590.423.4567', TO_DATE('2016-05-20','YYYY-MM-DD'), 'IT PROG', 9000.00, NULL, 102, 60);
INSERT INTO employees VALUES (104, 'Bruce', 'Ernst', 'BERNST', '590.423.4568', TO_DATE('2014-05-20','YYYY-MM-DD'), 'FINANCIAL MANAGER', 6000.00, 0.00, 103, 60);
INSERT INTO employees VALUES (105, 'David', 'Austin', 'DAUSTIN', '590.423.4569', TO_DATE('2001-09-17','YYYY-MM-DD'), 'IT PROG', 4800.00, 0.00, 103, 60);
INSERT INTO employees VALUES (106, 'Valli', 'Pataballa', 'VPATABAL', '590.423.4560', TO_DATE('2001-09-20','YYYY-MM-DD'), 'FINANCE ACCOUNTANT', 4800.00, 0.00, 103, 60);
INSERT INTO employees VALUES (114, 'Den', 'Raphaely', 'DRAPHEAL', '515.127.4561',TO_DATE('1990-09-01','YYYY-MM-DD'), 'SALES CLERK', 11000.00, 0.00, 100, 30);
INSERT INTO employees VALUES (119, 'Karen', 'Colmenares', 'KCOLMENA', '515.127.4566', TO_DATE('1987-07-06','YYYY-MM-DD'), 'CLERK', 2500.00, NULL, 114, 30);
INSERT INTO employees VALUES (206, 'William', 'Gietz', 'WGIETZ', '515.123.8181', TO_DATE('2005-07-06','YYYY-MM-DD'), 'ACCOUNTANT', 8300.00, NULL, 205, 110);


INSERT INTO client VALUES ('C01','Ivan Bayross','Mumbai',400054,'Maharashtra',15000);
INSERT INTO client VALUES ('C02','Mamta Shah','Chennai',780001,'Tamil Nadu',0);
INSERT INTO client VALUES ('C03','Chhaya Patel','Mumbai',400057,'Maharashtra',5000);
INSERT INTO client VALUES ('C04','Ashni Joshi','Banglore',560001,'Karnataka',0);
INSERT INTO client VALUES ('C05','Harsh Desai','Mumbai',400060,'Maharashtra',2000);
INSERT INTO client VALUES ('C06','Deepak Sharma','Manglore',560050,'Karnataka',0);


INSERT INTO product VALUES ('P00001','1.44 Floppies',5,'Piece',100,20,525,500);
INSERT INTO product VALUES ('P03453','Monitors',6,'Piece',10,3,12000,11200);
INSERT INTO product VALUES ('P06734','Mouse',5,'Piece',20,5,1050,500);
INSERT INTO product VALUES ('P07865','1.22 Floppies',5,'Piece',100,20,525,500);
INSERT INTO product VALUES ('P07868','Keyboards',2,'Piece',10,3,3150,3050);


INSERT INTO salesman VALUES ('S01','Aman','A/14','Worli','Mumbai',400001,'Maharashtra',3000,100,50,'good');
INSERT INTO salesman VALUES ('S02','Omkar','65','Nariman','Mumbai',400001,'Maharashtra',3000,200,100,'good');
INSERT INTO salesman VALUES ('S03','Raj','p-7','Bandra','Mumbai',400032,'Maharashtra',3000,200,100,'good');
INSERT INTO salesman VALUES ('S04','Ashish','A/5','Juhu','Mumbai',400044,'Maharashtra',3500,200,150,'good');


INSERT INTO sales_order VALUES ('O19001','C01','12-JAN-2016','S01','F','N','20-JAN-2016','In Process');
INSERT INTO sales_order VALUES ('O19002','C02','25-JAN-2017','S02','P','N','27-JAN-2017','Cancelled');
INSERT INTO sales_order VALUES ('O46865','C02','25-FEB-2017','S03','F','Y','20-FEB-2017','Fulfilled');
INSERT INTO sales_order VALUES ('O19003','C01','03-APR-2016','S01','F','Y','07-APR-2016','Fulfilled');
INSERT INTO sales_order VALUES ('O46866','C04','20-May-2016','S02','P','N','22-May-2016','Cancelled');
INSERT INTO sales_order VALUES ('O19008','C05','24-MAY-2016','S04','F','N','26-MAY-2016','In Process');


INSERT INTO sales_order_details VALUES ('O19002','P00001',10,525);
INSERT INTO sales_order_details VALUES ('O46865','P07868',3,3150);
INSERT INTO sales_order_details VALUES ('O19001','P00001',4,525);
INSERT INTO sales_order_details VALUES ('O19001','P07965',2,8400);
INSERT INTO sales_order_details VALUES ('O19001','P07885',2,5250);
