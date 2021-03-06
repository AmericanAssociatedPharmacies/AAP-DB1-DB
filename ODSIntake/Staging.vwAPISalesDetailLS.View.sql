USE [ODSIntake]
GO
/****** Object:  View [Staging].[vwAPISalesDetailLS]    Script Date: 12/22/2020 9:21:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [Staging].[vwAPISalesDetailLS]

AS

SELECT SBINV as InvNbr
	, SBLINE as InvLine				
	, SBITEM as ItemNo
	, SBITD1 as Item
	, SBXNDC as NDC
	, SBQSHP as Qty
	, SBPRIC as ItemAmt
	, SBCLS  as ItemGrp
	, SBDIV  AS AcctGrp
	, SBSMNO as Slsman				
	, SBQSHP * SBPRIC as LineAmt
	, SBQSHP * SBPRIC as ExtSales
	, SBDIV as IDPAGR		
	, TRY_CONVERT(DATETIME,SBINDT) AS InvDate	
	FROM [10.80.2.41].[S7810B60].R60FILES.VSADETL
GO
