--Qual é o número de Clientes que existem na base de dados ?

SELECT COUNT(id_cliente) AS Total_clientes --selecionando a coluna de id_cliente e fazendo a contagem do total de linhas, atribuindo o alias de Total_clientes;
FROM clientes; --indicando de qual tabela a consulta será feita;


