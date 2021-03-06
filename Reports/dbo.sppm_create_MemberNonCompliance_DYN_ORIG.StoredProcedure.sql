USE [Reports]
GO
/****** Object:  StoredProcedure [dbo].[sppm_create_MemberNonCompliance_DYN_ORIG]    Script Date: 12/22/2020 5:00:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		< Joni Wilson>
-- Create date: <03/29/2010>
-- Description:	Create table to use for load to THIS USES BRUCES FUNCTION *******************88
-- =============================================
Create PROCEDURE [dbo].[sppm_create_MemberNonCompliance_DYN_ORIG]
(@in_month varchar(02), @in_year varchar(4), @insert varchar(4) )
 
AS
BEGIN

	-- Used to insert into the AAPMemNonCompAll table (each month when the tmp_memNonCompAll is created if the @insert is set to 'Yes' the whole table will be inserted with the date).
	DECLARE  @date   datetime  ;
	SET @date = @in_month + '/01/' + @in_year;


--Create the table with Active members
	 IF EXISTS(SELECT name FROM sys.tables
		 WHERE name = 'tmp_memNonCompAll')
	 BEGIN
      DROP TABLE tmp_memNonCompAll
     END
  

select * into tmp_memNonCompAll from (
SELECT p.PMID,p.AccountName,p.AAPAccountNo ,p.City,p.State,p.Territory as TM,p.AAPEffectiveDate,p.APIAccountNo,
case when p.APIStatus = 'ACTIVE' then 'Yes' else 'No' end as [WarehouseStatus] ,
case when  c.pmid is not null then 'Yes' else null end as [CardinalMLStatus],
case when  p.chaincode is not null and p.mcquitdate is null then 'Yes' else 'No' end as[IsManagedCare],
cast(0 as numeric(18,2)) as [WarehouseVolume],
cast(0 as numeric(18,2)) as [CardinalVolume],
cast(0 as numeric(18,2)) as [MiamiLukenVolume],

p.Affiliate 
 from pharmacymaster..v_PM_AllWithAffiliates p

left outer join
(select pmid from pharmacymaster..pm_chaccounts_adj union select pmid from pharmacymaster..pm_chaccounts_bas) c
on p.pmid = c.pmid
where   p.aapaccountno is not null and p.aapaccountno != ''  and p.aapquitdate is null
) ch


 

-- UPDATE with Cardinal Volume
update nc set 
   [CardinalVolume] = aapnetsales
         from tmp_memNonCompAll nc
    inner join
	  ( select aapnetsales,pmid from pharmacymaster..all_volume where month(date) = @in_month and year(date) = @in_year ) v
			on nc.pmid = v.pmid 

-- UPDATE with Warehouse Volume
update nc set 
   [WarehouseVolume] = whapitotal
         from tmp_memNonCompAll nc
    inner join
	  ( select whapitotal,pmid from pharmacymaster..all_volume where month(date) = @in_month and year(date) = @in_year ) v
			on nc.pmid = v.pmid 

---Update with ML Status

update nc set 
   [CardinalMLStatus] = 'Yes'
         from tmp_memNonCompAll nc
    inner join (select vendor,pmid from pharmacymaster..v_wholesaler_primary where vendor = 'ML' )w
            on nc.pmid=w.pmid

--Update where ML and Cardinal are not yes to no

update tmp_memNonCompAll set  [CardinalMLStatus] = 'No' where  [CardinalMLStatus] is null

--Update with Bashas Volume

update nc set 
   [CardinalVolume] = extsales
         from tmp_memNonCompAll nc
    inner join (select extsales,pmid from reports..ch_bashas where month(date) = @in_month and year(date) = @in_year)b
            on nc.pmid=b.pmid

--Update with Miami-Luken Volume

update nc set 
   [MiamiLukenVolume] = mltotal
         from tmp_memNonCompAll nc
    inner join (select mltotal,m.pmid from pharmacymaster..all_volume m
                join(select  pmid from pharmacymaster..v_wholesaler_primary where vendor = 'ML'
                     ) w on m.pmid = w.pmid
                    WHERE month(m.date) = @in_month and year(m.date) = @in_year)b
            on nc.pmid=b.pmid
 

	 IF EXISTS(SELECT name FROM sys.tables
		 WHERE name = 'tmp_memNonComp')
	 BEGIN
      DROP TABLE tmp_memNonComp
     END
-- TODO will need to add in fliter to fliter out any of these that are LTC - once we get that in place
SELECT * into tmp_memNonComp from (
SELECT t.* from tmp_memNonCompAll t
 join pharmacymaster..pm_pharmacy p on t.pmid = p.pmid 
WHERE ( ([WarehouseStatus] = 'Yes' and [CardinalMLStatus] = 'No' and t.[IsManagedCare] = 'No' and Affiliate is null)
or ([WarehouseStatus] = 'No' and [CardinalMLStatus] = 'No' and t.[IsManagedCare] = 'Yes' and Affiliate is null)
or ([WarehouseStatus] = 'No' and [CardinalMLStatus] = 'Yes' and t.[IsManagedCare] = 'No' and Affiliate is null)
or ([WarehouseStatus] = 'No' and [CardinalMLStatus] = 'No' and t.[IsManagedCare] = 'No' and Affiliate is null)
or ([CardinalMLStatus] = 'No' and [WarehouseStatus] = 'No' and t.[IsManagedCare] = 'No'and Affiliate is not null)
or([CardinalMLStatus] = 'No' and [WarehouseStatus] = 'Yes' and t.[IsManagedCare] = 'No'and Affiliate is not null)
or([CardinalMLStatus] = 'No' and [WarehouseStatus] = 'No' and t.[IsManagedCare] = 'Yes'and Affiliate is not null) )
and ( p.categoryID  != 3 or p.categoryID is null)
) ch

IF (@insert = 'Yes')
BEGIN
INSERT into AAPMemNonCompAll
SELECT @date, * from tmp_memNonCompAll;
END

END

		 








GO
