USE [Reports]
GO
/****** Object:  StoredProcedure [dbo].[sppm_PM_AnnualRebates_CardinalAdminFee_Pivot]    Script Date: 12/22/2020 5:00:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		< Joni Wilson>
-- Create date: <10/08/2010>
-- Description:	 Pivot the Cardinal Annual Admin fee table from Betty 
-- =============================================
CREATE PROCEDURE [dbo].[sppm_PM_AnnualRebates_CardinalAdminFee_Pivot] 
(@in_year varchar(4))

AS
BEGIN
 
 INSERT  into reports..import_RebateCAAnnualAdminFee (Date, PMID,ExtSales)   
 
SELECT cast (dbo.NumberFromFullNameMonth(Sales) as varchar(2)) + '/01/' + Year as date,PMID,Value as ExtSales

FROM import_RebateCAAnnualAdminFeePivot
UNPIVOT( Value For  Sales
       IN (January,February,March,April,May,June,July,August,September,October,November,December) )  UNPVTTable
 where Year = @in_year
 
 END

 
--SELECT Year,PMID,Value,Sales,
--cast (dbo.NumberFromFullNameMonth(Sales) as varchar(2)) + '/01/' + Year as date
--FROM import_RebateCAAnnualAdminFeePivot
--UNPIVOT( Value For  Sales
--       IN (January,February,March,April,May,June,July,August,September,October,November,December) )  UNPVTTable
--where pmid = 107212
--
--select   * from import_RebateCAAnnualAdminFeePivot
--where pmid = 107212



GO
