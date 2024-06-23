--Qual o primeiro ano disponível na base ?

SELECT strftime ('%Y', data_venda) as Ano --fazendo a seleção do ano da conluna data_venda;
FROM vendas --indicando a tabela para buscar os dados;
ORDER by Ano asc --ordenando a consulta pelo ano de forma ascendente;
LIMIT (1); --limitando a consulta a uma linha para mostrar apenas o ano mais antigo;


