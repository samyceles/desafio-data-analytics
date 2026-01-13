# 📊 Desafio Técnico – Time de Dados (Manchester Investimentos)

Este repositório contém a solução completa do Desafio Técnico – Time de Dados (Manchester Investimentos), abordando todo o fluxo analítico: tratamento de dados, SQL, visualização e entrega de insights de negócio.

O projeto foi desenvolvido simulando um cenário real de análise de dados, com foco em **clareza**, **reprodutibilidade** e **boas práticas**.

Para mais detalhes sobre o desafio, acesse o link: https://github.com/manchesterinvestimentos/desafio-data-analytics

## 🎯 Objetivo do Projeto

- Explorar e tratar dados de vendas

- Modelar dados para análise relacional

- Criar consultas SQL orientadas a negócio

- Construir um dashboard interativo no Power BI

- Comunicar insights de forma clara e estruturada

## 🧠 Visão Geral da Arquitetura

```bash
Fluxo completo do projeto:

┌────────────────────┐
│ Base Original (XLSX)│
└─────────┬──────────┘
          │
          ▼
┌────────────────────┐
│ Python (EDA & DQ)  │
│ • Limpeza          │
│ • Padronização     │
│ • Validações       │
└─────────┬──────────┘
          │
          ▼
┌────────────────────┐
│ CSVs Tratados      │
│ (data/)            │
└─────────┬──────────┘
          │
          ▼
┌────────────────────┐
│ PostgreSQL (Docker)│
│ • Modelo estrela   │
│ • Queries SQL      │
└─────────┬──────────┘
          │
          ▼
┌────────────────────┐
│ Power BI Dashboard │
│ • KPIs             │
│ • Gráficos         │
│ • Slicers          │
└────────────────────┘
```


## 📁 Estrutura do Projeto

```bash
case-manchester/
│
├── data/
│   ├── base_vendas_tratada.csv
│   └── base_produtos_tratada.csv
│
├── notebooks/
│   ├── Case_Manchester_EDA_e_Data_Quality.ipynb
│   ├── Case_Manchester_Graficos.ipynb
│   └── README.md
│
├── sql/
│   ├── create_tables.sql
│   ├── load_data.sql
│   ├── analises.sql
│   └── README.md
│
├── powerbi/
│   ├── case_manchester.pbix
│   ├── README_POWER_BI.md
│   └── assets/
│       └── dashboard.png
│
├── docker-compose.yml
├── Dockerfile
├── pyproject.toml
├── poetry.lock
├── Base-Dados-Desafio-500k.xlsx
├── .dockerignore
└── README.md

```
## 🧪 Etapas do Projeto
### 1️⃣ Análise Exploratória e Data Quality (Python)

- Identificação de valores nulos e inconsistências

- Verificação de tipos de dados

- Detecção de outliers

- Padronização de campos

- Geração das bases tratadas em CSV

📂 Pasta: ``` notebook/```

### 2️⃣ Modelagem e Consultas SQL (PostgreSQL + Docker)

- Banco PostgreSQL executado via Docker

- Modelo em estrela (fato + dimensão)

- Carga dos CSVs com COPY

Consultas analíticas orientadas a negócio:

- perfil demográfico

- ranking de categorias

- sazonalidade

- tendência regional

- relação idade × categoria

📂 Pasta: ```sql/```

### 3️⃣ Visualização e Dashboard (Power BI)

- KPIs principais (faturamento, volume, ticket médio)

- Gráficos por tempo, categoria e região

- Segmentações interativas (slicers)

- Uso de medidas DAX simples

📂 Pasta: ```powerbi/```
📸 Preview em: ```assets/dashboard.png```

## 🐳 Como Executar o Projeto
1. Subir o ambiente (PostgreSQL)
```bash
docker-compose up -d
```
2. Acessar o PostgreSQL
```bash
docker exec -it postgres-manchester psql -U postgres -d case_manchester
```
3. Criar tabelas
```bash
\i /sql/01_create_tables.sql
```
4. Carregar dados
```bash
\i /sql/load_data.sql
```
5. Executar análises
```bash
\i /sql/analises.sql
```
## 📊 Dashboard Power BI

1. Abrir o arquivo .pbix no Power BI Desktop

2. Atualizar as conexões, se necessário

3. Utilizar os slicers para explorar os dados

## 🧰 Tecnologias Utilizadas

- Python (pandas, numpy, Jupyter)

- PostgreSQL

- Docker & Docker Compose

- SQL

- Power BI

- Git / GitHub

## 📌 Considerações Finais

Este projeto demonstra o ciclo completo de análise de dados, desde a preparação da base até a entrega de insights visuais, utilizando ferramentas amplamente adotadas no mercado e boas práticas de engenharia e análise de dados.

Para mais detalhes sobre os noteboooks, com principais insights e recomendações, limitações da base e da análise, acesse o link para o README.md específico: https://github.com/samyceles/desafio-data-analytics/blob/main/notebooks/README.md?plain=1

Para mais detalhes sobre o dashboard em Power Bi, acesse o link para o README.md específico: https://github.com/samyceles/desafio-data-analytics/blob/main/powerbi/README.md

Para mais detalhes sobre os noteboooks, acesse o link para as consultas SQL específico: https://github.com/samyceles/desafio-data-analytics/blob/main/sql/README.md
