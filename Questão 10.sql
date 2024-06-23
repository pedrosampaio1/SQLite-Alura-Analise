--Crie uma métrica mostrando a porcentagem de vendas a mais que a melhor categoria tem em relação a pior no ano de 2022. 

WITH Total_Vendas AS (
  SELECT COUNT(*) as Total_Vendas_2022
  FROM itens_venda iv
  JOIN vendas v ON v.id_venda = iv.venda_id
  WHERE strftime('%Y', v.data_venda) = '2022'
),
Vendas_Por_Categoria AS (
  SELECT 
    c.nome_categoria AS Nome_Categoria, 
    COUNT(iv.produto_id) AS Qtd_Vendas
  FROM itens_venda iv
  JOIN vendas v ON v.id_venda = iv.venda_id
  JOIN produtos p ON p.id_produto = iv.produto_id
  JOIN categorias c ON c.id_categoria = p.categoria_id
  WHERE strftime('%Y', v.data_venda) = '2022'
  GROUP BY Nome_Categoria
),
Melhor_Pior_Categorias AS (
  SELECT 
    MIN(Qtd_Vendas) AS Pior_Vendas, 
    MAX(Qtd_Vendas) AS Melhor_Vendas
  FROM Vendas_Por_Categoria
)

SELECT 
  Nome_Categoria, 
  Qtd_Vendas, 
  ROUND(100.0*Qtd_Vendas/tv.Total_Vendas_2022, 2) || '%' AS Porcentagem,
  ROUND(100.0*(Qtd_Vendas - Melhor_Vendas) / Melhor_Vendas, 2) || '%' AS Porcentagem_Mais_Que_Melhor
FROM Vendas_Por_Categoria
CROSS JOIN Total_Vendas tv
CROSS JOIN Melhor_Pior_Categorias;
