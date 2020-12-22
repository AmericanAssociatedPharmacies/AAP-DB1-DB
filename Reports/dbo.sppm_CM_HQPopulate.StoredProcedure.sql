USE [Reports]
GO
/****** Object:  StoredProcedure [dbo].[sppm_CM_HQPopulate]    Script Date: 12/22/2020 5:00:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:		< Joni Wilson>
-- Create date: <5/18/2015>
-- Description:	Get List of HQ for Comm UI
-- =============================================
CREATE PROCEDURE [dbo].[sppm_CM_HQPopulate]

AS
BEGIN
 
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
--	SELECT  distinct businessClass,Group_Name  from pharmacymaster..pm_corporate p  
--				  join(  
--				  select * from pharmacymaster..pm_groups  
--				  ) a on p.businessclass = a.buscls 


SELECT distinct source, accountname from pharmacymaster..v_Address_CommMaster_Corporate 

END










GO
