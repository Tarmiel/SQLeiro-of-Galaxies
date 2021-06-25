/*'SQLeiro das galaxies' guide, a quick and 'practical' introduction to SQL*/
/*AULA 03*/


/* -- ---------------------------------------------------------------------------------------- -- */
/* COUNT E GROUP BY - PERFORMANCE A*/
-- CONTANDO OS REGISTROS DE UMA TABELA
SELECT COUNT(*) FROM CLIENTE; 
    -- CONTE A QUANTIDADE DE REGISTROS DA TABELA CLIENTE
SELECT COUNT(*) AS 'QTD' FROM CLIENTE; 


-- OPERADOR GROUP BY
SELECT SEXO, COUNT(*) AS 'QTD' FROM CLIENTE c 
	GROUP BY SEXO; 
    -- QUANTIDADE DE REGISTROS POR SEXO


-- PERFORMANCE COM OPERADORES LOGICOS 
-- SUPONDO -> 1 MILHAO DE REGISTROS
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
