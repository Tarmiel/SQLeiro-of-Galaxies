/*'SQLeiro das galaxies' guide, a quick and 'practical' introduction to SQL*/
/*AULA 14*/


/* -- ---------------------------------------------------------------------------------------- -- */
/* DELIMITADOR E ESTADO DE SERVIDOR */
SELECT * FROM V_RELATORIO

SELECT * FROM V_RELATORIO; -- ;(PONTO E VIRGULA) = DELIMITADOR DO BANCO

-- MUDANDO O DELIMITADOR DO BANCO
-- OS COMANDOS A SEGUIR FUNCIONAM APENAS EM LINHAS DE COMANDO - SHELL / PROMPT	
DELIMITER $ -- TROCAR O SIMBOLO DO DELIMITADOR ; PARA $

STATUS -- INFORMAÇÃO DO BANCO

