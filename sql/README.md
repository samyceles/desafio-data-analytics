# SQL — Case Manchester Investimentos

Este diretório contém os scripts SQL utilizados para modelagem, carga e análises de dados no banco PostgreSQL, executado via Docker. <br>
O objetivo é demonstrar a capacidade de estruturar dados, realizar consultas analíticas e extrair insights de negócio.

## Estrutura do diretório
sql/ <br>
├── create_tables.sql      # Criação das tabelas (modelo estrela)<br>
├── load.sql               # Carga dos dados a partir dos CSVs<br>
├── analises.sql           # Consultas analíticas de negócio<br>
└── README_SQL.md          # Este documento

## Pré-requisitos
```
Docker
Docker Compose
```
Os dados utilizados estão na pasta data/:

- base_vendas_tratada.csv

- base_produtos_tratada.csv

## Como executar (passo a passo)
1) Subir os containers (PostgreSQL + App)

Na raiz do projeto:
```
docker-compose up -d
```
<br>

2) Acessar o PostgreSQL
```
docker exec -it postgres-manchester psql -U postgres -d case_manchester
```
<br>

Você deve ver o prompt:
```
case_manchester=#
```

<br>

3) Criar as tabelas
```
\i /sql/01_create_tables.sql
```

Este script cria:
  - dim_produto → tabela de dimensão
  - fato_vendas → tabela fato de vendas

4) Carregar os dados
```
\i /sql/load_data.sql
```

Este script:
  - Limpa as tabelas
  - Carrega os CSVs utilizando COPY
  - Garante alinhamento correto de colunas e tipos

Validação recomendada:
```
SELECT COUNT(*) FROM fato_vendas;
```

5) Executar as análises
```
\i /sql/analises.sql
```

# Detalhamento das consultas (analises.sql)
1) Perfil demográfico

*Pergunta:*

> Qual o perfil etário dos clientes em termos de volume e faturamento?

*Lógica:*

  - Segmentação por faixas etárias
  
  - Contagem de clientes únicos
  
  - Soma de volume e faturamento
  
  - Uso de: CASE, GROUP BY, agregações

2) Ranking de categorias

*Pergunta:*

> Quais categorias geram maior faturamento?

*Lógica:*

  - Join entre fato e dimensão
  
  - Soma do faturamento por categoria
  
  - Ranking com função de janela
  
  - Uso de: JOIN, RANK() OVER()

3) Sazonalidade

* Pergunta: *

> Existe sazonalidade ao longo do ano?

*Lógica:*

- Extração do mês da data

- Análise do faturamento mensal agregado

- Uso de: EXTRACT(MONTH)

4) Tendência por região

*Pergunta:*

> Como o faturamento evolui ao longo do tempo em cada estado?

*Lógica:*

- Agrupamento por estado e ano

- Avaliação de crescimento ou queda ao longo do tempo

- Uso de: EXTRACT(YEAR), GROUP BY

5) Relação idade × categoria

*Pergunta:*

> Quais categorias são mais consumidas por diferentes faixas etárias?

*Lógica:*

- Cruzamento de faixa etária com categoria

- Análise de volume e faturamento por segmento

- Uso de: CASE, JOIN, agregações

# Considerações técnicas

- O modelo segue um formato estrela (fato + dimensão)

- Tipagem foi ajustada para garantir compatibilidade com os CSVs

- O ambiente é totalmente reproduzível via Docker
