USE [WebDev]
GO
/****** Object:  View [dbo].[v_CA_DataForInfoWorks]    Script Date: 12/22/2020 9:41:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_CA_DataForInfoWorks]
AS
	SELECT 
		CASE WHEN a.ComplianceOfficer IS NULL OR a.ComplianceOfficer = '' OR a.ComplianceOfficer = 'NULL' THEN b.ComplianceOfficer ELSE a.ComplianceOfficer END AS [Authorized User],
		c.Software AS [Authorized Platform],
		s.NCPDP,
		s.[AccountName] AS [Authorized Site],
		s.[City],
		s.[State]
	FROM [dbo].[v_CA_StoreStatus] AS s
		LEFT OUTER JOIN (SELECT NCPDP, [Compliance Officer] AS ComplianceOfficer FROM (SELECT *, ROW_NUMBER() OVER (PARTITION BY NCPDP ORDER BY NCPDP DESC) as rn FROM [WebDev].[dbo].[CA_Temp_ComplianceOfficerFromPRS]) AS a WHERE rn = 1) AS a
			ON a.NCPDP = s.NCPDP
		LEFT OUTER JOIN (SELECT NCPDP, CASE WHEN ComplianceOfficer = '' OR ComplianceOfficer IS NULL OR ComplianceOfficer LIKE '%same%' or ComplianceOfficer LIKE '%above%' THEN Attestor ELSE ComplianceOfficer END AS ComplianceOfficer FROM (SELECT NCPDP, Attestor, ComplianceOfficer, ROW_NUMBER() OVER (PARTITION BY NCPDP ORDER BY Date DESC) AS rn FROM [WebDev].[dbo].[CGAttestations]) as a WHERE rn = 1) AS b
			ON b.NCPDP = s.NCPDP
		LEFT OUTER JOIN (SELECT p.PMID, p.NCPDP, s.Software FROM [PharmacyMaster].[dbo].[v_PM_AllWithAffiliates] as p LEFT OUTER JOIN [PharmacyMaster].[dbo].[software] as s ON p.ComputerSoftware = s.ID) as c
			ON c.PMID = s.PMID
	WHERE
		s.IsStoreComplianceGuardian = 1 
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[41] 4[20] 2[20] 3) )"
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
         Column = 1440
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_CA_DataForInfoWorks'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_CA_DataForInfoWorks'
GO
