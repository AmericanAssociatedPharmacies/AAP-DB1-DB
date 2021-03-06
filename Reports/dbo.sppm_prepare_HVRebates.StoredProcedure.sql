USE [Reports]
GO
/****** Object:  StoredProcedure [dbo].[sppm_prepare_HVRebates]    Script Date: 12/22/2020 5:00:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO






-- =============================================
-- Author:		< Joni Wilson>
-- Create date: <05/24/2011>
-- Description:	Populate High Volume Rebate from  Import
-- =============================================
CREATE PROCEDURE [dbo].[sppm_prepare_HVRebates]
		@in_date varchar(10)


AS

SET NOCOUNT ON;

BEGIN
 
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.





 UPDATE x
 SET [AAP#] = i.[AAP#]
, [API acct] = i.[API acct]
, [Customer Name] = i.[Customer Name]
, [City] = i.[City]
, [ST] = i.[ST]
, [Bs Class] = i.[Bs Class]
, [Month] = i.[Month]
, [Current Est Mo Sales] = i.[Current Est Mo Sales]
, [Mo API Volume] = i.[Mo API Volume]
, [CAH off Contract-LTC Volume] = i.[CAH off Contract-LTC Volume]
, [AAP Net Sales] = i.[AAP Net Sales]
, [Mo Comb Volume] = i.[Mo Comb Volume]
, [AAP Sales- COG Applied] = i.[AAP Sales- COG Applied]
, [AAP Brand RX Sales] = i.[AAP Brand RX Sales]
, [Current CA COG] = i.[Current CA COG]
, [Base] = i.[Base]
, [Brand RX@WAC] = i.[Brand RX@WAC]
, [Brand RX Saved] = i.[Brand RX Saved]
, [High Volume Incentive] = i.[High Volume Incentive]
, [Total Saved] = i.[Total Saved]
, [ECOG] = i.[ECOG]
, [COG Reduction] = i.[COG Reduction]
, [Generic Source] = i.[Generic Source]
, [1% Generic Admin] = i.[1% Generic Admin]
, [Incentive from AAP Net Sales] = i.[Incentive from AAP Net Sales]
, [A/P Payment Mode] = i.[A/P Payment Mode]
, [Group] = i.[Group]
	FROM PharmacyMaster.[dbo].[pm_rebates_highvolume] AS x
	INNER JOIN dbo.Import_HVRebate AS i ON x.PMID = CONVERT(NVARCHAR(255),i.PMID)
											AND x.Date = i.Date
	WHERE x.date = @in_date
  
INSERT INTO PharmacyMaster..PM_Rebates_HighVolume (date,
rebate_type,
PMID,
AAP#,
[API acct],
[Customer Name],
City,
ST,
[Bs Class],
Month,
[Current Est Mo Sales],
[Mo API Volume],
[CAH off Contract-LTC Volume],
[AAP Net Sales],
[Mo Comb Volume],
[AAP Sales- COG Applied],
[AAP Brand RX Sales],
[Current CA COG],
Base,
[Brand RX@WAC],
[Brand RX Saved],
[High Volume Incentive], 
[Total Saved],
ECOG,
[COG Reduction] ,
[Generic Source],
[1% Generic Admin],
[Incentive from AAP Net Sales],
[A/P Payment Mode],
[Group]
)  

SELECT Date,'HV',
PMID,
AAP#,
[API acct],
[Customer Name],
City,
ST,
[Bs Class],
Month,
[Current Est Mo Sales],
[Mo API Volume],
[CAH off Contract-LTC Volume],
[AAP Net Sales],
[Mo Comb Volume],
[AAP Sales- COG Applied],
[AAP Brand RX Sales],
[Current CA COG],
Base,
[Brand RX@WAC],
[Brand RX Saved],
[High Volume Incentive], 
[Total Saved],
ECOG,
[COG Reduction] ,
[Generic Source],
[1% Generic Admin],
[Incentive from AAP Net Sales],
[A/P Payment Mode],
[Group]
 from dbo.Import_HVRebate AS i 
 where date = @in_date
 AND NOT EXISTS(SELECT 1
				FROM PharmacyMaster..PM_Rebates_HighVolume AS h
				WHERE CONVERT(NVARCHAR(255),i.PMID) = h.PMID
				AND i.Date = h.Date
				)

UPDATE Import_HVRebate set [Generic Source] = 0 where [Generic Source] is null;
UPDATE Import_HVRebate set [1% Generic Admin]  = 0 where [1% Generic Admin] is null;
UPDATE Import_HVRebate set [Incentive from AAP Net Sales] = 0 where [Incentive from AAP Net Sales] is null;
 
UPDATE PharmacyMaster..PM_Rebates_HighVolume  set [Generic Source] = 0 where [Generic Source] is null;
UPDATE PharmacyMaster..PM_Rebates_HighVolume  set [1% Generic Admin]  = 0 where [1% Generic Admin] is null;
UPDATE PharmacyMaster..PM_Rebates_HighVolume  set [Incentive from AAP Net Sales] = 0 where [Incentive from AAP Net Sales] is null;
 
Delete from PharmacyMaster..PM_Rebates_HighVolume where PMID is NULL;

------
--Now do LaJolla

INSERT INTO PharmacyMaster..PM_Rebates_HighVolume_LaJolla (date,
rebate_type,
PMID,
AAP#,
[API acct],
[Customer Name],
City,
ST,
[Bs Class],
Month,
[Current Est Mo Sales],
[Mo API Volume],
[CAH off Contract-LTC Volume],
[AAP Net Sales],
[Mo Comb Volume],
[AAP Sales- COG Applied],
[AAP Brand RX Sales],
[Current CA COG],
Base,
[Brand RX@WAC],
[Brand RX Saved],
[High Volume Incentive], 
[Total Saved],
ECOG,
[COG Reduction] ,
[Generic Source],
[1% Generic Admin],
[Incentive from AAP Net Sales],
[A/P Payment Mode],
[Group]
)  

SELECT Date,'HVLJ',
PMID,
AAP#,
[API acct],
[Customer Name],
City,
ST,
[Bs Class],
Month,
[Current Est Mo Sales],
[Mo API Volume],
[CAH off Contract-LTC Volume],
[AAP Net Sales],
[Mo Comb Volume],
[AAP Sales- COG Applied],
[AAP Brand RX Sales],
[Current CA COG],
Base,
[Brand RX@WAC],
[Brand RX Saved],
[High Volume Incentive], 
[Total Saved],
ECOG,
[COG Reduction] ,
[Generic Source],
[1% Generic Admin],
[Incentive from AAP Net Sales],
[A/P Payment Mode],
[Group]



 from Import_HVRebate_LaJolla  where date = @in_date

UPDATE Import_HVRebate_LaJolla set [Generic Source] = 0 where [Generic Source] is null;
UPDATE Import_HVRebate_LaJolla set [1% Generic Admin]  = 0 where [1% Generic Admin] is null;
UPDATE Import_HVRebate_LaJolla set [Incentive from AAP Net Sales] = 0 where [Incentive from AAP Net Sales] is null;
 
UPDATE PharmacyMaster..PM_Rebates_HighVolume_LaJolla  set [Generic Source] = 0 where [Generic Source] is null;
UPDATE PharmacyMaster..PM_Rebates_HighVolume_LaJolla  set [1% Generic Admin]  = 0 where [1% Generic Admin] is null;
UPDATE PharmacyMaster..PM_Rebates_HighVolume_LaJolla  set [Incentive from AAP Net Sales] = 0 where [Incentive from AAP Net Sales] is null;
 
Delete from PharmacyMaster..PM_Rebates_HighVolume_LaJolla where PMID is NULL;

END












GO
