/*'SQLeiro das galaxies' guide, a quick and 'practical' introduction to SQL*/
/*AULA 05*/


/* -- ---------------------------------------------------------------------------------------- -- */
/* A008 - FILTRANDO VALORES NULOS*/
SELECT NOME,SEXO,EMAIL,ENDERECO FROM CLIENTE c 
	WHERE EMAIL IS NULL;
    -- SELECIONE ONDE EMAIL FOR VAZIO 
    -- PESQUISE SOBRE IF NULL OU VEJA MAIS A FRENTE
