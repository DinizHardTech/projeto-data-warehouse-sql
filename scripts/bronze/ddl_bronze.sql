
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




IF OBJECT_ID ('bronze.crm_cust_info' , 'U') IS NOT NULL
DROP TABLE bronze.crm_cust_info;

CREATE TABLE bronze.crm_cust_info (

	cst_id INT,
	cst_key NVARCHAR(50),
	cst_firstname NVARCHAR(50),
	cst_lastname NVARCHAR(50),
	cst_material_status NVARCHAR(50),
	cst_gndr NVARCHAR(50),
	cst_create_date DATE

);


IF OBJECT_ID ('bronze.prd.cust_info' , 'U') IS NOT NULL
DROP TABLE bronze.crm_prd_info;


CREATE TABLE bronze.crm_prd_info (
    prd_id INT,
    prd_key NVARCHAR(50),
    prd_nm NVARCHAR(50),
    prd_cost INT,
    prd_line NVARCHAR(50),
    prd_start_dt DATETIME,
    prd_end_dt DATETIME
);


IF OBJECT_ID ('bronze.crm_sales_details' , 'U') IS NOT NULL
DROP TABLE bronze.crm_sales_details;

CREATE TABLE bronze.crm_sales_details (
    sls_ord_num NVARCHAR(50),
    sls_prd_key NVARCHAR(50),
    sls_cust_id INT,
    sls_order_dt INT,
    sls_ship_dt INT,
    sls_due_dt INT,
    sls_sales INT,
    sls_quantity INT,
    sls_price INT
);


IF OBJECT_ID ('bronze.erp_loc_a101' , 'U') IS NOT NULL
DROP TABLE bronze.erp_loc_a101;


CREATE TABLE bronze.erp_loc_a101 (
    cid NVARCHAR(50),
    cntry NVARCHAR(50)
);


IF OBJECT_ID ('bronze.erp_cust_az12' , 'U') IS NOT NULL
DROP TABLE bronze.erp_cust_az12;


CREATE TABLE bronze.erp_cust_az12 (
    cid NVARCHAR(50),
    bdate DATE,
    gen NVARCHAR(50)
);


IF OBJECT_ID ('bronze.erp_px_cat_g1v2' , 'U') IS NOT NULL
DROP TABLE bronze.erp_px_cat_g1v2;


CREATE TABLE bronze.erp_px_cat_g1v2 (
    id NVARCHAR(50),
    cat NVARCHAR(50),
    subcat NVARCHAR(50),
    maintenance NVARCHAR(50)
);
