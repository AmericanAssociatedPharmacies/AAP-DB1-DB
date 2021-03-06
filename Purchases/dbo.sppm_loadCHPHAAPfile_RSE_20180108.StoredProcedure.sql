USE [Purchases]
GO
/****** Object:  StoredProcedure [dbo].[sppm_loadCHPHAAPfile_RSE_20180108]    Script Date: 12/22/2020 4:55:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO


-- =============================================
-- Author:		Joni Wilson
-- Create date: 6/17/2010
-- Description:	load a  cardinal CHPH file
-- =============================================
CREATE PROCEDURE [dbo].[sppm_loadCHPHAAPfile_RSE_20180108] 

	-- Add the parameters for the stored procedure here
	@filename varchar(1000),
    @monthYear datetime 
AS

SET NOCOUNT ON;

DECLARE @SQL varchar(2000)

--This logic will keep a file from being reloaded. We need to reload a file at anytime.
--IF NOT EXISTS(SELECT  filename 
--				FROM  CHPH_loadlog 
--				WHERE filename = @filename +"_AAP"
--				)

BEGIN

	TRUNCATE TABLE [Staging].[CHPH_AAP];

	--Bulk insert flat file
	set @SQL = "bulk insert Staging.v_chph_load_AAP from '" + @filename;
	--set @SQL = "bulk insert dbo.v_chph_load_AAP from '" + @filename;
	set @SQL = @SQL + "' with (fieldterminator=';', firstrow=2, "
	set @SQL = @SQL + "errorfile='" + @filename + ".err')"
	exec(@SQL)

	UPDATE STATISTICS [Staging].[CHPH_AAP];

	--Fix Store and PMID issues
	EXEC [Staging].[usp_CHPH_AAP_Updates]

	--This will handle a reload
	DELETE x
	FROM [dbo].[CHPH_AAP_Test] AS x
	INNER JOIN [Staging].[CHPH_AAP] AS s ON x.[MM_DD_YY_LOAD] = s .MM_DD_YY_LOAD


	--Insert all non exact dups rows from flat file. Te SQL View removes any exact dups
	INSERT INTO [dbo].[CHPH_AAP_Test](DC, CUSTOMER_NAME, CUSTOMER_NO, ITEM_NO, STORE, NDC, ITEM_TYPE, ITEM_DESCR, GENERIC_NAME, TRADE_NAME, INV_DATE, INVOICE_NO, TYPE, ORDER_QTY, SHIP_QTY, UNIT_COST, EXT_COST
	, CORP_AWP, WAC, VENDOR_NAME, UPC, CONTRACT_FLAG, BRAND, GENERIC_CODE, STRENGTH, SHORT_CODE, ENCODING, CONTRACTNO, CONTRACTDESC, ORDERNO, MM_DD_YY_LOAD, PMID)
	SELECT DC, CUSTOMER_NAME, CUSTOMER_NO, ITEM_NO, STORE, NDC, ITEM_TYPE, ITEM_DESCR, GENERIC_NAME, TRADE_NAME, INV_DATE, INVOICE_NO, TYPE, ORDER_QTY, SHIP_QTY, UNIT_COST, EXT_COST
	, CORP_AWP, WAC, VENDOR_NAME, UPC, CONTRACT_FLAG, BRAND, GENERIC_CODE, STRENGTH, SHORT_CODE, ENCODING, CONTRACTNO, CONTRACTDESC, ORDERNO, MM_DD_YY_LOAD, PMID
	FROM [Staging].[vw_CHPH_AAP] AS s
	WHERE NOT EXISTS(SELECT 1
						FROM [dbo].[CHPH_AAP] AS c
						WHERE s.MM_DD_YY_LOAD = c.MM_DD_YY_LOAD	
					)

	--Load file log info

	SET @filename = @filename + '_AAP'

	INSERT INTO CHPH_loadlog (filename,date_loaded) 
	VALUES(@filename,getdate())

	--set @SQL = "insert into CHPH_loadlog (filename,date_loaded) values('" + @filename + "_AAP',getdate())"
	--exec(@SQL)

END



GO
