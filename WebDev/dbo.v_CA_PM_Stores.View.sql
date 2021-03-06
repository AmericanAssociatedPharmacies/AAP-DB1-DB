USE [WebDev]
GO
/****** Object:  View [dbo].[v_CA_PM_Stores]    Script Date: 12/22/2020 9:41:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[v_CA_PM_Stores]
AS
SELECT        *
FROM            (SELECT        *, /* to get rid of old pmids when there is a transfer of ownership*/ ROW_NUMBER() OVER (PARTITION BY NCPDP
                          ORDER BY pmid DESC) AS rn
FROM            (SELECT        PMID, MAX(NCPDP) AS NCPDP, MAX(AccountName) AS AccountName, MAX(IsStoreComplianceGuardian) AS IsStoreComplianceGuardian, 
                                                    MAX(IsStoreStaffGuard) AS IsStoreStaffGuard, MAX(IsStoreAAP) AS IsStoreAAP, MAX(IsStoreManagedCare) AS IsStoreManagedCare, MAX(IsStoreNonManagedCare) 
                                                    AS IsStoreNonManagedCare, MAX(IsStoreNPP) AS IsStoreNPP, MAX(Email) AS Email, MAX(OwnerName) AS OwnerName, MAX(Addr1) AS Addr1, 
                                                    MAX(Addr2) AS Addr2, MAX(City) AS City, MAX(State) AS State, MAX(Zip) AS Zip, MAX(Phone) AS Phone, MAX(Fax) AS Fax, MAX(NPI) AS NPI, 
                                                    MAX(ComplianceGuardianStartDate) AS ComplianceGuardianStartDate, MAX(ComplianceGuardianEndDate) AS ComplianceGuardianEndDate, 
                                                    MAX(StaffGuardStartDate) AS StaffGuardStartDate, MAX(StaffGuardEndDate) AS StaffGuardEndDate, MAX(AAPAccountNo) AS AAPAccountNo, 
                                                    MAX(ChainCode) AS ChainCode, MAX(MCQuitDate) AS MCQuitDate, MAX(AAPQuitDate) AS AAPQuitDate, MAX(IsNPP) AS IsNPP
,MAX(MCEffectiveDate) as MCEffectiveDate,MAX(TMFirstName) as TMFirstName,MAX(TMLastName) as TMLastName,MAX(TM) as TM
                          FROM            (SELECT        store.PMID, store.NCPDP, store.AccountName, CASE WHEN ((p.ProgramId = 197 AND (p.EndDate IS NULL OR
                                                                              p.EndDate > getDate())) OR
                                                                              ((((store.ChainCode IS NOT NULL) AND (store.MCQuitDate IS NULL) AND (store.AAPAccountNo IS NOT NULL OR
                                                                              store.AAPAccountNo <> '') OR
                                                                              (store.ChainCode IS NOT NULL) AND (store.MCQuitDate IS NULL) AND (store.AAPAccountNo IS NULL) AND (store.IsNPP <> 0)) OR
                                                                              store.isNPP = - 1) AND ((store.MCQuitDate IS NULL OR
                                                                              store.MCQuitDate > getdate()) AND (store.AAPQuitDate IS NULL OR
                                                                              store.AAPQuitDate > getdate())) OR
                                                                              store.isNPP = - 1)) THEN 1 ELSE 0 END AS IsStoreComplianceGuardian, 
                                                                              CASE WHEN p.ProgramId = 196 THEN 1 ELSE 0 END AS IsStoreStaffGuard, 
                                                    CASE WHEN ISNULL(LTRIM(RTRIM(store.AAPAccountNo)), NULL) <> '' AND (store.AAPQuitDate IS NULL OR
                                                    store.AAPQuitDate > getdate()) THEN 1 ELSE 0 END AS IsStoreAAP, CASE WHEN ((((store.ChainCode IS NOT NULL) AND 
                                                                              (store.MCQuitDate IS NULL) AND (store.AAPAccountNo IS NOT NULL OR
                                                                              store.AAPAccountNo <> '') OR
                                                                              (store.ChainCode IS NOT NULL) AND (store.MCQuitDate IS NULL) AND (store.AAPAccountNo IS NULL) AND (store.IsNPP <> 0)) OR
                                                                              store.isNPP = - 1) AND ((store.MCQuitDate IS NULL OR
                                                                              store.MCQuitDate > getdate()) AND (store.AAPQuitDate IS NULL OR
                                                                              store.AAPQuitDate > getdate())) OR
                                                                              store.isNPP = - 1) THEN 1 ELSE 0 END AS IsStoreManagedCare, CASE WHEN NOT (((((store.ChainCode IS NOT NULL) AND 
                                                                              (store.MCQuitDate IS NULL) AND (store.AAPAccountNo IS NOT NULL OR
                                                                              store.AAPAccountNo <> '') OR
                                                                              (store.ChainCode IS NOT NULL) AND (store.MCQuitDate IS NULL) AND (store.AAPAccountNo IS NULL) AND (store.IsNPP <> 0)) OR
                                                                              store.isNPP = - 1) AND ((store.MCQuitDate IS NULL OR
                                                                              store.MCQuitDate > getdate()) AND (store.AAPQuitDate IS NULL OR
                                                                              store.AAPQuitDate > getdate())) OR
                                                                              store.isNPP = - 1)) THEN 1 ELSE 0 END AS IsStoreNonManagedCare, CASE WHEN (IsNPP != 0) THEN 1 ELSE 0 END AS IsStoreNPP, 
                                                                              store.Email, store.OwnerName, store.Addr1, store.Addr2, store.City, store.State, store.Zip, store.Phone, store.Fax, store.NPI, 
                                                                              CASE WHEN p.ProgramID = 197 THEN p.StartDate ELSE NULL END AS ComplianceGuardianStartDate, 
                                                                              CASE WHEN p.ProgramID = 197 THEN p.EndDate ELSE NULL END AS ComplianceGuardianEndDate, 
                                                                              CASE WHEN p.ProgramID = 196 THEN p.StartDate ELSE NULL END AS StaffGuardStartDate, 
                                                                              CASE WHEN p.ProgramID = 196 THEN p.EndDate ELSE NULL END AS StaffGuardEndDate, store.AAPAccountNo, store.ChainCode, 
                                                                              store.MCQuitDate, store.AAPQuitDate, store.IsNPP
,store.MCEffectiveDate,store.TMFirstName, store.TMLastName, store.TM
                                                    FROM            PharmacyMaster.dbo.v_PM_AllWithAffiliates AS store LEFT OUTER JOIN
                                                                                  (SELECT        *
                                                                                    FROM            (SELECT        p.*, a.NCPDP, a.AAPQuitDate, Row_number() OVER (PARTITION BY a.NCPDP
                                                                                                              ORDER BY p.Created DESC) AS r
                                                                                    FROM            [PharmacyMaster].[dbo].[PM_MemberPrograms] AS p LEFT OUTER JOIN
                                                                                                              PharmacyMaster.dbo.v_PM_AllWithAffiliates AS a ON p.PMID = a.PMID
                                                                                    WHERE        p.ProgramID = 197) AS m
                                                    WHERE        r = 1
                                                    UNION
                                                    SELECT        *
                                                    FROM            (SELECT        p.*, a.NCPDP, a.AAPQuitDate, Row_number() OVER (PARTITION BY a.NCPDP
                                                                              ORDER BY p.Created DESC) AS r
                                                    FROM            [PharmacyMaster].[dbo].[PM_MemberPrograms] AS p LEFT OUTER JOIN
                                                                             PharmacyMaster.dbo.v_PM_AllWithAffiliates AS a ON p.PMID = a.PMID
                                                    WHERE        p.ProgramID = 196) AS m
                          WHERE        r = 1) AS p ON p.PMID = store.PMID
WHERE        (p.ProgramID = 197) OR
                         (p.ProgramID = 196) OR
                         (store.ChainCode IS NOT NULL) AND (store.MCQuitDate IS NULL) AND (store.AAPAccountNo IS NOT NULL OR
                         store.AAPAccountNo <> '') OR
                         (store.ChainCode IS NOT NULL) AND (store.MCQuitDate IS NULL) AND (store.AAPAccountNo IS NULL) AND (store.IsNPP = - 1)) AS stores
GROUP BY PMID) AS a) AS a
WHERE        rn = 1


GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[47] 4[14] 2[20] 3) )"
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_CA_PM_Stores'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_CA_PM_Stores'
GO
