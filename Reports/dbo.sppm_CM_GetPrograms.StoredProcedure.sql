USE [Reports]
GO
/****** Object:  StoredProcedure [dbo].[sppm_CM_GetPrograms]    Script Date: 12/22/2020 5:00:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		< Joni Wilson>
-- Create date: <5/11/2015>
-- Description:	Get valid Programs for Communications
-- =============================================
CREATE PROCEDURE [dbo].[sppm_CM_GetPrograms]
 

AS
BEGIN
 
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

SELECT programid,description from
   pharmacymaster..pm_programs where programid not in(195,198)
and programid in 
(SELECT distinct programid from pharmacymaster..pm_memberprograms where enddate is null)
and programid not in (171,188)


END










GO
