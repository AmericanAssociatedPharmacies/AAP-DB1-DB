USE [reporting]
GO
/****** Object:  View [dbo].[v_SLXAccount_PMID]    Script Date: 12/22/2020 9:27:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_SLXAccount_PMID]
AS
SELECT     p.PMID, s.ACCOUNT, s.NCPDP, s.DEA, s.NPI_NUMBER, s.UDACCTNO, s.WHACCOUNTID, s.AAPID, s.ADDRESS1, s.CITY, s.STATE, s.POSTALCODE, 
                      s.STATUS, s.TYPE, s.SUBTYPE, s.BUSINESSDESCRIPTION, s.MAINPHONE, s.FAX, s.TERRITORY, s.RXNETWORK, s.RXCOMPUTER, s.CREATEDATE, 
                      s.MODIFYDATE, s.ACCOUNTID, s.APPLICATIONMEMSTATUS, s.APPLICATIONWHSTATUS, s.APPLICATIONMCSTATUS, s.APPLICATIONMEMDATERECD, 
                      s.APPLICATIONWHDATERECD, s.APPLICATIONMEMDATECOMPLETE, s.APPLICATIONMCDATEDSRECD, s.AAPPREVIOUSGROUP, 
                      s.APPLICATIONFEEPAID, s.APPLICATIONWHDATECREDAPPVD, s.APPLICATIONWHDATEACTIVATED, s.WHPAYTERMS, s.WHPAYMETHOD, 
                      s.WHVOLUMEMONTHLY, s.WHVOLUMEBRANDRX, s.WHVOLUMEGENERICRX, s.WHVOLUMEOTC, s.WHCREDITLIMIT, s.MCDATEEFFECTIVE, 
                      s.MCPREVAFFILIATION, s.AAPPARENTID, s.APPLICATIONWHSTSTATUS, s.APPLICATIONWHSTDATEACTIVE, s.WHCREDITALERT, s.WHMOT, 
                      s.WHFREIGHTOPTION, s.AAPWHPLANOGRAM, s.WHCUSTOMERSTATUS, s.APPLICATIONWHDATETOCREDIT, s.WHORDERCUTOFF, 
                      s.MEDBPROVIDER, s.QPS, s.ScanAndToss, s.Planogram, s.CHAINCODE, s.MCAFFILIATION, s.CATEGORY, s.OwnerType
FROM         dbo.v_SLXAccount AS s LEFT OUTER JOIN
                       PharmacyMaster.dbo.PM_Pharmacy AS p ON 
					   (s.DEA != '' AND s.DEA IS NOT NULL AND s.DEA = p.DEA )
                       OR (  s.AAPID != '' AND  s.AAPID IS NOT NULL AND  s.AAPID = p.AAPAccountNo )
                       OR ( s.WHACCOUNTID != '' AND s.WHACCOUNTID IS NOT NULL AND s.WHACCOUNTID = p.APIAccountNo )                  
                       OR ( s.NCPDP != '' AND s.NCPDP IS NOT NULL AND s.NCPDP = p.NCPDP )
                   --  OR ( s.UDACCTNO != '' AND s.UDACCTNO IS NOT NULL AND s.UDACCTNO = p.UDAccountNo )
WHERE     (s.TYPE <> 'Prospect')
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[23] 4[15] 2[44] 3) )"
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
         Begin Table = "p"
            Begin Extent = 
               Top = 126
               Left = 38
               Bottom = 241
               Right = 262
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "s"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 121
               Right = 288
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
         Column = 4275
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_SLXAccount_PMID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_SLXAccount_PMID'
GO
