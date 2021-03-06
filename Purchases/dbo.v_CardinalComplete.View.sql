USE [Purchases]
GO
/****** Object:  View [dbo].[v_CardinalComplete]    Script Date: 12/22/2020 9:26:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE VIEW [dbo].[v_CardinalComplete]

AS

SELECT DISTINCT dbo.CardinalComplete.CARDINALITEMNUMBER
, dbo.CardinalComplete.UNITPRODUCT
, dbo.CardinalComplete.SCANNEDUNITPRODUCTCODE
, dbo.CardinalComplete.NDC
, dbo.CardinalComplete.RXOTCFLAG
, dbo.CardinalComplete.BRANDNAME
, dbo.CardinalComplete.GENERICPRODUCTDESCRIPTION
, dbo.CardinalComplete.AWP
, dbo.CardinalComplete.CONTRACTPRICE
, dbo.CardinalComplete.INVOICEPRICE
, dbo.CardinalComplete.BASEPRICE
, dbo.CardinalComplete.RETAILPRICE
, dbo.CardinalComplete.FORM
, dbo.CardinalComplete.STRENGTH
, dbo.CardinalComplete.SIZE
, dbo.CardinalComplete.UNITOFMEASURE
, dbo.CardinalComplete.VENDORNAME
, dbo.CardinalComplete.ACCUNETSIZE
, dbo.CardinalComplete.CASEQUANTITY
, dbo.CardinalComplete.PACKQUANTITY
, dbo.CardinalComplete.UNITSIZE
, dbo.CardinalComplete.DISPENSEQUANTITY
, dbo.CardinalComplete.THERAPEUTICCLASSCODE
, dbo.CardinalComplete.CONTRACTNUMBER
, dbo.CardinalComplete.CONTRACTNAME
, dbo.CardinalComplete.CONTRACTSTARTDATE
, dbo.CardinalComplete.CONTRACTENDDATE
, dbo.CardinalComplete.INVOICEPRICECHANGEDATE
, dbo.CardinalComplete.BASEPRICECHANGEDATE
, dbo.CardinalComplete.FINELINECODE
, dbo.CardinalComplete.PREVIOUSINVOICEPRICE
, dbo.CardinalComplete.CCAHEADER
, dbo.CardinalComplete.GENERICCODE
, dbo.CardinalComplete.GPPCCODE
, dbo.CardinalComplete.GPI
, dbo.CardinalComplete.API_Size
, dbo.CardinalComplete.[API ITEM]
, dbo.CardinalComplete.[API PRICE]
, ISNULL(TRY_CAST(dbo.CardinalComplete.[Adj Rebate] AS numeric(10, 3)),0.00) AS [Adj Rebate]
, ISNULL(dbo.v_APIPrice_mostrecent2.NDC, 'N\A') AS APINDC
FROM dbo.CardinalComplete 
LEFT OUTER JOIN dbo.v_APIPrice_mostrecent2 ON dbo.CardinalComplete.[API ITEM] = dbo.v_APIPrice_mostrecent2.APIItemNbr
WHERE dbo.CardinalComplete.[API ITEM] LIKE '%[a-zA-Z0-9]%' 








GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[46] 4[12] 2[31] 3) )"
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
         Begin Table = "CardinalComplete"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 307
               Right = 503
            End
            DisplayFlags = 280
            TopColumn = 23
         End
         Begin Table = "v_APIPrice_mostrecent2"
            Begin Extent = 
               Top = 21
               Left = 610
               Bottom = 238
               Right = 1059
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
      Begin ColumnWidths = 40
         Width = 284
         Width = 2385
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
         Column = 4635
         Alias = 1815
         Table = 1170
         Output = 720
        ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_CardinalComplete'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N' Append = 1400
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_CardinalComplete'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_CardinalComplete'
GO
