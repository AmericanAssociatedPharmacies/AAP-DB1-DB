USE [Reports]
GO
/****** Object:  StoredProcedure [dbo].[sppm_CM_AccoutDescriptionPopulate]    Script Date: 12/22/2020 5:00:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:		< Joni Wilson>
-- Create date: <5/18/2015>
-- Description:	Get List of Account Descriptions for Comm UI
-- =============================================
CREATE PROCEDURE [dbo].[sppm_CM_AccoutDescriptionPopulate]

AS
BEGIN
 
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

SELECT DISTINCT AccountDescription FROM pharmacymaster..pm_pharmacy WHERE 
accountdescription is not null and accountdescription != ''
ORDER by accountdescription


END










GO
