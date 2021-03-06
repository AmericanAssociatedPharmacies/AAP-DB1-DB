USE [ShipmentInfo]
GO
/****** Object:  View [dbo].[Z30UPSQ]    Script Date: 12/22/2020 9:35:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Z30UPSQ]
AS
SELECT        dbo.Z3OUPS.UPPCKN, dbo.Z3OUPS.UPCUNO, dbo.Z3OUPS.UPINVN, dbo.Z3OUPS.UPORNO, dbo.Z3OUPS.UPNAME, dbo.Z3OUPS.UPADR1, dbo.Z3OUPS.UPADR2, 
                         dbo.Z3OUPS.UPADR3, dbo.Z3OUPS.UPCITY, dbo.Z3OUPS.UPSPCD, dbo.Z3OUPS.UPPOCD, dbo.Z3OUPS.UPCOUN, dbo.Z3OUPS.UPMOTC, dbo.Z3OUPS.UPQVN, 
                         dbo.Z3OUPS.UPQVCT, dbo.Z3OUPS.UPCONT, dbo.Z3OUPS.UPPCKT, dbo.Z3OUPS.UPTWGT, dbo.Z3OUPS.UPTVOL, LOWER(dbo.EmailAddress.NFPHNO) 
                         AS UPCMAD, dbo.PhoneNumber.NFPHNO AS UPCPHO, dbo.BoxData.PTHIGH AS PKGH, dbo.BoxData.PTLENG AS PKGL, dbo.BoxData.PTWIDT AS PKGW, 
                         dbo.BoxData.PTPCKT
FROM            dbo.Z3OUPS LEFT OUTER JOIN
                         dbo.BoxData ON dbo.Z3OUPS.UPPCKT = dbo.BoxData.PTPCKT LEFT OUTER JOIN
                         dbo.EmailAddress ON dbo.Z3OUPS.UPCUNO = dbo.EmailAddress.NFNANO LEFT OUTER JOIN
                         dbo.PhoneNumber ON dbo.Z3OUPS.UPCUNO = dbo.PhoneNumber.NFNANO
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
         Begin Table = "Z3OUPS"
            Begin Extent = 
               Top = 8
               Left = 362
               Bottom = 336
               Right = 532
            End
            DisplayFlags = 280
            TopColumn = 6
         End
         Begin Table = "BoxData"
            Begin Extent = 
               Top = 29
               Left = 45
               Bottom = 328
               Right = 191
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "EmailAddress"
            Begin Extent = 
               Top = 10
               Left = 985
               Bottom = 319
               Right = 1155
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "PhoneNumber"
            Begin Extent = 
               Top = 105
               Left = 649
               Bottom = 426
               Right = 819
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
      Begin ColumnWidths = 9
         Width = 284
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
         Column = 3420
         Alias = 900
         Table = 1815
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
   ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Z30UPSQ'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'   End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Z30UPSQ'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Z30UPSQ'
GO
