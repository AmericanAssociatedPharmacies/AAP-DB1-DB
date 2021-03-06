USE [AAP]
GO
/****** Object:  StoredProcedure [dbo].[spaap_create_Qrtrly_Vol_WH_BS]    Script Date: 12/22/2020 4:10:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		< Joni Wilson>
-- Create date: <08/29/2008>
-- Description:	Update account numbers for the  AccountMasterActive_Distinct table
-- =============================================
CREATE PROCEDURE [dbo].[spaap_create_Qrtrly_Vol_WH_BS]

AS
	BEGIN


 
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
        IF EXISTS(SELECT name FROM sys.tables
        WHERE name = 'tmp_qrtr_jmw')
          DROP TABLE tmp_qrtr_jmw
 SELECT * INTO tmp_qrtr_jmw from 
(
	SELECT ch.dea as DEA ,pmn.accountname as AccountName, aap.aapid as AAPID, accountdescription as AccountDescription,
	   sum(Q4_2009) as UD_PVA ,sum(Q4_2009_CH_API) as API_PVA ,sum(Q4_2009_WH_API) as WH_Purchases from (
		select  pm.dea, sum( n.october + n.november + n.december ) as Q4_2009,cast (0 as numeric(18,2) ) as Q4_2009_CH_API,cast (0 as numeric(18,2) ) as Q4_2009_WH_API
		from reporting.dbo.volumecalyy n
		left outer join (SELECT DEA,udaccountno,aapAccountNo FROM aap.dbo.PharmacyMaster) pm 
		on pm.UDAccountNo = n.acct_no or pm.aapAccountNo = n.acct_no
		where vendor_id in (65,86) and year = '2009' AND
	 ( OCTOBER <> 0 OR NOVEMBER <> 0 OR DECEMBER <> 0) and dea is not null
	   group by  pm.dea
	    
	UNION
	   SELECT pm.dea ,cast (0 as numeric(18,2) ) as Q4_2009,sum(api.october + api.november + api.december ) as Q4_2009_CH_API,cast (0 as numeric(18,2) ) as Q4_2009_WH_API
		 from api..apicardvolume api
	  left outer join (select dea ,apiaccountno  FROM aap.dbo.PharmacyMaster) pm 
	   on api.apiaccountno = pm.apiaccountno where pm.dea is not null
		group by pm.dea

	UNION
	 
	   SELECT pm.dea ,cast (0 as numeric(18,2) ) as Q4_2009,cast (0 as numeric(18,2) ) as Q4_2009_CH_API,sum(api.october + api.november + api.december ) as Q4_2009_WH_API 
		 from api..API_Sum_Totamt_Mnthly api
	  left outer join (select dea ,apiaccountno  FROM aap.dbo.PharmacyMaster) pm 
	   on api.whaccountid = pm.apiaccountno where dea is not null
		group by pm.dea
	) ch

	left outer join
	(
	  SELECT aapid, accountdescription,dea from aapaccount 
	) aap
	on ch.dea  =  aap.dea
	left outer join 
	(
	SELECT accountname,dea from aap..pharmacymaster
	) pmn
	on ch.dea = pmn.dea   
	group by ch.dea, AAPID,accountdescription,accountname

) tmp

-- Need to remove duplicate entries for accounts that have duplicate deas (it's all rolled up to one)
DELETE from tmp_qrtr_jmw where accountname = 'LOUIS & CLARK #572-B'
DELETE from tmp_qrtr_jmw where accountname = 'SULLIVANS PHARMACY-B'
 
    END









GO
