USE [Reports]
GO
/****** Object:  StoredProcedure [dbo].[sppm_list_ControlSub_RPT]    Script Date: 12/22/2020 5:00:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		< Joni Wilson>
-- Create date: <10/14/2010>
-- Description:	Call Controlled Substance report
-- =============================================
Create PROCEDURE [dbo].[sppm_list_ControlSub_RPT]

AS
BEGIN
 
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	SELECT * from tmp_ControlSub_ALL
END










GO
