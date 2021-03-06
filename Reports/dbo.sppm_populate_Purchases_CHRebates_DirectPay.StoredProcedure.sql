USE [Reports]
GO
/****** Object:  StoredProcedure [dbo].[sppm_populate_Purchases_CHRebates_DirectPay]    Script Date: 12/22/2020 5:00:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		< Joni Wilson>
-- Create date: <05/24/2011>
-- Description:	Populate Rebate from  Import
-- =============================================
CREATE PROCEDURE [dbo].[sppm_populate_Purchases_CHRebates_DirectPay]
(@in_date varchar(10))
 

AS
BEGIN
 
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON; 
INSERT INTO Purchases..CHRebates ( date,month,year,PMID,NCPDP,CHRebatePerc)
 

SELECT Date,month(date) as month,year(date) as year, r.PMID,ncpdp,effrebateperc as CalcRebatePerc  from reports..import_rebates_cahdirect r
join
(
	SELECT pmid,ncpdp FROM pharmacymaster..pm_Pharmacy
)p on r.pmid = p.pmid  WHERE date = @in_date  and effrebateperc != 0

 


END










GO
