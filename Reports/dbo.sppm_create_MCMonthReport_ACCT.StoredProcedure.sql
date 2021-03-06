USE [Reports]
GO
/****** Object:  StoredProcedure [dbo].[sppm_create_MCMonthReport_ACCT]    Script Date: 12/22/2020 5:00:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		< Joni Wilson>
-- Create date: <11/17/2010>
-- Description:	Find APIAccountNo's for a certain month/year with no Match in PM_Pharmacy - XX's are excluded
-- =============================================
CREATE PROCEDURE [dbo].[sppm_create_MCMonthReport_ACCT]
(@in_month varchar(2), @in_year varchar(4))

AS
BEGIN
 
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	DECLARE @quitDate   varchar(10);
	SET @quitdate = @in_month + '/01/' + @in_year;
  
	SELECT AAPAccountNo,AccountName,addr1 as Address,City,State ,AAPEffectiveDate,AAPQUitDate,MCQuitDate,MCEffectiveDate
	,ChainCode from pharmacymaster..v_PM_AllWithAffiliates
	WHERE  (mcquitdate is not null or 
	mceffectivedate is not null 
	or chaincode is not null) and (mcquitdate is null or mcquitdate >= @quitdate)
	and aapaccountno is not null

	ORDER BY mcquitdate


END










GO
