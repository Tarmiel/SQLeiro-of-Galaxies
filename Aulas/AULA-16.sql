/*'SQLeiro das galaxies' guide, a quick and 'practical' introduction to SQL*/
/*AULA 16*/


/* -- --------------------------------------------------------------------------------------- -- */
/* PROCEDURES COM TABELAS */

CREATE TABLE CURSOS(
	IDCURSO INT PRIMARY KEY AUTO_INCREMENT,
	NOME VARCHAR(30) NOT NULL,
	HORAS INT(3) NOT NULL,
	VALOR FLOAT(10,2) NOT NULL
);

INSERT INTO CURSOS VALUES(NULL,'BANCO DE DADOS',25,200.00);
SELECT FROM * CURSOS;

/* DELIMITADOR */
DELIMITER $

CREATE PROCEDURE CAD_CURSO(P_NOME VARCHAR(30),P_HORAS INT(3),P_PRECO FLOAT(10,2))
BEGIN
	INSERT INTO CURSOS VALUES(NULL,P_NOME,P_HORAS,P_PRECO);	
END
$

DELIMITER ;
CALL CAD_CURSO("REDES",30,500.00);

SELECT * FROM CURSOS;

DELIMITER $
CREATE PROCEDURE SEL_CURSOS()
BEGIN
	SELECT * FROM CURSOS;	
END
$

DELIMITER ;
CALL SEL_CURSOS();

