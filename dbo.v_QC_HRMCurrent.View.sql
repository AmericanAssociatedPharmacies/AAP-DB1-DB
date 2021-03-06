USE [WebTest]
GO
/****** Object:  View [dbo].[v_QC_HRMCurrent]    Script Date: 12/22/2020 9:42:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_QC_HRMCurrent]
AS
SELECT     [Pharm ID], BINNbr, PlanName, GPI, PatID, PatientDOB, DrugName, [Rx Nbr], LastFillDate, RefillsRemain, RefillNbr, DaysAfterLastRefill, DaySupply, 
                      NextFillDate
FROM         dbo.QC_HRM
WHERE     (RefillsRemain > RefillNbr) AND (DATEDIFF(dd, LastFillDate, GETDATE()) < DaySupply)
GO
