/*'SQLeiro das galaxies' guide, a quick and 'practical' introduction to SQL*/
/*AULA 02*/


/* -- ---------------------------------------------------------------------------------------- -- */
/* FILTRANDO DADOS COM WHERE E LIKE */
SELECT NOME,TELEFONE FROM CLIENTE;

-- FILTRANDO
SELECT NOME,SEXO FROM CLIENTE -- SELECIONE NOME E SEXO 
	WHERE SEXO = 'F'; -- ONDE SEXO = 'F'

SELECT NOME,ENDERECO FROM CLIENTE
	WHERE ENDERECO = 'RJ'; 
	-- WHERE = IGUALDADE TOTAL, RETORNA VAZIO VISTO QUE O CAMPO ENDERECO AGREGA 
	-- MAIS DE UM PALAVRA/SIGLA ETC...
	
	-- USE LIKE - ABAIXO

-- UTILIZANDO LIKE
SELECT NOME,ENDERECO FROM CLIENTE
	WHERE ENDERECO LIKE '%RJ'; -- QUALQUER COLUNA/REGISTRO QUE TERMINE EM RJ 
	-- PESQUISE SOBRE REGEX EM SQL

SELECT NOME,SEXO,ENDERECO FROM CLIENTE
	WHERE ENDERECO LIKE '%CENTRO%'; -- QUALQUER COLUNA/REGISTRO QUE TENHA CENTRO EM N POSIÇÃO



