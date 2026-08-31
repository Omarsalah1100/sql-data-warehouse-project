
--exec bronze.load_bronze;

CREATE OR ALTER PROCEDURE bronze.load_bronze

AS

BEGIN
    DECLARE @start_time DATETIME, @end_time DATETIME;

    BEGIN TRY
        PRINT '==============================';
        PRINT ' Loading Bronze Layer ';
        PRINT '===============================';

        -------------------------------------------------
        -- CRM Tables
        -------------------------------------------------
        PRINT '-------------------------------';
        PRINT ' Loading CRM Tables ';
        PRINT '-------------------------------';

        -- crm_cust_info
        SET @start_time = GETDATE();
        PRINT '>> Truncating table : bronze.crm_cust_info';
        TRUNCATE TABLE bronze.crm_cust_info;

        PRINT '>> Inserting Data into bronze.crm_cust_info';
        BULK INSERT bronze.crm_cust_info
        FROM 'E:\DataWithBaraa\sql-data-warehouse-project\datasets\source_crm\cust_info.csv'
        WITH (FIRSTROW = 2, FIELDTERMINATOR = ',', TABLOCK);

        SET @end_time = GETDATE();
        PRINT '>> Load Duration : ' + CAST(DATEDIFF(SECOND, @start_time, @end_time) AS NVARCHAR) + ' second';
        PRINT '-------------------------------------------';

        -- crm_prd_info
        SET @start_time = GETDATE();
        PRINT '>> Truncating table : bronze.crm_prd_info';
        TRUNCATE TABLE bronze.crm_prd_info;

        PRINT '>> Inserting Data into bronze.crm_prd_info';
        BULK INSERT bronze.crm_prd_info
        FROM 'E:\DataWithBaraa\sql-data-warehouse-project\datasets\source_crm\prd_info.csv'
        WITH (FIRSTROW = 2, FIELDTERMINATOR = ',', TABLOCK);

        SET @end_time = GETDATE();
        PRINT '>> Load Duration : ' + CAST(DATEDIFF(SECOND, @start_time, @end_time) AS NVARCHAR) + ' second';
        PRINT '-------------------------------------------';

        -- crm_sales_details
        SET @start_time = GETDATE();
        PRINT '>> Truncating table : bronze.crm_sales_details';
        TRUNCATE TABLE bronze.crm_sales_details;

        PRINT '>> Inserting Data into bronze.crm_sales_details';
        BULK INSERT bronze.crm_sales_details
        FROM 'E:\DataWithBaraa\sql-data-warehouse-project\datasets\source_crm\sales_details.csv'
        WITH (FIRSTROW = 2, FIELDTERMINATOR = ',', TABLOCK);

        SET @end_time = GETDATE();
        PRINT '>> Load Duration : ' + CAST(DATEDIFF(SECOND, @start_time, @end_time) AS NVARCHAR) + ' second';
        PRINT '-------------------------------------------';

        -------------------------------------------------
        -- ERP Tables
        -------------------------------------------------
        PRINT '-------------------------------';
        PRINT ' Loading ERP Tables ';
        PRINT '-------------------------------';

        -- erp_loc_a101
        SET @start_time = GETDATE();
        PRINT '>> Truncating table : bronze.erp_loc_a101';
        TRUNCATE TABLE bronze.erp_loc_a101;

        PRINT '>> Inserting Data into bronze.erp_loc_a101';
        BULK INSERT bronze.erp_loc_a101
        FROM 'E:\DataWithBaraa\sql-data-warehouse-project\datasets\source_erp\LOC_A101.csv'
        WITH (FIRSTROW = 2, FIELDTERMINATOR = ',', TABLOCK);

        SET @end_time = GETDATE();
        PRINT '>> Load Duration : ' + CAST(DATEDIFF(SECOND, @start_time, @end_time) AS NVARCHAR) + ' second';
        PRINT '-------------------------------------------';

        -- erp_cust_az12
        SET @start_time = GETDATE();
        PRINT '>> Truncating table : bronze.erp_cust_az12';
        TRUNCATE TABLE bronze.erp_cust_az12;

        PRINT '>> Inserting Data into bronze.erp_cust_az12';
        BULK INSERT bronze.erp_cust_az12
        FROM 'E:\DataWithBaraa\sql-data-warehouse-project\datasets\source_erp\CUST_AZ12.csv'
        WITH (FIRSTROW = 2, FIELDTERMINATOR = ',', TABLOCK);

        SET @end_time = GETDATE();
        PRINT '>> Load Duration : ' + CAST(DATEDIFF(SECOND, @start_time, @end_time) AS NVARCHAR) + ' second';
        PRINT '-------------------------------------------';

        -- erp_px_cat_g1v2
        SET @start_time = GETDATE();
        PRINT '>> Truncating table : bronze.erp_px_cat_g1v2';
        TRUNCATE TABLE bronze.erp_px_cat_g1v2;

        PRINT '>> Inserting Data into bronze.erp_px_cat_g1v2';
        BULK INSERT bronze.erp_px_cat_g1v2
        FROM 'E:\DataWithBaraa\sql-data-warehouse-project\datasets\source_erp\PX_CAT_G1V2.csv'
        WITH (FIRSTROW = 2, FIELDTERMINATOR = ',', TABLOCK);

        SET @end_time = GETDATE();
        PRINT '>> Load Duration : ' + CAST(DATEDIFF(SECOND, @start_time, @end_time) AS NVARCHAR) + ' second';
        PRINT '-------------------------------------------';

    END TRY
    BEGIN CATCH
        PRINT '============================';
        PRINT ' ERROR OCCURRED DURING LOADING BRONZE LAYER ';
        PRINT ' ERROR MESSAGE : ' + ERROR_MESSAGE();
        PRINT ' ERROR NUMBER  : ' + CAST(ERROR_NUMBER() AS NVARCHAR);
        PRINT ' ERROR STATE   : ' + CAST(ERROR_STATE() AS NVARCHAR);
        PRINT '============================';
    END CATCH
END;
GO
