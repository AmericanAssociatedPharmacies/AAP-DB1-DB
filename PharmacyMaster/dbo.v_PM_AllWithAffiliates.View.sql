USE [PharmacyMaster]
GO
/****** Object:  View [dbo].[v_PM_AllWithAffiliates]    Script Date: 12/22/2020 9:24:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE VIEW [dbo].[v_PM_AllWithAffiliates]
AS
SELECT DISTINCT 
                      p.PMID, p.PMParentID, p.AAPAccountNo, p.AAPEffectiveDate, p.AAPParentNo, p.AAPPreviousGroup, p.AAPQuitDate, p.AAPStatus, p.AccountDescription, p.AccountName, 
                      p.AllowDupDEA, p.APIAccountNo, p.APIMemberNo, p.APIStatus, p.AvgWholesaleVolume, p.BusinessClass, p.CAHStatus, p.CardinalDC, p.CompetitiveAcct, 
                      p.ComputerSoftware, p.ContractDate, p.CorporateName, p.CustPayTermsAPI, p.DateOpened, p.DBA, p.DEA, p.DEAEXP, p.Email, p.EmergencyPhone, p.FedID, 
                      p.HolidayHours, p.Hours, p.IsStartUpStore, p.NCPDP, p.NPI, p.NumReactivated, p.OrigStartDate, p.OwnerName, p.Payee_id, p.PrimaryCAAccountNo, p.QPS, p.Rank, 
                      p.Resigned, p.Source, p.Status, p.Territory, p.UDAccountNo, p.UDNonPharmacy, p.UDParentNo, p.UDQuitDate, p.UDStatus, p.Website, p.Wholesaler, 
                      p.WholesalerAccountNo, p.WhyResigned, p.IsBuyingGroup, p.IsPos, p.IsPva, p.FeePaid, p.IsManagedCare, p.IsWarehouse, p.IsNPP, p.ACHEmail, a.ContactFullName, 
                      p.Created, p.Modified, p.RowVersion, a.Addr1, a.Addr2, a.City, a.State, a.Zip, a.Phone, a.Fax, m.ChainCode, m.MCEffectiveDate, m.MCQuitDate, c.StateLicExpDate, 
                      c.StateLicNo, gx.Group_Name AS Affiliate, p.GroupNo, p.CategoryID, p.AuthorizedVoter, p.MembershipOwner, dbo.PM_Territory.FirstName AS TMFirstName, 
                      dbo.PM_Territory.LastName AS TMLastName, dbo.PM_Territory.Territory AS TM, af.FinAddr1, af.FinAddr2, af.FinCity, af.FinState, af.FinZip, am.MailAddr1, 
                      am.MailAddr2, am.MailCity, am.MailState, am.MailZip, p.AAPPaymentMode, p.DoNotFax, p.CommunicationPreference, p.IsHighVolume, p.WHSNUM AS API_WarehouseNumber
FROM dbo.PM_Pharmacy AS p 
LEFT OUTER JOIN dbo.PM_Territory ON p.Territory = dbo.PM_Territory.Territory 
LEFT OUTER JOIN (SELECT g.Group_Name, g.AffiliateID, x.PMID
                 FROM dbo.PM_Groups_xref AS x 
				 INNER JOIN dbo.PM_Groups AS g ON x.Group_ID = g.Group_ID
                 WHERE (g.AffiliateID IS NOT NULL)
				 AND EXISTS(SELECT 1
							FROM dbo.PM_AffiliateHistory AS p
							WHERE x.Group_ID = p.GroupID
							AND x.PMID = p.PMID
							AND p.StatusCode = 'Active'
							)
				) AS gx ON p.PMID = gx.PMID
LEFT OUTER JOIN (SELECT PMID, Address AS Addr1, Address2 AS Addr2, ContactFullName, City, State, Zip, Phone, Fax
                 FROM dbo.PM_AddressMaster
                 WHERE (Address_Type_Id = 1)
				 ) AS a ON p.PMID = a.PMID 
LEFT OUTER JOIN (SELECT PMID, Address AS FinAddr1, Address2 AS FinAddr2, City AS FinCity, State AS FinState, Zip AS FinZip
                 FROM dbo.PM_AddressMaster AS PM_AddressMaster_2
                 WHERE (Address_Type_Id = 3)
				 ) AS af ON p.PMID = af.PMID 
LEFT OUTER JOIN(SELECT PMID, Address AS MailAddr1, Address2 AS MailAddr2, City AS MailCity, State AS MailState, Zip AS MailZip
                FROM dbo.PM_AddressMaster AS PM_AddressMaster_1
                WHERE (Address_Type_Id = 2)
				) AS am ON p.PMID = am.PMID 
LEFT OUTER JOIN(SELECT ChainCode, MCEffectiveDate, MCQuitDate, PMID
                FROM dbo.PM_ManagedCare) AS m ON p.PMID = m.PMID 
LEFT OUTER JOIN(SELECT StateLicExpDate, StateLicNo, PMID
                FROM dbo.PM_Cred) AS c ON p.PMID = c.PMID




GO
