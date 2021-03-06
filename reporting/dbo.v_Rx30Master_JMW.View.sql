USE [reporting]
GO
/****** Object:  View [dbo].[v_Rx30Master_JMW]    Script Date: 12/22/2020 9:27:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_Rx30Master_JMW]
AS
SELECT     TOP (100) PERCENT dbo.Rx30Master.[Pharm ID], dbo.Rx30Master.[BIN Nbr], dbo.Rx30Master.PCN, dbo.Rx30Master.[Group Nbr], 
                      dbo.Rx30Master.Submitted, dbo.Rx30Master.[Rx Date], dbo.Rx30Master.[Qty Dispensed], dbo.Rx30Master.[Day Supply], dbo.Rx30Master.NDC, 
                      dbo.Rx30Master.[Fee Submitted], dbo.Rx30Master.[Cost Submitted], dbo.Rx30Master.[Fee Paid], dbo.Rx30Master.[Cost Paid], 
                      dbo.Rx30Master.[Plan Amount], dbo.Rx30Master.[Co Pay Amount], dbo.Rx30Master.[U and C], dbo.Rx30Master.[Total Price], dbo.Rx30Master.BS, 
                      dbo.Rx30Master.BR, dbo.Rx30Master.OI, dbo.Rx30Master.DAW, dbo.Rx30Master.[DAW Desc], dbo.Rx30Master.[Patient Paid], 
                      dbo.Rx30Master.[Gross Amt Due], dbo.Rx30Master.[Rej Code], dbo.Rx30Master.[Tx Response], dbo.RejectCodes.Description AS ResponseReason, 
                      dbo.BasisOfCost.Name AS BOC, FDB.dbo.RNDC14.LN60 AS DrugName, dbo.Rx30Master.[Rx Nbr], dbo.Rx30Master.PID AS RPH, 
                      dbo.Rx30Master.[Bill Code], dbo.Rx30Master.updatedon, FDB.dbo.RNDC14.GPI, FDB.dbo.RNDC14.NDCGI1, FDB.dbo.RNDC14.PS, 
                      FDB.dbo.RNP2_PIVOT.BB, dbo.Rx30Master.Doctor, dbo.Rx30Master.RxID, dbo.v_Stores.ACCT_NO, FDB.dbo.RNDC14.DF, 
                      FDB.dbo.RNDC14.HCFA_UNIT, FDB.dbo.RNDC14.GTI, FDB.dbo.RNDC14.CSP, FDB.dbo.RNDC14.GSI, FDB.dbo.RNDC14.GMI, 
                      FDB.dbo.RNDC14.GNI
FROM         dbo.Rx30Master LEFT OUTER JOIN
                      dbo.v_Stores ON dbo.Rx30Master.[Pharm ID] = dbo.v_Stores.NABP LEFT OUTER JOIN
                      FDB.dbo.RNP2_PIVOT ON dbo.Rx30Master.NDC = FDB.dbo.RNP2_PIVOT.ndc LEFT OUTER JOIN
                      FDB.dbo.RNDC14 ON dbo.Rx30Master.NDC = FDB.dbo.RNDC14.NDC LEFT OUTER JOIN
                      dbo.BasisOfCost ON dbo.Rx30Master.BS = dbo.BasisOfCost.ID LEFT OUTER JOIN
                      dbo.RejectCodes ON dbo.Rx30Master.[Rej Code] = dbo.RejectCodes.[Reject Code]
WHERE     (dbo.Rx30Master.[BIN Nbr] <> '') AND (FDB.dbo.RNDC14.LN60 IS NOT NULL) AND dbo.Rx30Master.[Tx Response] != 'R'
                     AND
                     (dbo.Rx30Master.Submitted =
                      (SELECT     MAX(Submitted) AS Expr1
                         FROM          dbo.Rx30Master AS Rx2
                        WHERE      (dbo.Rx30Master.[Rx Nbr] = [Rx Nbr]) AND ([BIN Nbr] <> '')))
GO
