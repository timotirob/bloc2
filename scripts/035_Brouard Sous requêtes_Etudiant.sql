--> préalable
-- USE BD_Air_France;

IF NOT EXISTS ( SELECT  *
                FROM    sys.schemas
                WHERE   name = N'COURS' )
    EXEC('CREATE SCHEMA [COURS]');
GO

IF OBJECT_ID('COURS.T_qualifs_qua','U') IS NOT NULL
   DROP TABLE COURS.T_qualifs_qua;
GO
IF OBJECT_ID('COURS.T_qualifs_qlf','U') IS NOT NULL
   DROP TABLE COURS.T_qualifs_qlf;
GO
IF OBJECT_ID('COURS.T_pilote_pil','U') IS NOT NULL
   DROP TABLE COURS.T_pilote_pil;
GO
IF OBJECT_ID('COURS.T_compagnie_cmp','U') IS NOT NULL
   DROP TABLE COURS.T_compagnie_cmp;
GO
IF OBJECT_ID('COURS.T_avion_avi','U') IS NOT NULL
   DROP TABLE COURS.T_avion_avi;
GO


CREATE TABLE COURS.T_avion_avi
(avi_immat VARCHAR(6), avi_type CHAR(4), avi_hvol DECIMAL(7,2), cmp_comp VARCHAR(4));

CREATE TABLE COURS.T_compagnie_cmp
(cmp_comp VARCHAR(4), cmp_pays CHAR(3), cmp_nom VARCHAR(15),
 CONSTRAINT pk_compagnie PRIMARY KEY(cmp_comp));
GO

CREATE TABLE COURS.T_pilote_pil
(pil_brevet VARCHAR(6), pil_prenom VARCHAR(15), pil_nom VARCHAR(15), 
 pil_hvol DECIMAL(7,2), cmp_comp VARCHAR(4), pil_chef VARCHAR(6),
 CONSTRAINT pk_pilote PRIMARY KEY(pil_brevet),
 CONSTRAINT fk_pil_cmp FOREIGN KEY(cmp_comp) REFERENCES COURS.T_compagnie_cmp(cmp_comp),
 CONSTRAINT fk_pil_chef_pil FOREIGN KEY(pil_chef) REFERENCES COURS.T_pilote_pil(pil_brevet));
GO

CREATE TABLE COURS.T_qualifs_qua
(pil_brevet VARCHAR(6), typ_typa VARCHAR(4), expire_qua DATE);
GO

INSERT INTO COURS.T_compagnie_cmp VALUES ('AF', 'fr', 'Air France');
INSERT INTO COURS.T_compagnie_cmp VALUES ('SING','sn', 'Singapore AL');
INSERT INTO COURS.T_compagnie_cmp VALUES ('CAST', 'fr', 'Castanet AL');


INSERT INTO COURS.T_pilote_pil VALUES ('PL-4', 'Henri','Alquié', 3400, 'AF', NULL);
INSERT INTO COURS.T_pilote_pil VALUES ('PL-1', 'Pierre','Lamothe', 450, 'AF','PL-4');
INSERT INTO COURS.T_pilote_pil VALUES ('PL-2', 'Didier','Linxe', 900, 'AF','PL-4');
INSERT INTO COURS.T_pilote_pil VALUES ('PL-3', 'Michel','Castaings', 1000, 'SING', NULL);
INSERT INTO COURS.T_pilote_pil VALUES ('PL-5', 'Pascal','Larrazet', 1500,NULL,NULL);


INSERT INTO COURS.T_avion_avi VALUES ('F-HVFR', 'A320', 1000, 'AF');
INSERT INTO COURS.T_avion_avi VALUES ('F-HRXM', 'A330', 1500, 'AF');
INSERT INTO COURS.T_avion_avi VALUES ('G-YGTR', 'A320', 550, 'SING');
INSERT INTO COURS.T_avion_avi VALUES ('N-345R', 'A340', 1800, 'SING');
INSERT INTO COURS.T_avion_avi VALUES ('F-GADE', 'A340', 200, 'AF');
INSERT INTO COURS.T_avion_avi VALUES ('F-HYZE', 'A330', 100, 'AF');

INSERT INTO COURS.T_qualifs_qua VALUES ('PL-1', 'A340', '20150622');
INSERT INTO COURS.T_qualifs_qua VALUES ('PL-1', 'A330', '20150205');
INSERT INTO COURS.T_qualifs_qua VALUES ('PL-1', 'A320', '20140116');
INSERT INTO COURS.T_qualifs_qua VALUES ('PL-2', 'A320', '20140118');
INSERT INTO COURS.T_qualifs_qua VALUES ('PL-3', 'A330', '20160122');
GO



