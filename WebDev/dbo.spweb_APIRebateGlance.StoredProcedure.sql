USE [WebDev]
GO
/****** Object:  StoredProcedure [dbo].[spweb_APIRebateGlance]    Script Date: 12/22/2020 5:21:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<LeeAnn Carrell>
-- Create date: <05-23-2017>
-- Description:	<Used to populate website with daily API rebates>
-- =============================================
CREATE PROCEDURE [dbo].[spweb_APIRebateGlance]
	-- Add the parameters for the stored procedure here
	@apiaccountno varchar(8)
AS
BEGIN
	SET NOCOUNT ON;

    SELECT CONVERT(VARCHAR(10), invdate, 101) as [Invoice Date],
		'$' + RTRIM(LTRIM(str(SUM(ExtSales),18,2))) as [API Generic $],
		'$' + RTRIM(LTRIM(str(SUM(FinalRebateAmount),18,2))) as [Rebate $*],
		RTRIM(LTRIM(str(((SUM(FinalRebateAmount) / SUM(ExtSales))*100),18,2))) + '%' as [Rebate %*]
	FROM API..APISalesDetail
	WHERE invdate = (SELECT max(InvDate) FROM API..APISalesDetail)
		AND Type = 'Generic'
		AND WHAccountID = @apiaccountno
	GROUP BY invdate, WHAccountID

END

GO
