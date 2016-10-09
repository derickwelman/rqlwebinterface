DROP DATABASE Questionnaire;
CREATE DATABASE Questionnaire;
USE Questionnaire;

CREATE TABLE Login(
	idLogin		INT 			NOT NULL 	PRIMARY KEY AUTO_INCREMENT,
	name 		VARCHAR(50) 	NOT NULL,
	institution VARCHAR(100) 	NOT NULL,
	login 		VARCHAR(50) 	NOT NULL,
	pass 		VARCHAR(50) 	NOT NULL,
	country 	VARCHAR(50) 	NOT NULL,
	experience 	INT 			NOT NULL
);
 
CREATE TABLE Answer(
	idQuestion 	INT 			NOT NULL,
	idLogin		INT 			NOT NULL,
	rqlAnswer 	VARCHAR(1000)	NULL,
	sqlAnswer 	VARCHAR(1000)	NULL,
	rqlTime		DOUBLE 			NOT NULL,
	sqlTime 	DOUBLE			NOT NULL,
	rqlErrors	INT 			NOT NULL,
	sqlErrors	INT 			NOT NULL,
	CONSTRAINT pk_answer PRIMARY KEY (idQuestion, idLogin),
	CONSTRAINT fk_answer_user FOREIGN KEY (idLogin) REFERENCES Login (idLogin)		
);