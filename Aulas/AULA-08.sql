/*'SQLeiro das galaxies' guide, a quick and 'practical' introduction to SQL*/
/*AULA 08*/


/* -- ---------------------------------------------------------------------------------------- -- */
/* ENTRANDO COM MAIS TELEFONES */
-- GAMBIARRA NA MODELAGEM
UPDATE CLIENTE SET TELEFONE = '22923110-90908888' -- DOIS TELEFONES
	WHERE NOME = 'JOAO';

SELECT ENDERECO,COUNT(*) AS 'QTD' FROM CLIENTE c -- CLIENTE c('ALIAS(APELIDO)' DA TABELA) 
	GROUP BY ENDERECO ;


/* AVANÇANDO NA MODELAGEM */
/* -- ---------------------------------------------------------------------------------------- -- */
/* MODELAGEM DE CLIENTE*/
CREATE DATABASE COMERCIO;

USE COMERCIO;

CREATE TABLE CLIENTE(
	IDCLIENTE INT PRIMARY KEY AUTO_INCREMENT, -- PRIMARY KEY(CHAVE PARA IDENTIFICAÇÃO) E AUTO INCREMENTADO
	NOME VARCHAR(30) NOT NULL, -- NOT NULL = NÃO PODE SER VAZIO
	SEXO ENUM('M','F') NOT NULL,
	EMAIL VARCHAR(50) UNIQUE, -- EMAIL UNICO (APENAS UM EM TODA A TABELA)
	CPF VARCHAR(15) UNIQUE -- CPF UNICO(APENAS UM)
);

/* O CLIENTE PODE TER N(VARIOS) TELEFONES */
CREATE TABLE TELEFONE(
	IDTELEFONE INT PRIMARY KEY AUTO_INCREMENT,
	TIPO ENUM('COM','RES','CEL'), -- DEVE SER INSERIDO UM DOS 3 VALORES DEFINIDOS
	NUMERO VARCHAR(10),
	ID_CLIENTE INT,
	FOREIGN KEY(ID_CLIENTE) REFERENCES CLIENTE(IDCLIENTE) 
        -- A CHAVE PRIMARIA IDCLIENTE DA TABELA CLIENTE
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
	FOREIGN KEY(ID_CLIENTE) REFERENCES CLIENTE(IDCLIENTE) 
        -- A CHAVE PRIMARIA IDCLIENTE DA TABELA CLIENTE
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

-- PESQUISE SOBRE CONCEITOS DE ENTIDADES FORTES E FRACAS

