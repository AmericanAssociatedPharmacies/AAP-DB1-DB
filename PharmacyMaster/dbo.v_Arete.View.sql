USE [PharmacyMaster]
GO
/****** Object:  View [dbo].[v_Arete]    Script Date: 12/22/2020 9:24:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		Deepa
-- Create date: 6/23/2016
-- Description:	Copied Bruce's view uddw1\pharmacymaster..v_testArete
-- =============================================

CREATE VIEW [dbo].[v_Arete]
AS SELECT DISTINCT 
                         p.PMID, p.PMParentID, p.AAPAccountNo, p.AAPEffectiveDate, p.AAPParentNo, p.AAPPreviousGroup, p.AAPQuitDate, p.AAPStatus, p.AccountDescription, 
                         p.AccountName, p.AllowDupDEA, p.APIAccountNo, p.APIMemberNo, p.APIStatus, p.AvgWholesaleVolume, p.BusinessClass, p.CAHStatus, p.CardinalDC, 
                         p.CompetitiveAcct, p.ComputerSoftware, p.ContractDate, p.CorporateName, p.CustPayTermsAPI, p.DateOpened, p.DBA, p.DEA, p.DEAEXP, p.Email, 
                         p.EmergencyPhone, p.FedID, p.HolidayHours, p.Hours, p.IsStartUpStore, p.NCPDP, p.NPI, p.NumReactivated, p.OrigStartDate, p.OwnerName, p.Payee_id, 
                         p.PrimaryCAAccountNo, p.QPS, p.Rank, p.Resigned, p.Source, p.Status, p.Territory, p.UDAccountNo, p.UDNonPharmacy, p.UDParentNo, p.UDQuitDate, p.UDStatus, 
                         p.Website, p.Wholesaler, p.WholesalerAccountNo, p.WhyResigned, p.IsBuyingGroup, p.IsPos, p.IsPva, p.FeePaid, p.IsManagedCare, p.IsWarehouse, p.IsNPP, 
                         p.ACHEmail, a.ContactFullName, p.Created, p.Modified, p.RowVersion, a.Addr1, a.Addr2, a.City, a.State, a.Zip, a.Phone, a.Fax, m.ChainCode, m.MCEffectiveDate, 
                         m.MCQuitDate, c.StateLicExpDate, c.StateLicNo, gx.Group_Name AS Affiliate, p.GroupNo, p.CategoryID, p.AuthorizedVoter, p.MembershipOwner, 
                          PM_Territory.FirstName AS TMFirstName,  PM_Territory.LastName AS TMLastName,  PM_Territory.Territory AS TM, af.FinAddr1, af.FinAddr2, af.FinCity, 
                         af.FinState, af.FinZip, af.fincontact, am.MailContact, am.MailAddr1, am.MailAddr2, am.MailCity, am.MailState, am.MailZip, CASE WHEN (p.AAPAccountno IS NOT NULL 
                         AND p.AAPAccountno <> '' AND p.AAPQuitdate IS NULL) OR
                         APISTATUS IN ('ACTIVE', 'SUSPENDED') OR
                         (isNPP <> 0 AND mcquitdate IS NULL) THEN 1 ELSE 0 END AS isActive, CASE WHEN (m.MCQuitDate IS NULL AND m.chaincode IS NOT NULL) AND 
                         (((p.AAPAccountno IS NOT NULL AND p.AAPAccountno <> '') AND p.AAPQuitdate IS NULL)) THEN 1 ELSE 0 END AS isMCnotNPP, CASE WHEN (m.MCQuitDate IS NULL 
                         AND m.chaincode IS NOT NULL) AND (((p.AAPAccountno IS NOT NULL AND p.AAPAccountno <> '') AND p.AAPQuitdate IS NULL)) OR
                         (isNPP <> 0 AND mcquitdate IS NULL) THEN 1 ELSE 0 END AS isMCorNPP,
                             (SELECT        CASE WHEN COUNT(MemberPrograms.PMID) > 0 THEN 1 ELSE 0 END AS Expr1
                               FROM             PM_MemberPrograms AS MemberPrograms
                               WHERE        (ProgramID = 182) AND (EndDate IS NULL) AND (PMID = p.PMID)) AS IsAuditGuard,
                             (SELECT        CASE WHEN COUNT(MemberPrograms.PMID) > 0 THEN 1 ELSE 0 END AS Expr1
                               FROM             PM_MemberPrograms AS MemberPrograms
                               WHERE        (ProgramID = 184) AND (EndDate IS NULL) AND (PMID = p.PMID)) AS IsAAPElite, 
                         CASE WHEN ComputerSoftware LIKE 'Rx3%' THEN 1 ELSE 0 END AS IsRx30, p.CommunicationPreference, CASE WHEN (p.AAPAccountno IS NOT NULL AND 
                         p.AAPAccountno <> '' AND p.AAPQuitdate IS NULL) THEN 1 ELSE 0 END AS isAAP, em.ExecMailAddr1, em.ExecMailAddr2, em.ExecMailCity, em.ExecMailState, 
                         em.ExecMailContact, em.ExecEmail, CASE WHEN (m.MCEffectiveDate < '3/1/2016' AND (m.MCQuitDate IS NULL OR
                         m.MCQuitDate >= '3/1/2016')) OR
                         p.PMID = 100364 OR  (m.MCEffectiveDate >= '3/1/2016' AND (m.MCQuitDate IS NULL OR
                         m.MCQuitDate >= '3/1/2016')) THEN 1 ELSE 0 END AS IsArete
FROM             PM_Pharmacy AS p LEFT OUTER JOIN
                          PM_Territory ON p.Territory =  PM_Territory.Territory LEFT OUTER JOIN
                             (SELECT        g.Group_Name, g.AffiliateID, x.PMID
                               FROM             PM_Groups_xref AS x INNER JOIN
                                                          PM_Groups AS g ON x.Group_ID = g.Group_ID
                               WHERE        (g.AffiliateID IS NOT NULL)) AS gx ON p.PMID = gx.PMID LEFT OUTER JOIN
                             (SELECT        PMID, Address AS Addr1, Address2 AS Addr2, ContactFullName, City, State, Zip, Phone, Fax
                               FROM             PM_AddressMaster
                               WHERE        (Address_Type_Id = 1)) AS a ON p.PMID = a.PMID LEFT OUTER JOIN
                             (SELECT        PMID, Address AS FinAddr1, Address2 AS FinAddr2, City AS FinCity, State AS FinState, Zip AS FinZip, ContactFullName AS fincontact
                               FROM             PM_AddressMaster AS PM_AddressMaster_2
                               WHERE        (Address_Type_Id = 3)) AS af ON p.PMID = af.PMID LEFT OUTER JOIN
                             (SELECT        PMID, Address AS MailAddr1, Address2 AS MailAddr2, City AS MailCity, State AS MailState, Zip AS MailZip, ContactFullName AS MailContact
                               FROM             PM_AddressMaster AS PM_AddressMaster_1
                               WHERE        (Address_Type_Id = 2)) AS am ON p.PMID = am.PMID LEFT OUTER JOIN
                             (SELECT        ChainCode, MCEffectiveDate, MCQuitDate, PMID
                               FROM             PM_ManagedCare) AS m ON p.PMID = m.PMID LEFT OUTER JOIN
                             (SELECT        StateLicExpDate, StateLicNo, PMID
                               FROM             PM_Cred) AS c ON p.PMID = c.PMID LEFT OUTER JOIN
                             (SELECT        PMID, Address AS ExecMailAddr1, Address2 AS ExecMailAddr2, City AS ExecMailCity, State AS ExecMailState, Zip AS ExecMailZip, 
                                                         ContactFullName AS ExecMailContact, Email AS ExecEmail
                               FROM             PM_AddressMaster AS PM_AddressMaster_1
                               WHERE        (Address_Type_Id = 9)) AS em ON p.PMID = em.PMID

GO
