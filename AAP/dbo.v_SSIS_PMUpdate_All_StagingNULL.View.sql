USE [AAP]
GO
/****** Object:  View [dbo].[v_SSIS_PMUpdate_All_StagingNULL]    Script Date: 12/22/2020 9:04:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_SSIS_PMUpdate_All_StagingNULL]
AS

--select * from PMUpdate_All_staging  where ( dea is null or dea  = 'DEA - DEA' ) and
--                   (( businessclass != 'SDFT' and  Territory != 'XX' and
--					apiaccountNo !=  '_CREATIVE' and apiaccountNo != 'SECRETARY' 
--					and apiaccountNo != '00APSLLC' ) or apiaccountNo is null)

select * from PMUpdate_All_staging  where ( dea is null or dea  = 'DEA - DEA' ) and
 (( businessclass != 'SDFT'  or businessclass is null) 
    and ( Territory != 'XX' or Territory is null) 
  and ((apiaccountNo !=  '_CREATIVE' and apiaccountNo != 'SECRETARY' and apiaccountNo != '00APSLLC' ) or apiaccountNo is null) )

GO
