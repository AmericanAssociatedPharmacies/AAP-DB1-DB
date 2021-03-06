USE [PMBackups]
GO
/****** Object:  StoredProcedure [dbo].[sppm_compare_APIPMIDDEA_PMPMIDDEA]    Script Date: 12/22/2020 4:47:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		< Joni Wilson>
-- Create date: <03/29/2010>
-- Description:	Backup and Truncate AddressMaster to recreate
-- =============================================
CREATE PROCEDURE [dbo].[sppm_compare_APIPMIDDEA_PMPMIDDEA]

AS
BEGIN
 
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
  
	   --- Drop the previous runs table

select p1.PMID,p1.AccountName,AAPQuitDate,p1.APIAccountNo, p1.DEA,p2.DEA  as NewDEA,p2.PMID as NewPMID,
p2.AccountName as NewAccountName,p2.APIAccountNo as NewAPIAccountNo,p2.AAPEffectiveDate as NewAAPEffectiveDate
from pharmacymaster..pm_pharmacy p1
join
(
	select PMID,DEA,AccountName,APIAccountNo,AAPEffectiveDate from pharmacymaster..pm_pharmacy
) p2
on substring(ltrim(rtrim(p1.dea)),1,9) = p2.dea
where p1.dea like '%-%' and
p1.dea not like '%OFFICE%' and p1.dea not like '%DEA%' and p1.apiaccountno is not null
order by p2.apiaccountno
END








GO
