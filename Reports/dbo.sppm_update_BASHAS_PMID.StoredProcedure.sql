USE [Reports]
GO
/****** Object:  StoredProcedure [dbo].[sppm_update_BASHAS_PMID]    Script Date: 12/22/2020 5:00:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
-- =============================================
-- Author:		Joni Wilson
-- Create date: 4/26/2010
-- Description:	load Cardinal CHPH file for AAP
-- =============================================
CREATE PROCEDURE [dbo].[sppm_update_BASHAS_PMID] 
 
AS

BEGIN
--    	UPDATE  c  set 
--			c.pmid = p.pmid  
--	   FROM purchases..ch_bashas   c 
--		inner join 
--			( select pmid,udaccountno,aapaccountno from pharmacymaster..pm_pharmacy where pmid is not null ) p
--	    on c.storeno = p.udaccountno or c.storeno = p.aapaccountno 


UPDATE  c  set 
			c.pmid = p.pmid  
	   FROM purchases..ch_bashas   c 
		inner join 
			(select pmid,ncpdp from pharmacymaster..pm_pharmacy where pmid is not null ) p
	    on replicate('0', 7-len(c.ncpdp)) + c.ncpdp = p.ncpdp where c.ncpdp != 0 and c.pmid is null  


--  select 
--			c.pmid as cpmid, p.pmid as ppmid  ,c.ncpdp as cncpdp,p.ncpdp as pncpdp
--	   FROM purchases..ch_bashas   c 
--		left outer join 
--			( select pmid,ncpdp from pharmacymaster..pm_pharmacy where pmid is not null ) p
--	    on replicate('0', 7-len(c.ncpdp)) + c.ncpdp = p.ncpdp where c.ncpdp != 0

END

GO
