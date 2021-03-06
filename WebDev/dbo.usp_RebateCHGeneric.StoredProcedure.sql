USE [WebDev]
GO
/****** Object:  StoredProcedure [dbo].[usp_RebateCHGeneric]    Script Date: 12/22/2020 5:21:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_RebateCHGeneric]
	-- Add the parameters for the stored procedure here
	@PMIDList varchar(255)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	declare @leader float
--declare @msi float
declare @checkfee float
declare @ncpa float
 
--todo: last leader rebate in 2015, may no longer need included/excluded
select @leader = 
sum(isnull(leaderrebate,0.0)) from 
pharmacymaster..PM_Rebates_CHAAP
--where pmid= @PMID
where pmid in (select * from ufn_CommaListToTable(@PMIDList))
and [date] in (select distinct top 4 [date] from pharmacymaster..PM_Rebates_CHAAP order by [date] desc)

select @checkfee = 
sum(isnull([check fee],0.0)) from 
pharmacymaster..PM_Rebates_CHAAP
where pmid in (select * from ufn_CommaListToTable(@PMIDList))
and [date] in (select distinct top 4 [date] from pharmacymaster..PM_Rebates_CHAAP order by [date] desc)

select @ncpa = 
sum(isnull(NCPAMembershipFee,0.0)) from 
pharmacymaster..PM_Rebates_CHAAP
where pmid in (select * from ufn_CommaListToTable(@PMIDList))
and [date] in (select distinct top 4 [date] from pharmacymaster..PM_Rebates_CHAAP order by [date] desc)


	select top 4
	[date] as [RebateDate],
	[SourceGenericSales] as [GenericSales],
	[GenericRebate] as [GenericRebateAmount],
	[EffRebatePerc] as [RebatePercent],
	[HRTA] as [HRTAPercent],
	[msirebate] as [MSIRebate],
	[leaderrebate] as [LeaderRebate],
	isnull([PriceProtectionRebate],0.0) as [PriceProtection],
	[check fee] as [CheckFee],	
	([NCPAMembershipFee]* -1) as [NCPAFee],	
	[AretePerformanceRebate] as [AreteRebate],
	[COGRebate] as [Other],
	[PayToStore] as [Total]	
	,(select top 1 PaymentDate from  pharmacymaster..pm_rebates_paymentdates d where d.RebateMonth=[date] and RebateType='CH') as [PaymentDate]
	into #tempCHGeneric
	from
	pharmacymaster..PM_Rebates_CHAAP
	--where pmid=@PMID
	where pmid in (select * from ufn_CommaListToTable(@PMIDList))
	order by [date] desc
	
IF @checkfee = 0.0
	begin
	ALTER TABLE #tempCHGeneric DROP COLUMN [CheckFee]
	end
if  @leader = 0.0
	begin
	ALTER TABLE #tempCHGeneric DROP COLUMN [LeaderRebate]
	end
if  @ncpa = 0.0
	begin
	ALTER TABLE #tempCHGeneric DROP COLUMN [NCPAFee]
	end
select *
from #tempCHGeneric
END
GO
