/*'SQLeiro das galaxies' guide, a quick and 'practical' introduction to SQL*/
/*AULA 23*/


/* -- --------------------------------------------------------------------------------------- -- */
/* COMUNICAÇÃO ENTRE BANCOS */
CREATE DATABASE LOJA;
USE LOJA;
CREATE TABLE PRODUTO(
	IDPRODUTO INT PRIMARY KEY AUTO_INCREMENT,
	NOME VARCHAR(30),
	VALOR FLOAT(10,2)
);


CREATE DATABASE BACKUP;
USE BACKUP;
CREATE TABLE BKP_PRODUTO(
	IDBKP INT PRIMARY KEY AUTO_INCREMENT,
	IDPRODUTO INT,
	NOME VARCHAR(30),
	VALOR FLOAT(10,2)
);

USE LOJA; -- USANDO O BANCO LOJA

-- INSERINDO EM BACKUP.BKP_PRODUTO DE LOJA
INSERT INTO BACKUP.BKP_PRODUTO VALUES(NULL,1000,'TESTE',0.0);
SELECT * FROM BACKUP.BKP_PRODUTO;

DELIMITER $

-- BACKUP LÓGICO
-- PEGA OS DADOS ANTES DELES SEREM INSERIDOS NA TABELA
CREATE TRIGGER BACKUP_PRODUT
BEFORE INSERT ON PRODUTO -- ANTES DE INSERIR EM PRODUTO
FOR EACH ROW
BEGIN
	INSERT INTO BACKUP.BKP_PRODUTO VALUES(NULL,NEW.IDPRODUTO,NEW.NOME,NEW.VALOR);
END
$

DELIMITER ;

INSERT INTO PRODUTO VALUES (NULL,'PAMONHA',4.00);
INSERT INTO PRODUTO VALUES (NULL,'CAJU',10.00);
INSERT INTO PRODUTO VALUES (NULL,'CD',2.00);
INSERT INTO PRODUTO VALUES (NULL,'DVD',4.00);


-- OBSERVE O ID DO PRODUTO E OLHE COMO O TRIGGER FOI CRIADO...
SELECT * FROM BACKUP.BKP_PRODUTO;

CREATE DATABASE BACKUP_DELETE;
USE BACKUP_DELETE;
CREATE TABLE BKP_PRODUTO_DELETE(
	IDBKPDELETE INT PRIMARY KEY AUTO_INCREMENT,
	IDPRODUTO INT,
	NOME VARCHAR(30),
	VALOR FLOAT(10,2)
);

DELIMITER $

CREATE TRIGGER BACKUP_PRODUTO_DELETE
BEFORE DELETE ON PRODUTO
FOR EACH ROW
BEGIN
	INSERT INTO BACKUP_DELETE.BKP_PRODUTO_DELETE VALUES(NULL,OLD.IDPRODUTO,OLD.NOME,OLD.VALOR);	
END
$

DELIMITER ;

DELETE FROM PRODUTO WHERE NOME = 'CAJU';
SELECT * FROM BACKUP_DELETE.BKP_PRODUTO_DELETE;


-- "CORRIGINDO" O ID DO PRODUTO NO TRIGGER INSERT
DROP TRIGGER BACKUP_PRODUT;
DELIMITER $

CREATE TRIGGER BACKUP_PRODUT
AFTER INSERT ON PRODUTO
FOR EACH ROW
BEGIN
	INSERT INTO BACKUP.BKP_PRODUTO VALUES(NULL,NEW.IDPRODUTO,NEW.NOME,NEW.VALOR);
END
$

DELIMITER ;
INSERT INTO PRODUTO VALUES (NULL,'AMORA',12.00);
-- AGORA INSERE O ID, POIS ELE SO PEGA OS VALORES NA TABELA APOS O DADO SER INSERIDO
SELECT * FROM BACKUP.BKP_PRODUTO;


-- TESTANDO
ALTER TABLE BACKUP.BKP_PRODUTO 
ADD EVENTO CHAR(1);
ALTER TABLE BACKUP.BKP_PRODUTO
DROP COLUMN EVENTO;
