USE [Purchases]
GO
/****** Object:  StoredProcedure [dbo].[spClint_CHPHAAP]    Script Date: 12/22/2020 4:55:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[spClint_CHPHAAP]
@pmid int,
@dt_from datetime,
@dt_to datetime
as
SELECT    MIN(c.NDC) as NDC, 
MIN(purchases.dbo.fnParseCHPHDescription(ITEM_DESCR,1)) as ITEM_DESCR,
MIN(f.PS) as FDB_PKG_SIZE,
 SUM(SHIP_QTY) as SHIP_QTY, MIN(UNIT_COST) as Unit_Cost, SUM(EXT_COST) as Ext_Cost
from purchases..CHPH_AAP c
left join FDB..RNDC14 f on c.NDC=f.NDC
where ITEM_TYPE = 'RX' AND SHIP_QTY > 0 AND INV_DATE >= @dt_from and INV_DATE < @dt_to
and PMID=@pmid
GROUP BY c.NDC

GO
