--Quais as duas categorias que mais venderam no total de todos os anos ? 

SELECT COUNT(*) AS Total_vendas, c.nome_categoria AS Categoria --selecionando o total das vendas e a categoria dos produtos;
FROM itens_venda iv --indicando de qual tabela os dados devem ser obtidos;
JOIN vendas v ON v.id_venda = iv.venda_id --juntando a tabela de vendas com a tabela de itens_venda onde os id_venda é correspondente;
JOIN produtos p ON p.id_produto = iv.produto_id --juntando a tabela de produtos onde o id do produto bate com a tabela de itens_venda;
JOIN categorias c ON c.id_categoria = p.categoria_id --juntando a tabela de categorias onde o id da categoria bate com a tabela de produtos;
GROUP BY Categoria --agrupando a consulta pela categoria dos produtos;
ORDER BY Total_vendas DESC --ordando pela somatória em ordem descrescente;
LIMIT (2); --limitando a consulta a apenas uma linha para mostrar a categoria com a maior quantidade de vendas;