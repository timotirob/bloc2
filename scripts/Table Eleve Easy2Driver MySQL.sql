SET foreign_key_checks = 0;
DROP TABLE IF EXISTS AutoEcole ;

CREATE TABLE IF NOT EXISTS AutoEcole(
id INT NOT NULL AUTO_INCREMENT,
raisonSociale VARCHAR(200),
rue VARCHAR(50),
codePostal CHAR(5),
ville VARCHAR(100),
PRIMARY KEY (id)
);

INSERT INTO AutoEcole(raisonSociale ,rue ,codePostal ,ville) 
VALUES('Mme Autosure','72 Bld Bessieres','75017','Paris') ;

DROP TABLE IF EXISTS UTILISATEUR ;

CREATE TABLE IF NOT EXISTS UTILISATEUR(
id INT NOT NULL AUTO_INCREMENT,
login VARCHAR(50),
passwordHash VARCHAR(200),
nom VARCHAR(80),
prenom VARCHAR(80),
email VARCHAR(200),
idAutoEcole INT NOT NULL,
PRIMARY KEY (id),
FOREIGN KEY(idAutoEcole) REFERENCES AutoEcole(Id)
);

INSERT INTO UTILISATEUR(login,passwordHash,nom,prenom,email,idAutoEcole)
VALUES('trobert','jfldksjfklsdjf','Robert','Timothée','robert.btssio@gmail.com',1) ;

INSERT INTO UTILISATEUR(login,passwordHash,nom,prenom,email,idAutoEcole)
VALUES('gdupond','123dfsqaa3132fdfs','Dupond','Gertrude','gertrude.dupond@gmail.com',1) ;

INSERT INTO UTILISATEUR(login,passwordHash,nom,prenom,email,idAutoEcole)
VALUES('yfofana','pr12454554aaddderr','Fofana','Yamissa','yamissa.fofana@gmail.com',1) ;

-- Eleve (idUtilisateur, dateNaissance, rue, codePostal, ville, 
-- dateInscription, NEPH, dateETG, echecETG, garantieReussite)
-- Clé primaire : idUtilisateur
-- Clé étrangère : idUtilisateur en référence à id de Utilisateur
DROP TABLE IF EXISTS ELEVE ;

CREATE TABLE IF NOT EXISTS ELEVE(
idUtilisateur INT NOT NULL AUTO_INCREMENT,
dateNaissance DATE ,
adresse VARCHAR(200),
dateInscription DATE ,
NEPH CHAR(12) ,
dateETG DATE,
echecETG bool ,
garantieReussite BOOL,
PRIMARY KEY (idUtilisateur),
FOREIGN KEY(idUtilisateur) REFERENCES utilisateur(id)
);

INSERT INTO ELEVE(dateNaissance,adresse,dateInscription,NEPH,dateETG,echecETG,garantieReussite)
 VALUES ('1971-06-15','41 rue Carnot 94700 Maisons-Alfort',
'2023-05-12','123456789123','2023-06-24',1,1);
INSERT INTO ELEVE(dateNaissance,adresse,dateInscription,NEPH,dateETG,echecETG,garantieReussite) 
VALUES ('1970-05-04','4 rue de la Paix 94250 Gentilly',
'2023-05-18','213456789123','2023-06-24',1,1);
INSERT INTO ELEVE(dateNaissance,adresse,dateInscription,NEPH,dateETG,echecETG,garantieReussite) 
VALUES ('2004-04-22','24 av Foch 75016 Paris',
'2023-05-23','165456789123',NULL,0,1);

DROP TABLE IF EXISTS SerieTest ;

CREATE TABLE IF NOT EXISTS SerieTest(
id INT NOT NULL AUTO_INCREMENT,
theme VARCHAR(200),
PRIMARY KEY (id)
);

INSERT INTO SerieTest(theme)  VALUES ('Stop 1') ;
 INSERT INTO SerieTest(theme) VALUES ('Stop 2') ;
 INSERT INTO SerieTest(theme) VALUES ('Stop 3') ;
 INSERT INTO SerieTest(theme) VALUES ('Croisement 1') ;
  INSERT INTO SerieTest(theme) VALUES ('Croisement 2') ;
 INSERT INTO SerieTest(theme) VALUES ('Feux 1') ;
INSERT INTO SerieTest(theme) VALUES ('Feux 2') ;
 INSERT INTO SerieTest(theme) VALUES ('Feux 3') ;
 INSERT INTO SerieTest(theme) VALUES ('Dépassement 1') ;
INSERT INTO SerieTest(theme) VALUES ('Dépassement 2') ;
INSERT INTO SerieTest(theme) VALUES ('Feux') ;
INSERT INTO SerieTest(theme) VALUES ('Panneaux ronds 1') ;
INSERT INTO SerieTest(theme) VALUES ('Panneaux ronds 2') ;
INSERT INTO SerieTest(theme) VALUES ('Panneaux triangles 1') ;
INSERT INTO SerieTest(theme) VALUES ('Panneaux triangles 2') ;
INSERT INTO SerieTest(theme) VALUES ('Autres panneaux') ;
INSERT INTO SerieTest(theme) VALUES ('Pluie') ;
INSERT INTO SerieTest(theme) VALUES ('Verglas') ;
INSERT INTO SerieTest(theme) VALUES ('Ronds points') ;
INSERT INTO SerieTest(theme) VALUES ('Parkings') ;
INSERT INTO SerieTest(theme) VALUES ('Freinage') ;
INSERT INTO SerieTest(theme) VALUES ('Pneus') ;
INSERT INTO SerieTest(theme) VALUES ('Mécanique') ;
INSERT INTO SerieTest(theme) VALUES ('Entretien') ;
INSERT INTO SerieTest(theme) VALUES ('Marquage au sol') ;
INSERT INTO SerieTest(theme) VALUES ('Démarrage côté') ;
INSERT INTO SerieTest(theme) VALUES ('Créneaux') ;
INSERT INTO SerieTest(theme) VALUES ('Vitesse') ;

DROP TABLE IF EXISTS ExamenBlanc ;

CREATE TABLE IF NOT EXISTS ExamenBlanc(
id INT NOT NULL AUTO_INCREMENT,
nom VARCHAR(200),
PRIMARY KEY (id)
);

INSERT INTO ExamenBlanc(nom)  VALUES ('Examen 1') ;
INSERT INTO ExamenBlanc(nom)  VALUES ('Examen 2') ;
INSERT INTO ExamenBlanc(nom)  VALUES ('Examen 3') ;
INSERT INTO ExamenBlanc(nom)  VALUES ('Examen 4') ;
INSERT INTO ExamenBlanc(nom)  VALUES ('Examen 5') ;
INSERT INTO ExamenBlanc(nom)  VALUES ('Examen 6') ;
INSERT INTO ExamenBlanc(nom)  VALUES ('Examen 7') ;
INSERT INTO ExamenBlanc(nom)  VALUES ('Examen 8') ;


DROP TABLE IF EXISTS Evaluer ;

CREATE TABLE IF NOT EXISTS Evaluer(
ideleve INT NOT NULL,
idSerieTest INT NOT NULL,
dateHeure DATETIME NOT NULL,
evaluerScore INT,
PRIMARY KEY (ideleve,idSerieTest, dateHeure),
FOREIGN KEY(ideleve) REFERENCES Eleve(idUtilisateur),
FOREIGN KEY(idSerieTest) REFERENCES SerieTest(id)
);

 INSERT INTO Evaluer(ideleve,idSerieTest,dateHeure,evaluerScore)  VALUES (1,1,'2023-10-28 19:30:35',14);
 INSERT INTO Evaluer(ideleve,idSerieTest,dateHeure,evaluerScore) VALUES (1,2,'2023-10-28 19:35:35',16);
 INSERT INTO Evaluer(ideleve,idSerieTest,dateHeure,evaluerScore) VALUES (1,5,'2023-10-28 19:40:35',11);
 INSERT INTO Evaluer(ideleve,idSerieTest,dateHeure,evaluerScore) VALUES (1,7,'2023-10-28 19:45:35',10);
 INSERT INTO Evaluer(ideleve,idSerieTest,dateHeure,evaluerScore) VALUES (1,9,'2023-10-28 19:50:35',12);
 INSERT INTO Evaluer(ideleve,idSerieTest,dateHeure,evaluerScore) VALUES (1,12,'2023-10-28 19:55:35',10);
 INSERT INTO Evaluer(ideleve,idSerieTest,dateHeure,evaluerScore) VALUES (1,13,'2023-10-28 20:00:35',15);
 INSERT INTO Evaluer(ideleve,idSerieTest,dateHeure,evaluerScore) VALUES (1,14,'2023-10-28 20:05:35',15);
 INSERT INTO Evaluer(ideleve,idSerieTest,dateHeure,evaluerScore) VALUES (1,15,'2023-10-28 20:10:35',16);
 INSERT INTO Evaluer(ideleve,idSerieTest,dateHeure,evaluerScore) VALUES (1,17,'2023-10-28 20:15:35',18);
 INSERT INTO Evaluer(ideleve,idSerieTest,dateHeure,evaluerScore) VALUES (1,19,'2023-10-28 20:20:35',20);
 INSERT INTO Evaluer(ideleve,idSerieTest,dateHeure,evaluerScore) VALUES (1,20,'2023-10-28 20:25:35',14);
 INSERT INTO Evaluer(ideleve,idSerieTest,dateHeure,evaluerScore) VALUES (1,6,'2023-10-28 20:30:35',18);
 INSERT INTO Evaluer(ideleve,idSerieTest,dateHeure,evaluerScore) VALUES (1,8,'2023-10-28 20:35:35',20);
 INSERT INTO Evaluer(ideleve,idSerieTest,dateHeure,evaluerScore) VALUES (1,21,'2023-10-28 20:40:35',14);
 INSERT INTO Evaluer(ideleve,idSerieTest,dateHeure,evaluerScore)  VALUES (1,1,'2023-10-31 19:30:35',17);
 INSERT INTO Evaluer(ideleve,idSerieTest,dateHeure,evaluerScore) VALUES (1,2,'2023-10-31 19:35:35',18);
 INSERT INTO Evaluer(ideleve,idSerieTest,dateHeure,evaluerScore) VALUES (1,5,'2023-10-31 19:40:35',15);
 INSERT INTO Evaluer(ideleve,idSerieTest,dateHeure,evaluerScore) VALUES (1,7,'2023-10-31 19:45:35',15);
 INSERT INTO Evaluer(ideleve,idSerieTest,dateHeure,evaluerScore) VALUES (1,9,'2023-10-31 19:50:35',16);
 INSERT INTO Evaluer(ideleve,idSerieTest,dateHeure,evaluerScore) VALUES (1,12,'2023-10-31 19:55:35',14);
 INSERT INTO Evaluer(ideleve,idSerieTest,dateHeure,evaluerScore) VALUES (1,13,'2023-10-31 20:00:35',17);
 INSERT INTO Evaluer(ideleve,idSerieTest,dateHeure,evaluerScore) VALUES (1,14,'2023-10-31 20:05:35',18);
 INSERT INTO Evaluer(ideleve,idSerieTest,dateHeure,evaluerScore) VALUES (1,15,'2023-10-31 20:10:35',17);
 INSERT INTO Evaluer(ideleve,idSerieTest,dateHeure,evaluerScore) VALUES (1,18,'2023-10-31 20:15:35',14);
 INSERT INTO Evaluer(ideleve,idSerieTest,dateHeure,evaluerScore) VALUES (1,19,'2023-10-31 20:20:35',20);
 INSERT INTO Evaluer(ideleve,idSerieTest,dateHeure,evaluerScore) VALUES (1,20,'2023-10-31 20:25:35',14);
 INSERT INTO Evaluer(ideleve,idSerieTest,dateHeure,evaluerScore) VALUES (1,6,'2023-10-31 20:30:35',18);
 INSERT INTO Evaluer(ideleve,idSerieTest,dateHeure,evaluerScore) VALUES (1,22,'2023-10-31 20:35:35',19);
 INSERT INTO Evaluer(ideleve,idSerieTest,dateHeure,evaluerScore) VALUES (1,21,'2023-10-31 20:40:35',18);
 INSERT INTO Evaluer(ideleve,idSerieTest,dateHeure,evaluerScore)  VALUES (2,1,'2023-10-28 19:30:35',19);
 INSERT INTO Evaluer(ideleve,idSerieTest,dateHeure,evaluerScore) VALUES (2,2,'2023-10-28 19:35:35',20);
 INSERT INTO Evaluer(ideleve,idSerieTest,dateHeure,evaluerScore) VALUES (2,5,'2023-10-28 19:40:35',20);
 INSERT INTO Evaluer(ideleve,idSerieTest,dateHeure,evaluerScore) VALUES (2,7,'2023-10-28 19:45:35',20);
 INSERT INTO Evaluer(ideleve,idSerieTest,dateHeure,evaluerScore) VALUES (2,9,'2023-10-28 19:50:35',18);
 INSERT INTO Evaluer(ideleve,idSerieTest,dateHeure,evaluerScore) VALUES (2,12,'2023-10-28 19:55:35',17);
 INSERT INTO Evaluer(ideleve,idSerieTest,dateHeure,evaluerScore) VALUES (2,13,'2023-10-28 20:00:35',15);
 INSERT INTO Evaluer(ideleve,idSerieTest,dateHeure,evaluerScore) VALUES (2,14,'2023-10-28 20:05:35',15);
 INSERT INTO Evaluer(ideleve,idSerieTest,dateHeure,evaluerScore) VALUES (2,15,'2023-10-28 20:10:35',16);
 INSERT INTO Evaluer(ideleve,idSerieTest,dateHeure,evaluerScore) VALUES (2,17,'2023-10-28 20:15:35',18);
 INSERT INTO Evaluer(ideleve,idSerieTest,dateHeure,evaluerScore) VALUES (2,19,'2023-10-28 20:20:35',19);
 INSERT INTO Evaluer(ideleve,idSerieTest,dateHeure,evaluerScore) VALUES (2,20,'2023-10-28 20:25:35',17);
 INSERT INTO Evaluer(ideleve,idSerieTest,dateHeure,evaluerScore) VALUES (2,6,'2023-10-28 20:30:35',18);
 INSERT INTO Evaluer(ideleve,idSerieTest,dateHeure,evaluerScore) VALUES (2,8,'2023-10-28 20:35:35',17);
 INSERT INTO Evaluer(ideleve,idSerieTest,dateHeure,evaluerScore) VALUES (2,21,'2023-10-28 20:40:35',17);

 
 
 
 DROP TABLE IF EXISTS Passer ;

CREATE TABLE IF NOT EXISTS Passer(
ideleve INT NOT NULL,
idExamenBlanc INT NOT NULL,
dateHeure DATETIME NOT NULL,
examenScore INT,
PRIMARY KEY (ideleve,idExamenBlanc, dateHeure),
FOREIGN KEY(ideleve) REFERENCES Eleve(idUtilisateur),
FOREIGN KEY(idExamenBlanc) REFERENCES ExamenBlanc(id)
);

INSERT INTO Passer(ideleve,idExamenBlanc,dateHeure,examenScore)
 VALUES (1,1,'2023-10-29 19:30:35',29);
 INSERT INTO Passer(ideleve,idExamenBlanc,dateHeure,examenScore)
 VALUES (1,2,'2023-10-30 19:30:35',30);
 INSERT INTO Passer(ideleve,idExamenBlanc,dateHeure,examenScore)
 VALUES (1,3,'2023-10-31 19:30:35',32);
 INSERT INTO Passer(ideleve,idExamenBlanc,dateHeure,examenScore)
 VALUES (1,4,'2023-11-02 19:30:35',33);
 INSERT INTO Passer(ideleve,idExamenBlanc,dateHeure,examenScore)
 VALUES (1,5,'2023-11-04 19:30:35',35);

INSERT INTO Passer(ideleve,idExamenBlanc,dateHeure,examenScore)
 VALUES (2,1,'2023-10-29 19:30:35',37);
 INSERT INTO Passer(ideleve,idExamenBlanc,dateHeure,examenScore)
 VALUES (2,2,'2023-10-30 19:30:35',38);
 INSERT INTO Passer(ideleve,idExamenBlanc,dateHeure,examenScore)
 VALUES (2,3,'2023-10-31 19:30:35',38);
 INSERT INTO Passer(ideleve,idExamenBlanc,dateHeure,examenScore)
 VALUES (2,4,'2023-11-02 19:30:35',39);
 INSERT INTO Passer(ideleve,idExamenBlanc,dateHeure,examenScore)
 VALUES (2,5,'2023-11-04 19:30:35',40);


SET foreign_key_checks = 1;