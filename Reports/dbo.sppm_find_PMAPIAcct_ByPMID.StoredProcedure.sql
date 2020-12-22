USE [Reports]
GO
/****** Object:  StoredProcedure [dbo].[sppm_find_PMAPIAcct_ByPMID]    Script Date: 12/22/2020 5:00:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		< Joni Wilson>
-- Create date: <07/19/2016>
-- Description:	Find PMID in PM_Pharmacy for PM_APIAccount table Maintenance
-- =============================================
CREATE PROCEDURE [dbo].[sppm_find_PMAPIAcct_ByPMID]
(@in_PMID varchar(500))

AS
BEGIN
 
	DECLARE @SQL varchar(max);
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
  
    SET @SQL = 'SELECT * FROM pharmacymaster..pm_pharmacy where PMID in ('+ @in_PMID + ')';
	EXEC (@SQL);
	 
END










GO
