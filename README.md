# 🚀 Projeto de Data Warehouse e Analytics

Bem-vindo ao repositório do **Projeto de Data Warehouse e Analytics**.

Este projeto demonstra a construção completa de uma solução moderna de dados, desde a ingestão de dados brutos até a geração de insights para tomada de decisão.

O objetivo é simular um **cenário real de engenharia de dados**, aplicando boas práticas utilizadas no mercado para construção de **Data Warehouse e análises de negócio**.

---

# 🏗️ Arquitetura da Solução

O projeto segue uma arquitetura moderna de dados utilizando o modelo **Medallion Architecture**:

* **Camada Bronze** → Dados brutos vindos das fontes
* **Camada Silver** → Dados limpos e padronizados
* **Camada Gold** → Dados prontos para análise e BI

Fluxo do projeto:

Fontes de Dados → Bronze → Silver → Gold → BI / Analytics

---

# 📂 Fontes de Dados

Os dados utilizados no projeto vêm de dois sistemas distintos:

**ERP**

* Dados operacionais de vendas
* Produtos
* Clientes
* Pedidos

**CRM**

* Informações de relacionamento com clientes
* Histórico de interações
* Dados comerciais

Formato dos dados:

* Arquivos **CSV**
* Interface via **arquivos em pastas**

---

# ⚙️ Engenharia de Dados – Construção do Data Warehouse

## 🎯 Objetivo

Desenvolver um **Data Warehouse moderno utilizando SQL Server** para consolidar dados de vendas e permitir análises estratégicas e relatórios analíticos.

---

## 📋 Especificações do Projeto

### 📥 Ingestão de Dados

Importação de dados provenientes de dois sistemas:

* ERP
* CRM

Os dados são disponibilizados no formato **CSV**.

---

### 🧹 Qualidade de Dados

Antes da análise, os dados passam por processos de:

* Limpeza de dados
* Tratamento de valores nulos
* Correção de inconsistências
* Padronização de formatos

---

### 🔗 Integração de Dados

Os dados de ERP e CRM são integrados em um **modelo de dados unificado**, projetado especificamente para **consultas analíticas**.

---

### 📊 Modelagem de Dados

A camada analítica utiliza **modelagem dimensional**:

* ⭐ Modelo Estrela (Star Schema)
* Tabelas Fato
* Tabelas Dimensão

Exemplo:

Fato:

* vendas

Dimensões:

* clientes
* produtos
* datas

---

### 📌 Escopo

* Utilização apenas do **dataset mais recente**
* **Historização de dados não é necessária**

---

### 📚 Documentação

O projeto inclui documentação clara sobre:

* Estrutura das tabelas
* Transformações de dados
* Modelo dimensional
* Fluxo de ingestão e transformação

Essa documentação é útil tanto para:

* Equipes de negócio
* Analistas de dados
* Engenheiros de dados

---

# 📊 Análise de Dados e BI

## 🎯 Objetivo

Desenvolver análises e consultas SQL que gerem **insights relevantes para o negócio**, como:

* Performance de vendas
* Produtos mais vendidos
* Receita por região
* Comportamento de clientes
* Tendências de vendas

---

# 🛠️ Tecnologias Utilizadas

* SQL Server
* T-SQL
* Modelagem Dimensional
* Data Warehouse
* ETL
* Arquivos CSV
* Git / GitHub

---

# 📈 Resultados Esperados

Com este projeto é possível demonstrar habilidades em:

* Engenharia de Dados
* Construção de Data Warehouse
* Modelagem Dimensional
* Limpeza e transformação de dados
* Análise exploratória de dados
* Escrita de consultas SQL complexas

---

# 👨‍💻 Autor

Projeto desenvolvido como parte de estudos e portfólio em **Engenharia de Dados e Analytics**.
