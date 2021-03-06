USE [reporting]
GO
/****** Object:  StoredProcedure [dbo].[spud_AWPLoadALL]    Script Date: 12/22/2020 4:58:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[spud_AWPLoadALL] 
	-- in this case the filename = the table name
	/*@strContractRate nvarchar(5),
	@strDFee nvarchar(10),
	@filename nvarchar(200)*/

AS
DECLARE @SQL varchar(2000)
BEGIN
	
	-- Copy data from flat file --------------------------------------------------------------------------------------------
	--set @SQL = 'bulk insert AWPSettle from ''\\intranet2\wwwroot\intranet3\Docs\AnthemWellpointOpen_SEP_3Q08_ALL.txt' ;
	/*set @SQL = 'bulk insert AWPAnalyse from ''C:\data\AWPImport\AnthemWellpointOpen_SEP_3Q08_ALL.txt' ;
	set @SQL = @SQL + ''' with (fieldterminator='';'', firstrow=2 ) ';
	--set @SQL = @SQL + 'errorfile=''C:\Documents and Settings\jnarayanan\My Documents\Visual Studio 2008\WebSites\Intranet3\Docs\' + @filename + '.err'')';
	SET NOCOUNT ON;
	exec(@SQL);
	SET NOCOUNT OFF */

	--Change format of fields --------------------------------------------------------------------------------------------
	Update AWPAnthem set [Total  AWP] =  LTRIM(RTRIM(REPLACE(REPLACE([Total  AWP], '$', ''),',',''))),
					[Patient Paid Amount] =  LTRIM(RTRIM(REPLACE(REPLACE([Patient Paid Amount], '$', ''),',',''))),
					[Total Paid Amount] =  LTRIM(RTRIM(REPLACE(REPLACE([Total Paid Amount], '$', ''),',',''))),
					[Dispensing Fee Amount] =  LTRIM(RTRIM(REPLACE(REPLACE([Dispensing Fee Amount], '$', ''),',',''))),
					[Total Ingredient Cost] =  LTRIM(RTRIM(REPLACE(REPLACE([Total Ingredient Cost], '$', ''),',',''))),
					[Usual Customary Amount] =  LTRIM(RTRIM(REPLACE(REPLACE([Usual Customary Amount], '$', ''),',',''))), 
					[TRx Quantity Dispensed] =  LTRIM(RTRIM(REPLACE(REPLACE([TRx Quantity Dispensed], '$', ''),',',''))),
					[TRx Count] = LTRIM(RTRIM(REPLACE(REPLACE([TRx Count], '$', ''),',','')))

	

	UPDATE AWPAnthem Set Flag1400 = 1, Flag8000 = 1

	--	TotalAWP is null or zero
	
	UPDATE    AWPAnthem SET [Total  AWP] = (SELECT  BB FROM RNP2_PIVOT WHERE (ndc = AWPAnthem.NDC11)) * [TRx Quantity Dispensed]
	WHERE     ([Total  AWP] IS NULL) OR ([Total  AWP] = 0)		

	--Calculated fields
	
	--1.	Set Flag
	UPDATE  AWPAnthem SET Flag1400 = 2 WHERE  (NDC11 IN (SELECT  NDC  FROM  AWP1400))

	UPDATE  AWPAnthem SET Flag8000 = 3 WHERE  (NDC11 IN (SELECT  NDC  FROM  AWP8000))

	--2.	Reverse Calculate WAC		
	Update AWPAnthem Set TotalRelayWAC = [Total  AWP]/1.2 Where Flag1400=1  
	Update AWPAnthem Set TotalRelayWAC = [Total  AWP]/1.25 Where (Flag1400 = 2 or Flag8000 = 3)   --1400 & 8000

	--3.	Calculate AdjustedAWP
	UPDATE  AWPAnthem SET  TotalAdjustedAWP = [Total  AWP] WHERE (Flag1400 = 1 or Flag8000 = 1) 			
	UPDATE  AWPAnthem SET  TotalAdjustedAWP = TotalRelayWAC * 1.2 WHERE (Flag1400 = 2 or Flag8000 = 3) 
	
	
	--Retrieve The Aggregates -----------------------------------------------------------------------------------------------
	--1400
/*	SELECT
		'Anthem 1400' AS Type,
		SUM([TRx Count]) as TotalPrescription,
		COUNT(distinct ndc11) as NDCs, 
		SUM(TotalRelayWAC) as TotalWAC, 
		SUM([Total Paid Amount]) as TotalPlanPaid, 
		SUM([Total  AWP]) as TotalAWP,
		SUM([TotalAdjustedAWP]) as TotalAdjAWP, 
		SUM([Total  AWP] - [Total  AWP] * 16 / 100 + 1.75) AS TotalReimburse , 
		SUM(((TotalRelayWAC * 1.2) - (TotalRelayWAC * 1.2 * 16 / 100)) + 1.75) AS TotalAdjReimburse,
		(SUM([Total  AWP] - [Total  AWP] * 16 / 100 + 1.75) ) - (SUM(((TotalRelayWAC * 1.2) - (TotalRelayWAC * 1.2 * 16 / 100)) + 1.75))  as Impact

	FROM AWPAnthem Where [Brand Type] = 'SINGLE-SOURCE BRAND' AND Flag1400 = 2 
	
	--8000
	SELECT
		'Anthem 8000' AS Type,
		SUM([TRx Count]) as TotalPrescription,
		COUNT(distinct ndc11) as NDCs, 
		SUM(TotalRelayWAC) as TotalWAC, 
		SUM([Total Paid Amount]) as TotalPlanPaid, 
		SUM([Total  AWP]) as TotalAWP,
		SUM([TotalAdjustedAWP]) as TotalAdjAWP, 
		SUM([Total  AWP] - [Total  AWP] * 16 / 100 + 1.75) AS TotalReimburse , 
		SUM(((TotalRelayWAC * 1.2) - (TotalRelayWAC * 1.2 * 16 / 100)) + 1.75) AS TotalAdjReimburse,
		(SUM([Total  AWP] - [Total  AWP] * 16 / 100 + 1.75) ) - (SUM(((TotalRelayWAC * 1.2) - (TotalRelayWAC * 1.2 * 16 / 100)) + 1.75))  as Impact
	FROM AWPAnthem Where [Brand Type] = 'SINGLE-SOURCE BRAND' AND Flag8000 = 3

	--Total
	SELECT
		'Anthem Total' AS Type,
		SUM([TRx Count]) as TotalPrescription,
		COUNT(distinct ndc11) as NDCs, 
		SUM(TotalRelayWAC) as TotalWAC, 
		SUM([Total Paid Amount]) as TotalPlanPaid, 
		SUM([Total  AWP]) as TotalAWP,
		SUM([TotalAdjustedAWP]) as TotalAdjAWP, 
		SUM([Total  AWP] - [Total  AWP] * 16 / 100 + 1.75) AS TotalReimburse , 
		SUM(((TotalRelayWAC * 1.2) - (TotalRelayWAC * 1.2 * 16 / 100)) + 1.75) AS TotalAdjReimburse,
		(SUM([Total  AWP] - [Total  AWP] * 16 / 100 + 1.75) ) - (SUM(((TotalRelayWAC * 1.2) - (TotalRelayWAC * 1.2 * 16 / 100)) + 1.75))  as Impact
	FROM AWPAnthem Where [Brand Type] = 'SINGLE-SOURCE BRAND'  */

END
GO
