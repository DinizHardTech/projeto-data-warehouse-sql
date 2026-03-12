
/*
==============================================================
Script: Criação do Banco de Dados e Schemas
Projeto: Data Warehouse e Analytics
Autor: Pedro Henrique Alves Diniz
Descrição: Script de inicialização do ambiente de Data Warehouse
==============================================================

OBJETIVO
Este script cria o banco de dados 'DataWarehouse' caso ele não exista.
Caso o banco já exista, ele será removido e recriado para garantir
um ambiente limpo para execução do projeto.

Além disso, o script cria três schemas principais utilizados na
arquitetura do Data Warehouse:

- bronze → Armazena dados brutos vindos das fontes
- silver → Armazena dados limpos e padronizados
- gold   → Armazena dados prontos para análise e relatórios

ARQUITETURA DE DADOS
Este projeto utiliza a arquitetura de camadas:

Bronze Layer → Raw Data
Silver Layer → Cleaned & Standardized Data
Gold Layer   → Business Ready Data

AVISO IMPORTANTE
A execução deste script removerá completamente o banco de dados
'DataWarehouse' caso ele já exista.

Todos os dados armazenados serão permanentemente deletados.

Execute este script apenas em ambientes de desenvolvimento ou
quando houver certeza de que os dados podem ser removidos.

Certifique-se de possuir backups antes de executar.

==============================================================
*/



-- Criando Database  'DataWarehouse'


USE master;

-- Drop and recreat the ' DataWarehouse' database

IF EXISTS (SELECT 1 FROM sys.databases WHERE name = 'DataWarehouse')
BEGIN 

  ALTER DATABASE DtaWarehouse SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
  DROP DATABASE DataWarehouse;

  END. GO



CREATE DATABASE DataWarehouse;


Use DataWarehouse;


CREATE SCHEMA Bronze;

GO

CREATE SCHEMA Silver;

GO

CREATE SCHEMA Gold;
