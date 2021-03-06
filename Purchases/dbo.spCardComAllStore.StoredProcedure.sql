USE [Purchases]
GO
/****** Object:  StoredProcedure [dbo].[spCardComAllStore]    Script Date: 12/22/2020 4:55:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[spCardComAllStore]	
		
as

Begin

	SET NOCOUNT ON;

	DECLARE @dt_from datetime
	DECLARE	@dt_to datetime
	

	set @dt_from = Convert(char(10),DATEADD(dd,-(DAY(DATEADD(mm,1,getdate()))-1),DATEADD(mm,-1,getdate())),101) --First day of previous month
	set @dt_to = DATEADD(mm, DATEDIFF(mm,0,getdate()), 0) --First day of this month


	SELECT 	
	c.PMID,
	p.AccountName,
	MIN(p.TM) as TM,
	SUM(SHIP_QTY) as [SHIP QTY], 
	Cast(SUM(Unit_Cost) as numeric(18,2)) as [CAH Cost], 
	Cast(SUM(Ext_Cost) as numeric(18,2)) as [Ext Cost],	
	MIN(Rebate) as [CAHRebate%],
    Cast(((SUM(Ext_Cost)) * (MIN(Rebate)*.01))as numeric(18,2)) as [CAH Rebate],
	Cast((SUM(Ext_Cost)) - ((SUM(Ext_Cost)) * (MIN(Rebate)*.01)) as numeric(18,2)) as CAHNetCost,
	Cast(SUM([API PRICE])as numeric(18,2)) as [API Cost],
	Cast(SUM([API PRICE]  * SHIP_QTY) as numeric(18,2)) as [API Ext],
	Cast(SUM([Adj Rebate]) as numeric(18,2)) as [API Rebate],
	Cast(SUM([API PRICE] * SHIP_QTY) - SUM([Adj Rebate]) as numeric(18,2)) as APINetCost,
	Cast(((SUM(Ext_Cost)) - ((SUM(Ext_Cost)) * (MIN(Rebate)*.01))) - (SUM([API PRICE] * SHIP_QTY) - SUM([Adj Rebate])) as numeric(18,2)) as TotalSavings
	from purchases..CHPH_AAP c
	left join purchases..v_CARDINALCOMPLETE ON c.ITEM_NO = v_CardinalComplete.CARDINALITEMNUMBER	
	left join PharmacyMaster..v_PM_AllWithAffiliates p ON c.PMID = p.PMID
	left join PharmacyMaster..v_cahrebatesall  ON c.PMID = v_cahrebatesall.PMID
	where c.PMID IS NOT NULL AND [API ITEM ] IS NOT NULL AND [API ITEM ] <> '0' AND ITEM_TYPE = 'RX' AND SHIP_QTY > 0 AND INV_DATE >= @dt_from and INV_DATE < @dt_to
	AND Brand='N' AND (Ext_Cost IS NOT NULL AND Ext_Cost <> '' AND Ext_Cost <> 0)
	GROUP BY c.PMID,p.AccountName
	ORDER BY ((SUM(Ext_Cost)) - ((SUM(Ext_Cost)) * (MIN(Rebate)*.01))) - (SUM([API PRICE] * SHIP_QTY) - SUM([Adj Rebate])) DESC
	--HAVING (((SUM(Ext_Cost)- (MIN([API PRICE]) * SUM(SHIP_QTY)))/SUM(Ext_Cost)) * 100) < 50

End

GO
