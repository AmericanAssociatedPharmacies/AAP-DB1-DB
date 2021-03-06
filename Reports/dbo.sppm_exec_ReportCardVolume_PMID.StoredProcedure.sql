USE [Reports]
GO
/****** Object:  StoredProcedure [dbo].[sppm_exec_ReportCardVolume_PMID]    Script Date: 12/22/2020 5:00:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		< Joni Wilson>
-- Create date: <10/14/2010>
-- Description:	Call Report Card Volume and return table
-- =============================================
CREATE PROCEDURE [dbo].[sppm_exec_ReportCardVolume_PMID]
(@startDate varchar(10), @endDate varchar(10),@pmid varchar(8000) )

AS
BEGIN
 
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
  
	   --- Drop the previous runs table

	DECLARE @SQL   varchar(5000);
	EXEC dbo.sppm_create_ReportCardVolume_DYN_PMID @startDate, @endDate, @pmid
   -- EXEC dbo.sppm_create_ReportCardVolume_DYN_PMID_ANDA @startDate, @endDate, @pmid

	SET @SQL = 'SELECT * from tmp_RCVol_jmw_pmid order by  dbo.GlobalReport_KludgeSort(pmid)';
	EXEC (@SQL);

END










GO
