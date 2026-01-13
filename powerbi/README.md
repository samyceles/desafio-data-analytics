# 📊 Power BI Dashboard — Case Manchester Investimentos

 Este diretório contém o dashboard desenvolvido no Power BI Desktop, com foco em análise de vendas, comportamento de clientes e desempenho por categoria, região e tempo.

O objetivo é transformar os dados tratados em insights visuais claros, utilizando modelagem básica, medidas DAX e boas práticas de visualização.

## 📁 Arquivos 

```bash
powerbi/
├── case_manchester.pbix        # Dashboard Power BI
└── README_POWER_BI.md          # Este documento
```


Além disso, há um print do dashboard na pasta assets/ para visualização rápida.

## 🎯 Objetivo do Dashboard

- O dashboard foi construído para responder perguntas de negócio como:

- Qual o faturamento total e volume vendido?

- Como o faturamento evolui ao longo do tempo?

- Quais categorias e estados têm melhor desempenho?

- Existe diferença de comportamento por perfil demográfico?

- Como comparar desempenho entre períodos?

## 📐 Modelagem de Dados

O modelo segue uma estrutura simples em estrela:

1. Fato
```bash
base_vendas_tratada
```
2. Dimensão
```bash
base_produtos_tratada (dicionário de categorias)
```
### Relacionamento

- produto (fato) → produto (dimensão)

- Cardinalidade: muitos para um

- Direção de filtro: single

Essa modelagem garante consistência entre métricas e visuais.

## 📌 KPIs Principais

Os principais indicadores exibidos no topo do dashboard são:

- Faturamento Total

- Volume Total Vendido

- Ticket Médio

Esses KPIs permitem uma visão rápida do desempenho geral do negócio.

## 🧮 Medidas DAX Utilizadas

Exemplos de medidas criadas no modelo:

```bash
Faturamento Total =
SUM ( base_vendas_tratada[valor_total] )
```
```bash
Volume Total =
SUM ( base_vendas_tratada[quantidade_vendida] )
```
```bash
Ticket Médio =
DIVIDE (
    [Faturamento Total],
    [Volume Total]
)
```
## 📈 Principais Visualizações

1. Faturamento Total por Ano
→ Análise de tendência temporal

2. Faturamento Total por Categoria
→ Identificação das categorias mais relevantes

3. Faturamento Total por Estado
→ Comparação regional de desempenho

4. KPIs em cartões
→ Visão executiva do negócio

## 🎛️ Segmentações (Slicers)

O dashboard inclui filtros interativos para:

- Período (Data)

- Estado

- Categoria

Esses slicers permitem análises dinâmicas e exploração dos dados sob diferentes perspectivas.

## 🎨 Design e Usabilidade

- Paleta de cores alinhada à identidade visual da empresa

- Alto contraste para melhor legibilidade

- Rótulos de dados para facilitar interpretação

- Layout focado em clareza e tomada de decisão

## ▶️ Como abrir o dashboard

Instale o **Power BI Desktop**

Abra o arquivo:
```bash
case_manchester.pbix
```

Caso solicitado, atualize as conexões de dados

## 📌 Observação

O dashboard complementa de forma visual e interativa as análises realizadas em Python e SQL.
