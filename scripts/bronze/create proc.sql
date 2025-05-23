--making sure of logging etc by using getdate and knowin how much time taknen for each ,
--this makes us  undersatnd wher data leasks or bottlecnecks happen
--using try catch so that any failures we can logg it
EXEC bronze.load_bronze


IF OBJECT_ID('bronze.load_bronze', 'P') IS NOT NULL
    DROP PROCEDURE bronze.load_bronze;
GO
--adding etl tim , consuming time etc, so time constraint to be added. we need to get start and end time
--we can do tat by declaring start and end time
CREATE PROCEDURE bronze.load_bronze
AS
BEGIN 
	
	BEGIN TRY
	declare @start_time DATETIME, @end_time DATETIME, @b_start_time DATETIME, @b_end_time DATETIME;
	SET @b_start_time= GETDATE();
	--we use a vegin try and catch for error debign
		print'*************************'
		print'Loading bronze layer'
		print'*************************'


		print'*************************'
		print'Loading crm layer'
		print'*************************'
		SET @start_time= GETDATE();
		print 'Truncating data from .crm_cust_info'
		TRUNCATE TABLE bronze.crm_cust_info;

		print 'Inserting data into crm_cust_info'
		BULK INSERT bronze.crm_cust_info 
		FROM 'C:\Users\jacky\Downloads\sql-data-warehouse-project-main\datasets\source_crm\cust_info.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		SET @end_time= GETDATE();
		print 'Load duration is '+ cast(Datediff(second ,@start_time, @end_time) as nvarchar) + 'seconds';
		print '**************'
		SET @start_time= GETDATE();
		TRUNCATE TABLE bronze.crm_prd_info;
		BULK INSERT bronze.crm_prd_info
		FROM 'C:\Users\jacky\Downloads\sql-data-warehouse-project-main\datasets\source_crm\prd_info.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		SET @end_time= GETDATE();
		print 'Load duration is '+ cast(Datediff(second ,@start_time, @end_time) as nvarchar) + 'seconds';
		print '**************'
		SET @start_time= GETDATE();
		TRUNCATE TABLE bronze.crm_sales_details;

		BULK INSERT bronze.crm_sales_details
		FROM 'C:\Users\jacky\Downloads\sql-data-warehouse-project-main\datasets\source_crm\sales_details.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		SET @end_time= GETDATE();
		print 'Load duration is '+ cast(Datediff(second ,@start_time, @end_time) as nvarchar) + 'seconds';
		print '**************'

		print'*************************'
		print'Loading erp layer'
		print'*************************'

		SET @start_time= GETDATE();
		TRUNCATE TABLE bronze.erp_loc_a101;
		BULK INSERT bronze.erp_loc_a101
		FROM 'C:\Users\jacky\Downloads\sql-data-warehouse-project-main\datasets\source_erp\loc_a101.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		SET @end_time= GETDATE();
		print 'Load duration is '+ cast(Datediff(second ,@start_time, @end_time) as nvarchar) + 'seconds';
		print '**************'
		SET @start_time= GETDATE();
		TRUNCATE TABLE bronze.erp_cust_az12;
		BULK INSERT bronze.erp_cust_az12
		FROM 'C:\Users\jacky\Downloads\sql-data-warehouse-project-main\datasets\source_erp\cust_az12.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);

		SET @end_time= GETDATE();
		print 'Load duration is '+ cast(Datediff(second ,@start_time, @end_time) as nvarchar) + 'seconds';
		print '**************'
		SET @start_time= GETDATE();
		TRUNCATE TABLE bronze.erp_px_cat_g1v2;
		BULK INSERT bronze.erp_px_cat_g1v2
		FROM 'C:\Users\jacky\Downloads\sql-data-warehouse-project-main\datasets\source_erp\px_cat_g1v2.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
	SET @b_end_time=GETDATE();
	print ' the time takenf or bronse layer is '+ cast(datediff(second,@b_start_time, @b_end_time) as nvarchar) + 'seconds'; 
	END TRY
	BEGIN CATCH
		print'*************************'
		print'Error occuered Loading bronze layer'
		print'Error mesg' + ERROR_MESSAGE();
		print 'Error message' + CAST(error_number() as nvarchar);
		print 'Error message' + CAST(error_state() as nvarchar);
		print'*************************'
	END CATCH
--error_mesage functoni to tell wats error
--try ended and catch stmtnt done if any failure in try statment
END;
