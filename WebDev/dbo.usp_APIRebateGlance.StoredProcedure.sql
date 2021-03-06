USE [WebDev]
GO
/****** Object:  StoredProcedure [dbo].[usp_APIRebateGlance]    Script Date: 12/22/2020 5:21:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:		<LeeAnn Carrell>
-- Create date: <05-23-2017>
-- Description:	<Used to populate website with daily API rebates>
-- =============================================
CREATE PROCEDURE [dbo].[usp_APIRebateGlance]
	-- Add the parameters for the stored procedure here
	@apiaccountno varchar(8)
AS
BEGIN
	SET NOCOUNT ON;

    SELECT CONVERT(VARCHAR(10), invdate, 101) as [InvoiceDate],
		'$' + RTRIM(LTRIM(str(SUM(ExtSales),18,2))) as [APIGenericAmount],
		'$' + RTRIM(LTRIM(str((SUM(FinalRebateAmount))))) as [RebateAmount],
		RTRIM(LTRIM(str((((SUM(FinalRebateAmount)) / NULLIF(SUM(ExtSales),0))*100),18,2))) + '%' as [RebatePercentage]
		--'$' + RTRIM(LTRIM(str((SUM(Rebate) - 0.035 * SUM([Rebate])),18,2))) as [RebateAmount],
		--RTRIM(LTRIM(str((((SUM(Rebate) - 0.035 * SUM([Rebate])) / SUM(ExtSales))*100),18,2))) + '%' as [RebatePercentage]
	FROM API.dbo.APISalesDetail
	WHERE invdate = (SELECT max(InvDate) FROM API.dbo.APISalesDetail)
		AND Type = 'Generic'
		AND WHAccountID = @apiaccountno
	GROUP BY invdate, WHAccountID

END


GO
