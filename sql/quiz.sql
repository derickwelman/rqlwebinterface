DROP DATABASE Questionnaire;
CREATE DATABASE Questionnaire;
USE Questionnaire;

CREATE TABLE User(
	idUser 		INT 		NOT NULL 	PRIMARY KEY AUTO_INCREMENT,
	name 		VARCHAR 	NOT NULL,
	institution VARCHAR 	NOT NULL,
	user 		VARCHAR 	NOT NULL,
	pass 		VARCHAR 	NOT NULL,
	country 	VARCHAR 	NOT NULL,
	experience 	INT 		NOT NULL
);
 
CREATE TABLE Answer(
	idQuestion 	INT 		NOT NULL,
	idUser 		INT 		NOT NULL,
	answer 		VARCHAR		NOT NULL,
	CONSTRAINT pk_answer PRIMARY KEY (idQuestion, idUser),
	CONSTRAINT fk_answer_user FOREIGN KEY (idUser) REFERENCES User (idUser)		
);