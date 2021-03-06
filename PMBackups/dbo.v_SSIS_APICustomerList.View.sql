USE [PMBackups]
GO
/****** Object:  View [dbo].[v_SSIS_APICustomerList]    Script Date: 12/22/2020 9:24:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[v_SSIS_APICustomerList]
AS

	SELECT * FROM ( 
	SELECT * , Rank() OVER (Partition BY dea order by allowdupdea desc,aap.dbo.FixedSortOrder(status) asc, source asc) as Rank
	FROM (SELECT     *
				FROM         PMBackups.dbo.tmp_APICustomerList
				WHERE        businessclass != 'SDFT' and  Territory != 'XX' and
					accountNo !=  '_CREATIVE' and accountNo != 'SECRETARY' 
					and accountNo != '00APSLLC' and dea is not null and dea != 'DEA - DEA'   ) sm 
		) tmp where   Rank = 1   and (dea is not null and dea != 'DEA - DEA' )

    UNION
    SELECT * , cast(0.0 as int) as Rank from PMBackups.dbo.tmp_APICustomerList where (dea is null or dea = 'DEA - DEA')
          and businessclass != 'SDFT' and  Territory != 'XX' and
					accountNo !=  '_CREATIVE' and accountNo != 'SECRETARY' 
					and accountNo != '00APSLLC'

GO
