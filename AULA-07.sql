/*'SQLeiro das galaxies' guide, a quick and 'practical' introduction to SQL*/
/*AULA 07*/


/* -- ---------------------------------------------------------------------------------------- -- */
/* DELETANDO REGISTROS COM A CLAUSULA DELETE */
SELECT COUNT(*) FROM CLIENTE;
DELETE FROM CLIENTE WHERE NOME = 'ANA';
    -- DELETANDO O REGISTRO(TUPLA) ONDE NOME = ANA

SELECT COUNT(*) FROM CLIENTE; 

