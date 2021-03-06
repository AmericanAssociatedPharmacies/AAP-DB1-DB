USE [Medispan]
GO
/****** Object:  StoredProcedure [dbo].[sp_RefreshTables]    Script Date: 12/22/2020 4:38:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		JOSHILA NARAYANAN
-- Create date: 04/19/2012
--Medispan Load Data
-- =============================================
CREATE PROCEDURE [dbo].[sp_RefreshTables] 

AS
BEGIN

	DECLARE @date smalldatetime
	DECLARE @filename varchar(100)
	DECLARE @v_date varchar(2)
	DECLARE @v_month varchar(2)
	DECLARE @v_year varchar(4)

	ALTER Table M25_R	ALTER COLUMN AWP_EFfective_Date  smalldatetime

	ALTER Table M25_R	ALTER COLUMN Older_AWP_EFfective_Date  smalldatetime

	ALTER Table M25_M	ALTER COLUMN Inactive_Date  smalldatetime

	ALTER Table M25_Q	ALTER COLUMN Older_WAC_Eff_Date  smalldatetime

	ALTER Table M25_Q	ALTER COLUMN Effective_Date  smalldatetime

	ALTER Table M25_S	ALTER COLUMN DP_EFfective_Date  smalldatetime

	ALTER Table M25_S	ALTER COLUMN Older_DP_EFfective_Date  smalldatetime

	ALTER Table M25_T	ALTER COLUMN CMS_FUL_Price_Eff_Date  smalldatetime

	ALTER Table M25GPRR_4	ALTER COLUMN GPPC_Eff_Date  smalldatetime


	--Update FBDLoadDt table with Month and loaded on date 
	--insert into FDB..FDBLoadDt values( DATEADD(mm, DATEDIFF(mm,0,getdate()), 0) ,getdate())

	

	CREATE INDEX IDX_MSC
		on M25_A (Multi_Source_Code) 

	CREATE INDEX IDX_BNC
		on M25_A (Brand_Name_Code) 

	CREATE INDEX IDX_DEA
		on M25_A (DEA_Class_Code) 

	CREATE INDEX IDX_ROA
		on M25_A (Route_Of_Administration) 

	CREATE INDEX IDX_RxOTC
		on M25_A (Rx_OTC_Indicator_Code) 


	CREATE INDEX IDX_NDC
		on M25_R (NDC_UPC_HRI) 
	
	CREATE INDEX IDX_AWPEffDT
		on M25_R ([AWP_Effective_Date]) 

	CREATE INDEX IDX_Older_AWP
		on M25_R ([Older_AWP_Unit_Price]) 


	CREATE INDEX IDX_reccode
		on M25_R (Record_Code_ID) 

	CREATE INDEX IDX_NDC
		on M25_Q (NDC_UPC_HRI) 

	CREATE INDEX IDX_EffDt
		on M25_Q (Effective_Date) 

	CREATE INDEX IDX_reccode
		on M25_Q (Record_Code_ID) 

	CREATE INDEX IDX_Older_WAC
		on M25_Q (Older_WAC_Unit_Price) 

	CREATE INDEX IDX_NDC
		on M25_G (NDC_UPC_HRI) 

	CREATE INDEX IDX_GPI
		on M25_G (Generic_Product_Identifier) 

	CREATE INDEX IDX_NDC
		on M25_J (NDC_UPC_HRI) 

	CREATE INDEX IDX_DrugName
		on M25_J (Product_Description_Abbreviat) 

	CREATE INDEX IDX_Form
		on M25_L (Dosage_Form) 

	CREATE INDEX IDX_PS
		on M25_L (Package_Size) 

	CREATE INDEX IDX_INACTIVEDT
		on M25_M (Inactive_Date) 

	IF EXISTS (SELECT TABLE_NAME FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME='DrugMaster') DROP TABLE DrugMaster	
	Select * into DrugMaster FROM v_DrugMaster
	CREATE INDEX IDX_NDC
		on DrugMaster (NDC) 
	CREATE INDEX IDX_GPI
		on DrugMaster (GPI) 
	CREATE INDEX IDX_Drugtypeshort
		on DrugMaster (DrugTypeShort) 
	CREATE INDEX IDX_Drugtype
			on DrugMaster (DrugType) 
	CREATE INDEX IDX_Form
		on DrugMaster (Form) 
	CREATE INDEX IDX_RxOTC
		on DrugMaster (RxOTC) 

	--EXEC sp_RECOMPILE_ALL

	EXEC API.dbo.spweb_update_web_NDCList

	

	--Exec master..xp_cmdShell 'bcp Medispan.dbo.v_API OUT c:\API_Medispan.txt -c /S UDDW1\UDDW1 /U devuser /P apple314'
    --EXEC master..xp_cmdshell 'COPY /Y C:\API_Medispan.txt /B \\fs\api\API_Medispan.txt'  (changed \\sambaserv\api_operations\ to \\fs\api\ --CL 8/15)
 
	--*EXEC master..xp_cmdshell 'COPY /Y C:\API_Medispan.txt /B \\sambaserv\public\IT\API_Medispan.txt' --Obsolete Step(change path to new fs path if uncommenting this)
     
    --Exec master..xp_cmdShell 'bcp Medispan.dbo.v_API OUT \\fs\api\API_Medispan.txt -c /S UDDW1\UDDW1 /U devuser /P apple314'  --Obsolete Step(changed \\sambaserv\api_operations\ to \\fs\api\ --CL 8/15)

	--v_OUT is what creates the Medispan file sent to API
    Exec master..xp_cmdShell 'bcp Medispan_2.dbo.v_API OUT \\fs1.aap.local\api\Medispan\API_Medispan.txt -a 32767 -c -T -S'


	SET @date=getdate()

	WHILE(datename(dw,@date)<>'Wednesday')
	BEGIN
	SET @date = dateadd(day,1,@date)
	END

	SET @v_date=CONVERT(varchar(2),datepart(dd,@date))
	SET @v_month=CONVERT(varchar(2),datepart(mm, @date))
	SET @v_year=CONVERT(varchar(4),datepart(yyyy, @date))

	IF len(@v_month)=1 
	SET @v_month='0'+@v_month
	IF len(@v_date)=1 
	SET @v_date='0'+@v_date

	SET @filename= 'mddbv2.5_0_0_wk_pdu-w-gppc_2.5_d_'+@v_year+@v_month+@v_date
	SET @date=(CAST(FLOOR(CAST(@date as FLOAT)) AS DateTime))

	INSERT INTO Reports..Load_Log values(1,@date,getdate(),@filename,'Medispan')


END



GO
