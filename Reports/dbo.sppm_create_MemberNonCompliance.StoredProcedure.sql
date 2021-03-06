USE [Reports]
GO
/****** Object:  StoredProcedure [dbo].[sppm_create_MemberNonCompliance]    Script Date: 12/22/2020 5:00:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		< Joni Wilson>
-- Create date: <03/29/2010>
-- Description:	Create table to use for load to THIS USES BRUCES FUNCTION *******************88
-- =============================================
CREATE PROCEDURE [dbo].[sppm_create_MemberNonCompliance]
 
AS
BEGIN


--Create the table with Active members
drop table tmp_memNonCompAll

select * into tmp_memNonCompAll from (
SELECT p.PMID,p.AccountName,p.AAPAccountNo,p.City,p.State,p.Territory as TM,p.AAPEffectiveDate,p.AAPQuitDate,p.APIAccountNo,
case when p.APIStatus = 'ACTIVE' then 'Yes' else 'No' end as [Warehouse Status] ,
case when  c.pmid is not null then 'Yes' else null end as [Cardinal/ML Status],
case when  p.chaincode is not null and p.mcquitdate is null then 'Yes' else 'No' end as[Is ManagedCare],
cast(0 as numeric(18,2)) as [Warehouse Volume],
cast(0 as numeric(18,2)) as [Cardinal Volume],
cast(0 as numeric(18,2)) as [Miami-Luken Volume],

p.Affiliate 
 from pharmacymaster..v_PM_AllWithAffiliates p

left outer join
(select pmid from pharmacymaster..pm_chaccounts_adj union select pmid from pharmacymaster..pm_chaccounts_bas) c
on p.pmid = c.pmid
where   p.aapaccountno is not null and p.aapaccountno != ''  and p.aapquitdate is null
) ch


 

-- UPDATE with Cardinal Volume
update nc set 
   [Cardinal Volume] = aapnetsales
         from tmp_memNonCompAll nc
    inner join
	  ( select aapnetsales,pmid from pharmacymaster..all_volume where month(date) = 03 and year(date) = 2011 ) v
			on nc.pmid = v.pmid 

-- UPDATE with Warehouse Volume
update nc set 
   [Warehouse Volume] = whapitotal
         from tmp_memNonCompAll nc
    inner join
	  ( select whapitotal,pmid from pharmacymaster..all_volume where month(date) = 03 and year(date) = 2011 ) v
			on nc.pmid = v.pmid 

---Update with ML Status

update nc set 
   [Cardinal/ML Status] = 'Yes'
         from tmp_memNonCompAll nc
    inner join (select vendor,pmid from pharmacymaster..v_wholesaler_primary where vendor = 'ML' )w
            on nc.pmid=w.pmid

--Update where ML and Cardinal are not yes to no

update tmp_memNonCompAll set  [Cardinal/ML Status] = 'No' where  [Cardinal/ML Status] is null

--Update with Bashas Volume

update nc set 
   [Cardinal Volume] = extsales
         from tmp_memNonCompAll nc
    inner join (select extsales,pmid from reports..ch_bashas where month(date) = 03 and year(date) = 2011)b
            on nc.pmid=b.pmid

--Update with Miami-Luken Volume

update nc set 
   [Miami-Luken Volume] = mltotal
         from tmp_memNonCompAll nc
    inner join (select mltotal,m.pmid from pharmacymaster..all_volume m
                join(select  pmid from pharmacymaster..v_wholesaler_primary where vendor = 'ML'
                     ) w on m.pmid = w.pmid
                    where month(m.date) = 03 and year(m.date) = 2011)b
            on nc.pmid=b.pmid
 

 drop table tmp_memNonComp

select * into tmp_memNonComp from (
select * from tmp_memNonCompAll 
where ([Warehouse Status] = 'Yes' and [Cardinal/ML Status] = 'No' and [Is ManagedCare] = 'No' and Affiliate is null)
or ([Warehouse Status] = 'No' and [Cardinal/ML Status] = 'No' and [Is ManagedCare] = 'Yes' and Affiliate is null)
or ([Warehouse Status] = 'No' and [Cardinal/ML Status] = 'Yes' and [Is ManagedCare] = 'No' and Affiliate is null)
or ([Warehouse Status] = 'No' and [Cardinal/ML Status] = 'No' and [Is ManagedCare] = 'No' and Affiliate is null)
or ([Cardinal/ML Status] = 'No' and [Warehouse Status] = 'No' and [Is ManagedCare] = 'No'and Affiliate is not null)
or([Cardinal/ML Status] = 'No' and [Warehouse Status] = 'Yes' and [Is ManagedCare] = 'No'and Affiliate is not null)
or([Cardinal/ML Status] = 'No' and [Warehouse Status] = 'No' and [Is ManagedCare] = 'Yes'and Affiliate is not null)
) ch



END

		 








GO
