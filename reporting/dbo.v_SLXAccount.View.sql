USE [reporting]
GO
/****** Object:  View [dbo].[v_SLXAccount]    Script Date: 12/22/2020 9:27:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_SLXAccount]
AS
SELECT     a.ACCOUNT, me.NCPDP, me.DEA, si.NPI_NUMBER, mms.UDACCTNO, aap.WHACCOUNTID, aap.AAPID, d.ADDRESS1, d.CITY, d.STATE, 
                      d.POSTALCODE, a.STATUS, a.TYPE, a.SUBTYPE, a.BUSINESSDESCRIPTION, a.MAINPHONE, a.FAX, me.TERRITORY, mmc.RXNETWORK, 
                      me.RXCOMPUTER, a.CREATEDATE, a.MODIFYDATE, a.ACCOUNTID, aap.APPLICATIONMEMSTATUS, aap.APPLICATIONWHSTATUS, 
                      aap.APPLICATIONMCSTATUS, aap.APPLICATIONMEMDATERECD, aap.APPLICATIONWHDATERECD, aap.APPLICATIONMEMDATECOMPLETE, 
                      aap.APPLICATIONMCDATEDSRECD, aap.AAPPREVIOUSGROUP, aap.APPLICATIONFEEPAID, aap.APPLICATIONWHDATECREDAPPVD, 
                      aap.APPLICATIONWHDATEACTIVATED, aap.WHPAYTERMS, aap.WHPAYMETHOD, aap.WHVOLUMEMONTHLY, aap.WHVOLUMEBRANDRX, 
                      aap.WHVOLUMEGENERICRX, aap.WHVOLUMEOTC, aap.WHCREDITLIMIT, aap.MCDATEEFFECTIVE, aap.MCPREVAFFILIATION, aap.AAPPARENTID, 
                      aap.APPLICATIONWHSTSTATUS, aap.APPLICATIONWHSTDATERECD, aap.APPLICATIONWHSTDATEACTIVE, aap.WHCREDITALERT, aap.WHMOT, 
                      aap.WHFREIGHTOPTION, aap.AAPWHPLANOGRAM, aap.WHCUSTOMERSTATUS, aap.APPLICATIONWHDATETOCREDIT, aap.WHORDERCUTOFF, 
                      si.MEDBPROVIDER, aap.QPS, CASE aap.applicationwhststatus WHEN 'complete' THEN 'Yes' ELSE NULL END AS ScanAndToss, 
                      aap.AAPWHPLANOGRAM AS Planogram, me.STORETYPE AS CHAINCODE, si.MCAFFILIATION,me.Category,aap.Conference2010,aap.Conference2011,aap.Conference2012,
					  aap.Conference2013,aap.OwnerType
FROM         MSSQLSERVER.saleslogix.sysdba.account AS a LEFT OUTER JOIN
                      MSSQLSERVER.saleslogix.sysdba.address AS d ON a.ADDRESSID = d.ADDRESSID LEFT OUTER JOIN
                      MSSQLSERVER.saleslogix.sysdba.maximizer_extension AS me ON a.ACCOUNTID = me.ACCOUNTID LEFT OUTER JOIN
                      MSSQLSERVER.saleslogix.sysdba.storeidentifier AS si ON a.ACCOUNTID = si.ACCOUNTID LEFT OUTER JOIN
                      MSSQLSERVER.saleslogix.sysdba.maximizermemserv AS mms ON a.ACCOUNTID = mms.ACCOUNTID LEFT OUTER JOIN
                      MSSQLSERVER.saleslogix.sysdba.maximizermanagedcare AS mmc ON a.ACCOUNTID = mmc.ACCOUNTID LEFT OUTER JOIN
                      MSSQLSERVER.saleslogix.sysdba.accountaap AS aap ON a.ACCOUNTID = aap.ACCOUNTID
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[41] 4[32] 2[8] 3) )"
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
         Begin Table = "a"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 121
               Right = 256
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "d"
            Begin Extent = 
               Top = 6
               Left = 294
               Bottom = 121
               Right = 446
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "me"
            Begin Extent = 
               Top = 126
               Left = 38
               Bottom = 241
               Right = 247
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "si"
            Begin Extent = 
               Top = 126
               Left = 285
               Bottom = 241
               Right = 454
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "mms"
            Begin Extent = 
               Top = 246
               Left = 38
               Bottom = 361
               Right = 229
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "mmc"
            Begin Extent = 
               Top = 246
               Left = 267
               Bottom = 361
               Right = 460
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "aap"
            Begin Extent = 
               Top = 366
               Left = 38
               Bottom = 481
               Right = 288
            End
            DisplayFlags = 280
            TopColumn = 0
        ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_SLXAccount'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N' End
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
         Column = 4215
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_SLXAccount'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_SLXAccount'
GO
