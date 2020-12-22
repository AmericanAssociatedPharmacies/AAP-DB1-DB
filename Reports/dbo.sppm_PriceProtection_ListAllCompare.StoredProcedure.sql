USE [Reports]
GO
/****** Object:  StoredProcedure [dbo].[sppm_PriceProtection_ListAllCompare]    Script Date: 12/22/2020 5:00:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
-- =============================================
-- Author:		Joni Wilson
-- Create date: 9/23/2014
-- Description:	QA Cardinal   Price Protection  
-- =============================================
CREATE PROCEDURE [dbo].[sppm_PriceProtection_ListAllCompare] 
	-- Add the parameters for the stored procedure here

AS
 

BEGIN

SET ARITHABORT OFF 
SET ANSI_WARNINGS OFF


-- All Compare
 SELECT * from tmp_PPCompare  


 
END

GO
