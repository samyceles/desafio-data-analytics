-- Dimensão de Produtos
CREATE TABLE IF NOT EXISTS dim_produto (
    produto VARCHAR(10) PRIMARY KEY,
    categoria VARCHAR(100) NOT NULL
);

-- Fato de Vendas
CREATE TABLE IF NOT EXISTS fato_vendas (
    cliente INTEGER NOT NULL,
    idade INTEGER,
    estado VARCHAR(50),
    produto VARCHAR(10) NOT NULL,
    quantidade_vendida INTEGER NOT NULL,
    preco_unitario NUMERIC(10,2) NOT NULL,
    valor_total NUMERIC(12,2) NOT NULL,
    data DATE NOT NULL,

    CONSTRAINT fk_produto
        FOREIGN KEY (produto)
        REFERENCES dim_produto (produto)
);
