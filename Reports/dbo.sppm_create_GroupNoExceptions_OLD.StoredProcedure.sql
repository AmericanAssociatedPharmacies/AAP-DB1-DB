USE [Reports]
GO
/****** Object:  StoredProcedure [dbo].[sppm_create_GroupNoExceptions_OLD]    Script Date: 12/22/2020 5:00:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		< Joni Wilson>
-- Create date: <06/16/2011>
-- Description:	Exceptions for Groups
-- =============================================
CREATE PROCEDURE [dbo].[sppm_create_GroupNoExceptions_OLD]
 

AS
BEGIN

		 IF EXISTS(SELECT name FROM sys.tables
			 WHERE name = 'PMGroupNoExceptions')
		 BEGIN
          TRUNCATE TABLE PMGroupNoExceptions
         END

 --This will find any that have a GroupNo but no AAPAarentNo - to make sure it got it's groupNo in the orginal file or form the CH_Accounts_ADJ


--- INSERT
INSERT into PMGroupNoExceptions (PMID,AccountName,AAPEFfectiveDate,AAPQuitDate,AAPAccountNo,AAPParentNo,APIAccountNo,APIStatus,[PM GroupNo],
 [Original GroupNo],[CHAccounts GroupNo],Reason,VerifiedAsOK)

SELECT PMID,AccountName,AAPEFfectiveDate,AAPQuitDate,AAPAccountNo,AAPParentNo,APIAccountNo,APIStatus,[PM GroupNo],
 [Original GroupNo],[CHAccounts GroupNo],Reason,VerifiedAsOK
FROM
( 
	SELECT  p.PMID,AccountName,AAPEFfectiveDate,AAPQuitDate,p.AAPAccountNo, p.AAPParentNo,p.APIAccountNo, p.APIStatus,
	p.GroupNo as [PM GroupNo],c.GroupNo as [Original GroupNo],a.MultipleStoreCode as [CHAccounts GroupNo],
	cast ('Has PM GroupNo but no AAPParentNo and not in Original or CH Account tables' as varchar(200)) as Reason ,
	cast ('' as varchar(200) ) as VerifiedAsOK
	 from pharmacymaster..pm_Pharmacy p
	left outer join
	(
	 SELECT APIAccountNo,GroupNo from reports..tmp_ContribGroup where GroupNo != ''
	)c
	on p.APIAccountno = c.APIAccountNo
	left outer join 
	( SELECT * from pharmacymaster..pm_chaccounts_adj ) a
	on p.pmid = a.pmid

	where (p.aapparentno is null or p.aapparentno = '') and p.groupno is not null
--	 and (p.groupNo != c.groupNo and p.groupNo ! = a.MultipleStoreCode) --Changed the or to an and in between paranthesis jmw 06/13/12
	 and (p.groupNo ! = a.MultipleStoreCode) --Changed the or to an and in between paranthesis jmw 06/13/12

) ch
 
WHERE not exists  (select pmid from PMGroupNoExceptions where pmid = ch.pmid and 
					IsNull(AAPAccountNo,'') = IsNull(ch.AAPAccountNo,'') and 
					IsNull(AAPParentNo,'') = IsNull(ch.AAPParentNo,'') and
					IsNull([PM GroupNo],'') = IsNull(ch.[PM GroupNo],'') and
					IsNull([Original GroupNo],'') = IsNull(ch.[Original GroupNo],'') and
					IsNull([CHAccounts GroupNo],'') = IsNull(ch.[CHAccounts GroupNo],'') );

--- Where aapparentNo is not null but Group No is null
--- INSERT
INSERT into PMGroupNoExceptions (PMID,AccountName,AAPEFfectiveDate,AAPQuitDate,AAPAccountNo,AAPParentNo,APIAccountNo,APIStatus,[PM GroupNo],
 [Original GroupNo],[CHAccounts GroupNo],Reason,VerifiedAsOK)

SELECT PMID,AccountName,AAPEFfectiveDate,AAPQuitDate,AAPAccountNo,AAPParentNo,APIAccountNo,APIStatus,[PM GroupNo],
 [Original GroupNo],[CHAccounts GroupNo],Reason,VerifiedAsOK
FROM
( 
	SELECT  p.PMID,AccountName,AAPEFfectiveDate,AAPQuitDate,p.AAPAccountNo, p.AAPParentNo,p.APIAccountNo, p.APIStatus,
	p.GroupNo as [PM GroupNo],c.GroupNo as [Original GroupNo],a.MultipleStoreCode as [CHAccounts GroupNo],
	cast ('AAPParentNo Not null but GroupNo is null' as varchar(200)) as Reason ,
	cast ('' as varchar(200) ) as VerifiedAsOK
	 from pharmacymaster..pm_Pharmacy p
	left outer join
	(
	 SELECT APIAccountNo,GroupNo from reports..tmp_ContribGroup where GroupNo != ''
	)c
	on p.APIAccountno = c.APIAccountNo
	left outer join 
	( SELECT * from pharmacymaster..pm_chaccounts_adj ) a
	on p.pmid = a.pmid

	where (p.aapparentno is not null and p.aapparentno != '') and p.groupno is   null
) ch
 
WHERE not exists  (select pmid from PMGroupNoExceptions where pmid = ch.pmid and 
					IsNull(AAPAccountNo,'') = IsNull(ch.AAPAccountNo,'') and 
					IsNull(AAPParentNo,'') = IsNull(ch.AAPParentNo,'') and
					IsNull([PM GroupNo],'') = IsNull(ch.[PM GroupNo],'') and
					--IsNull([Original GroupNo],'') = IsNull(ch.[Original GroupNo],'') and
					IsNull([CHAccounts GroupNo],'') = IsNull(ch.[CHAccounts GroupNo],'') );



--Listing where PM GroupNo not null but not equal to anything it should be 

--- INSERT
INSERT into PMGroupNoExceptions (PMID,AccountName,AAPEFfectiveDate,AAPQuitDate,AAPAccountNo,AAPParentNo,APIAccountNo,APIStatus,[PM GroupNo],
 [Original GroupNo],[CHAccounts GroupNo],Reason,VerifiedAsOK)

SELECT PMID,AccountName,AAPEFfectiveDate,AAPQuitDate,AAPAccountNo,AAPParentNo,APIAccountNo,APIStatus,[PM GroupNo],
 [Original GroupNo],[CHAccounts GroupNo],Reason,VerifiedAsOK
FROM
( 
	SELECT  p.PMID,AccountName,AAPEFfectiveDate,AAPQuitDate,p.AAPAccountNo, p.AAPParentNo,p.APIAccountNo, p.APIStatus,
	p.GroupNo as [PM GroupNo],c.GroupNo as [Original GroupNo],a.MultipleStoreCode as [CHAccounts GroupNo],
	cast ('PMGroupNo has a value but doesn''t match AAPParentNo   or CH Account table value' as varchar(200)) as Reason ,
	cast ('' as varchar(200) ) as VerifiedAsOK
	 from  pharmacymaster..pm_Pharmacy p
	left outer join
	(
	 SELECT APIAccountNo,GroupNo from reports..tmp_ContribGroup where GroupNo != ''
	)c
	on p.APIAccountno = c.APIAccountNo
	left outer join 
	( SELECT * from  pharmacymaster..pm_chaccounts_adj ) a
	on p.pmid = a.pmid
	 
	where   p.groupno is  not null  and (  
	case when p.groupno is null then '' else p.groupno end !=  
	case when p.aapparentno is null then '' else p.aapparentno end 
	and
--	case when p.groupno is null then '' else p.groupno end !=  
--	case when c.groupno is null then '' else c.groupno end 
--	and  
	case when p.groupno is null then '' else p.groupno end !=  
	case when a.MultipleStoreCode is null then '' else a.MultipleStoreCode  end )

) ch
 
WHERE not exists  (select pmid from PMGroupNoExceptions where pmid = ch.pmid and 
					IsNull(AAPAccountNo,'') = IsNull(ch.AAPAccountNo,'') and 
					IsNull(AAPParentNo,'') = IsNull(ch.AAPParentNo,'') and
					IsNull([PM GroupNo],'') = IsNull(ch.[PM GroupNo],'') and
				--	IsNull([Original GroupNo],'') = IsNull(ch.[Original GroupNo],'') and
					IsNull([CHAccounts GroupNo],'') = IsNull(ch.[CHAccounts GroupNo],'') );



-- AAPParentNo but No AAPAccountNo and the PM GroupNo not equal to Original File GroupNo PM GroupNO not equal to CH Accounts table
--- INSERT
INSERT into PMGroupNoExceptions (PMID,AccountName,AAPEFfectiveDate,AAPQuitDate,AAPAccountNo,AAPParentNo,APIAccountNo,APIStatus,[PM GroupNo],
 [Original GroupNo],[CHAccounts GroupNo],Reason,VerifiedAsOK)

SELECT PMID,AccountName,AAPEFfectiveDate,AAPQuitDate,AAPAccountNo,AAPParentNo,APIAccountNo,APIStatus,[PM GroupNo],
 [Original GroupNo],[CHAccounts GroupNo],Reason,VerifiedAsOK
FROM
( 
	SELECT  p.PMID,AccountName,AAPEFfectiveDate,AAPQuitDate,p.AAPAccountNo, p.AAPParentNo,p.APIAccountNo, p.APIStatus,
	p.GroupNo as [PM GroupNo],c.GroupNo as [Original GroupNo],a.MultipleStoreCode as [CHAccounts GroupNo],
	cast ('AAPParentNo has a value but no  AAPAccountNo and PM Group No not equal   CH Account table value' as varchar(200)) as Reason ,
	cast ('' as varchar(200) ) as VerifiedAsOK
	 from pharmacymaster..pm_Pharmacy p
	left outer join
	(
	 SELECT APIAccountNo,GroupNo from reports..tmp_ContribGroup where GroupNo != ''
	)c
	on p.APIAccountno = c.APIAccountNo
	left outer join 
	( SELECT * from pharmacymaster..pm_chaccounts_adj ) a
	on p.pmid = a.pmid

	where (p.aapaccountno is null or p.aapaccountno = '') 
	and (p.aapparentno is not null and p.aapparentno != '') and 
	case when p.groupno is null then '' else p.groupno end !=  
	case when c.groupno is null then '' else c.groupno end 
	and  
	case when p.groupno is null then '' else p.groupno end !=  
	case when a.MultipleStoreCode is null then '' else a.MultipleStoreCode  end  
) ch
 
WHERE not exists  (select pmid from PMGroupNoExceptions where pmid = ch.pmid and 
					IsNull(AAPAccountNo,'') = IsNull(ch.AAPAccountNo,'') and 
					IsNull(AAPParentNo,'') = IsNull(ch.AAPParentNo,'') and
					IsNull([PM GroupNo],'') = IsNull(ch.[PM GroupNo],'') and
					IsNull([Original GroupNo],'') = IsNull(ch.[Original GroupNo],'') and
					IsNull([CHAccounts GroupNo],'') = IsNull(ch.[CHAccounts GroupNo],'') );

-- Where there is something in the Cardinal Account table but not PharmacyMaster

--- INSERT
INSERT into PMGroupNoExceptions (PMID,AccountName,AAPEFfectiveDate,AAPQuitDate,AAPAccountNo,AAPParentNo,APIAccountNo,APIStatus,[PM GroupNo],
 [Original GroupNo],[CHAccounts GroupNo],Reason,VerifiedAsOK)
SELECT PMID,AccountName,AAPEFfectiveDate,AAPQuitDate,AAPAccountNo,AAPParentNo,APIAccountNo,[PM GroupNo],APIStatus,
 [Original GroupNo],[CHAccounts GroupNo],Reason,VerifiedAsOK
FROM
( 
	SELECT  p.PMID,AccountName,AAPEFfectiveDate,AAPQuitDate,p.AAPAccountNo, p.AAPParentNo,p.APIAccountNo, p.APIStatus,
	p.GroupNo as [PM GroupNo],c.GroupNo as [Original GroupNo],a.MultipleStoreCode as [CHAccounts GroupNo],
	cast ('CH Account has a value but no PM Group (Check to see if Paul had us remove these and Cardinal file hasn''t been updated yet)' as varchar(200)) as Reason ,
	cast ('' as varchar(200) ) as VerifiedAsOK
	 from pharmacymaster..pm_chaccounts_adj a
	 join 
	(SELECT * from  pharmacymaster..pm_pharmacy where groupno is null or groupno = '')
	p
	on a.pmid = p.pmid
	left outer join
	(
	 SELECT APIAccountNo,GroupNo from reports..tmp_ContribGroup where GroupNo != ''
	)c
	on p.APIAccountno = c.APIAccountNo
	where  a.MultipleStoreCode is not null or  a.MultipleStoreCode != ''
) ch
 
WHERE not exists  (select pmid from PMGroupNoExceptions where pmid = ch.pmid and 
					IsNull(AAPAccountNo,'') = IsNull(ch.AAPAccountNo,'') and 
					IsNull(AAPParentNo,'') = IsNull(ch.AAPParentNo,'') and
					IsNull([PM GroupNo],'') = IsNull(ch.[PM GroupNo],'') and
					IsNull([Original GroupNo],'') = IsNull(ch.[Original GroupNo],'') and
					IsNull([CHAccounts GroupNo],'') = IsNull(ch.[CHAccounts GroupNo],'') );

-- Now we need to remove any that meet this criteria :
-- If business class = C23 then they are "PIC"
--if business class = C24 then they are "7010"



UPDATE PMGroupNoExceptions set AAPAccountNo = '' where AAPAccountNo is null;
UPDATE PMGroupNoExceptions set AAPParentNo = '' where AAPParentNo is null;
UPDATE PMGroupNoExceptions set [PM GroupNo] = '' where [PM GroupNo] is null;
UPDATE PMGroupNoExceptions set [Original GroupNo] = '' where [Original GroupNo] is null;
UPDATE PMGroupNoExceptions set [CHAccounts GroupNo] = '' where [CHAccounts GroupNo] is null;

--Listing of all Groups

--SELECT  p.PMID,AccountName,AAPEFfectiveDate,AAPQuitDate,p.AAPAccountNo, p.AAPParentNo,p.APIAccountNo, 
--p.GroupNo as [PM GroupNo],c.GroupNo as [Original GroupNo],a.MultipleStoreCode as [CHAccounts GroupNo] from pharmacymaster..pm_Pharmacy p
--left outer join
--(
-- SELECT APIAccountNo,GroupNo from reports..tmp_ContribGroup where (GroupNo != '' or GroupNo is not null)
--)c
--on p.APIAccountno = c.APIAccountNo
--left outer join 
--( SELECT * from pharmacymaster..pm_chaccounts_adj ) a
--on p.pmid = a.pmid
--
--where   p.groupno is  not null order by p.groupno


END










GO
