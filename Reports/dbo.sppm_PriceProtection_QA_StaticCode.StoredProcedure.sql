USE [Reports]
GO
/****** Object:  StoredProcedure [dbo].[sppm_PriceProtection_QA_StaticCode]    Script Date: 12/22/2020 5:00:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		< Joni Wilson>
-- Create date: <09/08/2016>
-- Description:	Price Protection QA Queries
-- =============================================
CREATE PROCEDURE [dbo].[sppm_PriceProtection_QA_StaticCode]
 
 

AS
BEGIN


 -- High Increase
	  SELECT * FROM (   
	  SELECT * , Rank() OVER (Partition BY customer_no,ndc order by aapunitcost asc) as Rank   
	  FROM (SELECT     *   
			 	FROM        tmp_ppcompare t where ndc in   
    (SELECT distinct ndc  from PharmacyMaster..CASourceContractMO c where [ChangeType] = 'Price Increase' 

   
    and month([EffectDte]) in( 06,07) 
								  and year([EffectDte]) = 2016) and ndc not in (select distinct ndc  from                         
					 PharmacyMaster..CASourceContractMO c where [ChangeType] = 'Price Decrease'   
                      and c.[EffectDte] > t.[AAPEffectDate]  
					 and c.ndc = t.ndc)
			 
  )pm  
 	) tmp where   Rank = 2   

--Low Increase

	  SELECT * FROM (  
	  SELECT * , Rank() OVER (Partition BY customer_no,ndc order by aapunitcost desc) as Rank   
	  FROM (SELECT     *       
	 			FROM        tmp_ppcompare t where ndc in   
  (  SELECT distinct ndc  from PharmacyMaster..CASourceContractMO c where [ChangeType] = 'Price Increase'
    and month([EffectDte]) in( 06,07) 
									  and year([EffectDte]) = 2016)  and ndc not in (select distinct ndc  from                      
					PharmacyMaster..CASourceContractMO c where [ChangeType] = 'Price Decrease'
                    and c.[EffectDte] > t.[AAPEffectDate] 
					and c.ndc = t.ndc) 
				 
  ) pm  
	 	) tmp where   Rank = 2   


--High Decrease
	  SELECT * FROM (   
	  SELECT * , Rank() OVER (Partition BY customer_no,ndc order by aapunitcost asc) as Rank  
	  FROM (SELECT *  
			 	FROM        tmp_ppcompare where ndc in  
  (  SELECT distinct ndc  from PharmacyMaster..CASourceContractMO c where [ChangeType] = 'Price Decrease'
    and month([EffectDte]) in( 06,07)  
		 and year([EffectDte]) = 2016)
  ) pm  
 		) tmp where   Rank = 2  

--Low Decrease

	  SELECT * FROM (  
	  SELECT * , Rank() OVER (Partition BY customer_no,ndc order by aapunitcost desc) as Rank  
	  FROM (SELECT  *  
			 FROM        tmp_ppcompare where ndc in   
  (  SELECT distinct ndc  from PharmacyMaster..CASourceContractMO c where [ChangeType] = 'Price Decrease'
	   and month([EffectDte]) in( 06,07)
	  and year([EffectDte]) = 2016)
  ) pm 
 ) tmp where   Rank = 2   
 
 

END










GO
