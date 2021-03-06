USE [API]
GO
/****** Object:  StoredProcedure [dbo].[spapi_create_Shipping_API]    Script Date: 12/22/2020 4:19:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[spapi_create_Shipping_API]
  
AS
SET NOCOUNT ON

 

BEGIN
-- This isn't really what it's going to be - just how it could work to pull data to populate a table
	SELECT distinct whaccountid,invnbr,invdate,PMID,NCPDP from api..apisalesdetail a
	join
	(
	SELECT pmid,apiaccountno,ncpdp from pharmacymaster..pm_pharmacy
	)p 
	on a.whaccountid = p. apiaccountno

	where invdate > (select DATEADD(d,-15,getdate()))
	order by whaccountid

END

SET NOCOUNT OFF
GO
