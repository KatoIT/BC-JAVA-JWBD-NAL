-- Insert Customer
INSERT INTO Customer(cID, cName, cAge) VALUES (1, 'Minh Quan', 10);
INSERT INTO Customer(cID, cName, cAge) VALUES (2, 'Ngoc Oanh', 20);
INSERT INTO Customer(cID, cName, cAge) VALUES (3, 'Hong Ha', 50);
-- Insert Product
INSERT INTO Product(pID, pName, pPrice) VALUES (1, 'May Giat', 3);
INSERT INTO Product(pID, pName, pPrice) VALUES (2, 'Tu Lanh', 5);
INSERT INTO Product(pID, pName, pPrice) VALUES (3, 'Dieu Hoa', 7);
INSERT INTO Product(pID, pName, pPrice) VALUES (4, 'Quat', 1);
INSERT INTO Product(pID, pName, pPrice) VALUES (5, 'Bep Dien', 2);
-- Insert Order
INSERT INTO Order1(oID , cID , oDate, oTotalPrice) VALUES (1, 1, '2006/3/21', null);
INSERT INTO Order1(oID , cID , oDate, oTotalPrice) VALUES (2, 2, '2006/3/23', null);
INSERT INTO Order1(oID , cID , oDate, oTotalPrice) VALUES (3, 1, '2006/3/16', null);
-- Insert OrderDetail
INSERT INTO OrderDetail(oID, pID, odQTY) VALUES (1 ,1 , 3);
INSERT INTO OrderDetail(oID, pID, odQTY) VALUES (1 ,3 , 7);
INSERT INTO OrderDetail(oID, pID, odQTY) VALUES (1 ,4 , 2);
INSERT INTO OrderDetail(oID, pID, odQTY) VALUES (2 ,1 , 1);
INSERT INTO OrderDetail(oID, pID, odQTY) VALUES (3 ,1 , 8);
INSERT INTO OrderDetail(oID, pID, odQTY) VALUES (2 ,5 , 4);
INSERT INTO OrderDetail(oID, pID, odQTY) VALUES (2 ,3 , 3);

-- Hiển thị các thông tin  gồm oID, oDate, oPrice của tất cả các hóa đơn trong bảng Order
SELECT oID, oDate, oTotalPrice
FROM Order;
-- Hiển thị danh sách các khách hàng đã mua hàng, và danh sách sản phẩm được mua bởi các khách
SELECT DISTINCT Customer.cID, cName, cAge
FROM Customer JOIN Order ON Order.cID = Customer.cID

SELECT DISTINCT Product.pID ,pName, pPrice 
FROM Product JOIN OrderDetail ON Product.pID = OrderDetail.pID;

-- Hiển thị tên những khách hàng không mua bất kỳ một sản phẩm nào
SELECT Customer.cID, cName, cAge
FROM Customer LEFT JOIN Order1 ON Order1.cID = Customer.cID
WHERE Order1.cID is null

-- Hiển thị mã hóa đơn, ngày bán và giá tiền của từng hóa đơn (giá một hóa đơn được tính bằng tổng giá bán của từng loại mặt hàng xuất hiện trong hóa đơn. Giá bán của từng loại được tính = odQTY*pPrice)
SELECT ORDER1.oID, oDate, SUM(odQTY*pPrice) as Total
FROM ORDERDETAIL 
JOIN PRODUCT ON PRODUCT.pID = ORDERDETAIL.pID 
JOIN ORDER1 ON ORDER1.oID = ORDERDETAIL.oID
GROUP BY oID