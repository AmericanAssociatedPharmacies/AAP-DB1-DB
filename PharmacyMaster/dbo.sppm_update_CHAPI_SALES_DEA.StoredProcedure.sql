USE [PharmacyMaster]
GO
/****** Object:  StoredProcedure [dbo].[sppm_update_CHAPI_SALES_DEA]    Script Date: 12/22/2020 4:45:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		< Joni Wilson>
-- Create date: <04/28/2010>
-- Description:	UPdate PM_Programs table
-- =============================================
CREATE PROCEDURE [dbo].[sppm_update_CHAPI_SALES_DEA]

AS
BEGIN
 
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
  
   UPDATE  a  set 
	   a.dea = p.dea
          FROM CHAPI_SALES a
		  join 
			( select   pmid,dea  from pm_pharmacy   ) p
	      on a.pmid  = p.pmid   

 
END








GO
