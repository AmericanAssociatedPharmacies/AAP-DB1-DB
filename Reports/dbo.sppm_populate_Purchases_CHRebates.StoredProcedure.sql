USE [Reports]
GO
/****** Object:  StoredProcedure [dbo].[sppm_populate_Purchases_CHRebates]    Script Date: 12/22/2020 5:00:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		< Joni Wilson>
-- Create date: <05/24/2011>
-- Description:	Populate Rebate from  Import
-- =============================================
CREATE PROCEDURE [dbo].[sppm_populate_Purchases_CHRebates]
(@in_date varchar(10))
 

AS
BEGIN
 
-- SET NOCOUNT ON added to prevent extra result sets from
-- interfering with SELECT statements.
SET NOCOUNT ON; 

--If data already loaded delete the old data
IF EXISTS (Select MAX(PMID) as pmid FROM Purchases..CHRebates WHERE date = @in_date)
BEGIN
	DELETE FROM Purchases..CHRebates WHERE date = @in_date
END

INSERT INTO Purchases..CHRebates ( date,month,year,PMID,NCPDP,CHRebatePerc)
 

--SELECT Date,month(date) as month,year(date) as year, r.PMID,ncpdp,GenericRebate/SourceGenericSales as CalcRebatePerc  from pharmacymaster..pm_rebates_chaap  r
--join
--(
--	SELECT pmid,ncpdp FROM pharmacymaster..pm_Pharmacy
--)p on r.pmid = p.pmid  WHERE date = @in_date and SourceGenericSales != 0 and effrebateperc != 0;
 
--Update JMW 11/23/2015 - needed to join Cardinal and Direct Pay instead of doing seperately in case there was a rebate for both 
-- on the same PMID - there shouldn't be but need to handle in case it does.  The SourceGenericSales is set to zero as the SourceGenericSales
-- is only in the pm_rebates_chaap

SELECT * from (
	SELECT Date,month,year,PMID,NCPDP,
	case when sum(SourceGenericSales) != 0 then Sum(GenericRebate)/sum(SourceGenericSales) else 0 end as CHRebatePerc   from (
	SELECT Date,month(date) as month,year(date) as year, r.PMID,ncpdp,GenericRebate ,SourceGenericSales   from pharmacymaster..pm_rebates_chaap  r
	join
	(
		SELECT pmid,ncpdp FROM pharmacymaster..pm_Pharmacy
	)p on r.pmid = p.pmid  WHERE date = @in_date and SourceGenericSales != 0 and effrebateperc != 0   
	union all 
	SELECT Date,month(date) as month,year(date) as year, r.PMID,ncpdp,GenericRebate, 0 as SourceGenericSales  from reports..import_rebates_cahdirect r
	join
	(
		SELECT pmid,ncpdp FROM pharmacymaster..pm_Pharmacy
	)p on r.pmid = p.pmid  WHERE date = @in_date   and effrebateperc != 0  
	) ch   group by pmid,date,month,year,ncpdp  
) ch1 where CHRebatePerc != 0 and ncpdp is not null 


END










GO
