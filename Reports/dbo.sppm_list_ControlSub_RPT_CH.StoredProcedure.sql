USE [Reports]
GO
/****** Object:  StoredProcedure [dbo].[sppm_list_ControlSub_RPT_CH]    Script Date: 12/22/2020 5:00:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		< Joni Wilson>
-- Create date: <10/14/2010>
-- Description:	Call Controlled Substance report
-- =============================================
CREATE PROCEDURE [dbo].[sppm_list_ControlSub_RPT_CH]

AS
BEGIN
 
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	Select
		AccountName,
        DEA,
		APIAccountNo,
		[CH_GenericUnits],
		[CH_BrandUnits],
		[CH_ControlUnitsCII],
		[CH_ControlUnits3_5],
		[CH_ControlUnitsTotal],
		[CH_NonControlUnits],
		[CH_Hydros],
        [CH_Hydro10s],
		[CH_Oxys],
		[CH_Oxy30s],
		[CH_AllALP],
		[CH_ALP2MG],
		[CH_METHADONE],
		[CH_%CII-CV],
		[CH_%CII-CV_AVG3MO],
		[CH_%CII],
		[CH_%CII_AVG3MO]

		from tmp_ControlSub_ALL
END










GO
