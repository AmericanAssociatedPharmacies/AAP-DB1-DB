USE [PharmacyMaster]
GO
/****** Object:  View [dbo].[v_SSIS_PM_AllWithAffiliates_Filtered]    Script Date: 12/22/2020 9:24:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[v_SSIS_PM_AllWithAffiliates_Filtered]
AS
SELECT     p.PMID, p.PMParentID, p.AAPAccountNo, p.AAPEffectiveDate, p.AAPParentNo, p.AAPPreviousGroup, p.AAPQuitDate, p.AAPStatus, p.AccountDescription, 
                      p.AccountName, p.AllowDupDEA, p.APIAccountNo, p.APIMemberNo, p.APIStatus, p.AvgWholesaleVolume, p.BusinessClass, p.CAHStatus, p.CardinalDC, 
                      p.CompetitiveAcct, p.ComputerSoftware, p.ContractDate, p.CorporateName, p.CustPayTermsAPI, p.DateOpened, p.DBA, p.DEA, p.DEAEXP, p.Email, 
                      p.EmergencyPhone, p.FedID, p.HolidayHours, p.Hours, p.IsStartUpStore, p.NCPDP, p.NPI, p.NumReactivated, p.OrigStartDate, p.OwnerName, 
                      p.Payee_id, p.PrimaryCAAccountNo, p.QPS, p.Rank, p.Resigned, p.Source, p.Status, p.Territory, p.UDAccountNo, p.UDNonPharmacy, p.UDParentNo, 
                      p.UDQuitDate, p.UDStatus, p.Website, p.Wholesaler, p.WholesalerAccountNo, p.WhyResigned, p.IsBuyingGroup, p.IsPos, p.IsPva, p.FeePaid, 
                      p.IsManagedCare, p.IsWarehouse, p.IsNPP, p.ACHEmail,a.ContactFullName , p.Created, p.Modified , 
                      p.RowVersion , a.Addr1, a.Addr2 ,   a.City, a.State, a.Zip, 
                      a.Phone, a.Fax , m.ChainCode, m.MCEffectiveDate , m.MCQuitDate, 
                      c.StateLicExpDate, c.StateLicNo , gx.Group_Name as Affiliate, pm.[AAP Elite StartDate],pm.[AAP Elite EndDate],p.GroupNo
FROM         dbo.PM_Pharmacy AS p LEFT OUTER JOIN
                          (SELECT     g.Group_Name, g.AffiliateID, x.PMID
                            FROM          dbo.PM_Groups_xref AS x INNER JOIN
                                                   dbo.PM_Groups AS g ON x.Group_ID = g.Group_ID
                            WHERE      (g.AffiliateID IS NOT NULL)) AS gx ON p.PMID = gx.PMID LEFT OUTER JOIN
                          (SELECT     PMID, Address AS Addr1, Address2 AS Addr2, ContactFullName, City, State, Zip, Phone, Fax
                            FROM          dbo.PM_AddressMaster
                            WHERE      (Address_Type_Id = 1)) AS a ON p.PMID = a.PMID LEFT OUTER JOIN
                          (SELECT     ChainCode, MCEffectiveDate, MCQuitDate, PMID
                            FROM          dbo.PM_ManagedCare) AS m ON p.PMID = m.PMID LEFT OUTER JOIN
                          (SELECT     StateLicExpDate, StateLicNo, PMID
                            FROM          dbo.PM_Cred) AS c ON p.PMID = c.PMID  LEFT OUTER JOIN
					      (SELECT PMID,startdate as [AAP Elite StartDate],endDate as [AAP Elite EndDate] from pharmacymaster..pm_memberprograms 
							where programid = 184
							) pm
							on p.PMID = pm.PMID
WHERE     (p.BusinessClass <> 'CZZ') OR
                      (p.BusinessClass = 'CZZ' OR
                      p.BusinessClass IS NULL) AND (p.AAPAccountNo IS NULL) AND (p.UDAccountNo IS NOT NULL) AND (p.UDQuitDate > '12/31/2008' OR
                      p.UDQuitDate IS NULL) OR
                      (p.BusinessClass = 'CZZ' OR
                      p.BusinessClass IS NULL) AND (p.AAPAccountNo IS NOT NULL)
/* The filter may seem a little crazy but I had to account for that fact that an aapaccount or udaccount may be valid even it the api account is 'CZZ'
 THIS WILL GIVE SAME RESULTS - A LITTLE EASIER TO READ
select * from pm_pharmacy where  (businessclass    != 'CZZ'  
or businessclass is null)
and udaccountno is not null and (udquitdate > '12/31/2008' or udquitdate is null)
union
select * from pm_pharmacy where  (businessclass    != 'CZZ'  
or businessclass is null)
and aapaccountno is not null
union 
select * from  pm_pharmacy where 
b(usinessclass    != 'CZZ'  
or businessclass is null) and (apiaccountno is not null)*/
GO
