USE [WebDev]
GO
/****** Object:  StoredProcedure [dbo].[usp_RebatePlanogram]    Script Date: 12/22/2020 5:21:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_RebatePlanogram]
	-- Add the parameters for the stored procedure here
	@PMID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select 
top 1
[Year],
[PlanOGramRebate] as [RebateAmount]
from
PharmacyMaster..PM_AnnualRebates
where pmid=@PMID
order by [Year] desc
END
GO
