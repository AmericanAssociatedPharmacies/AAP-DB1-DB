USE [reporting]
GO
/****** Object:  View [dbo].[v_Rx30MasterClaims]    Script Date: 12/22/2020 9:27:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_Rx30MasterClaims]
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
                      FDB.dbo.RNDC14.HCFA_UNIT, FDB.dbo.RNDC14.GTI, FDB.dbo.RNDC14.CSP, FDB.dbo.RNDC14.GSI, FDB.dbo.RNDC14.GMI, FDB.dbo.RNDC14.GNI, 
                      dbo.Rx30Master.RfNbr
FROM         dbo.Rx30Master LEFT OUTER JOIN
                      dbo.v_Stores ON dbo.Rx30Master.[Pharm ID] = dbo.v_Stores.NABP LEFT OUTER JOIN
                      FDB.dbo.RNP2_PIVOT ON dbo.Rx30Master.NDC = FDB.dbo.RNP2_PIVOT.ndc LEFT OUTER JOIN
                      FDB.dbo.RNDC14 ON dbo.Rx30Master.NDC = FDB.dbo.RNDC14.NDC LEFT OUTER JOIN
                      dbo.BasisOfCost ON dbo.Rx30Master.BS = dbo.BasisOfCost.ID LEFT OUTER JOIN
                      dbo.RejectCodes ON dbo.Rx30Master.[Rej Code] = dbo.RejectCodes.[Reject Code]
WHERE     (dbo.Rx30Master.[BIN Nbr] <> '') AND (FDB.dbo.RNDC14.LN60 IS NOT NULL) AND (dbo.Rx30Master.Submitted =
                          (SELECT     MAX(Submitted) AS Expr1
                            FROM          dbo.Rx30Master AS Rx2
                            WHERE      (dbo.Rx30Master.RfNbr = RfNbr) AND (dbo.Rx30Master.[Rx Nbr] = [Rx Nbr]) AND ([BIN Nbr] <> '')))
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Rx30Master"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 121
               Right = 211
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "v_Stores"
            Begin Extent = 
               Top = 6
               Left = 249
               Bottom = 121
               Right = 401
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "RNP2_PIVOT (FDB.dbo)"
            Begin Extent = 
               Top = 6
               Left = 439
               Bottom = 121
               Right = 591
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "RNDC14 (FDB.dbo)"
            Begin Extent = 
               Top = 6
               Left = 629
               Bottom = 121
               Right = 781
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "BasisOfCost"
            Begin Extent = 
               Top = 6
               Left = 819
               Bottom = 91
               Right = 971
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "RejectCodes"
            Begin Extent = 
               Top = 6
               Left = 1009
               Bottom = 91
               Right = 1161
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Co' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_Rx30MasterClaims'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'lumn = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_Rx30MasterClaims'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_Rx30MasterClaims'
GO
