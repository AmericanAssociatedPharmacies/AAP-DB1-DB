USE [AAP]
GO
/****** Object:  StoredProcedure [dbo].[spaap_create_MemCardVolStoreCountByTier_LS]    Script Date: 12/22/2020 4:10:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		< Joni Wilson>
-- Create date: <08/29/2008>
-- Description:	Update account numbers for the  AccountMasterActive_Distinct table
-- =============================================
CREATE PROCEDURE [dbo].[spaap_create_MemCardVolStoreCountByTier_LS]

AS
	BEGIN


 
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
        IF EXISTS(SELECT name FROM sys.tables
        WHERE name = 'tmp_q4_mem_jmw')
          DROP TABLE tmp_q4_mem_jmw
 
SELECT * into tmp_q4_mem_jmw  from (
	SELECT acct_no as accountNo ,sum(reporting.dbo.AvgNoLeading0s3args(october,november,december)) as Q4Avg from reporting..volumecalyy nv

	join 
	(SELECT * from pharmacymaster where  udQuitDate > '09/30/2009' or udQuitDate is null) pm
	  on nv.acct_no = pm.udaccountno 

	where nv.year= '2009' and vendor_id in ('65','86') and aapaccountno is not null
	group by nv.acct_no 

	UNION
	SELECT acct_no as accountNo,sum(reporting.dbo.AvgNoLeading0s3args(october,november,december) )as Q4Avg from reporting..volumecalyy nv

	join 
	(select * from pharmacymaster where  udQuitDate > '09/30/2009' or udQuitDate is null) pm
	  on nv.acct_no = pm.aapaccountno 

	where nv.year= '2009' and vendor_id in ('65','86') and udaccountno is   null
	group by nv.acct_no 


	UNION

	SELECT  api.apiaccountno as accountNo,sum(reporting.dbo.AvgNoLeading0s3args(october,november,december) )as Q4Avg from api..apicardVolume api
	join
	(SELECT * from pharmacymaster ) pm
	  on api.apiaccountno = pm.apiaccountno 
	 where api.year = 2009  and pm.aapaccountno is not null
	group by api.apiaccountno 

)tmp

 
SELECT count, Tier from 
(
	SELECT count(accountNo) as count   ,'> 0 and <= 50000'as Tier ,1 as ordernum from tmp_q4_mem_jmw   
    WHERE  Q4avg > 0 and  Q4avg <= 50000  

UNION
	SELECT count(accountNo) as count   ,'> 50000 and <= 100000'as Tier ,2 as ordernum from tmp_q4_mem_jmw   
    WHERE  Q4avg > 50000 and  Q4avg <= 100000
UNION
	SELECT count(accountNo) as count   ,'> 100000 and <= 150000'as Tier ,3 as ordernum from tmp_q4_mem_jmw   
    WHERE  Q4avg > 100000 and  Q4avg <= 150000
UNION
	SELECT count(accountNo) as count   ,'> 150000 and <= 200000'as Tier ,4 as ordernum from tmp_q4_mem_jmw   
    WHERE  Q4avg > 150000 and  Q4avg <= 200000
UNION
	SELECT count(accountNo) as count   ,'> 200000 and <= 250000'as Tier ,5 as ordernum from tmp_q4_mem_jmw   
    WHERE  Q4avg > 200000 and  Q4avg <= 250000
UNION
	SELECT count(accountNo) as count   ,'> 250000 and <= 300000'as Tier ,6 as ordernum from tmp_q4_mem_jmw   
    WHERE  Q4avg > 250000 and  Q4avg <= 300000
UNION
	SELECT count(accountNo) as count   ,'> 300000 and <= 350000'as Tier ,7 as ordernum from tmp_q4_mem_jmw   
    WHERE  Q4avg > 300000 and  Q4avg <= 350000
UNION
	SELECT count(accountNo) as count   ,'> 350000 and <= 400000'as Tier ,8 as ordernum from tmp_q4_mem_jmw   
    WHERE  Q4avg > 350000 and  Q4avg <= 400000
UNION
	SELECT count(accountNo) as count   ,'> 400000 and <= 450000'as Tier ,9 as ordernum from tmp_q4_mem_jmw   
    WHERE  Q4avg > 400000 and  Q4avg <= 450000
UNION
	SELECT count(accountNo) as count   ,'> 450000 and <= 500000'as Tier ,10 as ordernum from tmp_q4_mem_jmw   
    WHERE  Q4avg > 450000 and  Q4avg <= 500000
UNION
	SELECT count(accountNo) as count   ,'> 500000 and <= 550000'as Tier ,11 as ordernum from tmp_q4_mem_jmw   
    WHERE  Q4avg > 500000 and  Q4avg <= 550000
UNION
	SELECT count(accountNo) as count   ,'> 550000 and <= 600000'as Tier ,12 as ordernum from tmp_q4_mem_jmw   
    WHERE  Q4avg > 550000 and  Q4avg <= 600000
UNION
	SELECT count(accountNo) as count   ,'> 600000 and <= 650000'as Tier ,13 as ordernum from tmp_q4_mem_jmw   
    WHERE  Q4avg > 600000 and  Q4avg <= 650000
UNION
	SELECT count(accountNo) as count   ,'> 650000 and <= 700000'as Tier ,14 as ordernum from tmp_q4_mem_jmw   
    WHERE  Q4avg > 650000 and  Q4avg <= 700000
UNION
	SELECT count(accountNo) as count   ,'> 700000 and <= 750000'as Tier ,15 as ordernum from tmp_q4_mem_jmw   
    WHERE  Q4avg > 700000 and  Q4avg <= 750000
UNION
	SELECT count(accountNo) as count   ,'> 750000 and <= 800000'as Tier ,16 as ordernum from tmp_q4_mem_jmw   
    WHERE  Q4avg > 750000 and  Q4avg <= 800000
UNION
	SELECT count(accountNo) as count   ,'> 800000 and <= 850000'as Tier ,17 as ordernum from tmp_q4_mem_jmw   
    WHERE  Q4avg > 800000 and  Q4avg <= 850000
UNION
	SELECT count(accountNo) as count   ,'> 850000 and <= 900000'as Tier ,18 as ordernum from tmp_q4_mem_jmw   
    WHERE  Q4avg > 850000 and  Q4avg <= 900000
UNION
	SELECT count(accountNo) as count   ,'> 900000 and <= 950000'as Tier ,19 as ordernum from tmp_q4_mem_jmw   
    WHERE  Q4avg > 900000 and  Q4avg <= 950000
UNION
	SELECT count(accountNo) as count   ,'> 950000 and <= 1000000'as Tier ,20 as ordernum from tmp_q4_mem_jmw   
    WHERE  Q4avg > 950000 and  Q4avg <= 1000000

--------

UNION
	SELECT count(accountNo) as count   ,'> 1000000 and <= 1050000'as Tier ,21 as ordernum from tmp_q4_mem_jmw   
    WHERE  Q4avg > 1000000 and  Q4avg <= 1050000
UNION
	SELECT count(accountNo) as count   ,'> 1050000 and <= 1100000'as Tier ,22 as ordernum from tmp_q4_mem_jmw   
    WHERE  Q4avg > 1050000 and  Q4avg <= 1100000
UNION
	SELECT count(accountNo) as count   ,'> 1100000 and <= 1150000'as Tier ,23 as ordernum from tmp_q4_mem_jmw   
    WHERE  Q4avg > 1100000 and  Q4avg <= 1150000
UNION
	SELECT count(accountNo) as count   ,'> 1150000 and <= 1200000'as Tier ,24 as ordernum from tmp_q4_mem_jmw   
    WHERE  Q4avg > 1150000 and  Q4avg <= 1200000
UNION
	SELECT count(accountNo) as count   ,'> 1200000 and <= 1250000'as Tier ,24 as ordernum from tmp_q4_mem_jmw   
    WHERE  Q4avg > 1200000 and  Q4avg <= 1250000
UNION
	SELECT count(accountNo) as count   ,'> 1250000 and <= 1300000'as Tier ,25 as ordernum from tmp_q4_mem_jmw   
    WHERE  Q4avg > 1250000 and  Q4avg <= 1300000
UNION
	SELECT count(accountNo) as count   ,'> 1300000 and <= 1350000'as Tier ,26 as ordernum from tmp_q4_mem_jmw   
    WHERE  Q4avg > 1300000 and  Q4avg <= 1350000
UNION
	SELECT count(accountNo) as count   ,'> 1350000 and <= 1400000'as Tier ,27 as ordernum from tmp_q4_mem_jmw   
    WHERE  Q4avg > 1350000 and  Q4avg <= 1400000
UNION
	SELECT count(accountNo) as count   ,'> 1400000 and <= 1450000'as Tier ,28 as ordernum from tmp_q4_mem_jmw   
    WHERE  Q4avg > 1400000 and  Q4avg <= 1450000
UNION
	SELECT count(accountNo) as count   ,'> 1450000 and <= 1500000'as Tier ,29 as ordernum from tmp_q4_mem_jmw   
    WHERE  Q4avg > 1450000 and  Q4avg <= 1500000
UNION
	SELECT count(accountNo) as count   ,'> 1500000 and <= 1550000'as Tier ,30 as ordernum from tmp_q4_mem_jmw   
    WHERE  Q4avg > 1500000 and  Q4avg <= 1550000
UNION
	SELECT count(accountNo) as count   ,'> 1550000 and <= 1600000'as Tier ,31 as ordernum from tmp_q4_mem_jmw   
    WHERE  Q4avg > 1550000 and  Q4avg <= 1600000
UNION
	SELECT count(accountNo) as count   ,'> 1600000 and <= 1650000'as Tier ,32 as ordernum from tmp_q4_mem_jmw   
    WHERE  Q4avg > 1600000 and  Q4avg <= 1650000
UNION
	SELECT count(accountNo) as count   ,'> 1650000 and <= 1700000'as Tier ,33 as ordernum from tmp_q4_mem_jmw   
    WHERE  Q4avg > 1650000 and  Q4avg <= 1700000
UNION
	SELECT count(accountNo) as count   ,'> 1700000 and <= 1750000'as Tier ,34 as ordernum from tmp_q4_mem_jmw   
    WHERE  Q4avg > 1700000 and  Q4avg <= 1750000
UNION
	SELECT count(accountNo) as count   ,'> -50000 and <= 0'as Tier ,0  as ordernum from tmp_q4_mem_jmw   
    WHERE  Q4avg > -50000 and  Q4avg <= 0
) tmp1
order by ordernum

    END









GO
