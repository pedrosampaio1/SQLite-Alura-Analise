--Qual o nome do fornecedor que mais vendeu no primeiro ano disponível na base ?

SELECT COUNT(*) AS Total_vendas, f.nome AS Fornecedor --selecionando o total das vendas realizadas e o nome dos fornecedores;
FROM itens_venda iv --indicando a tabela para buscar os dados;
JOIN vendas v ON v.id_venda = iv.venda_id --juntando a tabela vendas com base no id da venda com a tabela itens_venda;
JOIN produtos p ON p.id_produto = iv.produto_id --juntando a tabela de produtos com a tabela de itens_venda para haver a correspondência do id do produto;
JOIN fornecedores f ON f.id_fornecedor = p.fornecedor_id --juntando a tabela de fornecedores com a tabela de produtos onde há correspondência do id do fornecedor;
WHERE strftime ('%Y', v.data_venda) = '2020' --filtrando pelo ano mais antigo na base de dados;
GROUP BY Fornecedor --agrupando a consulta pelo nome do fornecedor;
ORDER BY COUNT(*) DESC --ordenando pela ordem decrescente;
LIMIT (1); --limitando a uma linha para verificar o fornecedor com a maior quantidade de vendas;
