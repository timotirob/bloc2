-- Création de 3 sous types de données (contrainte de domaine)
CREATE TYPE salaire_stagiaire FROM DECIMAL(6,2) ;
CREATE TYPE lib_option FROM VARCHAR(4) NOT NULL;
CREATE TYPE madate FROM DATE NOT NULL ;
GO
-- déclaration de 3 variables Transact SQL
DECLARE @salaire_sio			salaire_stagiaire ;
DECLARE @option_sio				lib_option ;
DECLARE @eleve_date_naissance	madate = DATEFROMPARTS(1987,03,24);
BEGIN
-- Affectation de variables via un SET
SET @option_sio = 'SLAM' ;
SET @salaire_sio = 830.50 ;
-- Affichage d'informations calculées
PRINT 'Section BTS SIO: ' + @option_sio ;
PRINT 'Date de naissance : ' +
	CAST(@eleve_date_naissance AS VARCHAR(10));
PRINT 'Salaire stagiaire: ' + CAST(@salaire_sio AS VARCHAR(10));
SET @salaire_sio = @salaire_sio * 1.08 ;
PRINT 'Suite à augmentation de 8%: ' + CAST(@salaire_sio AS VARCHAR(10));
END;
