CREATE TABLE IF NOT EXISTS Colmeia(
	idColmeia 	SERIAL 	NOT NULL PRIMARY KEY,
	posicaoX 	INT 	NOT NULL,
	posicaoY 	INT 	NOT NULL,
	mel 		DECIMAL NOT NULL
);

CREATE TABLE IF NOT EXISTS Favo(
	idFavo 		SERIAL 	NOT NULL PRIMARY KEY,
	idColmeia 	INT 	NOT NULL REFERENCES Colmeia (idColmeia)
);

CREATE TABLE IF NOT EXISTS Trabalho(
	idTrabalho 	SERIAL  	NOT NULL PRIMARY KEY,
	descricao	VARCHAR(50) NOT NULL,
	salario 	DECIMAL		NOT NULL
);

CREATE TABLE IF NOT EXISTS Abelha(
	idAbelha 	SERIAL  	NOT NULL PRIMARY KEY,
	nome 		VARCHAR(50) NOT NULL,
	idade 		INT 		NOT NULL,
	mel 		DECIMAL 	NOT NULL,
	idTrabalho	INT 		NOT NULL REFERENCES Trabalho (idTrabalho),
	idFavo		INT 		NOT NULL REFERENCES Favo (idFavo)
);

CREATE TABLE IF NOT EXISTS Hierarquia(
	idInferior 	INT 	NOT NULL REFERENCES Trabalho (idTrabalho),
	idSuperior 	INT 	NOT NULL REFERENCES Trabalho (idTrabalho)
);

CREATE TABLE IF NOT EXISTS Flor(
	idFlor 	SERIAL 	NOT NULL PRIMARY KEY,
	posicaoX 	INT 	NOT NULL,
	posicaoY 	INT 	NOT NULL
);

CREATE TABLE IF NOT EXISTS Polen(
	idFlor 		INT 	NOT NULL REFERENCES Flor (idFlor),
	idAbelha 	INT 	NOT NULL REFERENCES Abelha (idAbelha)
);

INSERT INTO Colmeia (idColmeia, posicaoX, posicaoY, mel) VALUES
	(1, 14, 26, 580.56),
	(2, 27, 18, 365.45),
	(3, 46, 77, 779.64);

INSERT INTO Favo (idFavo, idColmeia) VALUES
	(1, 1),
	(2, 1),
	(3, 1),
	(4, 1),
	(5, 2),
	(6, 2),
	(7, 3),
	(8, 3),
	(9, 3),
	(10, 3),
	(11, 3);

INSERT INTO Trabalho (idTrabalho, descricao, salario) VALUES
	(1, 'Rainha', 50.0),
	(2, 'Guarda', 10.0),
	(3, 'Coletor', 5.0),
	(4, 'Operário', 3.0),
	(5, 'Transportador', 2.0),
	(6, 'Fazedor de mel', 7.0),
	(7, 'Gerente', 8.0),
	(8, 'Supervisor', 5.0);

INSERT INTO Abelha (idAbelha, nome, idade, mel, idTrabalho, idFavo) VALUES

(1, 'Edwina Lowell'		, 45	, 25.31, 1, 1),
(2, 'Diana Portia'		, 66	, 0.78, 2, 1),
(3, 'Brandt Jenna'		, 104	, 9.99, 3, 1),
(4, 'Donna Romy	'		, 150	, 6.11, 4, 2),
(5, 'Robby Salina'		, 16	, 8.75, 5, 2),
(6, 'Amie Kyler	'		, 111	, 2.30, 6, 2),
(7, 'Luther Randal'		, 88	, 4.09, 7, 3),
(8, 'Euphemia Lissa'	, 79	, 4.05, 8, 3),
(9, 'Karrie Nigel'		, 70	, 7.59, 3, 3),
(10, 'Lorne Beulah'		, 130	, 7.46, 4, 3),
(11, 'Tilly Andie'		, 126	, 5.65, 5, 4),
(12, 'Kegan Jerrod'		, 184	, 0.24, 6, 4),

(13, 'Amanda Janette'	, 163	, 18.72, 1, 5),
(14, 'Rowina Emerson'	, 131	, 5.13, 7, 5),
(15, 'Kaycee Coretta'	, 99	, 6.05, 3, 5),
(16, 'Kaitlynn Carver'	, 61	, 6.20, 4, 5),
(17, 'Luke Silas'		, 39	, 2.98, 5, 6),
(18, 'Phillipa Ros'		, 137	, 4.03, 6, 6),
(19, 'JoBeth Tim'		, 92	, 4.27, 3, 6),

(20, 'Ophelia Richmaly'	, 167	, 32.19, 1, 7),
(21, 'Cavan Emelia'		, 76	, 7.48, 2, 7),
(22, 'Ripley Goodwin'	, 41	, 0.98, 3, 7),
(23, 'Walt Tittus'		, 62	, 1.12, 3, 8),
(24, 'Mitch Denny'		, 148	, 5.17, 4, 8),
(25, 'Dawn Georgene'	, 129	, 7.41, 4, 8),
(26, 'Paisley Alisha'	, 80	, 2.10, 5, 8),
(27, 'Pauletta Pearl'	, 101	, 1.69, 5, 8),
(28, 'Dorita Eustace'	, 100	, 3.74, 6, 9),
(29, 'Aldous Mikki'		, 183	, 7.42, 6, 9),
(30, 'Timotha Marci'	, 57	, 5.98, 7, 10),
(31, 'Narelle Sherrie'	, 134	, 3.37, 8, 10),
(32, 'Jarred Claud'		, 123	, 6.58, 3, 11),
(33, 'Mandi Adeline'	, 158	, 8.48, 3, 11);


INSERT INTO Flor (idFlor, posicaoX, posicaoY) VALUES
	(1, 5.04, 9.29),
	(2, 6.96, 4.73),
	(3, 0.60, 9.86),
	(4, 7.40, 1.79),
	(5, 5.09, 0.86),
	(6, 0.17, 4.61),
	(7, 2.14, 1.87),
	(8, 0.57, 1.41),
	(9, 6.34, 5.87),
	(10, 4.87, 5.20),
	(11, 0.08, 9.80);


INSERT INTO Polen (idFlor, idAbelha) VALUES
	(1, 33),
	(2, 33),
	(3, 33),
	(4, 33),
	(5, 33),
	(6, 33),
	(7, 33),
	(8, 33),
	(9, 33),
	(10, 33),
	(11, 33),

	(1, 15),
	(1, 23),
	(2, 19),
	(2, 22),
	(2, 23),
	(2, 3),
	(2, 15),
	(3, 23),
	(3, 19),
	(3, 3),
	(3, 15),
	(4, 15),
	(4, 32),
	(4, 3),
	(4, 23),
	(4, 9),
	(5, 15),
	(5, 32),
	(5, 9),
	(6, 23),
	(6, 15),
	(6, 3),
	(6, 32),
	(6, 9),
	(7, 22),
	(7, 15),
	(7, 32),
	(8, 9),
	(8, 3),
	(8, 19),
	(8, 22),
	(9, 15),
	(9, 3),
	(9, 19),
	(10, 3),
	(10, 15),
	(11, 3),
	(11, 19),
	(11, 22);


INSERT INTO Hierarquia (idInferior, idSuperior) VALUES
	(2, 1),
	(3, 8),
	(4, 8),
	(5, 8),
	(6, 7),
	(7, 2),
	(8, 6);


CREATE TABLE IF NOT EXISTS Hive(
	idHive 		SERIAL 	NOT NULL PRIMARY KEY,
	positionX 	INT 	NOT NULL,
	positionY 	INT 	NOT NULL,
	honey 		DECIMAL NOT NULL
	);

CREATE TABLE IF NOT EXISTS Comb(
	idComb 		SERIAL 	NOT NULL PRIMARY KEY,
	idHive 		INT 	NOT NULL REFERENCES Hive (idHive)
	);

CREATE TABLE IF NOT EXISTS Job(
	idJob 		SERIAL  	NOT NULL PRIMARY KEY,
	description	VARCHAR(50) NOT NULL,
	salary 		DECIMAL		NOT NULL
	);

CREATE TABLE IF NOT EXISTS Bee(
	idBee 		SERIAL  	NOT NULL PRIMARY KEY,
	name 		VARCHAR(50) NOT NULL,
	age 		INT 		NOT NULL,
	honey 		DECIMAL 	NOT NULL,
	idJob		INT 		NOT NULL REFERENCES Job (idJob),
	idComb		INT 		NOT NULL REFERENCES Comb (idComb)
	);

CREATE TABLE IF NOT EXISTS Hierarchy(
	idInferior 	INT 	NOT NULL REFERENCES Job (idJob),
	idSuperior 	INT 	NOT NULL REFERENCES Job (idJob)
	);

CREATE TABLE IF NOT EXISTS Flower(
	idFlower 	SERIAL 	NOT NULL PRIMARY KEY,
	positionX 	INT 	NOT NULL,
	positionY 	INT 	NOT NULL
	);

CREATE TABLE IF NOT EXISTS Pollen(
	idFlower 	INT 	NOT NULL REFERENCES Flower (idFlower),
	idBee 		INT 	NOT NULL REFERENCES Bee (idBee)
	);

INSERT INTO Hive (idHive, positionX, positionY, honey) VALUES 
	(1, 14, 26, 580.56),
	(2, 27, 18, 365.45),
	(3, 46, 77, 779.64);

INSERT INTO Comb (idComb, idHive) VALUES
	(1, 1),
	(2, 1),
	(3, 1),
	(4, 1),
	(5, 2),
	(6, 2),
	(7, 3),
	(8, 3),
	(9, 3),
	(10, 3),
	(11, 3);
	

INSERT INTO Job (idJob, description, salary) VALUES
	(1, 'Queen', 50.0),
	(2, 'Guard', 10.0),
	(3, 'Collector', 5.0),
	(4, 'Worker', 3.0),
	(5, 'Transporter', 2.0),
	(6, 'Honey Maker', 7.0),
	(7, 'Manager', 8.0),
	(8, 'Supervisor', 5.0);
	

INSERT INTO Bee (idBee, name, age, honey, idJob, idComb) VALUES
	(1, 'Edwina Lowell'		, 45	, 25.31, 1, 1),
	(2, 'Diana Portia'		, 66	, 0.78, 2, 1),
	(3, 'Brandt Jenna'		, 104	, 9.99, 3, 1),
	(4, 'Donna Romy	'		, 150	, 6.11, 4, 2),
	(5, 'Robby Salina'		, 16	, 8.75, 5, 2),
	(6, 'Amie Kyler	'		, 111	, 2.30, 6, 2),
	(7, 'Luther Randal'		, 88	, 4.09, 7, 3),
	(8, 'Euphemia Lissa'	, 79	, 4.05, 8, 3),
	(9, 'Karrie Nigel'		, 70	, 7.59, 3, 3),
	(10, 'Lorne Beulah'		, 130	, 7.46, 4, 3),
	(11, 'Tilly Andie'		, 126	, 5.65, 5, 4),
	(12, 'Kegan Jerrod'		, 184	, 0.24, 6, 4),
	(13, 'Amanda Janette'	, 163	, 18.72, 1, 5),
	(14, 'Rowina Emerson'	, 131	, 5.13, 7, 5),
	(15, 'Kaycee Coretta'	, 99	, 6.05, 3, 5),
	(16, 'Kaitlynn Carver'	, 61	, 6.20, 4, 5),
	(17, 'Luke Silas'		, 39	, 2.98, 5, 6),
	(18, 'Phillipa Ros'		, 137	, 4.03, 6, 6),
	(19, 'JoBeth Tim'		, 92	, 4.27, 3, 6),
	(20, 'Ophelia Richmaly'	, 167	, 32.19, 1, 7),
	(21, 'Cavan Emelia'		, 76	, 7.48, 2, 7),
	(22, 'Ripley Goodwin'	, 41	, 0.98, 3, 7),
	(23, 'Walt Tittus'		, 62	, 1.12, 3, 8),
	(24, 'Mitch Denny'		, 148	, 5.17, 4, 8),
	(25, 'Dawn Georgene'	, 129	, 7.41, 4, 8),
	(26, 'Paisley Alisha'	, 80	, 2.10, 5, 8),
	(27, 'Pauletta Pearl'	, 101	, 1.69, 5, 8),
	(28, 'Dorita Eustace'	, 100	, 3.74, 6, 9),
	(29, 'Aldous Mikki'		, 183	, 7.42, 6, 9),
	(30, 'Timotha Marci'	, 57	, 5.98, 7, 10),
	(31, 'Narelle Sherrie'	, 134	, 3.37, 8, 10),
	(32, 'Jarred Claud'		, 123	, 6.58, 3, 11),
	(33, 'Mandi Adeline'	, 158	, 8.48, 3, 11);
	

INSERT INTO Flower (idFlower, positionX, positionY) VALUES
	(1, 5.04, 9.29),
	(2, 6.96, 4.73),
	(3, 0.60, 9.86),
	(4, 7.40, 1.79),
	(5, 5.09, 0.86),
	(6, 0.17, 4.61),
	(7, 2.14, 1.87),
	(8, 0.57, 1.41),
	(9, 6.34, 5.87),
	(10, 4.87, 5.20),
	(11, 0.08, 9.80);
	
INSERT INTO Pollen (idFlower, idBee) VALUES
	(1, 33),
	(2, 33),
	(3, 33),
	(4, 33),
	(5, 33),
	(6, 33),
	(7, 33),
	(8, 33),
	(9, 33),
	(10, 33),
	(11, 33),

	(1, 15),
	(1, 23),
	(2, 19),
	(2, 22),
	(2, 23),
	(2, 3),
	(2, 15),
	(3, 23),
	(3, 19),
	(3, 3),
	(3, 15),
	(4, 15),
	(4, 32),
	(4, 3),
	(4, 23),
	(4, 9),
	(5, 15),
	(5, 32),
	(5, 9),
	(6, 23),
	(6, 15),
	(6, 3),
	(6, 32),
	(6, 9),
	(7, 22),
	(7, 15),
	(7, 32),
	(8, 9),
	(8, 3),
	(8, 19),
	(8, 22),
	(9, 15),
	(9, 3),
	(9, 19),
	(10, 3),
	(10, 15),
	(11, 3),
	(11, 19),
	(11, 22);
	

INSERT INTO Hierarchy (idInferior, idSuperior) VALUES
	(2, 1),
	(3, 8),
	(4, 8),
	(5, 8),
	(6, 7),
	(7, 2),
	(8, 6);
	

/*----------------------- QUESTIONNAIRE -----------------------*/

CREATE TABLE IF NOT EXISTS Login(
	idLogin		SERIAL 			NOT NULL PRIMARY KEY,
	name 		VARCHAR(50) 	NOT NULL,
	birth 		DATE 			NOT NULL,
	institution VARCHAR(100) 	NOT NULL,
	formation 	INT 			NOT NULL,
	area 		VARCHAR(50)		NOT NULL,
	situation	INT 			NOT NULL,
	country 	VARCHAR(30) 	NOT NULL,
	email 		CHAR(64) 		NOT NULL,
	pass 		CHAR(64)		NOT NULL,
	experience 	INT 			NOT NULL
);

CREATE TABLE IF NOT EXISTS Answer(
	idQuestion 	INT 			NOT NULL,
	idLogin		INT 			NOT NULL REFERENCES Login (idLogin),
	rqlAnswer 	VARCHAR(1000)	NULL,
	sqlAnswer 	VARCHAR(1000)	NULL,
	rqlTime		DECIMAL			NOT NULL,
	sqlTime 	DECIMAL			NOT NULL,
	rqlErrors	INT 			NOT NULL,
	sqlErrors	INT 			NOT NULL
);

CREATE TABLE IF NOT EXISTS ComparationQuestion(
	idLogin 		INT 			NOT NULL REFERENCES Login (idLogin),
	questionNumber	INT 			NOT NULL,
	answer 			INT 			NOT NULL
);