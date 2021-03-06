USE [Reports]
GO
/****** Object:  StoredProcedure [dbo].[sppm_exec_Commission_OneOff]    Script Date: 12/22/2020 5:00:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		< Joni Wilson>
-- Create date: <10/14/2010>
-- Description:	Call Report Card Volume and return table
-- =============================================
CREATE PROCEDURE [dbo].[sppm_exec_Commission_OneOff]
(@startDate varchar(10), @endDate varchar(10),@territory varchar(100) )

AS
BEGIN
 
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
  
	   --- Drop the previous runs table

	DECLARE @SQL   varchar(5000);
	EXEC dbo.sppm_create_Commission_DYN_OneOffs @startDate,@endDate 

	SET @SQL = 'SELECT * from tmp_Comm_OneOff_jmw  ';
        IF (@territory is not null )
			BEGIN
				SET @SQL = @SQL + ' where TM in (' + @territory + ') order by  TM';
			END 
        ELSE
			BEGIN
				SET @SQL = @SQL + ' order by   dbo.GlobalReport_KludgeSort(pmid) '
			END
	EXEC (@SQL);

END










GO
