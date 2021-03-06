USE [Reports]
GO
/****** Object:  StoredProcedure [dbo].[sppm_find_DuplicateDEAinPM]    Script Date: 12/22/2020 5:00:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		< Joni Wilson>
-- Create date: <07/27/2016>
-- Description:	Find APIAccountNo's that are in PM twice
-- =============================================
CREATE PROCEDURE [dbo].[sppm_find_DuplicateDEAinPM]

AS
BEGIN
 
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
  

	SELECT  t.PMID,t.AAPAccountNo,t.AAPEffectiveDate,t.AAPParentNo,t.AAPQuitDate,t.AAPStatus,t.AccountDescription,
		t.AccountName,t.APIAccountNo,t.APIPMID,t.APIStatus,t.DEA
	FROM  PharmacyMaster..PM_Pharmacy t
	inner join 
	(
	SELECT DEA
	FROM   PharmacyMaster..PM_Pharmacy WHERE DEA != 'DEA - DEA'
	GROUP BY DEA
	HAVING count(*) > 1
	) d ON t.DEA = d.DEA WHERE t.DEA != 'DEA - DEA'
	ORDER BY DEA

END










GO
