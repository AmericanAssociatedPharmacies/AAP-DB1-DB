USE [PharmacyMaster]
GO
/****** Object:  View [dbo].[v_listFaxPMSLX]    Script Date: 12/22/2020 9:24:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create VIEW [dbo].[v_listFaxPMSLX]
AS
SELECT AccountName,NCPDP,case when Fax like '%-%' or Fax is null or Fax = '' then Fax else 
     SUBSTRING(Fax, 1, 3) + '-' +  SUBSTRING(Fax,4,3) + '-' + RIGHT(Fax, 4) end as Fax 
  FROM (
	SELECT AccountName,NCPDP,case when fax is null or fax = '' then SLXFax else fax end as Fax
      FROM (
		SELECT pm.PMID,AccountName,fax,NCPDP ,SLXFax  from v_pm_allwithaffiliates pm
		 join
		(
		  SELECT account,pmid ,fax as SLXFax from reporting..v_SLXAccount_PMID  
			WHERE type = 'AAP Member' or type = 'AAP Affiliate Member'
		) s
		ON pm.PMID = s.PMID
			WHERE chaincode is not null	and aapquitdate is null and aapaccountno is not null and aapaccountno != ''
				and mcquitdate is null  
		UNION
		SELECT  PMID,AccountName,fax,NCPDP  ,null   from v_pm_allwithaffiliates 
		WHERE chaincode is not null	and mcquitdate is null and  isNpp = -1	
	) db
)jm
GO
