USE [Reports]
GO
/****** Object:  StoredProcedure [dbo].[sppm_exec_ComplianceReport]    Script Date: 12/22/2020 5:00:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		< Joni Wilson>
-- Create date: <10/14/2010>
-- Description:	Call Report Card Volume and return table
-- =============================================
CREATE PROCEDURE [dbo].[sppm_exec_ComplianceReport]
(@in_month1 varchar(2),@in_month2 varchar(2),@in_month3 varchar(2),@in_month4 varchar(2), @in_year varchar(4))

AS
BEGIN
 
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
  
	   --- Drop the previous runs table

	DECLARE @SQL   varchar(5000);
	EXEC dbo.sppm_create_ComplianceReport_DYN @in_month1,@in_month2,@in_month3,@in_month4,@in_year

	--SET @SQL = 'SELECT * from tmp_CompRep_jmw where [CAH Total Sales] != 0 or [ML Total Sales] is not null or affiliate is not null order by  dbo.GlobalReport_KludgeSort(pmid)';
    SET @SQL = 'SELECT * from tmp_CompRep_jmw   order by  dbo.GlobalReport_KludgeSort(pmid)';
	EXEC (@SQL);

END










GO
