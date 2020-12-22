USE [TempTables]
GO
/****** Object:  View [dbo].[v_tmp_CHAccounts0310]    Script Date: 12/22/2020 9:41:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[v_tmp_CHAccounts0310]
as
select c.[ship to number] as CHAccount,
c.[DEA Registration Number] as DEA,
c.contract,
p.pmid
from
import_CHAccounts0310 c left join pharmacymaster..pm_pharmacy p on c.[DEA Registration Number]=p.DEA


GO
