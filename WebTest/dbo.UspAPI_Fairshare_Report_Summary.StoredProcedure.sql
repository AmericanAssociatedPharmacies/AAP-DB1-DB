USE [WebTest]
GO
/****** Object:  StoredProcedure [dbo].[UspAPI_Fairshare_Report_Summary]    Script Date: 12/22/2020 5:26:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[UspAPI_Fairshare_Report_Summary]
	-- Add the parameters for the stored procedure here
		@EndDate DATETIME2
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT dt.*, p.pmid, p.accountname as [AccountName] , p.city as [City], p.state as [State], p.Territory 
	FROM
	(
		SELECT custnum AS CustNum, COUNT(prodnum) as Products, SUM([RequestedQty]) as [RequestedQty], sum([RequestedQty] * Price) as ExtendedPrice
		FROM webdev..FairShareProgram f 
		WHERE [RequestedQty] > 0 AND [EndDate] = @EndDate
		GROUP BY custnum
	) dt
	LEFT JOIN pharmacymaster..v_pm_pharmacy p on p.apiaccountno = dt.custnum
	ORDER BY custnum
	END
GO
