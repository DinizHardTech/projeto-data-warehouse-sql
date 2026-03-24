
/*
===============================================================================
CAMADA BRONZE - DATA WAREHOUSE
===============================================================================

Descrição:
    A camada Bronze representa a ingestão inicial dos dados brutos (raw data)
    provenientes dos sistemas de origem, como CRM e ERP.

Características:
    - Dados são carregados sem transformações significativas
    - Estrutura próxima da origem (schema-on-read)
    - Pode conter inconsistências, duplicidades ou dados sujos
    - Foco em rastreabilidade e histórico da origem

Objetivo:
    Garantir que os dados originais sejam armazenados de forma íntegra,
    servindo como base para as camadas seguintes (Silver e Gold)

Boas práticas:
    - Evitar regras de negócio nesta camada
    - Utilizar cargas completas (full load) ou incrementais controladas
    - Manter logs de execução (tempo, status, volume)

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
