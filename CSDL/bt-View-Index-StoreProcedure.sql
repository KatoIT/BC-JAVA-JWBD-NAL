-- create databsae --
create database demo;
use demo;

-- Create table --
create table Products(
    id INT NOT NULL PRIMARY KEY,
    productCode VARCHAR(100) NOT NULL,
    productName VARCHAR(250) NOT NULL,
    productPrice FLOAT NOT NULL,
    productAmount INT NOT NULL,
    productDescription TEXT,
    productStatus TINYINT
);

-- Insert table --
Insert into Products value(1, 'AACB', 'product 1', 15.5, 5, 'descriptions', 0);
Insert into Products value(2, 'ABCB', 'product 2', 13.5, 5, 'descriptions', 1);
Insert into Products value(3, 'ACCB', 'preduct 1', 7.5, 5, 'descriptions', 0);

-- create index --
CREATE INDEX index_unique ON Products(productCode);
CREATE INDEX index_composite ON Products(productName, productPrice);

-- demo --
EXPLAIN Select productName FROM Products WHERE productName LIKE 'pro%';
EXPLAIN Select productCode FROM Products WHERE productName LIKE 'AB__%';

-- create view --
create view View1 AS 
Select productCode, productName, productPrice, productStatus
From Products;

-- Test View --
SELECT * FROM View1;

-- update view --
CREATE OR REPLACE view View1 AS
Select productCode, productName, productPrice, productStatus
From Products
WHERE productCode LIKE 'AA%';

-- Test View --
SELECT * FROM View1;

-- delete view --
drop view View1;

-- Create store procdure SELECT --
Delimiter $$
Create procedure getAll()
BEGIN
Select * from Products;
END$$
DELIMITER ;

-- Test store procedure SELECT --
call getAll();

-- Create store procdure INSERT --
Delimiter $$
Create procedure InsertProduct(
    IN id INT,
    IN productCode VARCHAR(100) ,
    IN productName VARCHAR(250) ,
    IN productPrice FLOAT ,
    IN productAmount INT ,
    IN productDescription TEXT,
    IN productStatus TINYINT
    )
BEGIN
INSERT INTO Products values(id, productCode, productName, productPrice, productAmount, productDescription, productStatus);
END$$
DELIMITER ;

-- Test store procedure INSERT --
call InsertProduct(4, 'BCCB', 'preduct 2', 5.5, 5, 'descriptions', 1);
call getAll();

-- Create store procdure Update --
Delimiter $$
Create procedure UpdateProduct(
    IN id INT,
    IN productCode VARCHAR(100) ,
    IN productName VARCHAR(250) ,
    IN productPrice FLOAT ,
    IN productAmount INT ,
    IN productDescription TEXT,
    IN productStatus TINYINT
    )
BEGIN
Update Products set 
productCode = productCode, 
productName = productName, 
productPrice = productPrice, 
productAmount = productAmount, 
productDescription = productDescription, 
productStatus = productStatus
Where id = id ;
END$$
DELIMITER ;

-- Test store procedure Update --
call UpdateProduct(4, 'BCAB', 'preduct 2', 5.5, 5, 'descriptions', 1);
call getAll();

-- Create store procdure Delete --
Delimiter $$
Create procedure DeleteProduct(IN id INT)
BEGIN
Delete From Products WHERE Products.id = id;
END$$
DELIMITER ;

-- Test store procedure Delete --
call DeleteProduct(4);
call getAll();
