-- O banco de dados a seguir descreve uma sociedade fictícia de abelhas com as seguintes características:
-- Cada abelha possui somente uma função
-- A idade das abelhas é medida em dias
-- As abelhas são "pagas" com unidades de mel por seu trabalho
-- O "salário" de cada abelha está atrelado a sua função e é pago por dia
-- Dentro da sociedade, existe uma hierarquia determinada pela função de cada abelha, na qual a posição mais alta pertence a rainha
-- Cada abelha mora em um favo, que por sua vez pode abrigar mais de 1 abelha
-- Uma colmeia é localizada a partir de sua posição x e y

-- Seu trabalho como analista das abelhas é apresentar as informações requisitadas pelas rainhas. 

-- RELATION
-- Exercício 0:
-- As rainhas precisam saber quais são as abelhas presentes em todas as colmeias, assim como suas informações.
-- Selecione todas as abelhas

-- PROJECTION
-- Exercício 1:
-- Após ver que haviam informações demais, as rainhas decidiram que precisavam somente do id, nome e a quantidade de mel de cada abelha.
-- Liste o id, nome e a quantidade de mel de cada abelha

-- SELECTION
-- Exercício 2:
-- Com a intenção de cortar alguns gastos, as rainhas precisam levantar quais são as funções que pagam mais que 40 unidades de mel por dia.
-- Liste as funções que pagam mais de 40 unidades de mel por dia

-- RENAME
-- Exercício 3:
-- A fim de traçar rotas entre as colmeias, as rainhas precisam das informações de localização de cada uma delas, porém, elas precisam dessa localização em latitude e longetude. Para isso selecione todos os atributos das colmeias e considere x como latitude e y como longetude.
-- Pesquise pelas colmeias de forma que a saída possua os seguintes atributos: id, latitude, longetude e mel. Considere x como latitude e y como longetude

-- JOIN
-- Exercício 4:
-- Por algum motivo, estão havendo atrasos nas entregas do mel para a distribuição. Pesquise quais são as abelhas que trabalham no transporte para que seja possível tomar as devidas providências.
-- Pesquise as abelhas que trabalham no transporte de mel

-- UNION
-- Exercício 5:
-- Já que muitas abelhas coletoras estavam se perdendo durante o trabalho, foi requisitado que houvesse uma lista de pontos de interesse. Essa lista deve ser composta pela posição x e y tanto de colmeias quanto de flores.
-- Selecione todos os locais de interesse por sua posição x e y (Colmeias e Flores)

-- CROSS JOIN
-- Exercício 6:
-- Como o analista estava ocioso e as rainhas não aceitam que ninguém pare de trabalhar, foi pedido que ele listasse todos os trabalhos relacionados a todas as abelhas, independete delas exercerem essa função ou não.
-- Selecione todos os trabalhos relacionados às abelhas que possuem a idade maior que o salário oferecido (A abelha não precisa exercer a profissão)  

-- INTERSECTION
-- Exercício 7:
-- O fato dos ids das abelhas serem semelhantes aos ids das colmeias faz com que hajam confusões na hora de referenciar um ou outro. Por este motivo as rainhas precisam que liste os ids de abelhas que também são ids de colmeias e assim acabar com as confusões.
-- Selecione todos os ids de abelhas que também são ids de colmeias

-- DIFFERENCE
-- Exercício 8:
-- Mesmo com a listagem de ids iguais entre abelhas e colmeias, ainda ficaram algumas dúvidas. Então liste todos os ids de colmeias que não sejam ids de abelhas.
-- Selecione todos os ids de colmeias que não sejam ids de abelhas

-- DIVISION
-- Exercício 9:
-- Com a implantação de uma nova política de incentivo, as abelhas que conseguirem polinizar todas as flores da região ganharão um bônus no salário diário. Encontre quais são as abelhas que receberão esse prêmio.
-- Pesquise pelas abelhas que participam da polinização de todas as flores

-- TRANSITIVE CLOSURE
-- Exercício 10:
-- Como a organização da colmeia ainda é nova, não se sabe ao certo quem é subordinado a quem. Para resolver esse problema, encontre todas as relações de hierarquia presentes nas funções exercidas pelas abelhas. Considere a regra de transitividade: a -> b; b -> c; a -> c.
-- Descubra todas as relações de hierarquia (chefe / subordinado) presentes na sociedade das abelhas

CREATE DATABASE Bees;
USE Bees;

CREATE TABLE Hive(
	idHive 		INT 	NOT NULL 	PRIMARY KEY AUTO_INCREMENT,
	positionX 	INT 	NOT NULL,
	positionY 	INT 	NOT NULL,
	honey 		DECIMAL NOT NULL
);

CREATE TABLE Comb(
	idComb 		INT 	NOT NULL 	PRIMARY KEY AUTO_INCREMENT,
	idHive 		INT 	NOT NULL,
	CONSTRAINT fk_comb_idHive FOREIGN KEY (idHive) REFERENCES Hive (idHive)
);

CREATE TABLE Job(
	idJob 		INT 	NOT NULL 	PRIMARY KEY AUTO_INCREMENT,
	description	VARCHAR(50) NOT NULL,
	salary 		DECIMAL	NOT NULL
);

CREATE TABLE Bee(
	idBee 		INT 	NOT NULL 	PRIMARY KEY AUTO_INCREMENT,
	name 		VARCHAR(50) NOT NULL,
	age 		INT 	NOT NULL,
	honey 		DECIMAL NOT NULL,
	idJob		INT 	NOT NULL,
	idComb		INT 	NOT NULL,
	CONSTRAINT fk_bee_idJob FOREIGN KEY (idJob) REFERENCES Job (idJob),
	CONSTRAINT fk_bee_idComb FOREIGN KEY (idComb) REFERENCES Comb (idComb)
);

CREATE TABLE Hierarchy(
	idInferior 	INT 	NOT NULL,
	idSuperior 	INT 	NOT NULL,
	CONSTRAINT fk_hierarchy_idInferior FOREIGN KEY (idInferior) REFERENCES Job (idJob),
	CONSTRAINT fk_hierarchy_idSuperior FOREIGN KEY (idSuperior) REFERENCES Job (idJob)
);

CREATE TABLE Flower(
	idFlower 	INT 	NOT NULL 	PRIMARY KEY AUTO_INCREMENT,
	positionX 	INT 	NOT NULL,
	positionY 	INT 	NOT NULL
);

CREATE TABLE Pollen(
	idFlower 	INT 	NOT NULL,
	idBee 		INT 	NOT NULL,
	CONSTRAINT fk_pollen_idFlower FOREIGN KEY (idFlower) REFERENCES Flower (idFlower),
	CONSTRAINT fk_pollen_idBee FOREIGN KEY (idBee) REFERENCES Bee (idBee)
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
-- First Hive
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
-- Second Hive
(13, 'Amanda Janette'	, 163	, 18.72, 1, 5),
(14, 'Rowina Emerson'	, 131	, 5.13, 7, 5),
(15, 'Kaycee Coretta'	, 99	, 6.05, 3, 5),
(16, 'Kaitlynn Carver'	, 61	, 6.20, 4, 5),
(17, 'Luke Silas'		, 39	, 2.98, 5, 6),
(18, 'Phillipa Ros'		, 137	, 4.03, 6, 6),
(19, 'JoBeth Tim'		, 92	, 4.27, 3, 6),
-- Third Hive
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

-- Collector bee ids
-- 3 9 15 19 22 23 32 33
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


------------ RQL DATABASE DEFINITION ------------
Hive.idHive:INTEGER;
Hive.positionX:INTEGER;
Hive.positionY:INTEGER;
Hive.honey:DOUBLE;

Comb.idComb:INTEGER;
Comb.idHive:INTEGER;

Job.idJob:INTEGER;
Job.description:VARCHAR;
Job.salary:DOUBLE;

Bee.idBee:INTEGER;
Bee.name:VARCHAR;
Bee.age:INTEGER;
Bee.honey:DOUBLE;
Bee.idJob:INTEGER;
Bee.idComb:INTEGER;

Hierarchy.idInferior:INTEGER;
Hierarchy.idSuperior:INTEGER;

Flower.idFlower:INTEGER;
Flower.positionX:INTEGER;
Flower.positionY:INTEGER;

Pollen.idFlower:INTEGER;
Pollen.idBee:INTEGER;

Hive.idHive:INTEGER;Hive.positionX:INTEGER;Hive.positionY:INTEGER;Hive.honey:DOUBLE;Comb.idComb:INTEGER;Comb.idHive:INTEGER;Job.idJob:INTEGER;Job.description:VARCHAR;Job.salary:DOUBLE;Bee.idBee:INTEGER;Bee.name:VARCHAR;Bee.age:INTEGER;Bee.honey:DOUBLE;Bee.idJob:INTEGER;Bee.idCom:INTEGER;Hierarchy.idInferior:INTEGER;Hierarchy.idSuperior:INTEGER;Flower.idFlower:INTEGER;Flower.positionX:INTEGER;Flower.positionY:INTEGER;Pollen.idFlower:INTEGER;Pollen.idBee:INTEGER;