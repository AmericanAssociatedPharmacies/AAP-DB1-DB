USE [Reports]
GO
/****** Object:  StoredProcedure [dbo].[sppm_exec_ReportCardVolumeTM]    Script Date: 12/22/2020 5:00:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		< Joni Wilson>
-- Create date: <10/14/2010>
-- Description:	Call Report Card Volume and return table
-- =============================================
CREATE PROCEDURE [dbo].[sppm_exec_ReportCardVolumeTM]
 

AS
BEGIN
 
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
  
	   --- Drop the previous runs table

	DECLARE @SQL   varchar(5000);
	--EXEC dbo.sppm_create_ReportCardVolume_DYN @ch_endDate,@wh_endDate 

	SET @SQL = 'SELECT * from tmp_RCVol_jmw_TM  order by TM';
	EXEC (@SQL);

END










GO
