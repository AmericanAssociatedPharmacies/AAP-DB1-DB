USE [Reports]
GO
/****** Object:  StoredProcedure [dbo].[sppm_PriceProtectionDeleteSourceContract]    Script Date: 12/22/2020 5:00:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
-- =============================================
-- Author:		Joni Wilson
-- Create date: 5/19/2015
-- Description:	QA Cardinal   Price Protection  
-- =============================================
CREATE PROCEDURE [dbo].[sppm_PriceProtectionDeleteSourceContract] 
	-- Add the parameters for the stored procedure here
@in_date varchar(10) 
AS
 

BEGIN

SET ARITHABORT OFF 
SET ANSI_WARNINGS OFF

DELETE from reports..import_CASourceContractMO where date = @in_date

DELETE from pharmacymaster..CASourceContractMO where date = @in_date
  

 
END

GO
