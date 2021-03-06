USE [WebDev]
GO
/****** Object:  StoredProcedure [dbo].[spSCANdata]    Script Date: 12/22/2020 5:21:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[spSCANdata]
(
	@ncpdp varchar(15)
)
AS
/* 3/16 BG added override for Anthem stores without data
	4/16 table names changed, see [spQC_GetScoreCard]
	QC_ScorecardANTHEM
	QC_ScorecardSCAN
*/
BEGIN
	select top 1 ncpdp from 
	/*
		(select distinct ncpdp from qc_scanesidaily 
			union select distinct ncpdp from qc_scanesimonthly
			union select distinct ncpdp from qc_anthem) dt 
	*/
	(select distinct [NABP#] as NCPDP from QC_ScorecardSCAN union select distinct [NABP#] as NCPDP from QC_ScorecardANTHEM
union select distinct NCPDP from QC_ScanEsiMonthly
union select distinct NCPDP from QC_ScanEsiDemographicMonthly) dt
		where ncpdp=@ncpdp;
END
GO
