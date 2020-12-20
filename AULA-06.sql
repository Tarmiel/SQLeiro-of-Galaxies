/*'SQLeiro das galaxies' guide, a quick and 'practical' introduction to SQL*/
/*AULA 06*/


/* -- ---------------------------------------------------------------------------------------- -- */
/* UTILIZANDO O UPDATE PARA ATUALIZAR VALORES */
-- UTILIZAR O UPDATE SEMPRE ACOMPANHADO DA CLAUSULA WHERE
UPDATE CLIENTE SET EMAIL = 'LILIAN@HOTMAIL.COM' 
	WHERE NOME = 'LILIAN' AND EMAIL IS NULL;
    -- ATUALIZE A TABELA CLIENTE, SET EMAIL = LILIAN....
    -- ONDE O NOME - LILIAN E O EMAIL FOR VAZIO
    
SELECT * FROM CLIENTE;

