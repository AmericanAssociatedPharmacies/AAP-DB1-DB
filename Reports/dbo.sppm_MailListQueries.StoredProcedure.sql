USE [Reports]
GO
/****** Object:  StoredProcedure [dbo].[sppm_MailListQueries]    Script Date: 12/22/2020 5:00:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		< Joni Wilson>
-- Create date: <07/07/2011>
-- Description:	Create table for Report Card Rebate for Wayne
-- =============================================
CREATE PROCEDURE [dbo].[sppm_MailListQueries]
 
AS
BEGIN

-- AAP Active Members List Only
 
select * from pharmacymaster..v_Address_Mailing_ListGen_NEW_PM p
where aapaccountno is not null and aapquitdate is null


-- AAP Active Members and NPP List Only
 
select * from pharmacymaster..v_Address_Mailing_ListGen_NEW_PM p
where (aapaccountno is not null and aapquitdate is null) or isnpp = -1

--  NPP List Only
 
select * from pharmacymaster..v_Address_Mailing_ListGen_NEW_PM p
where isnpp = -1


--API Only 
select * from pharmacymaster..v_Address_Mailing_ListGen_NEW_PM p
 
  where apiaccountno is not null and apistatus in ( 'active','suspended')   and apiaccountno not like '%-%'  

-- Nothing checked (will pull aap active members and api whose status is either active or suspended
select * from pharmacymaster..v_Address_Mailing_ListGen_NEW_PM p
 where (aapaccountno is not null and aapquitdate is null)
  or ( apiaccountno is not null and apistatus in ( 'active','suspended')   and apiaccountno not like '%-%'  )

-- AAP Active Members that are Pipco List Only
 
select * from pharmacymaster..v_Address_Mailing_ListGen_NEW_PM p
where aapaccountno is not null and aapquitdate is null and     
 pmid in (  select p.pmid from pharmacymaster.. pm_pharmacy p
  join  (  select * from  pharmacymaster..pm_groups_xref   where group_id in (54)) x on x.pmid = p.pmid )

--Nothing Selected in first column and Pipco (will include affiliate group members)

 SELECT  distinct PMID, Source, AccountName, MCEffectiveDate,AAPEffectiveDate, Addr1,   Addr2, City, State, Zip, ContactFullName,  Territory, Phone,  Fax, Email, Status, BusinessClass, AAPAccountNo, AAPParentNo, APIAccountNo,   ChainCode,GroupID, aapstatus, apistatus,group_name ,mcquitdate,dea,ncpdp,npi,statelicno,computersoftware,GroupNo,StateMedicaidNo,StateLicExpDate,DEAExp,FedID 
 from pharmacymaster..v_Address_Mailing_ListGen_NEW_PM 
 WHERE   ( (aapaccountno is not null and aapquitdate is null) or 
( apiaccountno is not null and apistatus in ( 'active','suspended')  and apiaccountno not like '%-%') 
or (aapaccountno is null  and accountdescription = 'Affiliate Group Pharmacy')) and
   (    pmid in (  select p.pmid from pharmacymaster..pm_pharmacy p  
join  (  select * from pharmacymaster..pm_groups_xref   where group_id in (54)) x on x.pmid = p.pmid ))



  --Miami Luken and another group/affiliate(Pipco in this case) and AAPMembers is checked

select * from pharmacymaster..v_Address_Mailing_ListGen_NEW_PM p
where aapaccountno is not null and aapquitdate is null
and ((   
 pmid in (  select p.pmid from pharmacymaster..pm_pharmacy p
  join  (  select * from pharmacymaster..pm_groups_xref   where group_id in (54)) x on x.pmid = p.pmid ))
  or 
(pmid  in (select pmid from  pharmacymaster..PM_VendorAccts where vendorid = 44 and aapaccountno is not null
   and aapaccountno != ''	and aapquitdate is   null)) )

--Miami Luken and another group/affiliate and nothing checked 
 SELECT  distinct PMID, Source, AccountName, MCEffectiveDate,AAPEffectiveDate, Addr1,   Addr2, City, State, Zip, ContactFullName, 
 Territory, Phone,  Fax, Email, Status, BusinessClass, AAPAccountNo, AAPParentNo, APIAccountNo,   ChainCode,GroupID,
 aapstatus, apistatus,group_name ,mcquitdate,dea,ncpdp,npi,statelicno,computersoftware,GroupNo,StateMedicaidNo,
StateLicExpDate,DEAExp,FedID  from pharmacymaster..v_Address_Mailing_ListGen_NEW_PM 
 WHERE   ( (aapaccountno is not null and aapquitdate is null)
 or ( apiaccountno is not null and apistatus in ( 'active','suspended')and apiaccountno not like '%-%'  ) 
or (aapaccountno is null  and accountdescription = 'Affiliate Group Pharmacy')) and
     (    pmid in (  select p.pmid from pharmacymaster..pm_pharmacy p 
 join  (  select * from pharmacymaster..pm_groups_xref   where group_id in (54)) x on x.pmid = p.pmid ))
  or
 (pmid  in (select pmid from pharmacymaster..PM_VendorAccts where vendorid = 44 and aapaccountno is not null 
and aapaccountno != ''	and aapquitdate is   null))  


--Pipco that are Managed Care - AAP Members selected
 
select * from pharmacymaster..v_Address_Mailing_ListGen_NEW_PM p
where aapaccountno is not null and aapquitdate is null
and     
 pmid in (  select p.pmid from pharmacymaster..pm_pharmacy p
  join  (  select * from pharmacymaster..pm_groups_xref   where group_id in (54)) x on x.pmid = p.pmid )
and (( ChainCode is not null and mcquitdate is null 
and aapaccountno is not null and aapaccountno != '' and aapquitdate is null ) or isnpp = -1 )  
 
--Miami Luken and Managed Care - nothing checked
 SELECT  distinct PMID, Source, AccountName, MCEffectiveDate,AAPEffectiveDate, Addr1,   Addr2, City, State, Zip, ContactFullName,  Territory, Phone,  Fax, Email, Status, BusinessClass, AAPAccountNo, AAPParentNo, APIAccountNo,   ChainCode,GroupID, aapstatus, apistatus,group_name ,mcquitdate,dea,ncpdp,npi,statelicno,computersoftware,GroupNo,StateMedicaidNo,StateLicExpDate,DEAExp,FedID  from pharmacymaster..v_Address_Mailing_ListGen_NEW_PM 
 WHERE   ( (aapaccountno is not null and aapquitdate is null) or ( apiaccountno is not null 
and apistatus in ( 'active','suspended')  and apiaccountno not like '%-%') )
AND     pmid  in (select pmid from pharmacymaster..PM_VendorAccts where vendorid = 44 and aapaccountno is not null
 and aapaccountno != ''	and aapquitdate is   null)
 AND ( ( ChainCode is not null and mcquitdate is null and aapaccountno is not null and
 aapaccountno != '' and aapquitdate is null ) or isnpp = -1 )

--Miami Luken and multipe other groups/affilaites (not Bashas) -- AAP Members only
--7 Keystone
--10 Legend-la&ms
--99 PFOA
--103 -- RxPlus

select * from pharmacymaster..v_Address_Mailing_ListGen_NEW_PM p
where aapaccountno is not null and aapquitdate is null
and (   
 pmid in (  select p.pmid from pharmacymaster..pm_pharmacy p
  join  (  select * from pharmacymaster..pm_groups_xref   where group_id in (7,99,10,103)) x on x.pmid = p.pmid ))
  or 
(pmid  in (select pmid from pharmacymaster..PM_VendorAccts where vendorid = 44 and aapaccountno is not null
   and aapaccountno != ''	and aapquitdate is   null))  

--Miami Luken and multipe other groups/affilaites (not Bashas) -- AAP and API -- need to
-- pull in affiliate group members here 
 

select * from pharmacymaster..v_Address_Mailing_ListGen_NEW_PM p
 WHERE   ( (aapaccountno is not null and aapquitdate is null)
 or ( apiaccountno is not null and apistatus in ( 'active','suspended')and apiaccountno not like '%-%'  ) 
or (aapaccountno is null  and accountdescription = 'Affiliate Group Pharmacy')) and
 pmid in (  select p.pmid from pharmacymaster..pm_pharmacy p
  join  (  select * from pharmacymaster..pm_groups_xref   where group_id in (7,99,10,103)) x on x.pmid = p.pmid )
  or 
(pmid  in (select pmid from pharmacymaster..PM_VendorAccts where vendorid = 44 and aapaccountno is not null
   and aapaccountno != ''	and aapquitdate is   null))  

--Miami Luken and multiple other groups/affiliates -- aap an api (nothing checked) and managed care
 SELECT  distinct PMID, Source, AccountName, MCEffectiveDate,AAPEffectiveDate, Addr1,   Addr2, City, State, Zip,
 ContactFullName,  Territory, Phone,  Fax, Email, Status, BusinessClass, AAPAccountNo, AAPParentNo, APIAccountNo,
   ChainCode,GroupID, aapstatus, apistatus,group_name ,mcquitdate,dea,ncpdp,npi,statelicno,computersoftware,GroupNo,
StateMedicaidNo,StateLicExpDate,DEAExp,FedID  from pharmacymaster..v_Address_Mailing_ListGen_NEW_PM 
 WHERE   ( (aapaccountno is not null and aapquitdate is null) or
 ( apiaccountno is not null and apistatus in ( 'active','suspended')  and apiaccountno not like '%-%') 
 or (aapaccountno is null  and accountdescription = 'Affiliate Group Pharmacy')) 
and   (    pmid in (  select p.pmid from pharmacymaster..pm_pharmacy p  
join  (  select * from pharmacymaster..pm_groups_xref   where group_id in (7,99,10,103)) x on x.pmid = p.pmid )  
or (pmid  in (select pmid from pharmacymaster..PM_VendorAccts where vendorid = 44 and aapaccountno is not null
 and aapaccountno != ''	and aapquitdate is   null)) )
  and (( ChainCode is not null and mcquitdate is null and aapaccountno is not null 
and aapaccountno != '' and aapquitdate is null ) or isnpp = -1 ) 

--API Only and Pipco
select * from pharmacymaster..v_Address_Mailing_ListGen_NEW_PM p 
  where apiaccountno is not null and apistatus in ( 'active','suspended')   and apiaccountno not like '%-%'  
 and pmid in (  select p.pmid from pharmacymaster..pm_pharmacy p
  join  (  select * from pharmacymaster..pm_groups_xref   where group_id in (54)) x on x.pmid = p.pmid )

--API and keystone

select * from pharmacymaster..v_Address_Mailing_ListGen_NEW_PM p 
  where apiaccountno is not null and apistatus in ( 'active','suspended')   and apiaccountno not like '%-%'  
 and pmid in (  select p.pmid from pharmacymaster..pm_pharmacy p
  join  (  select * from pharmacymaster..pm_groups_xref   where group_id in (7)) x on x.pmid = p.pmid )
 




-- API multiple groups and Miami Luken
--7 Keystone
--10 Legend-la&ms
--99 PFOA
--103 -- RxPlus
select * from pharmacymaster..v_Address_Mailing_ListGen_NEW_PM p
where    
 ( apiaccountno is not null and apistatus in ( 'active','suspended')and apiaccountno not like '%-%'   )
and ((   
 pmid in (  select p.pmid from pharmacymaster..pm_pharmacy p
  join  (  select * from pharmacymaster..pm_groups_xref   where group_id in (7,99,10,103)) x on x.pmid = p.pmid ))
  or 
(pmid  in (select pmid from pharmacymaster..PM_VendorAccts where vendorid = 44 and aapaccountno is not null
   and aapaccountno != ''	and aapquitdate is   null)) )

------ These all need to be redone
--Bashas only
--select * from v_Address_Mailing_ListGen_NEW_PM p
-- 
--where pmid  in (select pmid from dbo.PM_Pharmacy where groupno = '11377' and (isNpp = -1 or isNpp = 1 ))
--
----Bashas and Keystone -   AAP Members 
--
--select * from v_Address_Mailing_ListGen_NEW_PM p
-- where (aapaccountno is not null and aapquitdate is null
--and     
-- pmid in (  select p.pmid from pm_pharmacy p
--  join  (  select * from pm_groups_xref   where group_id in (7)) x on x.pmid = p.pmid ))
--or pmid  in (select pmid from dbo.PM_Pharmacy where groupno = '11377' and (isNpp = -1 or isNpp = 1 ))
--
--
---- bashas and other stores and nothing selected in first list
--
-- SELECT  distinct PMID, Source, AccountName, MCEffectiveDate,AAPEffectiveDate, Addr1,   Addr2, City, State, Zip, ContactFullName,  Territory, Phone,  Fax, Email, Status, BusinessClass, AAPAccountNo, AAPParentNo, APIAccountNo,   ChainCode,GroupID, aapstatus, apistatus,group_name ,mcquitdate,dea,ncpdp,npi,statelicno,computersoftware,GroupNo,StateMedicaidNo,StateLicExpDate,DEAExp,FedID  from v_Address_Mailing_ListGen_NEW_PM 
-- WHERE   ( (aapaccountno is not null and aapquitdate is null) or ( apiaccountno is not null and apistatus in ( 'active','suspended')  and apiaccountno not like '%-%') )
-- and   (    pmid in (  select p.pmid from pm_pharmacy p 
-- join  (  select * from pm_groups_xref   where group_id in (7,10,103)) x on x.pmid = p.pmid ) )
-- or pmid  in (select pmid from dbo.PM_Pharmacy where groupno = '11377' and (isNpp = -1 or isNpp = 1 )) 
--
---- bashas and other stores and AAP Members selected
--
-- SELECT  distinct PMID, Source, AccountName, MCEffectiveDate,AAPEffectiveDate, Addr1,   Addr2, City, State, Zip, ContactFullName,  Territory, Phone,  Fax, Email, Status, BusinessClass, AAPAccountNo, AAPParentNo, APIAccountNo,   ChainCode,GroupID, aapstatus, apistatus,group_name ,mcquitdate,dea,ncpdp,npi,statelicno,computersoftware,GroupNo,StateMedicaidNo,StateLicExpDate,DEAExp,FedID  from v_Address_Mailing_ListGen_NEW_PM  
--WHERE    (( aapaccountno is not null and aapquitdate is null )
-- and (    pmid in (  select p.pmid from pm_pharmacy p  
--join  (  select * from pm_groups_xref   where group_id in (7,10,103)) x on x.pmid = p.pmid )))
-- or  pmid  in (select pmid from dbo.PM_Pharmacy where groupno = '11377' and (isNpp = -1 or isNpp = 1 ))
--
--
----QeuryI need to use for AAP selected and Bashas - not working yet
--
-- SELECT  distinct PMID, Source, AccountName, MCEffectiveDate,AAPEffectiveDate, Addr1,   Addr2, City, State, Zip,
-- ContactFullName,  Territory, Phone,  Fax, Email, Status, BusinessClass, AAPAccountNo, AAPParentNo, APIAccountNo,
--   ChainCode,GroupID, aapstatus, apistatus,group_name ,mcquitdate,dea,ncpdp,npi,statelicno,computersoftware,GroupNo,
--StateMedicaidNo,StateLicExpDate,DEAExp,FedID  from v_Address_Mailing_ListGen_NEW_PM  W
--wHERE   (( aapaccountno is not null and aapquitdate is null)  
-- or pmid  in (select pmid from dbo.PM_Pharmacy where groupno = '11377' and (isNpp = -1 or isNpp = 1 )))
--
----AAP Members only
--select * from pm_pharmacy where aapaccountno is not null and aapquitdate is null 
--
--
--select * from pm_pharmacy where isNpp = -1 or isNpp = 1
--
--select * from pm_pharmacy where (isNpp = -1 or isNpp = 1) or(aapaccountno is not null and aapquitdate is null )

END








GO
