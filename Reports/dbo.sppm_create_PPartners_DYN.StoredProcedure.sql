USE [Reports]
GO
/****** Object:  StoredProcedure [dbo].[sppm_create_PPartners_DYN]    Script Date: 12/22/2020 5:00:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		< Joni Wilson>
-- Create date: <07/08/2011>
-- Description:	Create Preferred Partners 
-- =============================================
CREATE PROCEDURE [dbo].[sppm_create_PPartners_DYN]
(@in_month varchar(2), @in_year varchar(4) )

AS
BEGIN

	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

 	DECLARE @startMoCount int;
	DECLARE @startBetweenCount int;
	DECLARE @startQtrCount int;
	DECLARE @startCount int;

    DECLARE @SQL varchar(max);
    DECLARE @SQL2 varchar(max);
	DECLARE @startDate varchar(26);
    DECLARE @varDate varchar(26);

	SET @startCount = 0;
	SET @startMoCount = 1;
	SET @startQtrCount = 1;
    SET @SQL2 = '';  
	SET @startDate = '01/01/ ' + @in_year ;  

	SET @SQL = 'SELECT p.vendorid, p.vendorname, '+
				' COUNT (DISTINCT case WHEN accruedenddt < ''' +  @startDate + ''' THEN S.PMID END) AS Pre'+ @in_year + 'Count, '+
                ' sum(case when accruedenddt < ''' + @startDate + ''' THEN volumeamt else 0 END) AS Pre'+ @in_year + 'Volume, '+
                ' sum(case when accruedenddt < ''' +  @startDate + ''' THEN rebateamt else 0 END) AS Pre'+ @in_year + 'Rebate, ';
   		 
	WHILE @startCount < @in_month
	BEGIN
		SET @varDate =  dbo.fDate3(DATEADD(m,@startCount,@startDate));
        SET @SQL2 = @SQL2 + ' COUNT (DISTINCT case WHEN month(accruedenddt) = ' + cast(@startMoCount as varchar(2)) + ' and year(accruedenddt) = '+ @in_year +'  THEN S.PMID END) AS ' + @varDate + 'Count, ' + 
             ' sum(case when month(accruedenddt) = ' + cast(@startMoCount as varchar(2)) + ' and year(accruedenddt) = '+ @in_year +' THEN volumeamt else 0 END) AS ' + @varDate + 'Volume, ' +
             ' sum(case when month(accruedenddt) = ' + cast(@startMoCount as varchar(2)) + ' and year(accruedenddt) = '+ @in_year +' THEN rebateamt else 0 END) AS ' + @varDate + 'Rebate, ';
        IF(@startMoCount = 3 or @startMoCount = 6 or @startMoCount = 9 or @startMoCount = 12)
			BEGIN
                SET @startQtrCount = @startMoCount /3;
				SET @startBetweenCount = @startMoCount -2; 
				SET @SQL2 = @SQL2 + '  COUNT (DISTINCT case WHEN month(accruedenddt) between '  + cast(@startBetweenCount as varchar(2)) +  ' and ' + cast(@startMoCount as varchar(2)) + ' and year(accruedenddt) =  ' + @in_year + ' THEN S.PMID END) AS [' + cast(@startQtrCount as varchar(2)) + 'Q2011Count], '+
						 ' sum(case when month(accruedenddt) between ' + cast(@startBetweenCount as varchar(2)) + ' and ' + cast(@startMoCount as varchar(2)) + ' and year(accruedenddt) = ' + @in_year + ' THEN volumeamt else 0 END) AS [' + cast(@startQtrCount as varchar(2)) + 'Q2011Volume], '+
						 ' sum(case when month(accruedenddt) between  ' + cast(@startBetweenCount as varchar(2)) + ' and ' + cast(@startMoCount as varchar(2)) + '  and year(accruedenddt) = ' + @in_year  + ' THEN rebateamt else 0 END) AS [' + cast(@startQtrCount as varchar(2)) + 'Q2011Rebate],';
			END 
         		SET @startCount = @startCount + 1;
                SET @startMoCount = @startMoCount + 1;
         END

         SET @SQL2 = @SQL2 + ' sum(case when month(accruedenddt) <= ' + cast(@startMoCount - 1 as varchar(2)) + ' and year(accruedenddt) =  ' + @in_year + ' THEN volumeamt else 0 END) AS [FullVolume], '+
                     ' sum(case when month(accruedenddt) <= ' + cast(@startMoCount -1 as varchar(2)) + ' and year(accruedenddt) =  ' + @in_year + ' THEN rebateamt else 0 END) AS [FullRebate], '+
                     ' sum(volumeamt) as TotalVolume, sum(rebateamt) as TotalRebate '+
                     ' from pharmacymaster..vendortransaction t, pharmacymaster..vendorload vl, pharmacymaster..vendorvolumerebate vol, pharmacymaster..partners p, pharmacymaster..v_pm_withdeleted s  ' +
                     ' where t.transactionid = vl.transactionid ' +
                     ' and vl.transactionid = vol.transactionid ' +
                     ' and vol.vendorid = p.vendorid ' +
                     ' and s.pmid = vol.pmid ' +
                     --and paiddt is null  
                     ' group by p.vendorid,p.vendorname ' ;

		EXEC ( @SQL + @SQL2);

END








GO
