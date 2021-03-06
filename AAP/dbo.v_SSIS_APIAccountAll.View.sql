USE [AAP]
GO
/****** Object:  View [dbo].[v_SSIS_APIAccountAll]    Script Date: 12/22/2020 9:04:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_SSIS_APIAccountAll]
AS
--SELECT     *
--FROM         api.dbo.APIAccountMaster_Orig
--WHERE        businessclass != 'SDFT' and  Territory != 'XX' and accountNo !=  '_CREATIVE' and accountNo != 'SECRETARY'  and accountNo != '00APSLLC'

	SELECT * FROM ( 
	SELECT * , Rank() OVER (Partition BY dea order by allowdupdea desc,dbo.FixedSortOrder(status) asc, source asc) as Rank
	FROM (SELECT     *
				FROM         api.dbo.APIAccountMaster_Orig
				WHERE        businessclass != 'SDFT' and  Territory != 'XX' and
					accountNo !=  '_CREATIVE' and accountNo != 'SECRETARY' 
					and accountNo != '00APSLLC' and dea is not null and dea != 'DEA - DEA'   ) sm 
		) tmp where   Rank = 1   and (dea is not null and dea != 'DEA - DEA' )
GO
