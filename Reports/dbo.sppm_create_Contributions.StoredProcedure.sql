USE [Reports]
GO
/****** Object:  StoredProcedure [dbo].[sppm_create_Contributions]    Script Date: 12/22/2020 5:00:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		< Joni Wilson>
-- Create date: <10/14/2010>
-- Description:	Create Member/Customer contributions
-- =============================================
CREATE PROCEDURE [dbo].[sppm_create_Contributions]
 (@in_month varchar(02), @in_year varchar(4))

AS
BEGIN
 
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
  
 DECLARE @SQL   varchar(max);


 IF EXISTS(SELECT name FROM sys.tables
	 WHERE name = 'tmp_Contributions')
 BEGIN
  DROP TABLE tmp_Contributions
 END
 
 SELECT * INTO tmp_Contributions from ( 
 
	          SELECT   
               PMID,  
			   aapaccountno as [AAP Acct#] ,  
			   aapparentno as [AAP Parent#] ,  
			   apiaccountno as [API Acct#] ,  
			   accountname as [Account DBA Name] ,  
               aapeffectivedate as [AAP Eff] ,
               aapquitdate as [AAP Quit] ,
               AccountDescription as [Description] , 
               City ,  
			   State as ST , 
			   Affiliate ,    
               BusinessClass as [Bus Cls],
			   cast(0 as numeric(18,2)) as [Bashas Volume],
			   cast(0 as numeric(18,2)) as [Bashas Admin Fee],
			   cast(0 as numeric(18,2)) as [ML Volume],
			   cast(0 as numeric(18,2)) as [ML Admin Fee],
			   cast(0 as numeric(18,2)) as [Cardinal Volume],
			   cast(0 as numeric(18,2)) as [AAP Volume Admin Fee Retained],
			   cast(0 as numeric(18,2)) as [Cardinal Generic Src Volume],
			   cast(0 as numeric(18,2)) as [AAP Generic Admin Fee Retained],
			   cast(0 as numeric(18,2)) as [IPA Generic Admin Fee],
			   cast(0 as numeric(18,2)) as [Total Admin Fees Retained],
               cast(0 as numeric(18,2)) as [API Generic Sales],
               cast(0 as numeric(18,2)) as [API Generic Contributions],
               cast(0 as numeric(18,2)) as [API Brand Sales],
               cast(0 as numeric(18,2)) as [API Brand Contributions],
               cast(0 as numeric(18,2)) as [API OTC Sales],
               cast(0 as numeric(18,2)) as [API OTC Contributions],
               cast(0 as numeric(18,2)) as [Total Account Contributions],
               cast(0 as numeric(18,2)) as [Total Group Contributions],
               --GroupNo as [Group #],
               case when GroupNo = '' then null else GroupNo end as [Group #],
               cast(0 as int) as Rank
  from pharmacymaster..v_PM_AllWithAffiliates
)con


--- Miami Luken Admin Fee

 

 SET @SQL = ' UPDATE p set  '+
		    ' [ML Admin Fee] = fee '+
 
	        ' FROM   tmp_Contributions p  '+
		 	' INNER JOIN  '+
		 	' (   '+
			' SELECT round(sum(totalrebate)  ,2) as fee ,v.pmid '+
			' FROM  pharmacymaster..miamiluken v inner join pharmacymaster..v_pm_withdeleted on v.pmid =   v_pm_withdeleted.pmid '+
			' WHERE '+
			'  year(date)  = ' + @in_year +'  and month(date)  = ' + @in_month +'  group by v.pmid '+
          	' ) vol  '+
		    ' on p.pmid = vol.pmid  ';
 
 EXEC (@SQL);


--- Miami Luken Volume

 

 SET @SQL = ' UPDATE p set  '+
		    ' [ML Volume] = fee '+
 
	        ' FROM   tmp_Contributions p  '+
		 	' INNER JOIN  '+
		 	' (   '+
			' SELECT round(sum(totalsales),2) as fee ,v.pmid '+
			' FROM  pharmacymaster..miamiluken v inner join pharmacymaster..v_pm_withdeleted on v.pmid =   v_pm_withdeleted.pmid '+
			' WHERE '+
			'  year(date)  = ' + @in_year +'  and month(date)  = ' + @in_month +'   group by v.pmid '+
          	' ) vol  '+
		    ' on p.pmid = vol.pmid  ';
 
 EXEC (@SQL);


--- Update with Bashas Admin fee 

  SET @SQL = ' UPDATE p set  '+
		     ' [Bashas Admin Fee] = fee, '+
             ' [Bashas Volume] = sales '+
	         ' FROM   tmp_Contributions p  '+
		 	 ' inner join  '+
		 	 ' (   '+
             ' 	select b.pmid  , sum(adminfee) as fee,sum(extsales) as sales from Purchases..PM_CH_Bashas b '+
             '    where year(date) = ' + @in_year +' and month(date)  = ' + @in_month +'   group by b.pmid  '+

		 	 ' ) vol '+
		     ' on p.pmid = vol.pmid  ';
   EXEC (@SQL);

-- AAP Extended Sales and AAP Volume Admin Fee Retained


 SET @SQL = 'UPDATE p set  '+
		    ' [Cardinal Volume] = sales, '+
            ' [AAP Volume Admin Fee Retained]= feeRetained '+
	        ' FROM   tmp_Contributions p  '+
		 	' INNER JOIN '+ 
		 	' (    '+ 
            '  	SELECT r.pmid, '+
  --          '   sum(AAPVolumeAdminFee)  -  sum( [Incentive from AAP Net Sales]) - sum(AAPVolumeAdminFeePaidToAffiliate)  as feeRetained, '+
           '   sum((AAPVolumeAdminFee + volAdminFeeAdj))  -  sum(dbo.HighVolPaidToAffCalc([Incentive from AAP Net Sales],(AAPVolumeAdminFeePaidToAffiliate + affilAdminFeeAdj)))  as feeRetained, '+

            '    case when sum(AdjustedExtSales) is null then 0 else sum(AdjustedExtSales) end as sales '+
            '    FROM pharmacymaster..PM_REBATES_CHAAP r '+
         ' left join '+
		 ' (SELECT * from pharmacymaster..PM_Rebates_HighVolume '+
		 '	      ) h '+
	     '           on r.pmid = h.pmid and year(r.date) =  year(h.date) and month(r.date) =  month(h.date) '+
			'	 JOIN pharmacymaster..v_PM_AllWithAffiliates p on r.pmid = p.pmid '+
			'	 WHERE   year(r.date) = ' + @in_year + ' and month(r.date)  = ' + @in_month +'     group by r.pmid,p.affiliate  '+

		 	' ) vol '+
		    ' on p.pmid = vol.pmid  ';
 EXEC (@SQL);

-- IPA Generic Admin Fee  


 SET @SQL = 'UPDATE p set  '+
            ' [IPA Generic Admin Fee]= adminFee '+
	        ' FROM   tmp_Contributions p  '+
		 	' INNER JOIN '+ 
		 	' (    '+ 
            '  	SELECT r.pmid, '+
            '   sum(IPAGenericAdminFee)   as adminFee '+
            '    FROM pharmacymaster..PM_REBATES_CHAAP r '+
			'	 JOIN pharmacymaster..v_PM_AllWithAffiliates p on r.pmid = p.pmid '+
			'	 WHERE   year(date) = ' + @in_year + ' and month(date)  = ' + @in_month +'     group by r.pmid,p.affiliate  '+

		 	' ) vol '+
		    ' on p.pmid = vol.pmid  ';
 EXEC (@SQL);
 
-- AAP Generic Source Volume and AAP Generic Admin Fee Retained


 SET @SQL = 'UPDATE p set  '+
            ' [Cardinal Generic Src Volume] = sourceSales ,'+
		    ' [AAP Generic Admin Fee Retained] = feeRetained  '+

	        ' FROM   tmp_Contributions p  '+
		 	' INNER JOIN '+ 
		 	' (    '+ 
            '  	SELECT r.pmid, '+
         --   '   sum(AAPGenericAdminFee -[1% Generic Admin])  - sum(isnull(AAPGenericAdminFeePaidToPipco,0)) as feeRetained, '+
            '   sum(AAPGenericAdminFee + GenericAdminFeeAdj)  - sum(isnull([1% Generic Admin],0)) as feeRetained, '+

  --          '    case when sum(SourceGenericSales) is null then 0 else sum(SourceGenericSales) end as sourceSales '+
            '    case when sum(AdjustedGenericSource) is null then 0 else sum(AdjustedGenericSource) end as sourceSales '+
            '    FROM pharmacymaster..PM_REBATES_CHAAP r '+
         ' left join '+
		 ' (SELECT * from pharmacymaster..PM_Rebates_HighVolume '+
		 '	      ) h '+
	     '           on r.pmid = h.pmid and year(r.date) =  year(h.date) and month(r.date) =  month(h.date) '+

			'	 JOIN pharmacymaster..v_PM_AllWithAffiliates p on r.pmid = p.pmid '+
			'	 WHERE   year(r.date) = ' + @in_year + ' and month(r.date)  = ' + @in_month +'     group by r.pmid,p.affiliate  '+

		 	' ) vol '+
		    ' on p.pmid = vol.pmid  ';
 EXEC (@SQL);

--Set null to zero 
UPDATE tmp_Contributions set [Total Admin Fees Retained] = 0 where [Total Admin Fees Retained] is null;
UPDATE tmp_Contributions set [ML Admin Fee]  = 0 where [ML Admin Fee]  is null;
UPDATE tmp_Contributions set [Bashas Admin Fee]  = 0 where [Bashas Admin Fee]  is null;
UPDATE tmp_Contributions set [AAP Volume Admin Fee Retained] = 0 where [AAP Volume Admin Fee Retained] is null;
UPDATE tmp_Contributions set [AAP Generic Admin Fee Retained] = 0 where [AAP Generic Admin Fee Retained] is null;
UPDATE tmp_Contributions set [IPA Generic Admin Fee] = 0 where [IPA Generic Admin Fee] is null;


----TO DO UPDATE AAP Vol Admin Fee Retained for High Volume here

    UPDATE p set
   
           [AAP Volume Admin Fee Retained] =   newFeeRetained
	    FROM   tmp_Contributions p  
		 	 INNER JOIN  
		 	  (     
              	SELECT r.pmid,  
                     sum((AAPVolumeAdminFee + volAdminFeeAdj))   -  sum( [Incentive from AAP Net Sales]) - sum((AAPVolumeAdminFeePaidToAffiliate + affilAdminFeeAdj)) as newFeeRetained 
                    FROM pharmacymaster..PM_REBATES_CHAAP r  
                  inner join 
			       (select * from pharmacymaster..PM_Rebates_HighVolume
			     	where month(date) = @in_month and year(date) = @in_year ) h
	                on r.pmid = h.pmid
		 	 
			 	 WHERE   year(r.date) = @in_year and month(r.date)  = @in_month    group by r.pmid 

		   ) vol  
		    on p.pmid = vol.pmid   

UPDATE tmp_Contributions set [Total Admin Fees Retained] = [ML Admin Fee] + [Bashas Admin Fee] +  [AAP Volume Admin Fee Retained] +  [AAP Generic Admin Fee Retained] + [IPA Generic Admin Fee];


-- Warehouse
     

SET @SQL = 'UPDATE p set   '+
	       ' [API Brand Sales] = whapibrand,  '+
           ' [API Brand Contributions] = dbo.APIBrandContributions(whapibrand), '+
		   ' [API Generic Sales] = whapigeneric,  '+
           ' [API Generic Contributions]  = dbo.APIGenericContributions(whapigeneric) , '+
		   ' [API OTC Sales] = whapiotc ,  '+
		   ' [API OTC Contributions] =  dbo.APIOTCContributions(whapiotc) '+ 
		   ' FROM   Reports..tmp_Contributions p    '+
		   ' INNER JOIN    '+
		   ' (   '+
		   ' 	SELECT sum(whapibrand) as whapibrand ,sum(whapigeneric) as whapigeneric ,sum(whapiotc) as whapiotc, v.pmid   from pharmacymaster..all_volume  v  '+
           '  JOIN pharmacymaster..v_PM_AllWithAffiliates p on v.pmid = p.pmid  '+
		   '  WHERE   year(date) = ' + @in_year + ' and month(date)  = ' + @in_month +'   group by v.pmid  '+

		   ' ) vol '+
		   ' on p.pmid = vol.pmid   ';
EXEC (@SQL);	

--Set null to zero

UPDATE tmp_Contributions set  [API Brand Contributions]  = 0 where  [API Brand Contributions]  is null;
UPDATE tmp_Contributions set  [API OTC Contributions]  = 0 where  [API OTC Contributions]  is null;
UPDATE tmp_Contributions set  [API Generic Contributions]  = 0 where  [API Generic Contributions]  is null;
 


UPDATE tmp_Contributions set [Total Account Contributions] =  [Total Admin Fees Retained] +  [API Brand Contributions] +   [API OTC Contributions] + [API Generic Contributions];

--Update Group Contributions

UPDATE  t  set 
	[Total Group Contributions] = ch.totsum  
FROM tmp_Contributions   t 
inner join 
	( select sum([Total Account Contributions]) as totsum ,[Group #] from tmp_Contributions
       group by [Group #] 
     ) ch
on t.[Group #]  = ch.[Group #]  


-- Rank Over For All

 IF EXISTS(SELECT name FROM sys.tables
	 WHERE name = 'tmp_ContRankForAll')
 BEGIN
  DROP TABLE tmp_ContRankForAll
 END

SELECT * into tmp_ContRankForAll from 
(
SELECT PMID,
CASE WHEN [Total Account Contributions] > [Total Group Contributions] THEN [Total Account Contributions]  ELSE [Total Group Contributions] END
as ContForRank 
 from tmp_Contributions
)a
 

-- Do Rank Over for All
UPDATE t set
  t.Rank = r.Rank
  FROM tmp_Contributions   t 
		inner join
(
    SELECT PMID, ContForRank
    , Dense_Rank() OVER ( order by ContForRank desc) AS 'Rank'  
      from tmp_ContRankForAll
) r
on t.pmid= r.pmid
 

 
UPDATE tmp_Contributions set rank = 0 where rank > 25
------------- SINGLE ------------------

--Build Table for Single Site

 IF EXISTS(SELECT name FROM sys.tables
	 WHERE name = 'tmp_ContributionsSingle')
 BEGIN
  DROP TABLE tmp_ContributionsSingle
 END
 
SELECT * into tmp_ContributionsSingle from
(
SELECT * from tmp_Contributions where [Group #] is    null
) single 

--Build the Contributions for ranking for Single
 IF EXISTS(SELECT name FROM sys.tables
	 WHERE name = 'tmp_ContRankForSingle')
 BEGIN
  DROP TABLE tmp_ContRankForSingle
 END
 
SELECT * into tmp_ContRankForSingle from 
(
SELECT PMID,
CASE WHEN [Total Account Contributions] > [Total Group Contributions] THEN [Total Account Contributions]  ELSE [Total Group Contributions] END
as ContForRank 
 FROM tmp_ContributionsSingle
)a

 


-- Do Rank Over for Single
UPDATE t set
  t.Rank = r.Rank
  FROM tmp_ContributionsSingle   t 
		inner join
(
    SELECT PMID, ContForRank
    , Dense_Rank() OVER ( order by ContForRank desc) AS 'Rank'  
      from tmp_ContRankForSingle
) r
on t.pmid= r.pmid

UPDATE tmp_ContributionsSingle set rank = 0 where rank > 25


------------- GROUP ------------------

--Build Table for GROUP Site
 IF EXISTS(SELECT name FROM sys.tables
	 WHERE name = 'tmp_ContributionsGroup')
 BEGIN
  DROP TABLE tmp_ContributionsGroup
 END
  
SELECT * into tmp_ContributionsGroup from
(
SELECT * from tmp_Contributions where [Group #] is  not  null
) single 

--Build the Contributions for ranking for Group
 IF EXISTS(SELECT name FROM sys.tables
	 WHERE name = 'tmp_ContRankForGroup')
 BEGIN
  DROP TABLE tmp_ContRankForGroup
 END
   
SELECT * into tmp_ContRankForGroup from 
(
SELECT PMID,[Total Group Contributions]
--CASE WHEN [Total Account Contributions] > [Total Group Contributions] THEN [Total Account Contributions]  ELSE [Total Group Contributions] END
as ContForRank 
 FROM tmp_ContributionsGroup
)a

 


-- Do Rank Over for Group
UPDATE t set
  t.Rank = r.Rank
  FROM tmp_ContributionsGroup   t 
		inner join
(
    SELECT PMID, ContForRank
    , Dense_Rank() OVER ( order by ContForRank desc) AS 'Rank'  
      from tmp_ContRankForGroup
) r
on t.pmid= r.pmid

UPDATE tmp_ContributionsGroup set rank = 0 where rank > 25


END








GO
