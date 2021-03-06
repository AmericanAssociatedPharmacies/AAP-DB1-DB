USE [AAP]
GO
/****** Object:  StoredProcedure [dbo].[spaap_create_MemberQPSWarehouseVol_LS]    Script Date: 12/22/2020 4:10:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		< Joni Wilson>
-- Create date: <08/29/2008>
-- Description:	AAP QPS Warehouse Volume
-- =============================================
Create PROCEDURE [dbo].[spaap_create_MemberQPSWarehouseVol_LS]

AS
	BEGIN


 
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
        IF EXISTS(SELECT name FROM sys.tables
        WHERE name = 'tmp_q4_mem_qps_wh_jmw')
          DROP TABLE tmp_q4_mem_qps_wh_jmw
 
SELECT * into tmp_q4_mem_qps_wh_jmw  from (
	--- ALL QPS Cardinal Volume
--- AAP QPS Warehouse Volume
SELECT  api.whaccountid as accountNo,sum(reporting.dbo.AvgNoLeading0s3args(october,november,december) )as Q4Avg from api..API_Sum_Totamt_Mnthly api
	join
	(SELECT * from pharmacymaster where QPS = 'QPS' ) pm
	  on api.whaccountid = pm.apiaccountno 
	 where api.year = 2009  and pm.aapaccountno is not null
	group by api.whaccountid 
)tmp

 
SELECT count, Tier from 
(
	SELECT count(accountNo) as count   ,'> 0 and <= 25000'as Tier ,1 as ordernum from tmp_q4_mem_qps_wh_jmw   
    WHERE  Q4avg > 0 and  Q4avg <= 25000  
UNION
    SELECT count(accountNo) as count   ,'> 25000 and <= 50000'as Tier ,1 as ordernum from tmp_q4_mem_qps_wh_jmw   
    WHERE  Q4avg > 25000 and  Q4avg <= 50000  
UNION
	SELECT count(accountNo) as count   ,'> 50000 and <= 75000'as Tier ,2 as ordernum from tmp_q4_mem_qps_wh_jmw   
    WHERE  Q4avg > 50000 and  Q4avg <= 75000
UNION
	SELECT count(accountNo) as count   ,'> 75000 and <= 100000'as Tier ,3 as ordernum from tmp_q4_mem_qps_wh_jmw   
    WHERE  Q4avg > 75000 and  Q4avg <= 100000
UNION
	SELECT count(accountNo) as count   ,'> 100000 and <= 125000'as Tier ,4 as ordernum from tmp_q4_mem_qps_wh_jmw   
    WHERE  Q4avg > 100000 and  Q4avg <= 125000
UNION
	SELECT count(accountNo) as count   ,'> 125000 and <= 150000'as Tier ,5 as ordernum from tmp_q4_mem_qps_wh_jmw   
    WHERE  Q4avg > 125000 and  Q4avg <= 150000
UNION
	SELECT count(accountNo) as count   ,'> 150000 and <= 175000'as Tier ,6 as ordernum from tmp_q4_mem_qps_wh_jmw   
    WHERE  Q4avg > 150000 and  Q4avg <= 175000
UNION
	SELECT count(accountNo) as count   ,'> 175000 and <= 200000'as Tier ,7 as ordernum from tmp_q4_mem_qps_wh_jmw   
    WHERE  Q4avg > 175000 and  Q4avg <= 200000
UNION
	SELECT count(accountNo) as count   ,'> 200000 and <= 225000'as Tier ,8 as ordernum from tmp_q4_mem_qps_wh_jmw   
    WHERE  Q4avg > 200000 and  Q4avg <= 225000
UNION
	SELECT count(accountNo) as count   ,'> 225000 and <= 250000'as Tier ,9 as ordernum from tmp_q4_mem_qps_wh_jmw   
    WHERE  Q4avg > 225000 and  Q4avg <= 250000
UNION
	SELECT count(accountNo) as count   ,'> 250000 and <= 275000'as Tier ,10 as ordernum from tmp_q4_mem_qps_wh_jmw   
    WHERE  Q4avg > 250000 and  Q4avg <= 275000
UNION
	SELECT count(accountNo) as count   ,'> 275000 and <= 300000'as Tier ,11 as ordernum from tmp_q4_mem_qps_wh_jmw   
    WHERE  Q4avg > 275000 and  Q4avg <= 300000
UNION
	SELECT count(accountNo) as count   ,'> 300000 and <= 325000'as Tier ,12 as ordernum from tmp_q4_mem_qps_wh_jmw   
    WHERE  Q4avg > 300000 and  Q4avg <= 325000
UNION
	SELECT count(accountNo) as count   ,'> 325000 and <= 350000'as Tier ,13 as ordernum from tmp_q4_mem_qps_wh_jmw   
    WHERE  Q4avg > 325000 and  Q4avg <= 350000
UNION
	SELECT count(accountNo) as count   ,'> 350000 and <= 375000'as Tier ,14 as ordernum from tmp_q4_mem_qps_wh_jmw   
    WHERE  Q4avg > 350000 and  Q4avg <= 375000
UNION
	SELECT count(accountNo) as count   ,'> 375000 and <= 400000'as Tier ,15 as ordernum from tmp_q4_mem_qps_wh_jmw   
    WHERE  Q4avg > 375000 and  Q4avg <= 400000
UNION
	SELECT count(accountNo) as count   ,'> 400000 and <= 425000'as Tier ,16 as ordernum from tmp_q4_mem_qps_wh_jmw   
    WHERE  Q4avg > 400000 and  Q4avg <= 425000
UNION
	SELECT count(accountNo) as count   ,'> 425000 and <= 450000'as Tier ,17 as ordernum from tmp_q4_mem_qps_wh_jmw   
    WHERE  Q4avg > 425000 and  Q4avg <= 450000
UNION
	SELECT count(accountNo) as count   ,'> 450000 and <= 475000'as Tier ,18 as ordernum from tmp_q4_mem_qps_wh_jmw   
    WHERE  Q4avg > 450000 and  Q4avg <= 475000
UNION
	SELECT count(accountNo) as count   ,'> 475000 and <= 500000'as Tier ,19 as ordernum from tmp_q4_mem_qps_wh_jmw   
    WHERE  Q4avg > 475000 and  Q4avg <= 500000
UNION
	SELECT count(accountNo) as count   ,'> 500000 and <= 525000'as Tier ,20 as ordernum from tmp_q4_mem_qps_wh_jmw   
    WHERE  Q4avg > 500000 and  Q4avg <= 525000

--------

UNION
	SELECT count(accountNo) as count   ,'> 525000 and <= 575000'as Tier ,21 as ordernum from tmp_q4_mem_qps_wh_jmw   
    WHERE  Q4avg > 525000 and  Q4avg <= 575000
UNION
	SELECT count(accountNo) as count   ,'> 575000 and <= 600000'as Tier ,22 as ordernum from tmp_q4_mem_qps_wh_jmw   
    WHERE  Q4avg > 575000 and  Q4avg <= 600000
UNION
	SELECT count(accountNo) as count   ,'> 600000 and <= 625000'as Tier ,23 as ordernum from tmp_q4_mem_qps_wh_jmw   
    WHERE  Q4avg > 600000 and  Q4avg <= 625000
UNION
	SELECT count(accountNo) as count   ,'> 625000 and <= 650000'as Tier ,24 as ordernum from tmp_q4_mem_qps_wh_jmw   
    WHERE  Q4avg > 625000 and  Q4avg <= 650000
UNION
	SELECT count(accountNo) as count   ,'> 650000 and <= 675000'as Tier ,25 as ordernum from tmp_q4_mem_qps_wh_jmw   
    WHERE  Q4avg > 650000 and  Q4avg <= 675000
UNION
	SELECT count(accountNo) as count   ,'> 675000 and <= 700000'as Tier ,26 as ordernum from tmp_q4_mem_qps_wh_jmw   
    WHERE  Q4avg > 675000 and  Q4avg <= 700000
UNION
	SELECT count(accountNo) as count   ,'> 700000 and <= 725000'as Tier ,27 as ordernum from tmp_q4_mem_qps_wh_jmw   
    WHERE  Q4avg > 700000 and  Q4avg <= 725000
UNION
	SELECT count(accountNo) as count   ,'> 725000 and <= 750000'as Tier ,28 as ordernum from tmp_q4_mem_qps_wh_jmw   
    WHERE  Q4avg > 725000 and  Q4avg <= 750000
UNION
	SELECT count(accountNo) as count   ,'> 750000 and <= 775000'as Tier ,29 as ordernum from tmp_q4_mem_qps_wh_jmw   
    WHERE  Q4avg > 750000 and  Q4avg <= 775000
UNION
	SELECT count(accountNo) as count   ,'> 775000 and <= 800000'as Tier ,30 as ordernum from tmp_q4_mem_qps_wh_jmw   
    WHERE  Q4avg > 775000 and  Q4avg <= 800000
UNION
	SELECT count(accountNo) as count   ,'> 800000 and <= 825000'as Tier ,31 as ordernum from tmp_q4_mem_qps_wh_jmw   
    WHERE  Q4avg > 800000 and  Q4avg <= 825000
UNION
	SELECT count(accountNo) as count   ,'> 825000 and <= 850000'as Tier ,32 as ordernum from tmp_q4_mem_qps_wh_jmw   
    WHERE  Q4avg > 825000 and  Q4avg <= 850000
UNION
	SELECT count(accountNo) as count   ,'> 850000 and <= 875000'as Tier ,33 as ordernum from tmp_q4_mem_qps_wh_jmw   
    WHERE  Q4avg > 850000 and  Q4avg <= 875000
UNION
	SELECT count(accountNo) as count   ,'> 875000 and <= 900000'as Tier ,34 as ordernum from tmp_q4_mem_qps_wh_jmw   
    WHERE  Q4avg > 875000 and  Q4avg <= 900000
UNION
	SELECT count(accountNo) as count   ,'> 900000 and <= 925000'as Tier ,35 as ordernum from tmp_q4_mem_qps_wh_jmw   
    WHERE  Q4avg > 900000 and  Q4avg <= 925000
UNION
	SELECT count(accountNo) as count   ,'> 925000 and <= 950000'as Tier ,36 as ordernum from tmp_q4_mem_qps_wh_jmw   
    WHERE  Q4avg > 925000 and  Q4avg <= 950000
UNION
	SELECT count(accountNo) as count   ,'> 950000 and <= 975000'as Tier ,37 as ordernum from tmp_q4_mem_qps_wh_jmw   
    WHERE  Q4avg > 950000 and  Q4avg <= 975000
UNION
	SELECT count(accountNo) as count   ,'> 975000 and <= 1000000'as Tier ,38 as ordernum from tmp_q4_mem_qps_wh_jmw   
    WHERE  Q4avg > 975000 and  Q4avg <= 1000000

UNION
	SELECT count(accountNo) as count   ,'> 1000000 and <= 1025000'as Tier ,39 as ordernum from tmp_q4_mem_qps_wh_jmw   
    WHERE  Q4avg > 1000000 and  Q4avg <= 1025000

--------------------------

UNION
    SELECT count(accountNo) as count   ,'> 1025000 and <= 1050000'as Tier ,40 as ordernum from tmp_q4_mem_qps_wh_jmw   
    WHERE  Q4avg > 1025000 and  Q4avg <= 1050000  
UNION
	SELECT count(accountNo) as count   ,'> 1050000 and <= 1075000'as Tier ,41 as ordernum from tmp_q4_mem_qps_wh_jmw   
    WHERE  Q4avg > 1050000 and  Q4avg <= 1075000
UNION
	SELECT count(accountNo) as count   ,'> 1075000 and <= 1100000'as Tier ,42 as ordernum from tmp_q4_mem_qps_wh_jmw   
    WHERE  Q4avg > 1075000 and  Q4avg <= 1100000
UNION
	SELECT count(accountNo) as count   ,'> 1100000 and <= 1125000'as Tier ,43 as ordernum from tmp_q4_mem_qps_wh_jmw   
    WHERE  Q4avg > 1100000 and  Q4avg <= 1125000
UNION
	SELECT count(accountNo) as count   ,'> 1125000 and <= 1150000'as Tier ,44 as ordernum from tmp_q4_mem_qps_wh_jmw   
    WHERE  Q4avg > 1125000 and  Q4avg <= 1150000
UNION
	SELECT count(accountNo) as count   ,'> 1150000 and <= 1175000'as Tier ,45 as ordernum from tmp_q4_mem_qps_wh_jmw   
    WHERE  Q4avg > 1150000 and  Q4avg <= 1175000
UNION
	SELECT count(accountNo) as count   ,'> 1175000 and <= 1200000'as Tier ,46 as ordernum from tmp_q4_mem_qps_wh_jmw   
    WHERE  Q4avg > 1175000 and  Q4avg <= 1200000
UNION
	SELECT count(accountNo) as count   ,'> 1200000 and <= 1225000'as Tier ,47 as ordernum from tmp_q4_mem_qps_wh_jmw   
    WHERE  Q4avg > 1200000 and  Q4avg <= 1225000
UNION
	SELECT count(accountNo) as count   ,'> 1225000 and <= 1250000'as Tier ,48 as ordernum from tmp_q4_mem_qps_wh_jmw   
    WHERE  Q4avg > 1225000 and  Q4avg <= 1250000
UNION
	SELECT count(accountNo) as count   ,'> 1250000 and <= 1275000'as Tier ,49 as ordernum from tmp_q4_mem_qps_wh_jmw   
    WHERE  Q4avg > 1250000 and  Q4avg <= 1275000
UNION
	SELECT count(accountNo) as count   ,'> 1275000 and <= 1300000'as Tier ,50 as ordernum from tmp_q4_mem_qps_wh_jmw   
    WHERE  Q4avg > 1275000 and  Q4avg <= 1300000
UNION
	SELECT count(accountNo) as count   ,'> 1300000 and <= 1325000'as Tier ,51 as ordernum from tmp_q4_mem_qps_wh_jmw   
    WHERE  Q4avg > 1300000 and  Q4avg <= 1325000
UNION
	SELECT count(accountNo) as count   ,'> 1325000 and <= 1350000'as Tier ,52 as ordernum from tmp_q4_mem_qps_wh_jmw   
    WHERE  Q4avg > 1325000 and  Q4avg <= 1350000
UNION
	SELECT count(accountNo) as count   ,'> 1350000 and <= 1375000'as Tier ,53 as ordernum from tmp_q4_mem_qps_wh_jmw   
    WHERE  Q4avg > 1350000 and  Q4avg <= 1375000
UNION
	SELECT count(accountNo) as count   ,'> 1375000 and <= 1400000'as Tier ,54 as ordernum from tmp_q4_mem_qps_wh_jmw   
    WHERE  Q4avg > 1375000 and  Q4avg <= 1400000
UNION
	SELECT count(accountNo) as count   ,'> 1400000 and <= 1425000'as Tier ,55 as ordernum from tmp_q4_mem_qps_wh_jmw   
    WHERE  Q4avg > 1400000 and  Q4avg <= 1425000
UNION
	SELECT count(accountNo) as count   ,'> 1425000 and <= 1450000'as Tier ,56 as ordernum from tmp_q4_mem_qps_wh_jmw   
    WHERE  Q4avg > 1425000 and  Q4avg <= 1450000
UNION
	SELECT count(accountNo) as count   ,'> 1450000 and <= 1475000'as Tier ,57 as ordernum from tmp_q4_mem_qps_wh_jmw   
    WHERE  Q4avg > 1450000 and  Q4avg <= 1475000
UNION
	SELECT count(accountNo) as count   ,'> 1475000 and <= 1500000'as Tier ,58 as ordernum from tmp_q4_mem_qps_wh_jmw   
    WHERE  Q4avg > 1475000 and  Q4avg <= 1500000
UNION
	SELECT count(accountNo) as count   ,'> 1500000 and <= 1525000'as Tier ,59 as ordernum from tmp_q4_mem_qps_wh_jmw   
    WHERE  Q4avg > 1500000 and  Q4avg <= 1525000

--------

UNION
	SELECT count(accountNo) as count   ,'> 1525000 and <= 1575000'as Tier ,60 as ordernum from tmp_q4_mem_qps_wh_jmw   
    WHERE  Q4avg > 1525000 and  Q4avg <= 1575000
UNION
	SELECT count(accountNo) as count   ,'> 1575000 and <= 1600000'as Tier ,61 as ordernum from tmp_q4_mem_qps_wh_jmw   
    WHERE  Q4avg > 1575000 and  Q4avg <= 1600000
UNION
	SELECT count(accountNo) as count   ,'> 1600000 and <= 1625000'as Tier ,62 as ordernum from tmp_q4_mem_qps_wh_jmw   
    WHERE  Q4avg > 1600000 and  Q4avg <= 1625000
UNION
	SELECT count(accountNo) as count   ,'> 1625000 and <= 1650000'as Tier ,63 as ordernum from tmp_q4_mem_qps_wh_jmw   
    WHERE  Q4avg > 1625000 and  Q4avg <= 1650000
UNION
	SELECT count(accountNo) as count   ,'> 1650000 and <= 1675000'as Tier ,64 as ordernum from tmp_q4_mem_qps_wh_jmw   
    WHERE  Q4avg > 1650000 and  Q4avg <= 1675000
UNION
	SELECT count(accountNo) as count   ,'> 1675000 and <= 1700000'as Tier ,65 as ordernum from tmp_q4_mem_qps_wh_jmw   
    WHERE  Q4avg > 1675000 and  Q4avg <= 1700000
UNION
	SELECT count(accountNo) as count   ,'> 1700000 and <= 1725000'as Tier ,66 as ordernum from tmp_q4_mem_qps_wh_jmw   
    WHERE  Q4avg > 1700000 and  Q4avg <= 1725000
UNION
	SELECT count(accountNo) as count   ,'> 1725000 and <= 1750000'as Tier ,67 as ordernum from tmp_q4_mem_qps_wh_jmw   
    WHERE  Q4avg > 1725000 and  Q4avg <= 1750000
UNION
	SELECT count(accountNo) as count   ,'> 1750000 and <= 1775000'as Tier ,68 as ordernum from tmp_q4_mem_qps_wh_jmw   
    WHERE  Q4avg > 1750000 and  Q4avg <= 1775000
UNION
	SELECT count(accountNo) as count   ,'> 1775000 and <= 1800000'as Tier ,69 as ordernum from tmp_q4_mem_qps_wh_jmw   
    WHERE  Q4avg > 1775000 and  Q4avg <= 1800000

---------------------------
UNION
	SELECT count(accountNo) as count   ,'> -25000 and <= 0'as Tier ,0  as ordernum from tmp_q4_mem_qps_wh_jmw   
    WHERE  Q4avg > -50000 and  Q4avg <= 0
) tmp1
order by ordernum

    END









GO
