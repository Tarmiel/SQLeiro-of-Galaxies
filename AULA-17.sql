/*'SQLeiro das galaxies' guide, a quick and 'practical' introduction to SQL*/
/*AULA 17*/


/* -- --------------------------------------------------------------------------------------- -- */
/* FUNCOES DE AGREGACAO NUMERICAS */

CREATE TABLE VENDEDORES(
	IDVENDEDOR INT PRIMARY KEY AUTO_INCREMENT,
	NOME VARCHAR(30),
	SEXO CHAR(1),
	JANEIRO FLOAT(10,2),
	FEVEREIRO FLOAT(10,2),
	MARCO FLOAT(10,2)
);

INSERT INTO VENDEDORES VALUES(NULL,'LUCAS','M',75353.30,320.00,973.34);
INSERT INTO VENDEDORES VALUES(NULL,'JOAO','M',53353.30,350.00,123.34);
INSERT INTO VENDEDORES VALUES(NULL,'CELIA','F',34353.30,3650.00,323.34);
INSERT INTO VENDEDORES VALUES(NULL,'MARIA','F',13353.30,360.00,123.34);
INSERT INTO VENDEDORES VALUES(NULL,'CHESMA','M',65353.30,320.00,444.34);
INSERT INTO VENDEDORES VALUES(NULL,'JAM','F',75243.30,360.00,33.34);
INSERT INTO VENDEDORES VALUES(NULL,'MARIO','M',753.30,390.00,321.34);


/* MAX - TRAZ O VALOR MAXIMO DE UMA COLUNA */
SELECT MAX(FEVEREIRO) AS MAIOR_FEV
	FROM VENDEDORES;

SELECT NOME, FEVEREIRO AS MAX_FEV
    FROM VENDEDORES
    WHERE FEVEREIRO = (SELECT MAX(FEVEREIRO) FROM VENDEDORES);


/* MIN - TRAZ O VALOR MINIMO DE UMA COLUNA */
SELECT MIN(FEVEREIRO) AS MIN_FEV
	FROM VENDEDORES;


/* MIN - TRAZ O VALOR MEDIO DE UMA COLUNA */
SELECT AVG(FEVEREIRO) AS MEDIA_FEV
	FROM VENDEDORES;


/* VARIAS FUNCOES */
SELECT MAX(JANEIRO) AS MAX_JAN,
	MIN(JANEIRO) AS MIN_JAN,
	AVG(JANEIRO) AS MEDIA_JAN
	FROM VENDEDORES;


/* TRUNCATE */
-- NUMERO DE CASAS DECIMAIS
SELECT MAX(JANEIRO) AS MAX_JAN,
	MIN(JANEIRO) AS MIN_JAN,
	TRUNCATE(AVG(JANEIRO),2) AS MEDIA_JAN
	FROM VENDEDORES;


/* AGREGANDO COM SUM */
SELECT SUM(JANEIRO) AS TOTAL_JAN
	FROM VENDEDORES;


/* VENDAS POR SEXO */
SELECT SEXO,SUM(MARCO) AS TOTAL_MARCO
	FROM VENDEDORES
	GROUP BY SEXO;