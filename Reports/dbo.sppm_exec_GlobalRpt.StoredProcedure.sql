USE [Reports]
GO
/****** Object:  StoredProcedure [dbo].[sppm_exec_GlobalRpt]    Script Date: 12/22/2020 5:00:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		< Joni Wilson>
-- Create date: <10/14/2010>
-- Description:	Create Monthly Global Report
-- =============================================
CREATE PROCEDURE [dbo].[sppm_exec_GlobalRpt]
(@in_month varchar(50), @in_year varchar(4),@in_Qtr varchar(2),@in_TableName varchar(50))

AS
BEGIN
 
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
  
	   --- Drop the previous runs table

	DECLARE @SQL   varchar(5000);
    -- REPLACE when done with One-Off - JMW
	EXEC dbo.sppm_create_GlobalRpt @in_month,@in_year,@in_Qtr, @in_TableName

	--EXEC dbo.sppm_create_GlobalRpt_DetailPVA @in_month,@in_year,@in_Qtr, @in_TableName

	SET @SQL = 'SELECT * from ' + @in_TableName + ' order by  dbo.GlobalReport_KludgeSort(pmid)';
	EXEC (@SQL);

END










GO
