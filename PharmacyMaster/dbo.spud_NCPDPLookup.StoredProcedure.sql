USE [PharmacyMaster]
GO
/****** Object:  StoredProcedure [dbo].[spud_NCPDPLookup]    Script Date: 12/22/2020 4:45:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spud_NCPDPLookup]
	@NCPDP nvarchar(10),
	@state nvarchar(2),
	@affiliates nvarchar(200)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	DECLARE @SQL varchar(max);

	SET @SQL = 'SELECT NCPDP, NPI, DEA, DEAEXP, Name, Address, Address1, City, State, Zip, Phone, Ext, Fax, Email, ChainCode, AffiliateName, AffiliateType FROM v_NCPDP_Info WHERE NCPDP IS NOT NULL ';

	If @NCPDP <> 'ALL' 
		BEGIN			
			SET @SQL=@SQL + ' AND NCPDP =' + '''' + @NCPDP + '''';
		END

	If @state <> '' 
		BEGIN			
			SET @SQL=@SQL + ' AND State =' + '''' + @state + '''';
		END	
	
	If @affiliates <> '' 
		BEGIN			
			SET @SQL=@SQL + ' AND AffiliateName Like ' + '''' + '%' + @affiliates + '%' + '''';	
		END	
	
	--print @SQL;
	EXEC (@SQL)
END
GO
