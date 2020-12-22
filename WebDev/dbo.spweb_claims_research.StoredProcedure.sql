USE [WebDev]
GO
/****** Object:  StoredProcedure [dbo].[spweb_claims_research]    Script Date: 12/22/2020 5:21:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		JOSHILA NARAYANAN
-- Create date: 02/12/2013
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spweb_claims_research]
	
AS
BEGIN
	
	SET NOCOUNT ON;	

    Select BIN,PCN,[Group],PatName,PatID,PatDOB,Wholesaler,NDC,Filldate,Quantity,RxNbr,DaySupply,TotalCost,TotalPaid,Maced,NCPDP,ContactName,Email,Phone,Fax,CreatedOn,CreatedBy,Notes,DispensingFee,Compound FROM rform_claims_research

END
GO
