USE [PharmacyMaster]
GO
/****** Object:  StoredProcedure [dbo].[rpt_CurrentAAPMemberPVAList]    Script Date: 12/22/2020 4:45:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		Rudy Hinojosa
-- Create date: 7-15-2010
-- Description:	Current AAP Member/PVA Customer List
-- DIRECTLY MODIFYING THIS STORED PROCEDURE'S NUMBER OF COLUMNS WILL AFFECT THE
-- PHARMACY MASTER REPORTING ENGINE
-- =============================================
CREATE PROCEDURE [dbo].[rpt_CurrentAAPMemberPVAList] 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

--AAP MEMBER/PVA Customer List
SELECT pm.territory,pm.aapaccountno,pm.aapparentno,pm.accountname,
(select city from pm_addressmaster where pmid = pm.pmid and address_type_id = 1) as 'city',
(select state from pm_addressmaster where pmid = pm.pmid and address_type_id = 1) as 'state',
pm.accountdescription,
(select top 1 group_name from pm_groups where group_id in (select group_id from pm_groups_xref where pmid = pm.pmid)) as 'affiliate',
convert(varchar(10),pm.aapeffectivedate,101) as 'aapeffectivedate',
case when pm.ispva = -1 then 'Y' else 'N' end AS 'IsPva',
case when pm.iswarehouse = -1 then 'Y' else 'N' end AS 'IsWarehouse',
case when pm.ismanagedcare = -1 then 'Y' else 'N' end AS 'IsManagedCare'
FROM PM_pharmacy pm where (pm.ispva <> NULL or pm.ispva <> 0) and aapquitdate is null
order by accountname
END


GO
