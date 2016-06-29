DROP DATABASE rql;
CREATE DATABASE rql;
USE rql;

CREATE TABLE People(
	idPeople INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	name VARCHAR(100) NOT NULL,
	age INT NOT NULL
);

CREATE TABLE Sale(
	idSale INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	idPeople INT NOT NULL,
	saleDate DATE
);

CREATE TABLE ItemSale(
	idSale INT NOT NULL,
	idProduct INT NOT NULL,
	quantity INT NOT NULL
);

CREATE TABLE Product(
	idProduct INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	name VARCHAR(100) NOT NULL,
	price DOUBLE(9,2) NOT NULL,
	idCategory INT NOT NULL
);

CREATE TABLE Composition(
	idCompound INT NOT NULL,
	idComponent INT NOT NULL
);

CREATE TABLE Category(
	idCategory INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	description VARCHAR(100)
);

INSERT INTO People (name, age) VALUES ('Jessica', 14), ('Mark', 74), ('Alex', 28), ('Alan', 45);
INSERT INTO Category (description) VALUES ('Computer'), ('Notebook'), ('Tablet'), ('Smartphone'), ('Miscellanous');
INSERT INTO Product (name, price, idCategory) VALUES ('ASUS', 2000.00, 1), ('Dell', 2500.00, 2), ('Samsung', 300.00, 3), ('Apple', 1999.99, 4), ('Keyboard', 30.00, 5), ('Button', 0.05, 5), ('Plastic', 0.05, 5);
INSERT INTO Sale (idPeople, saleDate) VALUES (1, '2016-02-10'), (2, '2016-06-01'), (3, '2015-03-29'), (4, '2014-12-09');
INSERT INTO ItemSale (idSale, idProduct, quantity) VALUES (1, 1, 1), (2, 2, 1), (3, 3, 1), (4, 4, 1);
INSERT INTO Composition (idCompound, idComponent) VALUES (5, 6), (6, 7);

People.idPeople:INTEGER;
People.name:VARCHAR;
People.age:INTEGER;
Sale.idSale:INTEGER;
Sale.idPeople:INTEGER;
Sale.saleDate:VARCHAR;
ItemSale.idSale:INTEGER;
ItemSale.idProduct:INTEGER;
ItemSale.quantity:INTEGER;
Product.idProduct:INTEGER;
Product.name:VARCHAR;
Product.price:REAL;
Product.idCategory:INTEGER;
Categery.idCategory:INTEGER;
Category.description:VARCHAR;
Composition.idCompound:INTEGER;
Composition.idComponent:INTEGER;

