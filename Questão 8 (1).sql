--Crie uma tabela comparando as vendas ao longo do tempo das duas categorias que mais venderam no total de todos os anos.

SELECT "Ano/Mês",
SUM(CASE WHEN Categoria=='Eletrônicos' THEN Qtd_Vendas ELSE 0 END) AS Eletrônicos,
SUM(CASE WHEN Categoria=='Vestuário' THEN Qtd_Vendas ELSE 0 END) AS Vestuário
FROM(
    SELECT COUNT(*) AS Qtd_Vendas, strftime('%Y/%m', v.data_venda) AS "Ano/Mês", c.nome_categoria AS Categoria
    FROM itens_venda iv
    JOIN vendas v ON v.id_venda = iv.venda_id
    JOIN PRODUTOS p ON p.id_produto = iv.produto_id
    JOIN CATEGORIAS c ON c.id_categoria = p.categoria_id
    WHERE Categoria IN ('Eletrônicos', 'Vestuário')
    GROUP BY "Ano/Mês", Categoria
    ORDER BY "Ano/Mês", Categoria
)
GROUP BY "Ano/Mês";


