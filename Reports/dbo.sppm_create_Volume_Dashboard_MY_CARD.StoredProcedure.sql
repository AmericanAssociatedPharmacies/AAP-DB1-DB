USE [Reports]
GO
/****** Object:  StoredProcedure [dbo].[sppm_create_Volume_Dashboard_MY_CARD]    Script Date: 12/22/2020 5:00:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		< Joni Wilson>
-- Create date: <10/14/2010>
-- Description:	Create table for Volume for Dashboard
-- =============================================
CREATE PROCEDURE [dbo].[sppm_create_Volume_Dashboard_MY_CARD]

AS
BEGIN
 
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
  
DECLARE @year int;
DECLARE @prevYear int;
DECLARE @prevYear2 int;

SET @year = (select max(year(date))  from pharmacymaster..all_volume where aapnetsales <> 0);
SET @prevYear = @year - 1 ; 
SET @prevYear2 = @year - 2 ; 



--SELECT year(date) as Year, SUBSTRING(CONVERT(VARCHAR(9), date, 6), 4, 3) as Month ,round(sum(AAPBrand),2) as Brand ,round(sum(AAPGenTotal),2)
--	as Generic ,round(sum(AAPOTC) + sum(AAPOther),2) as OTC,round(sum(AAPNetSales),2) as [Total Sales] from pharmacymaster..all_volume
--	where year(date) in (@year,@prevYear,@prevYear2)  and AAPNetSales <> 0 group by date order by date

SELECT year(date) as Year, SUBSTRING(CONVERT(VARCHAR(9), date, 6), 4, 3) as Month ,round(sum(AAPBrand),2) as Brand ,round(sum(AAPGenTotal),2)
	as Generic ,round(sum(AAPOTC) + sum(AAPOther),2) as OTC,round(sum(AAPNetSales),2) as [Total Sales] from pharmacymaster..all_volume
	where year(date) in (@year,@prevYear,@prevYear2)    group by date order by date

END








GO
