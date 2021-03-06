USE [PharmacyMaster]
GO
/****** Object:  View [dbo].[v_CorporateNameForIRS]    Script Date: 12/22/2020 9:24:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[v_CorporateNameForIRS]
as
select pmid, aapaccountno
,dbo.csfn_stripPunctuationIRS(corporatename) as corporatename
,dbo.csfn_stripPunctuationIRS(FinAddr1) as addr1
,dbo.csfn_stripPunctuationIRS(FinAddr2) as addr2
,dbo.csfn_stripPunctuationIRS(FinCity) as city
,dbo.csfn_stripPunctuationIRS(FinState) as state
,dbo.csfn_stripPunctuationIRS(FinZip) as zip
,corporatename as corporatenameFromDB
,FinAddr1 as addr1FromDB
from v_pm_allwithaffiliates
where aapaccountno is not null
and aapquitdate is null
--order by aapaccountno
GO
