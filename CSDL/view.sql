-- Create view --
CREATE VIEW customer_views AS

SELECT customerNumber, customerName, phone

FROM  customers;

-- Select view --
select * from customer_views;

-- Replace View --
CREATE OR REPLACE VIEW customer_views AS

SELECT customerNumber, customerName, contactFirstName, contactLastName, phone

FROM customers

WHERE city = 'Nantes';

-- Select View --
select * from customer_views;

-- Delete view
DROP VIEW customer_views;