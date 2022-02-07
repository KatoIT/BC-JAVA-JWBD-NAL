CREATE DATABASE QuanLyBanHang;
USE QuanLyBanHang;

CREATE TABLE CUSTOMER(
    cID INT NOT NULL PRIMARY KEY,
    cName NVARCHAR(100) NOT NULL,
    cAge INT NULL
);
GO
CREATE TABLE ORDER(
    orID INT NOT NULL,
    cID INT NOT NULL,
    cDate DATETIME NOT NULL,
    oTotalPrice FLOAT NOT NULL,
    PRIMARY KEY (orID),
    FOREIGN KEY (cID) REFERENCES CUSTOMER(cID)
);
GO
CREATE TABLE PRODUCT(
    pID INT NOT NULL PRIMARY KEY,
    pName NVARCHAR(100) NOT NULL,
    pPrice FLOAT NOT NULL
);
GO
CREATE TABLE ORDERDETAIL(
    orID INT NOT NULL,
    cID INT NOT NULL,
    odQTy INT NOT NULL,    
    PRIMARY KEY (orID, cID),
    FOREIGN KEY (orID) REFERENCES ORDER(orID),
    FOREIGN KEY (cID) REFERENCES CUSTOMER(cID)
);


