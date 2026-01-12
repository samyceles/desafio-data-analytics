# 📊 Análise Exploratória de Vendas — Python

## 📌 Resumo do problema e abordagem

Este projeto tem como objetivo analisar dados de vendas com foco em **desempenho comercial**, **comportamento do consumidor** e **padrões temporais**, utilizando Python para exploração, agregação e visualização dos dados.

A análise busca responder perguntas como:
- Quais categorias e regiões mais contribuem para faturamento e volume?
- Existe sazonalidade nas vendas ao longo do tempo?
- Há associação entre **faixa etária** e **categorias de produtos**?
- Como volume e faturamento se comportam de forma conjunta?

### Abordagem adotada
- Limpeza e preparação dos dados
- Agregações por categoria, região, tempo e faixa etária
- Uso de métricas-chave: **faturamento**, **volume vendido** e **ticket médio**
- Visualizações analíticas (linhas, barras e heatmaps) para facilitar interpretação
- Comparação entre métricas absolutas e percentuais

---

## Como executar os notebooks

### Pré-requisitos
- Python 3.9+
- Ambiente virtual recomendado (venv ou conda ou poetry)

### Bibliotecas utilizadas
```bash
pip install pandas numpy matplotlib seaborn
```

### Execução

Clone o repositório:
```bash
git clone <url-do-repositorio>
cd ./desafio-data-analytics/notebooks
```

Execute os notebooks na ordem:
1. Case_Manchester_EDA_e_Data_Quality.ipynb
2. Case_Manchester_Graficos.ipynb

Execute os notebooks **na ordem sugerida**, garantindo que todas as células sejam rodadas sequencialmente.

---
# Data Quality — Avaliação, Limpeza e Padronização
📊 Visão geral da base original

A base de dados contém aproximadamente 500 mil registros de vendas, abrangendo o período de janeiro de 2021 a dezembro de 2025.

De forma geral, os dados apresentam boa consistência numérica, porém com a presença de valores nulos em colunas críticas, o que exigiu um processo estruturado de limpeza e padronização antes das análises.

## Avaliação inicial da qualidade dos dados
### Tipos e comportamento das variáveis

#### ° Idade do cliente: int | null (not 0) <br>
Intervalo observado: 18 a 80 anos <br>
Média aproximada: 39 anos <br>

Observações:
  
  - Alguns valores nulos (NaN)
  
  - Nenhum valor igual a zero

#### ° Quantidade vendida: int (not null | not 0 | not negative) <br>
Intervalo observado: [26 : 431] <br>

  Observações:
  
  - Não apresenta valores negativos
  
  - Presença de valores nulos e zero

#### ° Preço unitário: float (not null | not 0 | not negative) <br>

  Observações:
  
  - Presença de valores nulos e zero
  
  - Valores inválidos comprometem o cálculo de faturamento

#### ° Faturamento: float (not null | not 0 | not negative) <br>
Intervalo observado: [0 : 15.850] <br>

  Observações:
  - Valores zero presentes na amostragem
  
  - Não apresentou outliers segundo a metodologia de IQR

#### ° Colunas textuais: Estado e Produto <br>
Tipo na base original: object <br>
* Necessitaram padronização textual *  <br>

### Problemas identificados

Foram identificados valores nulos em colunas críticas, incluindo:  <br>
Cliente, Produto, Categoria, Preço unitário, Quantidade, Estado

## Limpeza e padronização dos dados
Regras de remoção aplicadas:

### Remoção de registros sem cliente
Justificativa: inviabilizam análises de comportamento, recorrência e perfil demográfico.

### Remoção de idades fora do intervalo válido (0–120 anos)
Justificativa: evita distorções em análises por faixa etária.

### Remoção de vendas sem produto ou categoria associada
Justificativa: impossibilitam análises por categoria, considerada dimensão estratégica da análise.

### Tratamento e padronização de tipos

1) Conversão de datas para o tipo datetime

2) Conversão de quantidade vendida e preço unitário para tipos numéricos

3) Padronização textual de:
- Estado

- Produto

- Categoria (remoção de acentos, normalização de caixa e espaços)

### Criação de métricas derivadas

- Criação da métrica de faturamento (valor_total)
Justificativa: permitir análises financeiras, identificação de vendas atípicas e comparação entre categorias, regiões e faixas etárias.

---

## Principais insights e recomendações

### Desempenho por categoria
- **Jardinagem, Mangueiras e Utilidades Domésticas** concentram a maior parte do faturamento e do volume.
- Algumas categorias apresentam alto volume, mas faturamento proporcionalmente menor, indicando produtos de menor ticket.

### Faixa etária × categorias
- Existe **associação** entre faixa etária e categorias consumidas.
- As faixas **25–54 anos**, especialmente **35–44**, concentram o maior volume e faturamento.
- Categorias como **Jardinagem e Mangueiras** são relevantes para praticamente todas as faixas etárias.
- A faixa **65+** apresenta menor impacto absoluto, mas padrões consistentes de consumo.

### Regiões
- A região **Sudeste** lidera em faturamento e volume.
- **Sul** apresenta bom equilíbrio entre volume e ticket médio.
- **Nordeste** possui menor participação.

### Sazonalidade
- Há indícios de sazonalidade mensal e trimestral.
- Períodos de fim de ano e determinados trimestres concentram maiores picos de faturamento.
- O comportamento sazonal é relativamente consistente ao longo dos anos analisados.

### Recomendações práticas
- Priorizar campanhas e estoque para faixas **25–54 anos**
- Explorar **cross-sell** entre Jardinagem e Mangueiras
- Usar produtos de alto volume como porta de entrada para upsell
- Ajustar mix de produtos considerando região e perfil etário

---

## Limitações da base e da análise

- A análise é baseada apenas nos dados disponíveis, sem informações sobre:
  - Custos ou margem de lucro
  - Canais de venda (online vs físico)
  - Promoções ou campanhas ativas
  - Não possui mais informações de cliente além de idade e estado
- Não há dados do cliente detalhados (ex.: conta criada, profissão, pj|pf, cidade).
- A base não permite inferência causal, apenas **análise descritiva e associativa**.
- Algumas análises utilizam agregações que podem mascarar variações individuais.

---

## Próximos passos sugeridos

- Incluir bases de dados de **custo e margem** para análises de rentabilidade
- Incorporar dados de **clientes recorrentes** e frequência de compra
- - Enriquecer com mais dados sobre os clientes
- Analisar **combinação de produtos no mesmo pedido** (market basket)
- Definição de arquitetura:
  - Python (Extração e Ingestão)
  - SQL (camada analítica e tratamentos)
  - Power BI (dashboard executivo)

---
