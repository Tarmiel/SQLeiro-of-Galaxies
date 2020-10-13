

/*'SQLeiro das galaxies' guide, a quick and 'practical' introduction to SQL*/


/* MODELAGEM BASICA */
-- TABELA CLIENTE
	NOME . CARACTER(30)
	CPF	. NUMERICO(11)
	EMAIL . CARACTER(30)
	TELEFONE . CARACTER(30)
	SEXO . CARACTER(1)
	ENDERECO . CARACTER(100)

/* PROCESSOS DE MODELAGEM */
-- ADM DE DADOS
	MODELAGEM CONCEITUAL - RASCUNHO
	MODELAGEM LOGICA - PROGRAMAS COMO DRAW.IO
-- AD - DBA
	MODELAGEM FISICA - SCRIPT DO BANCO

/* CRIANDO O BANCO DE DADOS */
CREATE DATABASE CURSO;

-- CONECTANDO
USE CURSO;

-- CRIANDO A TABELA CLIENTE
CREATE TABLE CLIENTE(
	NOME VARCHAR(30),
	SEXO CHAR(1),
	EMAIL VARCHAR(30),
	CPF INT(11),
	TELEFONE VARCHAR(30),
	ENDERECO VARCHAR(100)
);

-- VERIFICANDO AS TABELAS - APENAS MYSQL
SHOW TABLES;

-- DESCREVENDO TABELAS
DESC CLIENTE;

/* -- ---------------------------------------------------------------------------------------- -- */

-- FORMA 01 - INSERT - EXCLUINDO AS COLUNAS
INSERT INTO CLIENTE VALUES('JOAO','M','JOAO@GMAIL.COM',988638273,'22923110','MAIA LACERDA - ESTACIO - RIO DE JANEIRO -RJ');
INSERT INTO CLIENTE VALUES('CELIA','F','CELIA@GMAIL.COM',541521456,'25078869','RIACHUELO - CENTRO - RIO DE JANEIRO -RJ');
INSERT INTO CLIENTE VALUES('JORGE','M',NULL,885755896,'58748895','OSCAR CURY - BOM RETIRO - FSTOS DE MINAS - MG');

-- FORMA 02 - COLOCANDO AS COLUNAS
INSERT INTO CLIENTE(NOME,SEXO,ENDERECO,TELEFONE,CPF) VALUES('LILIAN','F','SENADOR SOARES - TIJUCA - RIO DE JANEIRO - RJ','985691511',1234567891);

-- FORMA 03 - INSERT COMPACTO - SOMENTE MYSQL
INSERT INTO CLIENTE VALUES('ANA','F','ANA@GLOBO.COM',85959543,'548556985','PRES ANTONIO CARLOS - CENTRO - SÃO PAULO - SP'),
						('CARLA','F','CARLA@TERARI.COM.BR',774582058,'66587458','SAMUEL SILVA - CENTRO - BELO HORIZONTE - BH');
	
					
/* Start */
/* -- ---------------------------------------------------------------------------------------- -- */
/* A004 - O COMANDO SELECT */
SELECT NOW();
SELECT 'TARMIEL';
SELECT 'BANCO DE DADOS';

-- ALIAS DE COLUNAS
SELECT 'TARMIEL' AS ALUNO;

SELECT NOME,SEXO,EMAIL FROM CLIENTE;
SELECT * FROM CLIENTE;


/* -- ---------------------------------------------------------------------------------------- -- */
/* A005 - FILTRANDO DADOS COM WHERE E LIKE */
SELECT NOME,TELEFONE FROM CLIENTE;

-- FILTRANDO
SELECT NOME,SEXO FROM CLIENTE -- SELECIONE NOME E SEXO 
	WHERE SEXO = 'F'; -- ONDE SEXO = 'F'

SELECT NOME,ENDERECO FROM CLIENTE
	WHERE ENDERECO = 'RJ'; -- WHERE - IGUALDADE TOTAL, RETORNA VAZIO VISTO QUE O CAMPO ENDERECO AGREGA MAIS DE UM PALAVRA/SIGLA ETC...
						   -- USE LIKE - ABAIXO

-- UTILIZANDO LIKE
SELECT NOME,ENDERECO FROM CLIENTE
	WHERE ENDERECO LIKE '%RJ'; -- QUALQUER VALOR QUE TERMINE EM RJ

SELECT NOME,SEXO,ENDERECO FROM CLIENTE
	WHERE ENDERECO LIKE '%CENTRO%'; -- QUALQUER VALOR QUE TENHA CENTRO EM QUALQUER POSIÇÃO


/* -- ---------------------------------------------------------------------------------------- -- */
/* A006 - OPERADORES LOGICOS */
-- OR = OU
SELECT NOME,EMAIL,SEXO,ENDERECO FROM CLIENTE c 
	WHERE SEXO = 'M' OR ENDERECO LIKE '%RJ'; -- SEXO = 'F' OU ENDERECO TENHA UM VALOR QUE TERMINE EM RJ
SELECT NOME,EMAIL,ENDERECO FROM CLIENTE c 
	WHERE SEXO = 'M' OR ENDERECO LIKE '%ESTACIO'; 

-- AND = E
SELECT NOME,EMAIL,ENDERECO FROM CLIENTE c 
	WHERE SEXO = 'M' AND ENDERECO LIKE '%RJ'; -- SEXO ='M' E ENDERECO TENHA UM VALOR QUE TERMINE EM RJ(MORE EM RJ)
SELECT NOME,EMAIL,ENDERECO FROM CLIENTE c 
	WHERE SEXO = 'F' AND ENDERECO LIKE '%CENTRO%';


/* -- ---------------------------------------------------------------------------------------- -- */
/* A007 - COUNT E GROUP BY - PERFORMANCE A*/
-- CONTANDO OS REGISTROS DE UMA TABELA
SELECT COUNT(*) FROM CLIENTE;
SELECT COUNT(*) AS 'QTD' FROM CLIENTE; 

-- OPERADOR GROUP BY
SELECT SEXO, COUNT(*) AS 'QTD' FROM CLIENTE c 
	GROUP BY SEXO; -- GRUPO SEXO E CONTA A QUANTIDADE DE VALORES EM CADA UM

-- PERFORMANCE COM OPERADORES LOGICOS
-- 1 MILHAO DE REGISTROS
SELECT COUNT(*) FROM CLIENTE;
SELECT ENDERECO, COUNT(*) FROM CLIENTE
	GROUP BY ENDERECO ;

SELECT SEXO,COUNT(*) FROM CLIENTE
	GROUP BY SEXO;

/* CONDICAO
 * SEXO = F
 * CIDADE = RIO DE JANEIRO
 * 
 * SITUACAO - TRATANDO COM OU/OR
 * 70% MULHERES = SEXO = F
 * 30% MORA NO RIO DE JANEIRO
 * */

-- CHECA A PRIMEIRA, SEXO = F ,SE VERDADE IGNORA A SEGUNDA(ENDERECO)
SELECT NOME,SEXO,ENDERECO FROM CLIENTE
	WHERE SEXO = 'F' OR ENDERECO = 'RIO DE JANEIRO';


/* SITUACAO - TRATANDO COM E/AND
 * 70% MULHERES = SEXO = F
 * 30% MORA NO RIO DE JANEIRO
 * */

-- CHECA O MENOR E DEPOIS O MAIOR
SELECT NOME,SEXO,ENDERECO FROM CLIENTE c 
	WHERE ENDERECO LIKE '%RIO DE JANEIRO%' AND SEXO = 'F';


/* -- ---------------------------------------------------------------------------------------- -- */
/* A008 - FILTRANDO VALORES NULOS*/
SELECT NOME,SEXO,EMAIL,ENDERECO FROM CLIENTE c 
	WHERE EMAIL IS NULL;


/* -- ---------------------------------------------------------------------------------------- -- */
/* A009 - UTILIZANDO O UPDATE PARA ATUALIZAR VALORES */
-- UTILIZAR O UPDATE SEMPRE ACOMPANHADO DA CLAUSULA WHERE
UPDATE CLIENTE SET EMAIL = 'LILIAN@HOTMAIL.COM' 
	WHERE NOME = 'LILIAN' AND EMAIL IS NULL;

SELECT * FROM CLIENTE;


/* -- ---------------------------------------------------------------------------------------- -- */
/* A10 - DELETANDO REGISTROS COM A CLAUSULA DELETE */
SELECT COUNT(*) FROM CLIENTE;
DELETE FROM CLIENTE WHERE NOME = 'ANA';
SELECT COUNT(*) FROM CLIENTE; 


/* -- ---------------------------------------------------------------------------------------- -- */
/* A11 - ENTRANDO COM MAIS TELEFONES */
-- GAMBIARRA NA MODELAGEM
UPDATE CLIENTE SET TELEFONE = '22923110-90908888' -- DOIS TELEFONES
	WHERE NOME = 'JOAO';
SELECT ENDERECO,COUNT(*) AS 'QTD' FROM CLIENTE c 
	GROUP BY ENDERECO ;


/* AVANÇANDO NA MODELAGEM */
/* -- ---------------------------------------------------------------------------------------- -- */
/* MODELAGEM DE CLIENTE*/
CREATE DATABASE COMERCIO;

USE COMERCIO;

CREATE TABLE CLIENTE(
	IDCLIENTE INT PRIMARY KEY AUTO_INCREMENT, -- ID = IDENTIFICADOR , PR IMARY KEY E AUTO INCREMENTADO
	NOME VARCHAR(30) NOT NULL, -- NOT NULL = NÃO PODE SER VAZIO
	SEXO ENUM('M','F') NOT NULL,
	EMAIL VARCHAR(50) UNIQUE, -- EMAIL UNICO (APENAS UM)
	CPF VARCHAR(15) UNIQUE -- CPF UNICO(APENAS UM)
);

/* O CLIENTE PODE TER N(VARIOS) TELEFONES */
CREATE TABLE TELEFONE(
	IDTELEFONE INT PRIMARY KEY AUTO_INCREMENT,
	TIPO ENUM('COM','RES','CEL'),
	NUMERO VARCHAR(10),
	ID_CLIENTE INT,
	FOREIGN KEY(ID_CLIENTE) REFERENCES CLIENTE(IDCLIENTE) -- A CHAVE PRIMARIA IDCLIENTE DA TABELA CLIENTE
							      -- REFERENCIA A CHAVE ESTRANGEIRA(ID_CLIENTE) DA TABELA TELEFONE
);

/* O CLIENTE SO PODE TER 1 ENDERECO */
CREATE TABLE ENDERECO(
	IDENDERECO INT PRIMARY KEY AUTO_INCREMENT,
	RUA VARCHAR(30) NOT NULL,
	BAIRRO VARCHAR(30) NOT NULL,
	CIDADE VARCHAR(30) NOT NULL,
	ESTADO CHAR(2) NOT NULL,
	ID_CLIENTE INT UNIQUE, -- APENAS UM ID_CLIENTE, APENAS UM ENDERECO POR CLIENTE
	FOREIGN KEY(ID_CLIENTE) REFERENCES CLIENTE(IDCLIENTE) -- A CHAVE PRIMARIA IDCLIENTE DA TABELA CLIENTE
							      -- REFERENCIA A CHAVE ESTRANGEIRA(ID_CLIENTE) DA TABELA ENDERECO
);

SHOW TABLES;

/* FOREIGN KEY - CHAVE ESTRANGEIRA - FK*/
/* É A CHAVE PRIMARIA DE UMA TABELA, QUE VAI ATE
 * OUTRA TABELA FAZER REFERENCIA*/

/* EM RELACIONAMENTOS 1X1 A CHAVE ESTRANGEIRA
 * FICA NA TABELA MAIS FRACA*/

/* EM RELACIONAMENTOS 1XN A CHAVE ESTRANGEIRA 
 * FICARA SEMPRE NA TABELA N*/


/* -- ---------------------------------------------------------------------------------------- -- */
/* A12 - INSERINDO REGISTROS */
INSERT INTO CLIENTE VALUES(NULL,'JOAO','M','JOAO@IG.COM','98547-6');
INSERT INTO CLIENTE VALUES(NULL,'CARLOS','M','CARLOS@TERA.COM','986664-7');
INSERT INTO CLIENTE VALUES(NULL,'ANA','F','ANA@GLOBO.COM','75658-5');
INSERT INTO CLIENTE VALUES(NULL,'JORGE','M','JORGE@IG.COM','88657-5');
INSERT INTO CLIENTE VALUES(NULL,'CLARA','M',NULL,'99754-7');
INSERT INTO CLIENTE VALUES(NULL,'CELIA','F','JOAO@TERRA.COM','77558-5');

SELECT * FROM CLIENTE;

-- INSERINDO UM REGISTRO ERRADO
INSERT INTO CLIENTE VALUES(NULL,'ANTONIO','M','JOAO@IG.COM');
-- CORRIGINDO
INSERT INTO CLIENTE VALUES(NULL,'ANTONIO','M',NULL,'78558-6');
INSERT INTO CLIENTE VALUES(NULL,'JOAO','M',NULL,'86695-6');

-- DESCREVER TABELA ENDERECO + ORDEM DOS INSERTS
DESC ENDERECO ;

INSERT INTO ENDERECO VALUES(NULL,'RUA A','ITAPERI','FORTALEZA','CE',1); -- O ULTIMO VALOR REFERENCIA O IDCLIENTE DA TABELA CLIENTE
INSERT INTO ENDERECO VALUES(NULL,'RUA B','CIDADE DOS FUNCIONARIOS','FORTALEZA','CE',2); -- CLIENTE DE IDCLIENTE = 2 MORA EM RUA B
INSERT INTO ENDERECO VALUES(NULL,'RUA C','MEIRELES','FORTALEZA','CE',3); -- CLIENTE DE IDCLIENTE = 3 MORA EM RUA C
INSERT INTO ENDERECO VALUES(NULL,'RUA D','CENTRO','EUCLIDES DA CUNHA','BH',7);
INSERT INTO ENDERECO VALUES(NULL,'RUA E','JARDIM','RIO DE JANEIRO','RJ',8);
INSERT INTO ENDERECO VALUES(NULL,'RUA F','SAO GONCALO','SAO PAULO','SP',5);
INSERT INTO ENDERECO VALUES(NULL,'RUA G','JARDIM','RIO DE JANEIRO','RJ',6);
INSERT INTO ENDERECO VALUES(NULL,'RUA H','CENTRO','BELEM','BE',4);
-- INSERINDO UM REGISTRO ERRADO
INSERT INTO ENDERECO VALUES(NULL,'RUA X','JARDIM','NITEROI','RJ',6);
SELECT * FROM ENDERECO e ;


-- DESCREVER TABELA TELEFONE - ORDEM DOS INSERTS
DESC TELEFONE;

INSERT INTO TELEFONE VALUES(NULL,'RES','3222222',1); -- CLIENTE DE IDCLIENTE = 1 TEM TELEFONE RES X
INSERT INTO TELEFONE VALUES(NULL,'CEL','3223234',2); -- CLIENTE DE IDCLIENTE = 2 TEM TELEFONE CEL
INSERT INTO TELEFONE VALUES(NULL,'COM','6543422',3);
INSERT INTO TELEFONE VALUES(NULL,'CEL','542OO99',5);
INSERT INTO TELEFONE VALUES(NULL,'COM','3222222',7);
INSERT INTO TELEFONE VALUES(NULL,'RES','3222222',8);
INSERT INTO TELEFONE VALUES(NULL,'CEL','3222222',2); -- CLIENTE DE IDCLIENTE = 2 TEM OUTRO TELEFONE CEL
INSERT INTO TELEFONE VALUES(NULL,'COM','3222222',3);
INSERT INTO TELEFONE VALUES(NULL,'CEL','3222222',3);

-- TESTE RÁPIDO, SELECIONANDO NOME,EMAIL,NUMERO,TIPO,ID_CLIENTE E ORDENANDO POR NOME
-- EXIBE OS CLIENTES,O EMAIL,NUMEROS,TIPO E ID
SELECT IDCLIENTE,NOME,EMAIL,NUMERO,TIPO
	FROM CLIENTE 
	INNER JOIN TELEFONE t 
	ON IDCLIENTE = ID_CLIENTE
	ORDER BY NOME;

-- SELECIONANDO ...... AGRUPANDO E ORDENANDO + CONTANDO QUANTOS TELEFONES TEM CADA UM
-- "SEMPRE" QUE USAR COUNT,USE GROUP BY
SELECT IDCLIENTE,NOME,EMAIL,COUNT(NUMERO) AS QTD_NUMEROS
	FROM CLIENTE c 
	INNER JOIN TELEFONE 
	ON IDCLIENTE = ID_CLIENTE 
	GROUP BY IDCLIENTE -- AGRUPANDO PELA COLUNA IDCLIENTE
	ORDER BY NOME; -- E ORDENE PELO NOME 

SELECT * FROM CLIENTE c ;
SELECT * FROM ENDERECO e ;
SELECT * FROM TELEFONE t ;


/* -- ---------------------------------------------------------------------------------------- -- */
/* A13 - SELEÇÃO, PROJEÇÃO E JUNÇÃO */

-- PROJEÇÃO - TUDO QUE QUEREMOS PROJETAR NA TELA
-- PROJETEI A COLUNA DATA , QUE NÃO EXISTE EM NENHUMA TABELA
SELECT NOW() AS DATA;
SELECT NOME,NOW() AS "DATA" FROM CLIENTE; -- PROJEÇÃO


-- SELEÇÃO - TEORIA DOS CONJUNTOS
SELECT NOME, SEXO
	FROM CLIENTE c ; -- SELEÇÃO
 
SELECT NOME, SEXO
	FROM CLIENTE c 
	WHERE SEXO = 'M'; -- SELEÇÃO 

UPDATE CLIENTE 
	SET SEXO = 'F'
	WHERE IDCLIENTE = 5;

-- JUNÇÃO
-- SELECIONE NOME,SEXO,BAIRRO E CIDADE ONDE A CHAVE PRIMARIA DE CLIENTE SEJA = CHAVE ESTRANGEIRA DE  ENDEREÇO
-- NÃO UTILIZAR WHERE PARA JUNÇÃO
SELECT NOME,SEXO,BAIRRO, CIDADE, NOW() AS DATA
	FROM CLIENTE , ENDERECO
	WHERE IDCLIENTE = ID_CLIENTE; -- SELEÇÃO

SELECT NOME,SEXO,BAIRRO, CIDADE, NOW() AS DATA
	FROM CLIENTE , ENDERECO
	WHERE IDCLIENTE = ID_CLIENTE
	AND BAIRRO = 'CENTRO';

-- JOIN
SELECT NOME,SEXO,BAIRRO,CIDADE -- PROJEÇÃO
	FROM CLIENTE
	INNER JOIN ENDERECO -- JUNÇÃO 
	ON IDCLIENTE = ID_CLIENTE; -- SELEÇÃO

-- CLAUSE AMBIGUOUS , ID_CLIENTE
SELECT CLIENTE.NOME,CLIENTE.SEXO,ENDERECO.BAIRRO,ENDERECO.CIDADE,TELEFONE.TIPO,TELEFONE.NUMERO
	FROM CLIENTE
	INNER JOIN ENDERECO
	ON CLIENTE.IDCLIENTE = ENDERECO.ID_CLIENTE
	INNER JOIN TELEFONE
	ON CLIENTE.IDCLIENTE = TELEFONE.ID_CLIENTE;

-- ATRIBUINDO APELIDOS
SELECT NOME,SEXO,BAIRRO,CIDADE,TIPO,NUMERO
	FROM CLIENTE c
	INNER JOIN ENDERECO e
	ON c.IDCLIENTE = e.ID_CLIENTE
	INNER JOIN TELEFONE t
	ON c.IDCLIENTE = t.ID_CLIENTE;

SELECT NOME,SEXO,EMAIL,BAIRRO,CIDADE,TIPO,NUMERO
	FROM CLIENTE c
	INNER JOIN ENDERECO e
	ON c.IDCLIENTE = e.ID_CLIENTE
	INNER JOIN TELEFONE t
	ON c.IDCLIENTE = t.ID_CLIENTE
	WHERE SEXO = 'M';


/* -- ---------------------------------------------------------------------------------------- -- */
/* A14 - QUERIES, SELEÇAO, PROJECAO E JUNCAO*/

/* PARA UMA CAMPANHA DE MARKETING, O SETOR SOLICITOU UM RELATÓRIO 
 * COM O NOME, EMAIL E TELEFONE CELULAR DOS CLIENTES
 * QUE MORAM NO ESTADO  DO RIO DE JANEIRO
 * VOCÊ TERÁ QUE PASSAR A QUERY PARA GERAR O RELATÓRIO PARA O PROGRAMADOR*/

SELECT NOME,EMAIL,ESTADO,NUMERO,TIPO -- PROJEÇAO
	FROM CLIENTE c
	INNER JOIN TELEFONE t
	ON c.IDCLIENTE = t.ID_CLIENTE
	INNER JOIN ENDERECO e 
	ON c.IDCLIENTE  = e.ID_CLIENTE 
	WHERE TIPO = 'CEL' AND ESTADO = 'CE';
 
|NOME   |EMAIL            |ESTADO |NUMERO  |TIPO|
|-------|-----------------|-------|--------|----|
|CARLOS |CARLOS@TERA.COM  |CE     |3223234 |CEL |
|JORGE  |JORGE@IG.COM     |CE     |3222222 |CEL |
|CARLOS |CARLOS@TERA.COM  |CE     |3222222 |CEL |


/* PARA UMA CAMPANHA DE PRODUTOS DE BELEZA, O COMERCIAL SOLICITOU UM
 * RELATÓRIO COM O NOME, EMAIL E TELEFONE CELULAR
 * DAS MULHERES QUE MORAM NO ESTADO DE SÃO PAULO
 * VOCÊ TERÁ QUE PASSAR A QUERY PARA GERAR O RELATÓRIO PARA O PROGRAMADOR*/

SELECT NOME,EMAIL,NUMERO
	FROM CLIENTE c 
	INNER JOIN TELEFONE t 
	ON c.IDCLIENTE = t.ID_CLIENTE 
	INNER JOIN ENDERECO e 
	ON c.IDCLIENTE = e.ID_CLIENTE 
	WHERE SEXO = 'F' AND TIPO = 'CEL' AND ESTADO = 'SP';

/* IFNULL */
SELECT NOME,
	   IFNULL(EMAIL,'SEM EMAIL') AS EMAIL,
	   NUMERO
	FROM CLIENTE c 
	INNER JOIN TELEFONE t 
	ON c.IDCLIENTE = t.ID_CLIENTE 
	INNER JOIN ENDERECO e 
	ON c.IDCLIENTE = e.ID_CLIENTE 
	WHERE SEXO = 'F' AND TIPO = 'CEL' AND ESTADO = 'SP';

SELECT IDCLIENTE AS "CODIGO",NOME AS "CLIENTE",
	   IFNULL(EMAIL,'SEM EMAIL') AS "EMAIL"
	FROM CLIENTE c;


/* -- ---------------------------------------------------------------------------------------- -- */
/* A15 - VIEWS OU VISOES */

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

-- PREFIXO V_
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

DELETE FROM V_RELATORIO
	WHERE NOME = 'JOAO';
-- Can not delete from join view 'COMERCIO.V_RELATORIO'

INSERT INTO V_RELATORIO VALUES ();
-- Can not insert into join view 'COMERCIO.V_RELATORIO' without fields list


/* -- ---------------------------------------------------------------------------------------- -- */
/* A16 - DELIMITADOR E ESTADO DE SERVIDOR */
SELECT * FROM V_RELATORIO

SELECT * FROM V_RELATORIO; -- Ponto e Virgula

-- OS COMANDOS A SEGUIR FUNCIONAM APENAS EM LINHAS DE COMANDO - SHELL / PROMPT	
DELIMITER $ -- TROCAR O SIMBOLO DO DELIMITADOR ; to $

STATUS -- Informações do banco


/* -- ---------------------------------------------------------------------------------------- -- */
/* A17 - PROCEDURES */

/* CREATE PROCEDURE nome(
 * BEGIN
 * 		AÇÃO;
 * END
 * $ -- CONSULTAR O DELIMITER
 */

CREATE PROCEDURE CONTA()
BEGIN
	SELECT 10+10 AS "CONTA";	
END
$

/* CHAMANDO A PROCEDURE */
CALL CONTA()$
DELIMITER ;

/* PROCEDURE COM PARAMETROS */
DROP PROCEDURE CONTA; -- APAGANDO

DELIMITER $

CREATE PROCEDURE CONTA(NUM1 INT,NUM2 INT)
BEGIN
	SELECT NUM1+NUM2 AS "CONTA";	
END
$

DELIMITER ;

CALL CONTA(20,30);


/* -- --------------------------------------------------------------------------------------- -- */
/* A18 - PROCEDURES COM TABELAS */

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


/* -- --------------------------------------------------------------------------------------- -- */
/* A19 - FUNCOES DE AGREGACAO NUMERICAS */

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

SELECT MAX(JANEIRO) AS MAX_JAN,
	MIN(JANEIRO) AS MIN_JAN,
	TRUNCATE(AVG(JANEIRO),2) AS MEDIA_JAN
	FROM VENDEDORES;


/* -- --------------------------------------------------------------------------------------- -- */
/* A20 - AGREGANDO COM SUM */

SELECT SUM(JANEIRO) AS TOTAL_JAN
	FROM VENDEDORES;

/* VENDAS POR SEXO */

SELECT SEXO,SUM(MARCO) AS TOTAL_MARCO
	FROM VENDEDORES
	GROUP BY SEXO;


/* -- --------------------------------------------------------------------------------------- -- */
/* A21- SUBQUERIES
 * VENDEDOR QUE MENOS VENDEU EM MARCO E O SEU NOME */
SELECT NOME, MARCO AS VENDAS_MIN_MARCO 
	FROM VENDEDORES 
	WHERE MARCO =(SELECT MIN(MARCO) FROM VENDEDORES); -- INNER QUERY( RESOLVIDA PRIMEIRA )

/* MAIOR VALOR */
SELECT NOME,MARCO AS VENDAS_MAX_MARCO
	FROM VENDEDORES
	WHERE MARCO = (SELECT MAX(MARCO) FROM VENDEDORES);

/* VENDEU MAIS QUE A MEDIA */
SELECT NOME,MARCO AS VENDAS_MAX_MARCO
	FROM VENDEDORES
	WHERE MARCO > (SELECT AVG(MARCO) FROM VENDEDORES);


/* -- --------------------------------------------------------------------------------------- -- */
/* A22 - OPERACOES EM LINHA */
SELECT * FROM VENDEDORES;
SELECT NOME,JANEIRO,FEVEREIRO,MARCO,(JANEIRO+FEVEREIRO+MARCO) AS "TOTAL", TRUNCATE((JANEIRO+FEVEREIRO+MARCO)/3,2) AS "MEDIA"
	FROM VENDEDORES;

/* APLICANDO UM %*/
SELECT NOME,JANEIRO,FEVEREIRO,MARCO,(JANEIRO+FEVEREIRO+MARCO) AS "TOTAL",
	(JANEIRO+FEVEREIRO+MARCO) * .25 AS "DESCONTO",
	TRUNCATE((JANEIRO+FEVEREIRO+MARCO)/3,2) AS "MEDIA"
	FROM VENDEDORES;


/* -- --------------------------------------------------------------------------------------- -- */
/* A23 - ALTERANDO TABELAS */
CREATE TABLE TABELA(
	COLUNA1 VARCHAR(30),
	COLUNA2 VARCHAR(30),
	COLUNA3 VARCHAR(30)
);

-- ADICIONANDO UMA PK
ALTER TABLE TABELA
	ADD PRIMARY KEY(COLUNA1);
DESC TABELA;

-- ADICIONANDO COLUNA SEM POSICAO. ULTIMA POSICAO
ALTER TABLE TABELA
	ADD COLUNA VARCHAR(30);

-- ADICIONANDO UMA COLUNA COM POSICAO
ALTER TABLE TABELA
	ADD COLUMN COLUNA4 VARCHAR(30) NOT NULL UNIQUE
	AFTER COLUNA3;
	
-- MODIFICANDO O TIPO DE UM CAMPO
ALTER TABLE TABELA MODIFY COLUNA2 DATE NOT NULL;

-- RENOMEANDO O NOME DA TABELA
ALTER TABLE TABELA
	RENAME PESSOA;

CREATE TABLE TIME(
	IDTIME INT PRIMARY KEY AUTO_INCREMENT,
	TIME VARCHAR(30),
	ID_PESSOA VARCHAR(30)
);
DESC TIME;

-- FOREIGN KEY
ALTER TABLE TIME
	ADD FOREIGN KEY(ID_PESSOA)
	REFERENCES PESSOA (COLUNA1);

-- DESCRICAO DETALHADA
SHOW CREATE TABLE TIME;


/* -- --------------------------------------------------------------------------------------- -- */
/* A24 - ORGANIZAÇAO DE CHAVES , CONSTRAINT(REGRA)*/
CREATE DATABASE TESTE_TIMES;

CREATE TABLE JOGADOR(
	IDJOGADOR INT PRIMARY KEY AUTO_INCREMENT,
	NOME VARCHAR(30)
);

CREATE TABLE TIMES(
	IDTIME INT PRIMARY KEY AUTO_INCREMENT,
	NOMETIME VARCHAR(30),
	ID_JOGADOR INT,
	FOREIGN KEY(ID_JOGADOR) REFERENCES JOGADOR(IDJOGADOR)
);

INSERT INTO JOGADOR VALUES(NULL,'GUERREIRO');
INSERT INTO TIMES VALUES(NULL,'FLAMENGO',1);

SHOW CREATE TABLE JOGADOR;
SHOW CREATE TABLE TIMES;

-- DICA: PRIMEIRO CRIAR AS TABELAS E DEPOIS AS CHAVES(FK) POR FORA


/* -- --------------------------------------------------------------------------------------- -- */
/* A25 - ORGANIZANDO CHAVES E ACOES DE CONSTRAINTS */
CREATE TABLE CLIENTE(
	IDCLIENTE INT,
	NOME VARCHAR(30)
);

CREATE TABLE TELEFONE(
	IDTELEFONE INT,
	TIPO CHAR(3) NOT NULL,
	NUMERO VARCHAR(10) NOT NULL,
	ID_CLIENTE INT
);

ALTER TABLE CLIENTE ADD CONSTRAINT PK_CLIENTE 
PRIMARY KEY(IDCLIENTE);

ALTER TABLE TELEFONE ADD CONSTRAINT FK_CLIENTE_TELEFONE
FOREIGN KEY(ID_CLIENTE) REFERENCES CLIENTE(IDCLIENTE);

SHOW CREATE TABLE TELEFONE;

/* DICIONARIO DE DADOS */
SHOW DATABASES;
USE information_schema;
SHOW TABLES;
DESC TABLE_CONSTRAINTS;

SELECT CONSTRAINT_SCHEMA AS "BANCO", 
		TABLE_NAME AS "TABELA",
		CONSTRAINT_NAME AS "NOME DA REGRA",
		CONSTRAINT_TYPE AS "TIPO"
    	FROM TABLE_CONSTRAINTS
    	WHERE CONSTRAINT_SCHEMA = "TESTE_TIMES";
    
/* APAGANDO CONSTRAINTS */
STATUS;
USE TESTE_TIMES;
    
ALTER TABLE TELEFONE
DROP FOREIGN KEY FK_CLIENTE_TELEFONE;

-- CONFIRA NOVAMENTE EM INFORMATION_SCHEMA
-- E ADICIONE NOVAMENTE A CONSTRAINT


/* -- --------------------------------------------------------------------------------------- -- */
/* A26 - TRIGGERS */
/* ESTRUTURA DE UMA TRIGGER */
CREATE TRIGGER NOME
BEFORE/AFTER INSERT/DELETE/UPDATE ON TABELA
FOR EACH NOW (PARA CADA LINHA)
BEGIN -> INICIO
	QUALQUER COMANDO SQL
END -> FIM

CREATE DATABASE TESTE_TRIGGERS;
USE  TESTE_TRIGGERS;

CREATE TABLE USUARIO(
	IDUSUARIO INT PRIMARY KEY AUTO_INCREMENT,
	NOME VARCHAR(30),
	LOGIN VARCHAR(30),
	SENHA VARCHAR(30)
);

CREATE TABLE BKP_USUARIO(
	IDBACKUP INT PRIMARY KEY AUTO_INCREMENT,
	IDUSUARIO INT,
	NOME VARCHAR(30),
	LOGIN VARCHAR(30)
);

/* CRIANDO A TRIGGER */
DELIMITER $
STATUS

CREATE TRIGGER BACKUP_USER
BEFORE DELETE ON USUARIO -- ANTES DE OCORRER UM DELETE NA TABELA USUARIO
FOR EACH ROW
BEGIN
	INSERT INTO BKP_USUARIO VALUES 
		(NULL,OLD.IDUSUARIO,OLD.NOME,OLD.LOGIN);
END
$

DELIMITER ;

INSERT INTO USUARIO VALUES (NULL,"LUCAS","TARMIEL","TARMIL123");
SELECT * FROM USUARIO;
DELETE FROM USUARIO WHERE IDUSUARIO = 1;
SELECT * FROM BKP_USUARIO;

/* VISUALIZAR TRIGGERS */
SHOW TRIGGERS FROM DB_NAME;


/* -- --------------------------------------------------------------------------------------- -- */
/* A27 - COMUNICAÇÃO ENTRE BANCOS */
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
BEFORE INSERT ON PRODUTO
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


/* -- --------------------------------------------------------------------------------------- -- */
/* A28 - TRIGGER DE AUDITORIA */

DROP DATABASE LOJA;
DROP DATABASE BACKUP;
DROP DATABASE BACKUP_DELETE;

CREATE DATABASE LOJA;
USE LOJA;
CREATE TABLE PRODUTO(
	IDPRODUTO INT PRIMARY KEY AUTO_INCREMENT,
	NOME VARCHAR(30),
	VALOR FLOAT(10,2)
);

INSERT INTO PRODUTO VALUES (NULL,'PAMONHA',4.00);
INSERT INTO PRODUTO VALUES (NULL,'CAJU',10.00);
INSERT INTO PRODUTO VALUES (NULL,'CD',2.00);
INSERT INTO PRODUTO VALUES (NULL,'DVD',4.00);


-- ....
SELECT NOW();
SELECT CURRENT_USER();

CREATE DATABASE BACKUP;
USE BACKUP;
CREATE TABLE BKP_PRODUTO(
	IDBKP INT PRIMARY KEY AUTO_INCREMENT,
	IDPRODUTO INT,
	NOME VARCHAR(30),
	VALOR_ORIGINAL FLOAT(10,2),
	VALOR_ALTERADO FLOAT(10,2),
	DATA DATETIME,
	USUARIO VARCHAR(30),
	EVENTO CHAR(1)
);

USE LOJA;
DELIMITER $

CREATE TRIGGER PRODUTO_UPDATE
AFTER UPDATE ON PRODUTO
FOR EACH ROW
BEGIN
	INSERT INTO BACKUP.BKP_PRODUTO VALUES(NULL,OLD.IDPRODUTO,OLD.NOME,OLD.VALOR,NEW.VALOR,NOW(),CURRENT_USER(),'U');	
END
$

DELIMITER ;
UPDATE PRODUTO SET VALOR = 110.00 
WHERE IDPRODUTO = 4;

SELECT * FROM BACKUP.BKP_PRODUTO;


/* -- --------------------------------------------------------------------------------------- -- */
/* A29 - AUTO RELACIONAMENTO */
CREATE DATABASE CURSOS;
USE CURSOS;
CREATE TABLE CURSOS(
	IDCURSO INT PRIMARY KEY AUTO_INCREMENT,
	NOME VARCHAR(30),
	VALOR FLOAT(10,2),
	HORAS FLOAT(10,2),
	IDREQ INT
);

ALTER TABLE CURSOS ADD CONSTRAINT FK_IDREQ
FOREIGN KEY (IDREQ) REFERENCES CURSOS(IDCURSO);

INSERT INTO CURSOS VALUES (NULL,'BD RELACIONAL',20,400.00, NULL);
INSERT INTO CURSOS VALUES (NULL,'PROG 2',50,800.00, 1);
INSERT INTO CURSOS VALUES (NULL,'LINGUAGEM ',10,400.00, NULL);
INSERT INTO CURSOS VALUES (NULL,'AUDITORIA DE SISTEMAS',30,400.00,1);
INSERT INTO CURSOS VALUES (NULL,'MATEMATICA COMPUTACIONAL',40,500.00, 3);

SELECT * FROM CURSOS;
SELECT NOME,VALOR,HORAS,IFNULL(IDREQ,"SEM REQUISITOS") REQUISITO FROM CURSOS;

SELECT 
C.NOME AS CURSO,
C.VALOR AS VALOR,
C.HORAS AS CARGA,
IFNULL(P.NOME,"---") AS PREREQ
FROM CURSOS C
LEFT JOIN CURSOS P
ON P.IDCURSO = C.IDREQ


/* -- --------------------------------------------------------------------------------------- -- */
/* A30 - CURSORS */
CREATE DATABASE CURSORES;
USE CURSORES;

CREATE TABLE VENDEDORES(
	IDVENDEDOR INT PRIMARY KEY AUTO_INCREMENT,
	NOME VARCHAR(50),
	JAN INT,
	FEV INT,
	MARC INT
);

INSERT INTO VENDEDORES VALUES (NULL,'LUCAS',1400,2300,4400);
INSERT INTO VENDEDORES VALUES (NULL,'MARIA',2600,3000,1400);
INSERT INTO VENDEDORES VALUES (NULL,'CHESMA',6400,2300,6400);
INSERT INTO VENDEDORES VALUES (NULL,'JEFERSON',3400,12300,1400);

SELECT * FROM VENDEDORES;

SELECT NOME, (JAN+FEV+MARC) AS TOTAL FROM VENDEDORES;
SELECT NOME, (JAN+FEV+MARC) AS TOTAL, TRUNCATE((JAN+FEV+MARC)/3,2) AS MEDIA FROM VENDEDORES;

CREATE TABLE VEND_TOTAL (
	NOME VARCHAR(50),
	JAN INT,
	FEV INT,
	MARC INT,
	TOTAL INT,
	MEDIA INT
);

DELIMITER $

CREATE PROCEDURE INSERE_DADOS()
BEGIN
	DECLARE FIM INT DEFAULT 0;
	DECLARE VAR1, VAR2, VAR3,VTOTAL,VMEDIA INT;
	DECLARE VNOME VARCHAR(50);

	DECLARE REG CURSOR FOR(
		SELECT NOME, JAN, FEV, MARC FROM VENDEDORES	
	);

	DECLARE CONTINUE HANDLER FOR NOT FOUND SET FIM = 1;

	OPEN REG; -- JOGAR OS VALORES NA MEMORIA RAM

	REPEAT
		FETCH REG INTO VNOME, VAR1, VAR2, VAR3;
		IF NOT FIM THEN
			SET VTOTAL = VAR1+VAR2+VAR3;
			SET VMEDIA = VTOTAL/3;

			INSERT INTO VEND_TOTAL VALUES(VNOME,VAR1,VAR2,VAR3,VTOTAL,VMEDIA);  
		END IF;
	UNTIL FIM END REPEAT;
	CLOSE REG;
END
$

DELIMITER ;

SELECT * FROM VEND_TOTAL;
CALL INSERE_DADOS();
SELECT * FROM VEND_TOTAL;


/* -- --------------------------------------------------------------------------------------- -- */
/* A31 - SEGUNDA E TERCEIRAS FORMAS NORMAIS */
/*
	PRIMEIRA FN

	ATOMICIDADE - UM CAMPO NÃO PODE SER DIVISIVEL
	UM CAMPO NÃO PODE SER VETORIZADO
	PK CHAVE PRIMMARIA

*/
CREATE DATABASE CONSULTORIO;
USE CONSULTORIO;

CREATE TABLE PACIENTE(
	IDPACIENTE INT PRIMARY KEY AUTO_INCREMENT,
	NOME VARCHAR(30),
	SEXO CHAR(1),
	EMAIL VARCHAR(30),
	NASCIMENTO DATE
); 

CREATE TABLE MEDICO(
	IDMEDICO INT PRIMARY KEY AUTO_INCREMENT,
	NOME VARCHAR(30),
	SEXO CHAR(1),
	ESPECIALIDADE VARCHAR(30),
	FUNCIONARIO ENUM('S','N')
);

CREATE TABLE HOSPITAL(
	IDHOSPITAL INT PRIMARY KEY AUTO_INCREMENT,
	NOME VARCHAR(30),
	BAIRRO VARCHAR(30),
	CIDADE VARCHAR(30),
	ESTADO CHAR(2)
);

CREATE TABLE CONSULTA(
	IDCONSULTA INT PRIMARY KEY AUTO_INCREMENT,
	ID_PACIENT INT,
	ID_MEDICO INT,
	ID_HOSPITAL INT,
	DATA DATETIME,
	DIAGNOSTICO VARCHAR(50)
);

CREATE TABLE INTERNACAO(
	IDINTERNACAO INT PRIMARY KEY AUTO_INCREMENT,
	ENTRADA DATETIME,
	QUARTO INT,
	SAIDA DATETIME,
	OBSERVACOES VARCHAR(50),
	ID_CONSULTA INT UNIQUE
);

ALTER TABLE CONSULTA ADD CONSTRAINT FK_CONSULTA_PACIENTE
FOREIGN KEY(ID_PACIENT) REFERENCES PACIENTE(IDPACIENTE);
ALTER TABLE CONSULTA ADD CONSTRAINT FK_CONSULTA_MEDICO
FOREIGN KEY(ID_MEDICO) REFERENCES MEDICO(IDMEDICO);
ALTER TABLE CONSULTA ADD CONSTRAINT FK_CONSULTA_HOSPITAL
FOREIGN KEY(ID_HOSPITAL) REFERENCES HOSPITAL(IDHOSPITAL);

ALTER TABLE INTERNACAO ADD CONSTRAINT FK_INTERNACAO_CONSULTA
FOREIGN KEY(ID_CONSULTA) REFERENCES CONSULTA(IDCONSULTA);

SHOW DATABASES;
USE INFORMATION_SCHEMA;
DESC TABLE_CONSTRAINTS;

/* -- ---------------------------------------------------------------------------------------- -- */
/* End of the first part, I hope the content offered here has been useful */


