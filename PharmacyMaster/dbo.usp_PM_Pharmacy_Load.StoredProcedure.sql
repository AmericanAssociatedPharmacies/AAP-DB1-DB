USE [PharmacyMaster]
GO
/****** Object:  StoredProcedure [dbo].[usp_PM_Pharmacy_Load]    Script Date: 12/22/2020 4:45:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





CREATE PROCEDURE [dbo].[usp_PM_Pharmacy_Load]

AS

SET NOCOUNT ON;

BEGIN

	--Update where StatusCodeName does not equal Prospect
	UPDATE x
	SET PMParentID = s.PMParentID
	, AAPAccountNo = s.AAPAccountNo
	, AAPEffectiveDate = s.AAPEffectiveDate
	, AAPParentNo = ISNULL(x.AAPParentNo, s.AAPParentNo)
	, AAPPreviousGroup = s.AAPPreviousGroup
	, AAPQuitDate = s.AAPQuitDate
	, AAPStatus = s.AAPStatus
	, AccountDescription = s.AccountDescription
	, AccountName = s.AccountName
	, AllowDupDEA = s.AllowDupDEA
	, APIAccountNo = s.APIAccountNo
	, APIDEA = s.APIDEA
	, APIMemberNo = s.APIMemberNo
	, APIPMID = s.APIPMID
	, APIStatus = s.APIStatus
	, AvgWholesaleVolume = s.AvgWholesaleVolume
	, BusinessClass = s.BusinessClass
	, CAHStatus = s.CAHStatus
	, CardinalDC = s.CardinalDC
	, CategoryID = s.CategoryID
	, CompetitiveAcct = s.CompetitiveAcct
	, ComputerSoftware = s.ComputerSoftware
	, ContractDate = s.ContractDate
	, CorporateName = s.CorporateName
	, CustPayTermsAPI = s.CustPayTermsAPI
	, DateOpened = s.DateOpened
	, DBA = s.DBA
	, DEA = s.DEA
	, DEAEXP = s.DEAEXP
	, Email = s.Email
	, EmergencyPhone = s.EmergencyPhone
	, EstMonthlyVol = s.EstMonthlyVol
	, FedID = s.FedID
	, GroupNo = s.GroupNo
	, Hours = s.Hours
	, IsHighVolume = s.IsHighVolume
	, StoreHours_HolidayAM = s.StoreHours_HolidayAM
	, StoreHours_HolidayPM = s.StoreHours_HolidayPM
	, StoreHours_MondayFridayAM = s.StoreHours_MondayFridayAM
	, StoreHours_MondayFridayPM = s.StoreHours_MondayFridayPM
	, StoreHours_SaturdayAM = s.StoreHours_SaturdayAM
	, StoreHours_SaturdayPM = s.StoreHours_SaturdayPM
	, StoreHours_SundayAM = s.StoreHours_SundayAM
	, StoreHours_SundayPM = s.StoreHours_SundayPM
	, IsStartUpStore = s.IsStartUpStore
	, NCPDP = s.NCPDP
	, NPI = s.NPI
	, NumReactivated = s.NumReactivated
	, OrigStartDate = s.OrigStartDate
	, OwnerName = ISNULL(x.OwnerName, s.OwnerName)
	, Payee_id = s.Payee_id
	, PrimaryCAAccountNo = s.PrimaryCAAccountNo
	, PrimaryWholesaler = s.PrimaryWholesaler
	, QPS = s.QPS
	, Rank = s.Rank
	, Resigned = s.Resigned
	, Source = s.Source
	, Status = s.Status
	, Territory = s.Territory
	, UDAccountNo = s.UDAccountNo
	, UDNonPharmacy = s.UDNonPharmacy
	, UDParentNo = s.UDParentNo
	, UDQuitDate = s.UDQuitDate
	, UDStatus = s.UDStatus
	, Website = s.Website
	, Wholesaler = s.Wholesaler
	, WholesalerAccountNo = s.WholesalerAccountNo
	, WhyResigned = ISNULL(x.WhyResigned, s.WhyResigned)
	, IsBuyingGroup = s.IsBuyingGroup
	, IsPos = s.IsPos
	, IsPva = s.IsPva
	, FeePaid = s.FeePaid
	, IsManagedCare = s.IsManagedCare
	, IsWarehouse = s.IsWarehouse
	, IsNPP = s.IsNPP
	, ACHEmail = s.ACHEmail
	, Created = s.Created
	, Modified = s.Modified
	, RowVersion = s.RowVersion
	, MembershipType = s.MembershipType
	, OrganizationType = s.OrganizationType
	, AuthorizedVoter = s.AuthorizedVoter
	, MembershipOwner = ISNULL(x.MembershipOwner, s.MembershipOwner)
	, WHSNUM = s.WHSNUM
	, PlansExcluded = s.PlansExcluded
	, IsClaimData = s.IsClaimData
	, IsUPCData = s.IsUPCData
	, MedicarePartBNo = s.MedicarePartBNo
	, DoNotFax = s.DoNotFax
	, CommunicationPreference = s.CommunicationPreference
	, APIPaymentMode = s.APIPaymentMode
	, NCPA = s.NCPA
	, OptOutNCPA = s.OptOutNCPA
	, ReasonNotEligibleNCPA = s.ReasonNotEligibleNCPA
	, TMEmailAddress = s.TMEmailAddress
	FROM [dbo].[PM_Pharmacy] AS x
	INNER JOIN [Staging].[PM_Pharmacy] AS s ON x.PMID = s.PMID
	WHERE s.StatusCodeName <> 'Prospect'

	--Update where StatusCodeName does equal Prospect. This is to update values where a Pharmacy is already in PM, left AAP, and is now wanting to come back again.
	UPDATE x
	SET PMParentID = t.PMParentID
	, AAPAccountNo = t.AAPAccountNo
	, AAPEffectiveDate = t.AAPEffectiveDate
	, AAPParentNo = ISNULL(x.AAPParentNo, t.AAPParentNo)
	, AAPPreviousGroup = t.AAPPreviousGroup
	, AAPQuitDate = t.AAPQuitDate
	, AAPStatus = t.AAPStatus
	, AccountDescription = 'Prospect'
	, AccountName = t.AccountName
	, AllowDupDEA = t.AllowDupDEA
	, APIAccountNo = t.APIAccountNo
	, APIDEA = t.APIDEA
	, APIMemberNo = t.APIMemberNo
	, APIPMID = t.APIPMID
	, APIStatus = t.APIStatus
	, AvgWholesaleVolume = t.AvgWholesaleVolume
	, BusinessClass = t.BusinessClass
	, CAHStatus = t.CAHStatus
	, CardinalDC = t.CardinalDC
	, CategoryID = t.CategoryID
	, CompetitiveAcct = t.CompetitiveAcct
	, ComputerSoftware = t.ComputerSoftware
	, ContractDate = t.ContractDate
	, CorporateName = t.CorporateName
	, CustPayTermsAPI = t.CustPayTermsAPI
	, DateOpened = t.DateOpened
	, DBA = t.DBA
	, DEA = t.DEA
	, DEAEXP = t.DEAEXP
	, Email = t.Email
	, EmergencyPhone = t.EmergencyPhone
	, EstMonthlyVol = t.EstMonthlyVol
	, FedID = t.FedID
	, GroupNo = t.GroupNo
	--, HolidayHours = t.HolidayHours
	, Hours = t.Hours
	, IsHighVolume = t.IsHighVolume
	, StoreHours_HolidayAM = t.StoreHours_HolidayAM
	, StoreHours_HolidayPM = t.StoreHours_HolidayPM
	, StoreHours_MondayFridayAM = t.StoreHours_MondayFridayAM
	, StoreHours_MondayFridayPM = t.StoreHours_MondayFridayPM
	, StoreHours_SaturdayAM = t.StoreHours_SaturdayAM
	, StoreHours_SaturdayPM = t.StoreHours_SaturdayPM
	, StoreHours_SundayAM = t.StoreHours_SundayAM
	, StoreHours_SundayPM = t.StoreHours_SundayPM
	, IsStartUpStore = t.IsStartUpStore
	, NCPDP = t.NCPDP
	, NPI = t.NPI
	, NumReactivated = t.NumReactivated
	, OrigStartDate = t.OrigStartDate
	, OwnerName = ISNULL(x.OwnerName, t.OwnerName)
	, Payee_id = t.Payee_id
	, PrimaryCAAccountNo = t.PrimaryCAAccountNo
	, PrimaryWholesaler = t.PrimaryWholesaler
	, QPS = t.QPS
	, Rank = t.Rank
	, Resigned = t.Resigned
	, Source = t.Source
	, Status = t.Status
	, Territory = t.Territory
	, UDAccountNo = t.UDAccountNo
	, UDNonPharmacy = t.UDNonPharmacy
	, UDParentNo = t.UDParentNo
	, UDQuitDate = t.UDQuitDate
	, UDStatus = t.UDStatus
	, Website = t.Website
	, Wholesaler = t.Wholesaler
	, WholesalerAccountNo = t.WholesalerAccountNo
	, WhyResigned = ISNULL(x.WhyResigned, t.WhyResigned)
	, IsBuyingGroup = t.IsBuyingGroup
	, IsPos = t.IsPos
	, IsPva = t.IsPva
	, FeePaid = t.FeePaid
	, IsManagedCare = t.IsManagedCare
	, IsWarehouse = t.IsWarehouse
	, IsNPP = t.IsNPP
	, ACHEmail = t.ACHEmail
	, Created = t.Created
	, Modified = t.Modified
	, RowVersion = t.RowVersion
	, MembershipType = t.MembershipType
	, OrganizationType = t.OrganizationType
	, AuthorizedVoter = t.AuthorizedVoter
	, MembershipOwner = ISNULL(x.MembershipOwner, t.MembershipOwner)
	, WHSNUM = t.WHSNUM
	, PlansExcluded = t.PlansExcluded
	, IsClaimData = t.IsClaimData
	, IsUPCData = t.IsUPCData
	, MedicarePartBNo = t.MedicarePartBNo
	, DoNotFax = t.DoNotFax
	, CommunicationPreference = t.CommunicationPreference
	, APIPaymentMode = t.APIPaymentMode
	--, AAPPaymentMode = t.AAPPaymentMode
	, NCPA = t.NCPA
	, OptOutNCPA = t.OptOutNCPA
	, ReasonNotEligibleNCPA = t.ReasonNotEligibleNCPA
	, TMEmailAddress = t.TMEmailAddress
	FROM [dbo].[PM_Pharmacy] AS x
	INNER JOIN [Staging].[PM_Pharmacy] AS t ON x.PMID = t.PMID
	WHERE StatusCodeName LIKE '%Prospect%'


	SET IDENTITY_INSERT [dbo].[PM_Pharmacy] ON


	INSERT INTO [dbo].[PM_Pharmacy](PMID, PMParentID, AAPAccountNo, AAPEffectiveDate, AAPParentNo, AAPPreviousGroup, AAPQuitDate, AAPStatus, AccountDescription, AccountName, AllowDupDEA, APIAccountNo
									, APIDEA, APIMemberNo, APIPMID, APIStatus, AvgWholesaleVolume, BusinessClass, CAHStatus, CardinalDC, CategoryID, CompetitiveAcct, ComputerSoftware, ContractDate, CorporateName
									, CustPayTermsAPI, DateOpened, DBA, DEA, DEAEXP, Email, EmergencyPhone, EstMonthlyVol, FedID, GroupNo, HolidayHours, Hours, IsHighVolume, StoreHours_HolidayAM, StoreHours_HolidayPM
									, StoreHours_MondayFridayAM, StoreHours_MondayFridayPM, StoreHours_SaturdayAM, StoreHours_SaturdayPM, StoreHours_SundayAM, StoreHours_SundayPM, IsStartUpStore, NCPDP, NPI
									, NumReactivated, OrigStartDate, OwnerName, Payee_id, PrimaryCAAccountNo, PrimaryWholesaler, QPS, Rank, Resigned, Source, Status, Territory, UDAccountNo, UDNonPharmacy
									, UDParentNo, UDQuitDate, UDStatus, Website, Wholesaler, WholesalerAccountNo, WhyResigned, IsBuyingGroup, IsPos, IsPva, FeePaid, IsManagedCare, IsWarehouse, IsNPP, ACHEmail
									, Created, Modified, RowVersion, MembershipType, OrganizationType, AuthorizedVoter, MembershipOwner, WHSNUM, PlansExcluded, IsClaimData, IsUPCData, MedicarePartBNo, DoNotFax
									, CommunicationPreference, APIPaymentMode
									--, AAPPaymentMode
									, NCPA, OptOutNCPA, ReasonNotEligibleNCPA, TMEmailAddress
									)
	SELECT PMID, PMParentID, AAPAccountNo, AAPEffectiveDate, AAPParentNo, AAPPreviousGroup, AAPQuitDate, AAPStatus, AccountDescription, AccountName, AllowDupDEA, APIAccountNo
	, APIDEA, APIMemberNo, APIPMID, APIStatus, AvgWholesaleVolume, BusinessClass, CAHStatus, CardinalDC, CategoryID, CompetitiveAcct, ComputerSoftware, ContractDate, CorporateName
	, CustPayTermsAPI, DateOpened, DBA, DEA, DEAEXP, Email, EmergencyPhone, EstMonthlyVol, FedID, GroupNo, HolidayHours, Hours, IsHighVolume, StoreHours_HolidayAM, StoreHours_HolidayPM
	, StoreHours_MondayFridayAM, StoreHours_MondayFridayPM, StoreHours_SaturdayAM, StoreHours_SaturdayPM, StoreHours_SundayAM, StoreHours_SundayPM, IsStartUpStore, NCPDP, NPI
	, NumReactivated, OrigStartDate, OwnerName, Payee_id, PrimaryCAAccountNo, PrimaryWholesaler, QPS, Rank, Resigned, Source, Status, Territory, UDAccountNo, UDNonPharmacy
	, UDParentNo, UDQuitDate, UDStatus, Website, Wholesaler, WholesalerAccountNo, WhyResigned, IsBuyingGroup, IsPos, IsPva, FeePaid, IsManagedCare, IsWarehouse, IsNPP, ACHEmail
	, Created, Modified, RowVersion, MembershipType, OrganizationType, AuthorizedVoter, MembershipOwner, WHSNUM, PlansExcluded, IsClaimData, IsUPCData, MedicarePartBNo, DoNotFax
	, CommunicationPreference, APIPaymentMode
	, NCPA, OptOutNCPA, ReasonNotEligibleNCPA, TMEmailAddress
	FROM [Staging].[PM_Pharmacy] AS s
	WHERE NOT EXISTS(SELECT 1
						FROM [dbo].[PM_Pharmacy] AS p
						WHERE s.PMID = p.PMID
					)

	SET IDENTITY_INSERT [dbo].[PM_Pharmacy] OFF

END








GO
