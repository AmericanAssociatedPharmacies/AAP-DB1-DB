USE [WebTest]
GO
/****** Object:  View [dbo].[v_CA_PM_StoresWithEmployeeExclusions]    Script Date: 12/22/2020 9:42:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[v_CA_PM_StoresWithEmployeeExclusions]
AS
SELECT        a.PMID, a.NCPDP, a.AccountName, a.OwnerName, a.IsStoreComplianceGuardian, a.IsStoreStaffGuard, a.IsStoreAAP, a.IsStoreManagedCare, 
                         a.IsStoreNonManagedCare, a.IsStoreNPP, CASE WHEN e_2.Employees IS NULL THEN 0 ELSE e_2.Employees END AS Employees, e_2.EmployeeLastModifiedDate, 
                         e_2.EmployeeLastCreatedDate, e_2.ExclusionLastFoundDate, CASE WHEN e_2.exclusions IS NULL THEN 0 ELSE e_2.exclusions END AS Exclusions, 
                         a.ComplianceGuardianStartDate, a.ComplianceGuardianEndDate, a.StaffGuardStartDate, a.StaffGuardEndDate, a.addr1 AS Addr1, a.addr2 AS Addr2, 
                         CASE WHEN a.addr1 IS NOT NULL AND a.addr2 IS NOT NULL THEN Rtrim(Ltrim(Rtrim(Ltrim(a.addr1)) + ' ' + Rtrim(Ltrim(a.addr2)))) WHEN a.Addr1 IS NULL AND 
                         a.Addr2 IS NOT NULL THEN Rtrim(Ltrim(a.addr2)) WHEN a.addr1 IS NOT NULL AND a.addr2 IS NULL THEN Rtrim(Ltrim(a.addr1)) ELSE NULL END AS Address, a.State,
                          a.Phone, 
--case when a.Email like '%, %' then a.Email else replace(a.Email,',',', ') end Email, 
Replace(Replace(a.Email,' ',''),',',', ') as Email,
a.Fax, a.City, a.Zip, a.NPI, a.AAPAccountNo, a.ChainCode, a.MCQuitDate, a.AAPQuitDate, a.IsNPP
,a.MCEffectiveDate,a.TMFirstName,a.TMLastName,a.TM
FROM            [dbo].[v_CA_PM_Stores] AS a LEFT OUTER JOIN
                             (SELECT        NCPDP, Count(ID) AS Employees, Sum(IsExclusionListed) AS Exclusions, Max(EmployeeLastModifiedDate) AS EmployeeLastModifiedDate, 
                                                         Max(EmployeeLastCreatedDate) AS EmployeeLastCreatedDate, Max(ExclusionLastFoundDate) AS ExclusionLastFoundDate
                               FROM            (SELECT        e.ID, e.NCPDP, e.PMID, e.FirstName, e.MiddleName, e.LastName, e.Email, c.IsExclusionListed, 
                                                                                   e.ModifiedDate AS EmployeeLastModifiedDate, e.CreatedDate AS EmployeeLastCreatedDate, c.ExclusionLastFoundDate
                                                         FROM            DBO.CA_StoreEmployee AS e LEFT OUTER JOIN
                                                                                       (SELECT        EmployeeId, Max(IsExclusionListed) AS IsExclusionListed, Max(CreatedDate) AS ExclusionLastFoundDate
                                                                                         FROM            (SELECT        EmployeeId, CASE WHEN IsOIGListed = 1 OR
                                                                                                                                             IsSAMListed = 1 THEN 1 ELSE 0 END AS IsExclusionListed, CASE WHEN IsOIGListed = 1 OR
                                                                                                                                             IsSAMListed = 1 THEN CreatedDate ELSE NULL END AS CreatedDate, Row_number() OVER (PARTITION BY 
                                                                                                                                             EmployeeId
                                                                                                                   ORDER BY CreatedDate DESC) AS rn
                                                                                         FROM            [WebDev].DBO.CA_CheckResultsHistory) AS c
                                                         WHERE        rn = 1
                                                         GROUP BY EmployeeId) AS c ON c.EmployeeId = e.ID
                               WHERE        (e.IsActive = 1)) AS e_1
GROUP BY NCPDP) AS e_2 ON e_2.NCPDP = a.NCPDP


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
         Alias = 1080
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_CA_PM_StoresWithEmployeeExclusions'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_CA_PM_StoresWithEmployeeExclusions'
GO
