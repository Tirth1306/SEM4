CREATE TABLE client (
clientno            VARCHAR2(6),
name                VARCHAR2(20),
city                VARCHAR2(15),
pincode             NUMBER(8),
state               VARCHAR2(15),
baldue              NUMBER(10,5)
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
orderno             VARCHAR2(6),
productno           VARCHAR2(6),
qtyordered          NUMBER(8),
productrate         NUMBER(10,2)
);


CREATE TABLE employees(
	employee_id    NUMBER(6),
	first_name     VARCHAR2(20),
	last_name      VARCHAR2(25)         CONSTRAINT     emp_last_name_nn     NOT NULL,
	email          VARCHAR2(25)        	CONSTRAINT     emp_email_nn         NOT NULL,
	phone_number   VARCHAR2(20),
	hire_date      DATE                 CONSTRAINT     emp_hire_date_nn     NOT NULL,
	job_id         VARCHAR2(40)         CONSTRAINT     emp_job_nn           NOT NULL,
	salary         NUMBER(8,2),
	commission_pct NUMBER(2,2),
	manager_id     NUMBER(6),
	department_id  NUMBER(4),
	CONSTRAINT     emp_salary_min       CHECK (salary > 0),
	CONSTRAINT     emp_email_uk UNIQUE (email)
);
