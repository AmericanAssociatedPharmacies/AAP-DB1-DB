USE [Reports]
GO
/****** Object:  StoredProcedure [dbo].[sppm_Copy_HVRebatesIntoImport]    Script Date: 12/22/2020 5:00:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		< Joni Wilson>
-- Create date: <09/19/2011>
-- Description:	Populate Import from High Volume Rebate - this happens when Bruce runs it and uses a seperate import file - I need to keep mine in sync
-- =============================================
CREATE PROCEDURE [dbo].[sppm_Copy_HVRebatesIntoImport]
(@in_date varchar(10))
 

AS
BEGIN
 
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
INSERT INTO Reports..Import_HVRebate (date,
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
[COG Reduction] 
)  

SELECT Date, 
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
[COG Reduction]



 from PharmacyMaster..PM_Rebates_HighVolume  where date = @in_date

END










GO
