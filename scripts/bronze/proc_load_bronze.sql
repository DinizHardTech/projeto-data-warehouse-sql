/*
===============================================================================
CAMADA BRONZE - DATA WAREHOUSE (RAW LAYER)
===============================================================================

Descrição:
    A camada Bronze é responsável pela ingestão dos dados brutos (raw data)
    provenientes dos sistemas de origem, como CRM e ERP.

    Nesta camada, os dados são carregados exatamente como são recebidos,
    sem aplicação de regras de negócio ou transformações complexas.

Objetivo:
    - Garantir a persistência dos dados originais
    - Permitir rastreabilidade completa das fontes
    - Servir como base para processamento nas camadas Silver e Gold

Características:
    - Estrutura semelhante à origem (schema-on-read)
    - Pode conter dados inconsistentes ou duplicados
    - Alta performance de carga (BULK INSERT / ingestão em massa)
    - Baixo nível de tratamento de dados

Estratégia de Carga:
    - Carga completa (FULL LOAD) com TRUNCATE + INSERT
    - Execução controlada via procedure (ex: bronze.load_bronze)
    - Monitoramento de tempo de execução por tabela e por batch

Boas Práticas:
    - Evitar transformações nesta camada
    - Manter nomes padronizados (snake_case)
    - Garantir logs de execução (tempo, status, erros)
    - Separar fontes (CRM, ERP, etc.) por domínio

Uso:
    Execute este script para recriar as tabelas da camada Bronze,
    garantindo consistência estrutural antes da ingestão de dados.

===============================================================================
*/



CREATE OR ALTER PROCEDURE bronze.load_bronze 
AS
BEGIN
    DECLARE 
        @start_time DATETIME,
        @end_time DATETIME,
        @batch_start_time DATETIME,
        @batch_end_time DATETIME;

    BEGIN TRY

        SET @batch_start_time = GETDATE();

        PRINT '===========================';
        PRINT 'Carregamento Camada Bronze';
        PRINT '===========================';

        -- =====================================
        -- CRM - CUST INFO
        -- =====================================
        SET @start_time = GETDATE();

        PRINT '>> TRUNCATE TABLE: bronze.crm_cust_info';
        TRUNCATE TABLE bronze.crm_cust_info;

        PRINT '>> INSERTING DATA INTO: bronze.crm_cust_info';
        BULK INSERT bronze.crm_cust_info
        FROM 'C:\Users\bocca\OneDrive\Área de Trabalho\Projetos Portifólio\Datawherehouse Projeto\fonte_CRM\cust_info.csv'
        WITH (
            FIRSTROW = 2,
            FIELDTERMINATOR = ',',
            TABLOCK
        );

        SET @end_time = GETDATE();
        PRINT '>> Duracao: ' + CAST(DATEDIFF(SECOND, @start_time, @end_time) AS NVARCHAR) + ' segundos';

        -- =====================================
        -- CRM - PRD INFO
        -- =====================================
        SET @start_time = GETDATE();

        PRINT '--------------------------';
        PRINT 'Carregamento Tabelas CRM';
        PRINT '--------------------------';

        PRINT '>> TRUNCATE TABLE: bronze.crm_prd_info';
        TRUNCATE TABLE bronze.crm_prd_info;

        PRINT '>> INSERTING DATA INTO: bronze.crm_prd_info';
        BULK INSERT bronze.crm_prd_info
        FROM 'C:\Users\bocca\OneDrive\Área de Trabalho\Projetos Portifólio\Datawherehouse Projeto\fonte_CRM\prd_info.csv'
        WITH (
            FIRSTROW = 2,
            FIELDTERMINATOR = ',',
            TABLOCK
        );

        SET @end_time = GETDATE();
        PRINT '>> Duracao: ' + CAST(DATEDIFF(SECOND, @start_time, @end_time) AS NVARCHAR) + ' segundos';

        -- =====================================
        -- CRM - SALES DETAILS
        -- =====================================
        SET @start_time = GETDATE();

        PRINT '>> TRUNCATE TABLE: bronze.crm_sales_details';
        TRUNCATE TABLE bronze.crm_sales_details;

        PRINT '>> INSERTING DATA INTO: bronze.crm_sales_details';
        BULK INSERT bronze.crm_sales_details
        FROM 'C:\Users\bocca\OneDrive\Área de Trabalho\Projetos Portifólio\Datawherehouse Projeto\fonte_CRM\sales_details.csv'
        WITH (
            FIRSTROW = 2,
            FIELDTERMINATOR = ',',
            TABLOCK
        );

        SET @end_time = GETDATE();
        PRINT '>> Duracao: ' + CAST(DATEDIFF(SECOND, @start_time, @end_time) AS NVARCHAR) + ' segundos';

        PRINT '--------------------------';

        -- =====================================
        -- ERP - CUST
        -- =====================================
        SET @start_time = GETDATE();

        PRINT 'Carregamento Tabelas ERP';
        PRINT '--------------------------';

        PRINT '>> TRUNCATE TABLE: bronze.erp_cust_az12';
        TRUNCATE TABLE bronze.erp_cust_az12;

        PRINT '>> INSERTING DATA INTO: bronze.erp_cust_az12';
        BULK INSERT bronze.erp_cust_az12
        FROM 'C:\Users\bocca\OneDrive\Área de Trabalho\Projetos Portifólio\Datawherehouse Projeto\fonte_ERP\CUST_AZ12.csv'
        WITH (
            FIRSTROW = 2,
            FIELDTERMINATOR = ',',
            TABLOCK
        );

        SET @end_time = GETDATE();
        PRINT '>> Duracao: ' + CAST(DATEDIFF(SECOND, @start_time, @end_time) AS NVARCHAR) + ' segundos';

        -- =====================================
        -- ERP - LOC
        -- =====================================
        SET @start_time = GETDATE();

        PRINT '>> TRUNCATE TABLE: bronze.erp_loc_a101';
        TRUNCATE TABLE bronze.erp_loc_a101;

        PRINT '>> INSERTING DATA INTO: bronze.erp_loc_a101';
        BULK INSERT bronze.erp_loc_a101
        FROM 'C:\Users\bocca\OneDrive\Área de Trabalho\Projetos Portifólio\Datawherehouse Projeto\fonte_ERP\LOC_A101.csv'
        WITH (
            FIRSTROW = 2,
            FIELDTERMINATOR = ',',
            TABLOCK
        );

        SET @end_time = GETDATE();
        PRINT '>> Duracao: ' + CAST(DATEDIFF(SECOND, @start_time, @end_time) AS NVARCHAR) + ' segundos';

        -- =====================================
        -- ERP - CATEGORY
        -- =====================================
        SET @start_time = GETDATE();

        PRINT '>> TRUNCATE TABLE: bronze.erp_px_cat_g1v2';
        TRUNCATE TABLE bronze.erp_px_cat_g1v2;

        PRINT '>> INSERTING DATA INTO: bronze.erp_px_cat_g1v2';
        BULK INSERT bronze.erp_px_cat_g1v2
        FROM 'C:\Users\bocca\OneDrive\Área de Trabalho\Projetos Portifólio\Datawherehouse Projeto\fonte_ERP\PX_CAT_G1V2.csv'
        WITH (
            FIRSTROW = 2,
            FIELDTERMINATOR = ',',
            TABLOCK
        );

        SET @end_time = GETDATE();
        PRINT '>> Duracao: ' + CAST(DATEDIFF(SECOND, @start_time, @end_time) AS NVARCHAR) + ' segundos';

        -- =====================================
        -- FINAL
        -- =====================================
        SET @batch_end_time = GETDATE();

        PRINT '======================================';
        PRINT 'Carregamento Camada Bronze Completa';
        PRINT '>> Duracao Total: ' 
            + CAST(DATEDIFF(SECOND, @batch_start_time, @batch_end_time) AS NVARCHAR) 
            + ' segundos';
        PRINT '======================================';

    END TRY
    BEGIN CATCH
        PRINT '===========================';
        PRINT 'Falha ao carregar camada bronze';
        PRINT 'Erro: ' + ERROR_MESSAGE();
        PRINT 'Numero: ' + CAST(ERROR_NUMBER() AS NVARCHAR);
        PRINT 'Estado: ' + CAST(ERROR_STATE() AS NVARCHAR);
        PRINT '===========================';
    END CATCH
END
GO

-- EXECUÇÃO
EXEC bronze.load_bronze;
