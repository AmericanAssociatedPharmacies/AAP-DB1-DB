USE [WebDev]
GO
/****** Object:  StoredProcedure [dbo].[usp_RebatePreferredPartner]    Script Date: 12/22/2020 5:21:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_RebatePreferredPartner]
	-- Add the parameters for the stored procedure here
	@PMID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select
top 2 --limits to 6 mos for quarterly
Period as [RebateFor]
,CASE WHEN Affiliate = 'PIPCO' THEN isnull([PaymentAmt],0.0)
	ELSE (isnull([Paid To Store],0.0)+isnull([Paid To Affiliate],0.0))
	END as [RebateAmount]
from pharmacymaster..pm_rebates_ppartner
where pmid=@PMID
order by period desc
END
GO
