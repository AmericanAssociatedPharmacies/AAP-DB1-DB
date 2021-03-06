USE [AAP]
GO
/****** Object:  StoredProcedure [dbo].[spaap_QA_Member_Customer_Affiliates]    Script Date: 12/22/2020 4:10:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		< Joni Wilson>
-- Create date: <08/29/2008>
-- Description:	Truncate PMUpdate_Active_staging table
-- =============================================
CREATE PROCEDURE [dbo].[spaap_QA_Member_Customer_Affiliates]

AS
	BEGIN
 
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
  
-- To get a seperateList just uncomment the where Affiliate = and put in the group you want
	
--SELECT AccountName,AAPAccountNo,APIAccountNo,UDAccountNo,City,State,Territory,Affiliate
--				from(
--
--					select pm.AccountName,pm.AAPAccountNo,pm.APIAccountNo ,pm.UDAccountNo,
--					  pm.City,pm.State,pm.Territory,api.description as Affiliate  from aap..pharmacymaster pm 
--					left outer join 
--					(select description ,buscls from api..apibuscls_chg ) api
--					on pm.businessclass = api.buscls
--
--					where   pm.businessclass   in 
--					(
--					'C02',   
--					'C14',  
--					'C16',   
--					'C17',   
--					'C18',  
--					'C19' 
--					)   and pm.apistatus = 'active'  
--					Union 
--
--					select pm.AccountName,pm.AAPAccountNo,pm.APIAccountNo ,pm.UDAccountNo,
--					  pm.City,pm.State,pm.Territory, aap.affiliategroupname as Affiliate  from aap..pharmacymaster pm 
--					join 
--					(select  ag.affiliategroupname,ap.accountid,ap.aapid from aap..AAPAccountAffiliateGroup apag
--					 left outer join aap..aapaffiliategroup ag on 
--					apag.AffiliateGroupID = ag.AffiliateGroupID 
--					left outer join aap..aapaccount ap on
--					apag.accountid = ap.accountid) aap
--					on pm.aapaccountno = aap.aapid
--					)tmp
----where Affiliate ='Keystone'
--order by affiliate,aapaccountno desc

select tmpw.*,aap.aapaffiliate as AAP_Affiliate,api.apiaffiliate as API_Affilaite from (
SELECT AccountName,AAPAccountNo,APIAccountNo,UDAccountNo,DEA,City,State,Territory 
				from(

					select pm.AccountName,pm.AAPAccountNo,pm.APIAccountNo ,pm.UDAccountNo,pm.DEA,
					  pm.City,pm.State,pm.Territory from aap..pharmacymaster pm 
					left outer join 
					(select description ,buscls from api..apibuscls_chg ) api
					on pm.businessclass = api.buscls

					where   pm.businessclass   in 
					(
					'C02',   
					'C14',  
					'C16',   
					'C17',   
					'C18',  
					'C19' 
					)   and pm.apistatus != 'closed'  
					Union  

					select pm.AccountName,pm.AAPAccountNo,pm.APIAccountNo ,pm.UDAccountNo,pm.DEA,
					  pm.City,pm.State,pm.Territory  from aap..pharmacymaster pm 
					join 
					(select  ag.affiliategroupname,ap.accountid,ap.aapid from aap..AAPAccountAffiliateGroup apag
					 left outer join aap..aapaffiliategroup ag on 
					apag.AffiliateGroupID = ag.AffiliateGroupID 
					left outer join aap..aapaccount ap on
					apag.accountid = ap.accountid) aap
					on pm.aapaccountno = aap.aapid
					)tmp
)tmpw
left outer join 
(
select pm.AccountName,pm.AAPAccountNo,pm.APIAccountNo ,pm.UDAccountNo,
					 api.description as APIAffiliate   from aap..pharmacymaster pm 
					left outer join 
					(select description ,buscls from api..apibuscls_chg ) api
					on pm.businessclass = api.buscls

					where   pm.businessclass   in 
					(
					'C02',   
					'C14',  
					'C16',   
					'C17',   
					'C18',  
					'C19' 
					)   and pm.apistatus != 'closed'  
) api
on tmpw.apiaccountno = api.apiaccountno
left outer join
(
    select pm.AccountName,pm.AAPAccountNo,pm.APIAccountNo ,pm.UDAccountNo,
					  pm.City,pm.State,pm.Territory, aap.affiliategroupname as AAPAffiliate  from aap..pharmacymaster pm 
					join 
					(select  ag.affiliategroupname,ap.accountid,ap.aapid from aap..AAPAccountAffiliateGroup apag
					 left outer join aap..aapaffiliategroup ag on 
					apag.AffiliateGroupID = ag.AffiliateGroupID 
					left outer join aap..aapaccount ap on
					apag.accountid = ap.accountid) aap
					on pm.aapaccountno = aap.aapid
) aap
 on tmpw.aapaccountno = aap.aapaccountno
where(apiaffiliate = 'pipco' or aapaffiliate = 'pipco')  -- these will change depending on what Group you want to see
order by tmpw.aapaccountno desc

--For Managed Care participants

select pm.AccountName,pm.AAPAccountNo,pm.APIAccountNo ,pm.UDAccountNo,
				  pm.City,pm.State,pm.Territory,pm.ChainCode  from aap..pharmacymaster pm 
				  where aapquitdate is null and udquitdate is null and chaincode is not null
order by chaincode


    END









GO
