/*'SQLeiro das galaxies' guide, a quick and 'practical' introduction to SQL*/
/*AULA 18*/


/* -- --------------------------------------------------------------------------------------- -- */
/* SUBQUERIES
 * VENDEDOR QUE MENOS VENDEU EM MARCO E O SEU NOME */
SELECT NOME, MARCO AS VENDAS_MIN_MARCO 
	FROM VENDEDORES 
	WHERE MARCO =(SELECT MIN(MARCO) FROM VENDEDORES); 
        -- INNER QUERY( RESOLVIDA PRIMEIRA )


/* MAIOR VALOR */
SELECT NOME,MARCO AS VENDAS_MAX_MARCO
	FROM VENDEDORES
	WHERE MARCO = (SELECT MAX(MARCO) FROM VENDEDORES);


/* VENDEU MAIS QUE A MEDIA */
SELECT NOME,MARCO AS VENDAS_MAX_MARCO
	FROM VENDEDORES
	WHERE MARCO > (SELECT AVG(MARCO) FROM VENDEDORES);
