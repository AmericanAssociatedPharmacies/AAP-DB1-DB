USE [Reports]
GO
/****** Object:  StoredProcedure [dbo].[usp_Import_HVRebate_Load]    Script Date: 12/22/2020 5:00:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_Import_HVRebate_Load]


AS

SET NOCOUNT ON;

BEGIN

	MERGE [dbo].[Import_HVRebate] AS t
	USING [Staging].[vwHighVolumeRebate] AS s ON t.Date = s.Date
												AND t.PMID = s.PMID

	WHEN MATCHED THEN 
	UPDATE
	SET t.[AAP#] = s.[AAP#]
	, t.[API acct] = s.[API acct]
	, t.[Customer Name] = s.[Customer Name]
	, t.[City] = s.[City]
	, t.[ST] = s.[ST]
	, t.[Bs Class] = s.[Bs Class]
	, t.[Month] = s.[Month]
	--, t.[Multiple Store Code] = s.[Multiple Store Code]
	, t.[Current Est Mo Sales] = s.[Current Est Mo Sales]
	, t.[Mo API Volume] = s.[Mo API Volume]
	, t.[CAH off Contract-LTC Volume] = s.[CAH off Contract-LTC Volume]
	, t.[AAP Net Sales] = s.[AAP Net Sales]
	, t.[Mo Comb Volume] = s.[Mo Comb Volume]
	, t.[AAP Sales- COG Applied] = s.[AAP Sales- COG Applied]
	, t.[AAP Brand RX Sales] = s.[AAP Brand RX Sales]
	, t.[Current CA COG] = s.[Current CA COG]
	, t.[Base] = s.[Base]
	, t.[Brand RX@WAC] = s.[Brand RX@WAC]
	, t.[Brand RX Saved] = s.[Brand RX Saved]
	--, t.[Rebate Eligible Source Generics] = s.[Rebate Eligible Source Generics]
	, t.[Generic Source] = s.[Generic Source]
	, t.[1% Generic Admin] = s.[1% Generic Admin]
	, t.[Incentive from AAP Net Sales] = s.[Incentive from AAP Net Sales]
	, t.[High Volume Incentive] = s.[High Volume Incentive]
	, t.[Total Saved] = s.[Total Saved]
	, t.[ECOG] = s.[ECOG]
	, t.[COG Reduction] = s.[COG Reduction]
	, t.[A/P Payment Mode] = s.[A/P Payment Mode]
	, t.[Group] = s.[Group]

	WHEN NOT MATCHED BY TARGET THEN
	INSERT([Date],[PMID],[AAP#],[API acct],[Customer Name],[City],[ST],[Bs Class],[Month],[Current Est Mo Sales],[Mo API Volume],[CAH off Contract-LTC Volume],[AAP Net Sales]
			,[Mo Comb Volume],[AAP Sales- COG Applied],[AAP Brand RX Sales],[Current CA COG],[Base],[Brand RX@WAC],[Brand RX Saved],[High Volume Incentive],[Total Saved],[ECOG]
			,[COG Reduction],[Generic Source],[1% Generic Admin],[Incentive from AAP Net Sales],[A/P Payment Mode],[Group])
	VALUES(s.[Date],s.[PMID],s.[AAP#],s.[API acct],s.[Customer Name],s.[City],s.[ST],s.[Bs Class],s.[Month],s.[Current Est Mo Sales],s.[Mo API Volume],s.[CAH off Contract-LTC Volume]
			,s.[AAP Net Sales],s.[Mo Comb Volume],s.[AAP Sales- COG Applied],s.[AAP Brand RX Sales],s.[Current CA COG],s.[Base],s.[Brand RX@WAC],s.[Brand RX Saved],s.[High Volume Incentive]
			,s.[Total Saved],s.[ECOG],s.[COG Reduction],s.[Generic Source],s.[1% Generic Admin],s.[Incentive from AAP Net Sales],s.[A/P Payment Mode],s.[Group]
			);


END
GO
