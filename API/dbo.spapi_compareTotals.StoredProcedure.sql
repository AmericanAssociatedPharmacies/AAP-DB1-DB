USE [API]
GO
/****** Object:  StoredProcedure [dbo].[spapi_compareTotals]    Script Date: 12/22/2020 4:19:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		< Joni Wilson>
-- Create date: <02/20/2014>
-- Description:	<Aggregate total amount for the month by whacccountid>
-- =============================================
CREATE PROCEDURE [dbo].[spapi_compareTotals]
 (@in_month varchar(2), @in_year varchar(4),@in_type varchar(10),@detail_type varchar(10))
AS
	BEGIN
 
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
  
   IF EXISTS(SELECT name FROM sys.tables
        WHERE name = 'tmp_apiwh')
          DROP TABLE tmp_apiwh

SELECT * into tmp_apiwh from 
(
	SELECT whaccountid,sum(extsales) as TotalDetailSales 
	from api..v_apisalesdetail where month(invdate) = @in_month  and year(invdate) =  @in_year 
	and AcctGrp <> 'I17'
	group by whaccountid 
 )ch

SELECT t.whaccountid as DetailWHID,TotalDetailSales,a.whaccountid as CompareWHID,TotalSales as CompareTotalSales from tmp_apiwh   t 
join
(
	SELECT * from  API_MO_WHSales      where month(date) = @in_month and year(date) = @in_year
)a on t.whaccountid = a.whaccountid
WHERE  TotalSales     !=  TotalDetailSales

END








GO
