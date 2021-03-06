USE [Purchases]
GO
/****** Object:  StoredProcedure [dbo].[spCardComAll]    Script Date: 12/22/2020 4:55:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[spCardComAll]	
		
as

Begin

	SET NOCOUNT ON;

	DECLARE @dt_from datetime
	DECLARE	@dt_to datetime


	

	set @dt_from = Convert(char(10),DATEADD(dd,-(DAY(DATEADD(mm,1,getdate()))-1),DATEADD(mm,-1,getdate())),101) --First day of previous month
	set @dt_to = DATEADD(mm, DATEDIFF(mm,0,getdate()), 0) --First day of this month


	SELECT 
	c.NDC,
	MIN(purchases.dbo.fnParseCHPHDescription(ITEM_DESCR,1)) as Description,
	MIN(f.PS) as SIZE, 
	SUM(SHIP_QTY) as [SHIP QTY], 
	Unit_Cost as [CAH Cost], 
	SUM(Ext_Cost)as [Ext Cost],	
	MIN([API ITEM]) as [API ITEM],
	MIN([API PRICE]) as [API Cost],
	(MIN([API PRICE])  * SUM(SHIP_QTY)) as [API Ext] ,
	MIN([Adj Rebate]) as [API Rebate]
	from purchases..CHPH_AAP c
	left join purchases..v_CARDINALCOMPLETE ON c.ITEM_NO = v_CardinalComplete.CARDINALITEMNUMBER 
	left join Medispan..v_DrugMaster f on c.NDC=f.NDC
	where purchases.dbo.fnParseCHPHDescription(ITEM_DESCR,1) NOT LIKE 'OLANZAPINE%' AND PMID IS NOT NULL AND [API ITEM ] IS NOT NULL AND [API ITEM ] <> '0' AND ITEM_TYPE = 'RX' AND SHIP_QTY > 0 AND INV_DATE >= @dt_from and INV_DATE < @dt_to
	AND Brand='N' AND (Ext_Cost IS NOT NULL AND Ext_Cost <> '' AND Ext_Cost <> 0)
	GROUP BY c.NDC,Unit_Cost
	HAVING (((SUM(Ext_Cost)- (MIN([API PRICE]) * SUM(SHIP_QTY)))/SUM(Ext_Cost)) * 100) < 50
End

GO
