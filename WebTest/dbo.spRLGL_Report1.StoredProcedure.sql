USE [WebTest]
GO
/****** Object:  StoredProcedure [dbo].[spRLGL_Report1]    Script Date: 12/22/2020 5:26:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



/* =============================================
-- Author:		BG
-- Create date: 10/08/14
-- based on spRLGL_Calculate3, extended to segregate claims from Rx30Latest 
-- which have losses BEFORE rebates, and calculate the loss AFTER rebate
-- spRLGL_Calculate3:
-- revised 5/14/14 BG to extend price checks to last 6 months
-- Description:	Red Light Green Light
-- ============================================= */
CREATE PROCEDURE [dbo].[spRLGL_Report1]

	
AS
	BEGIN

		SET NOCOUNT ON;
		--drop table tmp_RLGLReport2_100814
		--go
		select
		*
		into tmp_RLGLReport2_100814
		from
		(
		select
		case when (LossGross > 0) then 1 else 0 end as UPC
		,case when (LossNet > 0) then 'R' else 'G' end as RLGL
		,*
		from
		(
		select 
		(dbo.fnMinValueFloat(APIGrossPerUnit,CAHGrossPerUnit) * [Qty Dispensed]) - ([Total Price]-[Fee Paid] ) as LossGross
		,(dbo.fnMinValueFloat(APINetPerUnit,CAHNetPerUnit) * [Qty Dispensed]) - ([Total Price]-[Fee Paid] ) as LossNet
		,*
		from
		(
		select 
		--top 10
		'test' as test
		,(select top 1 ISNULL(PricePerUnit,0) from Purchases.dbo.v_APIRebatesWeekly WHERE NDC=r.ndc 
			and dateloaded <= r.[rx date] order by dateloaded desc) as APIGrossPerUnit
		,(select top 1 ISNULL(NetPerUnit,0) from Purchases.dbo.v_APIRebatesWeekly WHERE NDC=r.ndc 
			and dateloaded <= r.[rx date] order by dateloaded desc) as APINetPerUnit
		,dbo.fnRLGL_CAHPrice([Pharm ID],[NDC],[Rx Date],0) as CAHGrossPerUnit
		,dbo.fnRLGL_CAHPrice([Pharm ID],[NDC],[Rx Date],1) as CAHNetPerUnit		
		,r.*
		from Webdev.dbo.Rx30Latest r
		) dt
		where dbo.fnMinValueFloat(APINetPerUnit,CAHNetPerUnit) is not null
		and dbo.fnMinValueFloat(APINetPerUnit,CAHNetPerUnit) is not null
		) dt2
		) dt3
		where UPC = 1

END					

			
/*
spRLGL_Report1
--5:21 with 1000 rows, output 118 where UPC=1

select count(1) from Rx30Latest
--3387712
where [rx date] > '7/1/2014'
--3387712
--8/1 2301417
--9/1 1305417
select * from tmp_RLGLReport2_100814

select distinct [pharm id] from rx30latest
--420
*/










GO
