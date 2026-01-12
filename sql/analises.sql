--validações

SELECT COUNT(*) FROM fato_vendas;

--ver se data e valor estão corretos
SELECT
    data,
    valor_total
FROM fato_vendas
LIMIT 5;

-- Perfil demográfico por faixa etária

SELECT
    CASE
        WHEN idade BETWEEN 18 AND 29 THEN '18–29'
        WHEN idade BETWEEN 30 AND 39 THEN '30–39'
        WHEN idade BETWEEN 40 AND 49 THEN '40–49'
        WHEN idade BETWEEN 50 AND 59 THEN '50–59'
        ELSE '60+'
    END AS faixa_etaria,
    COUNT(DISTINCT cliente) AS clientes_unicos,
    SUM(quantidade_vendida) AS volume_total,
    SUM(valor_total) AS faturamento_total
FROM fato_vendas
GROUP BY faixa_etaria
ORDER BY faixa_etaria;

--Quais categorias de produtos geram maior faturamento?
-- Ranking de categorias por faturamento
SELECT
    p.categoria,
    SUM(v.valor_total) AS faturamento_total,
    RANK() OVER (ORDER BY SUM(v.valor_total) DESC) AS ranking
FROM fato_vendas v
JOIN dim_produto p
  ON v.produto = p.produto
GROUP BY p.categoria
ORDER BY faturamento_total DESC;

--Existe sazonalidade ao longo dos meses do ano?

-- Análise de sazonalidade mensal
SELECT
    EXTRACT(MONTH FROM data) AS mes,
    SUM(valor_total) AS faturamento_total
FROM fato_vendas
GROUP BY mes
ORDER BY mes;


--Como o faturamento evolui ao longo do tempo em cada estado?

-- Tendência anual de faturamento por estado
SELECT
    estado,
    EXTRACT(YEAR FROM data) AS ano,
    SUM(valor_total) AS faturamento_total
FROM fato_vendas
GROUP BY estado, ano
ORDER BY estado, ano;


-- Relação entre faixa etária e categoria de produto
SELECT
    CASE
        WHEN idade BETWEEN 18 AND 29 THEN '18–29'
        WHEN idade BETWEEN 30 AND 39 THEN '30–39'
        WHEN idade BETWEEN 40 AND 49 THEN '40–49'
        WHEN idade BETWEEN 50 AND 59 THEN '50–59'
        ELSE '60+'
    END AS faixa_etaria,
    p.categoria,
    SUM(v.quantidade_vendida) AS volume_total,
    SUM(v.valor_total) AS faturamento_total
FROM fato_vendas v
JOIN dim_produto p
  ON v.produto = p.produto
GROUP BY faixa_etaria, p.categoria
ORDER BY faixa_etaria, faturamento_total DESC;
