--Qual a categoria que mais vendeu em 2022 ?

SELECT COUNT(*) AS Total_vendas, c.nome_categoria AS Categoria --selecionando o total das vendas e a categoria dos produtos;
FROM itens_venda iv --indicando de qual tabela os dados devem ser obtidos;
JOIN vendas v ON v.id_venda = iv.venda_id --juntando a tabela de vendas com a tabela de itens_venda onde os id_venda é correspondente;
JOIN produtos p ON p.id_produto = iv.produto_id --juntando a tabela de produtos onde o id do produto bate com a tabela de itens_venda;
JOIN categorias c ON c.id_categoria = p.categoria_id --juntando a tabela de categorias onde o id da categoria bate com a tabela de produtos;
WHERE strftime('%Y', v.data_venda) = '2022' --definindo o ano da consulta com a função strftime;
GROUP BY categoria --agrupando a consulta pela categoria dos produtos;
ORDER BY COUNT(*) DESC --ordando pela somatória em ordem descrescente;
LIMIT (1); --limitando a consulta a apenas uma linha para mostrar a categoria com a maior quantidade de vendas;
