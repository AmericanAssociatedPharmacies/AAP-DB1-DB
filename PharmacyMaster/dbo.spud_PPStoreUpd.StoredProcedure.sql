USE [PharmacyMaster]
GO
/****** Object:  StoredProcedure [dbo].[spud_PPStoreUpd]    Script Date: 12/22/2020 4:45:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spud_PPStoreUpd]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

--Created a Derived Table for Preferred Partner Stores

   TRUNCATE TABLE PPStores

	INSERT INTO PPStores 
	SELECT     CAST(PMID AS nvarchar(50)) AS PMID, AAPAccountNo, NCPDP, APIAccountNo, LTRIM(RTRIM(OwnerName)) AS OwnerName, DEA, DEAEXP, StateLicNo, UDAccountNo, Affiliate, AAPQuitDate, 
						  PMParentID, AccountDescription, AccountName, Addr1, Addr2, City, State, Zip, CorporateName, AAPParentNo, contactfullname, phone, fax, email, fedid, territory,AAPPaymentMode
	FROM         dbo.v_PMDeletedAll

	INSERT INTO PPStores
	SELECT     CAST(PMID AS nvarchar(50)) AS PMID, AAPAccountNo, NCPDP, APIAccountNo, LTRIM(RTRIM(OwnerName)) AS OwnerName, DEA, DEAEXP, StateLicNo, UDAccountNo, Affiliate, AAPQuitDate, 
						  PMParentID, AccountDescription, AccountName, Addr1, Addr2, City, State, Zip, CorporateName, AAPParentNo, contactfullname, phone, fax, email, fedid, territory,AAPPaymentMode
	FROM dbo.v_PM_AllWithAffiliates

	DROP INDEX PPStores.IDX_PMID
	CREATE INDEX IDX_PMID
		on PPStores (PMID) 


--Create a Derived Table for Pharmacy Master Stores from v_PM_AllWithAffiliates

	TRUNCATE TABLE PMStores
	INSERT INTO dbo.PMStores ([PMID]
      ,[PMParentID]
      ,[AAPAccountNo]
      ,[AAPEffectiveDate]
      ,[AAPParentNo]
      ,[AAPPreviousGroup]
      ,[AAPQuitDate]
      ,[AAPStatus]
      ,[AccountDescription]
      ,[AccountName]
      ,[AllowDupDEA]
      ,[APIAccountNo]
      ,[APIMemberNo]
      ,[APIStatus]
      ,[AvgWholesaleVolume]
      ,[BusinessClass]
      ,[CAHStatus]
      ,[CardinalDC]
      ,[CompetitiveAcct]
      ,[ComputerSoftware]
      ,[ContractDate]
      ,[CorporateName]
      ,[CustPayTermsAPI]
      ,[DateOpened]
      ,[DBA]
      ,[DEA]
      ,[DEAEXP]
      ,[Email]
      ,[EmergencyPhone]
      ,[FedID]
      ,[HolidayHours]
      ,[Hours]
      ,[IsStartUpStore]
      ,[NCPDP]
      ,[NPI]
      ,[NumReactivated]
      ,[OrigStartDate]
      ,[OwnerName]
      ,[Payee_id]
      ,[PrimaryCAAccountNo]
      ,[QPS]
      ,[Rank]
      ,[Resigned]
      ,[Source]
      ,[Status]
      ,[Territory]
      ,[UDAccountNo]
      ,[UDNonPharmacy]
      ,[UDParentNo]
      ,[UDQuitDate]
      ,[UDStatus]
      ,[Website]
      ,[Wholesaler]
      ,[WholesalerAccountNo]
      ,[WhyResigned]
      ,[IsBuyingGroup]
      ,[IsPos]
      ,[IsPva]
      ,[FeePaid]
      ,[IsManagedCare]
      ,[IsWarehouse]
      ,[IsNPP]
      ,[ACHEmail]
      ,[ContactFullName]
      ,[Created]
      ,[Modified]
      ,[RowVersion]
      ,[Addr1]
      ,[Addr2]
      ,[City]
      ,[State]
      ,[Zip]
      ,[Phone]
      ,[Fax]
      ,[ChainCode]
      ,[MCEffectiveDate]
      ,[MCQuitDate]
      ,[StateLicExpDate]
      ,[StateLicNo]
      ,[Affiliate]
      ,[GroupNo]
      ,[CategoryID]
      ,[AuthorizedVoter]
      ,[MembershipOwner]
      ,[TMFirstName]
      ,[TMLastName]
      ,[TM]
      ,[FinAddr1]
      ,[FinAddr2]
      ,[FinCity]
      ,[FinState]
      ,[FinZip]
      ,[MailAddr1]
      ,[MailAddr2]
      ,[MailCity]
      ,[MailState]
      ,[MailZip]
      ,[AAPPaymentMode]
      ,[DoNotFax]
      ,[CommunicationPreference]
      ,[IsMC])
	SELECT [PMID]
      ,[PMParentID]
      ,[AAPAccountNo]
      ,[AAPEffectiveDate]
      ,[AAPParentNo]
      ,[AAPPreviousGroup]
      ,[AAPQuitDate]
      ,[AAPStatus]
      ,[AccountDescription]
      ,[AccountName]
      ,[AllowDupDEA]
      ,[APIAccountNo]
      ,[APIMemberNo]
      ,[APIStatus]
      ,[AvgWholesaleVolume]
      ,[BusinessClass]
      ,[CAHStatus]
      ,[CardinalDC]
      ,[CompetitiveAcct]
      ,[ComputerSoftware]
      ,[ContractDate]
      ,[CorporateName]
      ,[CustPayTermsAPI]
      ,[DateOpened]
      ,[DBA]
      ,[DEA]
      ,[DEAEXP]
      ,[Email]
      ,[EmergencyPhone]
      ,[FedID]
      ,[HolidayHours]
      ,[Hours]
      ,[IsStartUpStore]
      ,[NCPDP]
      ,[NPI]
      ,[NumReactivated]
      ,[OrigStartDate]
      ,[OwnerName]
      ,[Payee_id]
      ,[PrimaryCAAccountNo]
      ,[QPS]
      ,[Rank]
      ,[Resigned]
      ,[Source]
      ,[Status]
      ,[Territory]
      ,[UDAccountNo]
      ,[UDNonPharmacy]
      ,[UDParentNo]
      ,[UDQuitDate]
      ,[UDStatus]
      ,[Website]
      ,[Wholesaler]
      ,[WholesalerAccountNo]
      ,[WhyResigned]
      ,[IsBuyingGroup]
      ,[IsPos]
      ,[IsPva]
      ,[FeePaid]
      ,[IsManagedCare]
      ,[IsWarehouse]
      ,[IsNPP]
      ,[ACHEmail]
      ,[ContactFullName]
      ,[Created]
      ,[Modified]
      ,[RowVersion]
      ,[Addr1]
      ,[Addr2]
      ,[City]
      ,[State]
      ,[Zip]
      ,[Phone]
      ,[Fax]
      ,[ChainCode]
      ,[MCEffectiveDate]
      ,[MCQuitDate]
      ,[StateLicExpDate]
      ,[StateLicNo]
      ,[Affiliate]
      ,[GroupNo]
      ,[CategoryID]
      ,[AuthorizedVoter]
      ,[MembershipOwner]
      ,[TMFirstName]
      ,[TMLastName]
      ,[TM]
      ,[FinAddr1]
      ,[FinAddr2]
      ,[FinCity]
      ,[FinState]
      ,[FinZip]
      ,[MailAddr1]
      ,[MailAddr2]
      ,[MailCity]
      ,[MailState]
      ,[MailZip]
      ,[AAPPaymentMode]
      ,[DoNotFax]
      ,[CommunicationPreference]
	  ,CASE WHEN ((MCQuitDate IS NULL AND chaincode IS NOT NULL) AND 
                 (((AAPAccountno IS NOT NULL AND AAPAccountno <> '') AND AAPQuitdate IS NULL)) 
                 OR (isNPP = -1 and MCQuitDate IS NULL))
            THEN 1 
			ELSE 0
		END AS isMC 
FROM dbo.v_PM_AllWithAffiliates

	--Get Active PMID
	DROP TABLE tmp_PMIDRank

	select * INTO tmp_PMIDRank
	from (SELECT Rank() OVER (Partition BY NCPDP order by aapeffectivedate desc, aapquitdate asc, aapaccountno desc) as Rank,PMID
    FROM v_PM_AllWithAffiliates where NCPDP is not null  ) p where p.rank < 2 

	--Clean Up InActivePMID
	DELETE FROM PMStores WHERE PMID NOT IN (Select PMID from tmp_PMIDRank)

	DROP INDEX PMStores.IDX_PMID
	DROP INDEX PMStores.IDX_NCPDP
	DROP INDEX PMStores.IDX_AAPAccountNo2
	DROP INDEX PMStores.IDX_AAPQuitDate2
	DROP INDEX PMStores.IDX_ChainCode

	CREATE INDEX IDX_PMID
		on PMStores (PMID) 

	CREATE INDEX IDX_NCPDP
		on PMStores (NCPDP) 

	CREATE INDEX IDX_AAPAccountNo2
	on PMStores (AAPAccountNo) 

	CREATE INDEX IDX_AAPQuitDate2
	on PMStores (AAPQuitDate) 

	CREATE INDEX IDX_ChainCode
	on PMStores (Chaincode) 




END
GO
