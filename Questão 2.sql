--Quantos produtos foram vendidos no ano de 2022 ?

SELECT COUNT(*) AS Total_produtos, strftime('%Y', data_venda) AS Ano --fazendo a seleção do total de linhas e do ano com a função strftime, atribuindo os alias;
FROM vendas --indicando a tabela de origem das informações
WHERE Ano = '2022'; --definindo de qual ano a consulta deve ser feita
