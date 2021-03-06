USE [PMBackups]
GO
/****** Object:  StoredProcedure [dbo].[sppm_compare_APIBusCls_PMAffiliate]    Script Date: 12/22/2020 4:47:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		< Joni Wilson>
-- Create date: <03/29/2010>
-- Description:	Backup and Truncate AddressMaster to recreate
-- Modified : Added the Replace T with blank when comparing ASW field 02/11/2011
-- =============================================
CREATE PROCEDURE [dbo].[sppm_compare_APIBusCls_PMAffiliate]

AS
BEGIN
 
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
  
	   --- Drop the previous runs table


   IF EXISTS(SELECT name FROM sys.tables
        WHERE name = 'tmp_CompareAPIBusCls')
          DROP TABLE tmp_CompareAPIBusCls
 

SELECT  * into tmp_CompareAPIBusCls from (
--		SELECT p1.PMID,p2.AccountNo as APIAccountNo,p2.AccountName,p2.Status,p1.Affiliate as PM_Affiliate,p2.group_name as ASW_BusinessClass from pharmacymaster..v_pm_allwithaffiliates  p1 
--	join 
--	(
--		SELECT accountno,accountname,group_name,status from pmbackups..tmp_APIAccountMaster_Orig t
--        left outer join
--           ( 
--				select * from pharmacymaster..pm_groups where affiliateid is not null
--            ) pg
--				on t.businessclass = pg.buscls  where accountno is not null
--	) p2
--
--	ON p1.apiaccountno = p2.accountno
--		WHERE   p1.Affiliate !=  p2.group_name

select   v.PMID,v.DEA,v.AAPAccountNo,v.AAPQuitDate,a.AccountNo as APIAccountNo,a.AccountName,a.Status,v.Affiliate as PM_Affiliate,a.group_name as ASW_BusinessClass   
from pharmacymaster..v_PM_AllWithAffiliates v
join
(
	select accountno,AccountName,status,businessclass,buscls,group_name,dea from pmbackups..tmp_apiAccountMaster_orig t
	left outer join
	(
	select * from pharmacymaster..pm_groups where affiliateid is not null
	) p
	on t.businessclass = p.buscls
) a
on v.apiaccountno = a.accountno where    ((affiliate != group_name and a.businessclass != 'CZZ' 
)or 
((affiliate is not null and (group_name is null and a.businessclass != 'CZZ' 
 and a.businessclass != 'C00'))) or 
(affiliate is null and group_name is not null) or 
(affiliate is not null and group_name is null and aapquitdate is null and a.businessclass != 'CZZ'))

)tmp

select * from tmp_CompareAPIBusCls
END








GO
