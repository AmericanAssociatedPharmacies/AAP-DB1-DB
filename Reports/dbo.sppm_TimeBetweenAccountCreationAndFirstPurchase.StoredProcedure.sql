USE [Reports]
GO
/****** Object:  StoredProcedure [dbo].[sppm_TimeBetweenAccountCreationAndFirstPurchase]    Script Date: 12/22/2020 5:00:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<LeeAnn Carrell>
-- Create date: <5-11-2017>
-- Description:	<Called by SSRS report in Employee Portal. Shows all API Accounts,
-- their date opened, and the number of days between becoming a customer and making 
-- their first purchase.>
-- =============================================
CREATE PROCEDURE [dbo].[sppm_TimeBetweenAccountCreationAndFirstPurchase]
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    SELECT b.PMID, 
	b.AccountName, 
	b.APIAccountNo, 
	b.APIStatus, 
	b.Email,
	b.ACHEmail as FinancialEmail,
	b.DateOpened, 
	min(a.InvDate) as FirstPurchaseDate, 
	CASE 
		WHEN DATEDIFF("day", b.DateOpened, min(a.InvDate)) is null THEN 'No Purchases'
		ELSE STR(DATEDIFF("day", b.DateOpened, min(a.InvDate)))
	END as [Days Before First Purchase]
	FROM PharmacyMaster..v_PM_AllWithAffiliates b
	LEFT JOIN API..APISalesDetail a
	ON LEFT(WHAccountID,8) = LEFT(APIAccountNo,8) 
	WHERE (year(DateOpened) = 2009 and month(DateOpened) >= 09) or (year(DateOpened) > 2009) and 
		APIAccountNo is not null and APIAccountNo != '' and 
		APIAccountNo not like '%-%'
	GROUP BY b.PMID, AccountName, b.Email, b.ACHEmail, APIAccountNo, b.DateOpened, b.APIStatus
	--HAVING DATEDIFF("day", b.DateOpened, min(a.InvDate)) is null
	ORDER BY DATEDIFF("day", b.DateOpened, min(a.InvDate)), DateOpened

END
GO
