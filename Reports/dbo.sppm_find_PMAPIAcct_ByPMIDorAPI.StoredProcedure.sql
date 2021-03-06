USE [Reports]
GO
/****** Object:  StoredProcedure [dbo].[sppm_find_PMAPIAcct_ByPMIDorAPI]    Script Date: 12/22/2020 5:00:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		< Joni Wilson>
-- Create date: <07/19/2016>
-- Description:	Find PMID or APIAccountNO in PM_APIAccount for PM_APIAccount table Maintenance
-- =============================================
CREATE PROCEDURE [dbo].[sppm_find_PMAPIAcct_ByPMIDorAPI]
(@in_No varchar(500),@in_Type varchar(1))

AS
BEGIN
 
	DECLARE @SQL varchar(max);
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
  
IF(@in_Type = 'P')
	BEGIN
    SET @SQL = 'SELECT * FROM pharmacymaster..pm_apiaccounts where PMID in ('+ @in_No + ')';
	END
IF(@in_Type = 'A')
	BEGIN
	    SET @SQL = 'SELECT * FROM pharmacymaster..pm_apiaccounts where APIAccountNo like ('+ @in_No + ')';
	END

	EXEC (@SQL);
	 
END










GO
