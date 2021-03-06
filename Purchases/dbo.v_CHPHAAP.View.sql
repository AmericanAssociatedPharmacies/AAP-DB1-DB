USE [Purchases]
GO
/****** Object:  View [dbo].[v_CHPHAAP]    Script Date: 12/22/2020 9:26:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_CHPHAAP]
AS
SELECT     dbo.CHPH_AAP.ID, dbo.CHPH_AAP.DC, dbo.CHPH_AAP.CUSTOMER_NAME, dbo.CHPH_AAP.CUSTOMER_NO, dbo.CHPH_AAP.ITEM_NO, 
                      dbo.CHPH_AAP.PMID, dbo.CHPH_AAP.STORE, dbo.CHPH_AAP.NDC, dbo.CHPH_AAP.ITEM_TYPE, dbo.CHPH_AAP.ITEM_DESCR, 
                      dbo.CHPH_AAP.GENERIC_NAME, dbo.CHPH_AAP.TRADE_NAME, dbo.CHPH_AAP.INV_DATE, dbo.CHPH_AAP.INVOICE_NO, dbo.CHPH_AAP.TYPE, 
                      dbo.CHPH_AAP.ORDER_QTY, dbo.CHPH_AAP.SHIP_QTY, dbo.CHPH_AAP.UNIT_COST, dbo.CHPH_AAP.EXT_COST, dbo.CHPH_AAP.CORP_AWP, 
                      dbo.CHPH_AAP.WAC, dbo.CHPH_AAP.VENDOR_NAME, dbo.CHPH_AAP.UPC, dbo.CHPH_AAP.CONTRACT_FLAG, dbo.CHPH_AAP.BRAND, 
                      dbo.CHPH_AAP.GENERIC_CODE, dbo.CHPH_AAP.STRENGTH, dbo.CHPH_AAP.SHORT_CODE, dbo.CHPH_AAP.ENCODING, dbo.CHPH_AAP.ContractNo, 
                      dbo.CHPH_AAP.ContractDesc, dbo.CHPH_AAP.MM_DD_YY_LOAD, claims.dbo.fud_fdb2typefull(FDB.dbo.RNDC14.GNI, FDB.dbo.RNDC14.NDCGI1) 
                      AS DrugType
FROM         dbo.CHPH_AAP LEFT OUTER JOIN
                      FDB.dbo.RNDC14 ON dbo.CHPH_AAP.NDC = FDB.dbo.RNDC14.NDC
WHERE     (claims.dbo.fud_fdb2typefull(FDB.dbo.RNDC14.GNI, FDB.dbo.RNDC14.NDCGI1) <> 'MULTI-SOURCE GENERIC')
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[42] 4[20] 2[19] 3) )"
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
         Begin Table = "CHPH_AAP"
            Begin Extent = 
               Top = 89
               Left = 119
               Bottom = 371
               Right = 310
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "RNDC14 (FDB.dbo)"
            Begin Extent = 
               Top = 86
               Left = 412
               Bottom = 350
               Right = 615
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
      Begin ColumnWidths = 11
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 6945
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_CHPHAAP'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_CHPHAAP'
GO
