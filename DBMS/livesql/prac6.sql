CREATE TABLE client (
  clientno          VARCHAR2(6),
  name              VARCHAR2(20),
  city              VARCHAR2(15),
  pincode           NUMBER(8),
  state             VARCHAR2(15),
  baldue            NUMBER(10,5)
);

CREATE TABLE salesman (
  salesmanno        VARCHAR2(6),
  salesmanname      VARCHAR2(20),
  address1          VARCHAR2(30),
  address2          VARCHAR2(30),
  city              VARCHAR2(20),
  pincode           NUMBER(8),
  state             VARCHAR2(20),
  salamt            NUMBER(8,2),
  tgttoget          NUMBER(6,2),
  ytdsales          NUMBER(6,2),
  remarks           VARCHAR2(60)
);

CREATE TABLE product (
  productno         VARCHAR2(6),
  description       VARCHAR2(15),
  profitpercent     NUMBER(4,2),
  unitmeasure       VARCHAR2(10),
  qtyonband         NUMBER(8),
  reorderlvl        NUMBER(8),
  sellprice         NUMBER(8,2),
  costprice         NUMBER(8, 2)
);


CREATE TABLE sales_order (
  orderno           VARCHAR2(6),
  clientno          VARCHAR2(6),
  orderdate         DATE,
  salesmanno        VARCHAR2(6),
  delaytype         CHAR(1),
  billyn            CHAR(1),
  delaydate         DATE,
  orderstatus       VARCHAR2(10)
);


CREATE TABLE sales_order_details (
  orderno           VARCHAR2(6),
  productno         VARCHAR2(6),
  qtyordered        NUMBER(8),
  productrate       NUMBER(10,2)
);


CREATE TABLE employees(
  employee_id       NUMBER(6),
  first_name        VARCHAR2(20),
  last_name         VARCHAR2(25)          CONSTRAINT     emp_last_name_nn     NOT NULL,
  email             VARCHAR2(25)          CONSTRAINT     emp_email_nn         NOT NULL,
  phone_number      VARCHAR2(20),
  hire_date         DATE                  CONSTRAINT     emp_hire_date_nn     NOT NULL,
  job_id            VARCHAR2(40)          CONSTRAINT     emp_job_nn           NOT NULL,
  salary            NUMBER(8,2),
  commission_pct    NUMBER(2,2),
  manager_id        NUMBER(6),
  department_id     NUMBER(4),
  CONSTRAINT        emp_salary_min       CHECK (salary > 0),
  CONSTRAINT        emp_email_uk UNIQUE (email)
);


-----------------------------------------------------------------------------------------------------
---------------------------------------- ADDING CONSTRAINTS -----------------------------------------


-- 1 A
ALTER TABLE client MODIFY (
  name VARCHAR2(20)                             NOT NULL,
  CONSTRAINT client_pk                          PRIMARY KEY (clientno),
  CONSTRAINT check_clientno                     CHECK (clientno LIKE 'C%')
);


-- 1 B
ALTER TABLE product MODIFY (
  description   VARCHAR2(15)                    NOT NULL,
  profitpercent NUMBER(4,2)                     NOT NULL,
  unitmeasure   VARCHAR2(10)                    NOT NULL,
  qtyonband     NUMBER(8)                       NOT NULL,
  reorderlvl    NUMBER(8)                       NOT NULL,
  sellprice     NUMBER(8,2)                     NOT NULL,
  costprice     NUMBER(8, 2)                    NOT NULL,
  CONSTRAINT    product_pk                      PRIMARY KEY (productno),
  CONSTRAINT    check_sellprice                 CHECK (NOT sellprice = 0),
  CONSTRAINT    check_costprice                 CHECK (NOT costprice = 0),
  CONSTRAINT    check_productno                 CHECK (productno LIKE 'P%')
);


-- 1 C
ALTER TABLE salesman MODIFY (
  salesmanname      VARCHAR2(20)                NOT NULL,
  address1          VARCHAR2(30)                NOT NULL,
  salamt            NUMBER(8,2)                 NOT NULL,
  tgttoget          NUMBER(6,2)                 NOT NULL,
  ytdsales          NUMBER(6,2)                 NOT NULL,
  CONSTRAINT        salesman_pk                 PRIMARY KEY (salesmanno),
  CONSTRAINT        check_salesmanno            CHECK (salesmanno LIKE 'S%'),
  CONSTRAINT        check_salamt                CHECK (NOT salamt = 0),
  CONSTRAINT        check_tgttoget              CHECK (NOT tgttoget = 0)
);


-- 1 D
ALTER TABLE sales_order MODIFY (
  orderdate  DATE                               NOT NULL,
  delaytype  CHAR(1)                            DEFAULT 'F',
  CONSTRAINT sales_order_pk                     PRIMARY KEY (orderno),
  CONSTRAINT check_orderno                      CHECK(orderno LIKE 'O%'),
  CONSTRAINT sales_order_client_fk              FOREIGN KEY (clientno) REFERENCES client(clientno),
  CONSTRAINT sales_order_salesman_fk            FOREIGN KEY (salesmanno) REFERENCES salesman(salesmanno),
  CONSTRAINT check_delaytype                    CHECK (delaytype IN ('P', 'F')),
  CONSTRAINT check_delaydate                    CHECK (delaydate >= orderdate),
  CONSTRAINT check_orderstatus                  CHECK (orderstatus IN ('In Process', 'Fulfilled', 'BackOrder', 'Cancelled'))
);


-- 1 E
ALTER TABLE sales_order_details MODIFY (
  CONSTRAINT sales_order_details_sales_order_fk FOREIGN KEY (orderno) REFERENCES sales_order(orderno),
  CONSTRAINT sales_order_details_product_fk     FOREIGN KEY (productno) REFERENCES product(productno)
);


-- 2
-- Alter table salesman, add constraint Not Null on remarks column and observe the behavior.
-- Mention your remarks.
ALTER TABLE salesman MODIFY (
  remarks VARCHAR2(60) NOT NULL
);



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
INSERT INTO sales_order VALUES ('O19003','C01','03-APR-2016','S01','F','Y','07-APR-2016','Fulfilled');
INSERT INTO sales_order VALUES ('O46866','C04','20-May-2016','S02','P','N','22-May-2016','Cancelled');
INSERT INTO sales_order VALUES ('O19008','C05','24-MAY-2016','S04','F','N','26-MAY-2016','In Process');
---------------------------------------------------------------------------------------------------------
----------------------------------- CONSTRAINT VALIDATION FAILS -----------------------------------------
INSERT INTO sales_order VALUES ('O46865','C02','25-FEB-2017','S03','F','Y','20-FEB-2017','Fulfilled');
---------------------------------------------------------------------------------------------------------


INSERT INTO sales_order_details VALUES ('O19002','P00001',10,525);
INSERT INTO sales_order_details VALUES ('O19001','P00001',4,525);
---------------------------------------------------------------------------------------------------------
----------------------------------- CONSTRAINT VALIDATION FAILS -----------------------------------------
INSERT INTO sales_order_details VALUES ('O46865','P07868',3,3150);
INSERT INTO sales_order_details VALUES ('O19001','P07965',2,8400);
INSERT INTO sales_order_details VALUES ('O19001','P07885',2,5250);
---------------------------------------------------------------------------------------------------------
COMMIT;


-- 4
-- Delete data of salesman ‘S01’ from salesman table and observe the error. Rewrite the query
-- for alteration of table, so that on deletion of ‘S01’ from salesman, corresponding values
-- associated should also get deleted.
DELETE FROM salesman
WHERE salesmanno='S01';

-- ERROR -> ORA-02292: integrity constraint (SQL_NKSJMQCPTGVUDONLDSYNHRTRO.SALES_ORDER_SALESMAN_FK) violated - child record found ORA-06512: at "SYS.DBMS_SQL", line 1721
-- SOLUTION:
-- First, we need to drop the FK constraint from all child tables as
-- it is not possible to change constraints using ALTER TABLE directly.
ALTER TABLE sales_order         DROP CONSTRAINT sales_order_salesman_fk;
ALTER TABLE sales_order_details DROP CONSTRAINT sales_order_details_sales_order_fk;
-- Then, we add the constraint again but this time with ON DELETE CASCADE
ALTER TABLE sales_order ADD (
    CONSTRAINT on_delete_cascade_sales_order_salesman_fk FOREIGN KEY (salesmanno) REFERENCES salesman(salesmanno) ON DELETE CASCADE
);
ALTER TABLE sales_order_details ADD (
    CONSTRAINT on_delete_cascade_sales_order_details_sales_order_fk FOREIGN KEY (orderno) REFERENCES sales_order(orderno) ON DELETE CASCADE
);
-- Now, we can successfully delete the record!
DELETE FROM salesman
WHERE salesmanno='S01';
-- ROLLBACK;
-- ROLLBACK;
-- ROLLBACK;
-- ROLLBACK;
-- ROLLBACK;


-- 5
-- Delete data of order ‘O19001’ from sales_order table and observe the error. Rewrite the
-- query for alteration of table, so that if you remove ‘O19001’ from sales_order, corresponding
-- values associated should be set to NULL.
DELETE FROM sales_order
WHERE orderno='O19001';
-- ERROR -> ORA-02292: integrity constraint (SQL_CANOFVXQDKACAGQEHODNTLSDF.SALES_ORDER_DETAILS_SALES_ORDER_FK) violated - child record found ORA-06512: at "SYS.DBMS_SQL", line 1721
-- SOLUTION:
ALTER TABLE sales_order_details DROP CONSTRAINT sales_order_details_sales_order_fk;
ALTER TABLE sales_order_details ADD (
    CONSTRAINT on_delete_cascade_sales_order_details_sales_order_fk FOREIGN KEY (orderno) REFERENCES sales_order(orderno) ON DELETE SET NULL
);
DELETE FROM sales_order
WHERE orderno='O19001';
-- ROLLBACK;
-- ROLLBACK;
-- ROLLBACK;


-- 6
-- Drop primary key constraint on ‘orderno’ from sales_order table. Observe the error. Write
-- the drop query, so that associated constraints with ‘orderno’ also gets dropped. Check whether
-- the constraints have dropped from user_constraints table.
ALTER TABLE sales_order DROP CONSTRAINT sales_order_pk;
-- ERROR -> ORA-02273: this unique/primary key is referenced by some foreign keys
-- Print out all the refrential constraints.
SELECT * FROM ALL_CONSTRAINTS
WHERE constraint_type='R' AND table_name IN (UPPER('sales_order'), UPPER('client'), UPPER('product'), UPPER('sales_order_details'), UPPER('salesman'));
-- SOLUTION:
ALTER TABLE sales_order DROP CONSTRAINT sales_order_pk CASCADE;
-- ROLLBACK;
