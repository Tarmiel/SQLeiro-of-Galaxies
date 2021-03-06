/*'SQLeiro das galaxies' guide, a quick and 'practical' introduction to SQL*/
/*AULA 13*/


/* -- ---------------------------------------------------------------------------------------- -- */
/* VIEWS OU VISOES */
/* ME LEMBRAM FUNÇÕES '-' */

SELECT c.NOME,c.SEXO,
		IFNULL(c.EMAIL,'SEM EMAIL') AS "EMAIL",
		t.TIPO,t.NUMERO,e.BAIRRO,e.CIDADE,e.ESTADO
	FROM CLIENTE c 
	INNER JOIN TELEFONE t 
	ON c.IDCLIENTE = t.ID_CLIENTE
	INNER JOIN ENDERECO e 
	ON c.IDCLIENTE = e.ID_CLIENTE 
	ORDER BY IDCLIENTE;


/* CRIANDO A VIEW */
CREATE VIEW RELATORIO AS 
SELECT c.NOME,c.SEXO,
		IFNULL(c.EMAIL,'SEM EMAIL') AS "EMAIL",
		t.TIPO,t.NUMERO,e.BAIRRO,e.CIDADE,e.ESTADO
	FROM CLIENTE c 
	INNER JOIN TELEFONE t 
	ON c.IDCLIENTE = t.ID_CLIENTE
	INNER JOIN ENDERECO e 
	ON c.IDCLIENTE = e.ID_CLIENTE 
	ORDER BY IDCLIENTE;

SELECT * FROM RELATORIO;

SELECT * FROM RELATORIO 
	WHERE SEXO = 'F';

UPDATE CLIENTE SET EMAIL = 'CLARA@GMAIL.COM'
	WHERE NOME = 'CLARA';

SHOW TABLES;

/* APAGANDO UMA VIEW */
DROP VIEW RELATORIO;

-- PREFIXO V_ PARA UMA FÁCIL IDENTIFICAÇÃO
CREATE VIEW V_RELATORIO AS 
SELECT c.NOME,c.SEXO,
		IFNULL(c.EMAIL,'SEM EMAIL') AS "EMAIL",
		t.TIPO,t.NUMERO,e.BAIRRO,e.CIDADE,e.ESTADO
	FROM CLIENTE c 
	INNER JOIN TELEFONE t 
	ON c.IDCLIENTE = t.ID_CLIENTE
	INNER JOIN ENDERECO e 
	ON c.IDCLIENTE = e.ID_CLIENTE 
	ORDER BY IDCLIENTE;

SHOW TABLES;
SELECT NOME,SEXO,CIDADE FROM V_RELATORIO;

/* TESTES */
DELETE FROM V_RELATORIO
	WHERE NOME = 'JOAO';
-- Can not delete from join view 'COMERCIO.V_RELATORIO'

INSERT INTO V_RELATORIO VALUES ();
-- Can not insert into join view 'COMERCIO.V_RELATORIO' without fields list

