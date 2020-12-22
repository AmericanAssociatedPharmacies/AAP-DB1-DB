USE [Reports]
GO
/****** Object:  StoredProcedure [dbo].[sppm_CM_GetAffiliates]    Script Date: 12/22/2020 5:00:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		< Joni Wilson>
-- Create date: <5/11/2015>
-- Description:	Get valid Affiliates for Communications
-- =============================================
CREATE PROCEDURE [dbo].[sppm_CM_GetAffiliates]
 

AS
BEGIN
 
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
  
SELECT Group_ID,Group_Name from pharmacymaster..pm_groups where affiliateid is not null and 
affiliateid  ! ='' and group_id in 
(SELECT distinct group_id from pharmacymaster..pm_groups_xref)


END










GO
