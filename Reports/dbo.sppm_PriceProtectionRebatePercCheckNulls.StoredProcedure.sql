USE [Reports]
GO
/****** Object:  StoredProcedure [dbo].[sppm_PriceProtectionRebatePercCheckNulls]    Script Date: 12/22/2020 5:00:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
-- =============================================
-- Author:		Joni Wilson
-- Create date: 9/23/2014
-- Description:	QA Cardinal   Price Protection  
-- =============================================
CREATE PROCEDURE [dbo].[sppm_PriceProtectionRebatePercCheckNulls] 
	-- Add the parameters for the stored procedure here
@in_date varchar(10) 
AS
 

BEGIN

SET ARITHABORT OFF 
SET ANSI_WARNINGS OFF

--Comment out when done testing:

--SELECT top 100 *   from PharmacyMaster..CA_PriceProtection where 
-- date = @in_date

-- Uncomment when done testing - 
SELECT *  from PharmacyMaster..CA_PriceProtection where 
FinalPriceProtectionDue is null and date = @in_date
 
 
 
END

GO
