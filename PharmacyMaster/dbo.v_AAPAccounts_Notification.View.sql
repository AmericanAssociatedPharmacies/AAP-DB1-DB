USE [PharmacyMaster]
GO
/****** Object:  View [dbo].[v_AAPAccounts_Notification]    Script Date: 12/22/2020 9:24:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create VIEW [dbo].[v_AAPAccounts_Notification]
AS
SELECT DISTINCT 
                      TOP (100) PERCENT p.PMID AS AccountID, p.CorporateName AS CorpName, p.AccountName AS storename, p.AAPAccountNo AS aapid, 
                      p.AAPParentNo AS parentaapid, am.Address AS addr1, am.Address2 AS addr2, am.City, am.State, am.Zip, SUBSTRING(am.Phone, 1, 3) AS AreaCode, 
                      SUBSTRING(am.Phone, 5, 8) AS phone, SUBSTRING(am.Fax, 1, 3) AS FaxAreaCode, SUBSTRING(am.Fax, 5, 8) AS fax, p.Territory AS nsterritory, 
                      p.FeePaid, p.IsNPP, p.DEA, p.DEAEXP, p.NCPDP, p.NPI, mc.ArgusAgree, p.CompetitiveAcct, p.Email,
                          (SELECT     TOP (1) Group_Name
                            FROM          dbo.PM_Groups
                            WHERE      (Group_ID IN
                                                       (SELECT     TOP (1) Group_ID
                                                         FROM          dbo.PM_Groups_xref
                                                         WHERE      (PMID = p.PMID)
                                                         ORDER BY Grpxref_ID DESC))) AS GroupDesignation, (CASE UPPER(p.[accountdescription]) 
                      WHEN 'FULL MEMBER' THEN '1' ELSE '0' END) AS IsMember, (CASE UPPER(p.[accountdescription]) 
                      WHEN 'AFFILIATE GROUP MEMBER' THEN '1' ELSE '0' END) AS IsAffiliateGroup, p.IsBuyingGroup, p.IsNPP AS Expr1, p.IsWarehouse, p.IsPva, 
                      p.IsPos, dbo.PMListGroupNames(p.PMID) AS AffiliateGroupName, am.County, SUBSTRING(p.OwnerName, 1, CHARINDEX(' ', p.OwnerName)) 
                      AS ownerfirst, dbo.PMGetOwnerLastName(p.OwnerName) AS ownerlast, '' AS Effective, p.AvgWholesaleVolume, p.AAPEffectiveDate AS effectiveaap, 
                      p.IsStartUpStore, (CASE LEN
                          ((SELECT     TOP 1 pharfullname
                              FROM         dbo.pm_pharmacists
                              WHERE     pmid = p.pmid AND (pharprime = 1 OR
                                                    pharprime = - 1) AND pharexpdate IS NULL)) WHEN 0 THEN '0' ELSE '1' END) AS IsPharmacy, mc.ChainCode, p.FedID, 
                      p.AAPPreviousGroup, '' AS SwitchedFrom, p.UDQuitDate AS quitdate, p.AAPPreviousGroup AS PreviousAcctNo, '' AS APIPreviousAcctNo, 
                      p.WholesalerAccountNo AS apiwarehouseacctno, '' AS Bulletin, p.Created AS TS, c.StateLicNo, c.StateMedicaidNo, c.StateLicExpDate, p.Payee_id, 
                      p.EmergencyPhone, 'M-F: ' + ISNULL(p.StoreHours_MondayFridayAM, 'No ') + 'AM-' + ISNULL(p.StoreHours_MondayFridayPM, 'No ') 
                      + 'PM, SAT: ' + ISNULL(p.StoreHours_SaturdayAM, 'No ') + 'AM-' + ISNULL(p.StoreHours_SaturdayPM, 'No ') 
                      + 'PM' + CASE WHEN P.STOREHOURS_SUNDAYAM IS NULL THEN '' ELSE ', SUN: ' + ISNULL(P.STOREHOURS_SUNDAYAM, 'No ') 
                      + 'AM-' + ISNULL(P.STOREHOURS_SUNDAYPM, 'No ') + 'PM' END AS Hours, p.HolidayHours, c.GenLiabCarrier, c.GenLiabPolicyNumber, 
                      c.GenLiabilityLimit1, c.GenLiabilityLimit2, c.GenInsExpDate, c.ProfLiabCarrier, c.ProfLiabInsExpDate, c.ProfPolicyNumber, c.ProfLiabLimit1, 
                      c.ProfLiabLimit2, c.DeliveryService, c.EmergencyServices, c.AnsweringServiceOrMachine, c.AlternativeLanguages, c.SpecialtyServices, 
                      p.ComputerSoftware, c.Obra90, c.CounselingArea, c.PatientMR, c.DrugInformation, c.FraudFelonyConviction, c.FraudFelonyExplanation, 
                      c.RxLicenseSuspendedOrRevoked, c.SuspensionRevokationExplanation, c.UnrestrictedLicense, c.UnrestrictedLicenseExplanation, c.UAICoverage, 
                      c.Judgements, c.CompliesWithADAAct, c.AverageWaitTime, c.MedicationErrorsDocumented, c.ErrorCount12Months, c.HasResolutionPolicy, 
                      c.doesCompoundPrescriptions, c.UnitDosing, c.ProvidesDME, c.ProvidesIV, c.CertifiedDiseaseMgmt, c.CDMExplanation, c.GroupPresentations, 
                      c.ContinuingEducationRequired, c.StoreSizeClassification, c.CopyReleaseInfo, p.DBA, p.Website, p.Resigned, SUBSTRING(p.OwnerName, 1, 
                      CHARINDEX(' ', p.OwnerName)) AS ContactFirst, dbo.PMGetOwnerLastName(p.OwnerName) AS ContactLast, '' AS ContactTitle, p.WhyResigned, 
                      p.AccountDescription, mc.MCEffectiveDate, mc.MCQuitDate, p.PMID, p.QPS, p.AAPQuitDate
FROM         dbo.PM_Pharmacy AS p LEFT OUTER JOIN
                      dbo.PM_ManagedCare AS mc ON mc.PMID = p.PMID AND mc.MCQuitDate IS NULL LEFT OUTER JOIN
                      dbo.PM_AddressMaster AS am ON am.PMID = p.PMID AND am.Address_Type_Id = 1 LEFT OUTER JOIN
                      dbo.PM_Cred AS c ON c.PMID = p.PMID
--WHERE     (p.AAPAccountNo IS NOT NULL)
ORDER BY AccountID
GO
