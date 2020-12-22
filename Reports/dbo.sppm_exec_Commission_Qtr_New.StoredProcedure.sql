USE [Reports]
GO
/****** Object:  StoredProcedure [dbo].[sppm_exec_Commission_Qtr_New]    Script Date: 12/22/2020 5:00:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		< Joni Wilson>
-- Create date: <10/14/2010>
-- Description:	Call Report Card Volume and return table
-- =============================================
Create PROCEDURE [dbo].[sppm_exec_Commission_Qtr_New]
(@startDate varchar(10), @endDate varchar(10), @in_qtr varchar(2) )

AS
BEGIN
 
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
  
	   --- Drop the previous runs table

	DECLARE @SQL   varchar(5000);
	--EXEC dbo.sppm_create_Commission_QTR_DYN @in_qtr,@in_year 
   
    EXEC dbo.sppm_create_Commission_DYN_QTR_NEW_2 @startDate , @endDate , @in_qtr  

	SET @SQL = 'SELECT * from tmp_Comm_OneOff_jmw order by  dbo.GlobalReport_KludgeSort(pmid)';
	EXEC (@SQL);

END










GO
