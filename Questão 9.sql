--Calcule a porcentagem de vendas por categorias no ano de 2022.

WITH Total_vendas AS (
SELECT COUNT(*) as Total_Vendas_2022
From itens_venda iv
JOIN vendas v ON v.id_venda = iv.venda_id
WHERE strftime('%Y', v.data_venda) = '2022'
)
SELECT Nome_Categoria, Qtd_Vendas, ROUND(100.0*Qtd_Vendas/tv.Total_Vendas_2022, 2) || '%' AS Porcentagem
FROM(
  SELECT c.nome_categoria AS Nome_Categoria, COUNT(iv.produto_id) AS Qtd_Vendas
  from itens_venda iv
  JOIN vendas v ON v.id_venda = iv.venda_id
  JOIN produtos p ON p.id_produto = iv.produto_id
  JOIN categorias c ON c.id_categoria = p.categoria_id
  WHERE strftime('%Y', v.data_venda) = '2022'
  GROUP BY Nome_Categoria
  ORDER BY Qtd_Vendas DESC
  ), Total_vendas tv
;
