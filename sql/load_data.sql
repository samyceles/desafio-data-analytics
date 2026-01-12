-- =====================================================
-- LIMPEZA DAS TABELAS
-- =====================================================

TRUNCATE TABLE fato_vendas;
TRUNCATE TABLE dim_produto CASCADE;

-- =====================================================
-- CARGA DA DIMENSÃO PRODUTO
-- =====================================================

COPY dim_produto (
    produto,
    categoria
)
FROM '/data/base_produtos_tratada.csv'
DELIMITER ','
CSV HEADER;

-- =====================================================
-- CARGA DA TABELA FATO VENDAS
-- =====================================================

COPY fato_vendas (
    cliente,
    idade,
    estado,
    produto,
    quantidade_vendida,
    preco_unitario,
    data,
    valor_total
)
FROM '/data/base_vendas_tratada.csv'
DELIMITER ','
CSV HEADER;

ALTER TABLE fato_vendas ALTER COLUMN idade TYPE NUMERIC;


