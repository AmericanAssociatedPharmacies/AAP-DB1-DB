USE [intranet]
GO
/****** Object:  StoredProcedure [dbo].[spud_IntranetWebtmpAdd]    Script Date: 12/22/2020 4:34:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		JOSHILA NARAYANAN
-- Create date: 11/1/2013
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[spud_IntranetWebtmpAdd]
	
AS
BEGIN
	
	SET NOCOUNT ON;

	--Insert into temp table from web	
	

		INSERT INTO tmp_UPRequests (BIN,PCN,[Group],PatName,PatID,PatDOB,Wholesaler,NDC,Filldate,Quantity,RxNbr,DaySupply,TotalCost,TotalPaid,Maced,NCPDP,ContactName,Email,Phone,Fax,CreatedOn,CreatedBy,Notes,DispensingFee,Compound) 
		execute ('WebDev.dbo.spweb_claims_research');
			


	
	

END
GO
