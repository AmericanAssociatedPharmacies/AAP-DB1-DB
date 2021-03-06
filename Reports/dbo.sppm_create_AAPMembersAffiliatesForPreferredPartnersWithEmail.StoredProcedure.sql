USE [Reports]
GO
/****** Object:  StoredProcedure [dbo].[sppm_create_AAPMembersAffiliatesForPreferredPartnersWithEmail]    Script Date: 12/22/2020 5:00:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		< Joni Wilson>
-- Create date: <01/21/2016>
-- Description:	Create AAP Members and AAP Pipco & AAP Pipco2 (excluding PIPCo, PFOA, Keystone & RxPlus affiliates) for Preferred Partners
-- =============================================
CREATE PROCEDURE [dbo].[sppm_create_AAPMembersAffiliatesForPreferredPartnersWithEmail]
 (@in_date as varchar(10))
AS
BEGIN

SELECT  AccountName,	Addr1,	Addr2,	City,	State,	Zip,	OwnerName as ContactFullName,	Affiliate, Email, Phone,	Fax	,AAPAccountNo,	DEA	,NCPDP,	NPI 
from pharmacymaster..v_pm_allwithaffiliates 
where aapaccountno is not null and aapaccountno != '' and ( aapquitdate >= @in_date or aapquitdate is null)
and aapeffectivedate <= @in_date

--UNION

--select AccountName,	Addr1,	Addr2,	City,	State,	Zip,	OwnerName as ContactFullName,	Phone,	Fax	,AAPAccountNo,	DEA	,NCPDP,	NPI from pharmacymaster..v_pm_allwithaffiliates
--where affiliate in('Pipco', 'PIPCo - 2' )and accountdescription = 'Affiliate Group Member'
--and aapaccountno != '' and ( aapquitdate >= @in_date  or aapquitdate is null)
--and aapeffectivedate <= @in_date
--order by accountname


--SELECT  AccountName,	Addr1,	Addr2,	City,	State,	Zip,	ContactFullName,	Phone,	Fax	,
--AAPAccountNo,	DEA	,NCPDP,	NPI from pharmacymaster..v_pm_allwithaffiliates where (( affiliate not like
--('%Keystone%') and affiliate not like('%PFOA%') and affiliate not like('%Pipco%')
--and affiliate not like '%RxPlus%') or affiliate is null)
--and aapaccountno is not null and aapaccountno != '' and   aapquitdate is null 
--order by accountname


END

		 








GO
