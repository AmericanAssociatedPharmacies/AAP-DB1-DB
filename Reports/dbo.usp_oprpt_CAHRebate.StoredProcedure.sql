USE [Reports]
GO
/****** Object:  StoredProcedure [dbo].[usp_oprpt_CAHRebate]    Script Date: 12/22/2020 5:00:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_oprpt_CAHRebate] @PMID INT
AS
     SELECT EffectivePct
     FROM pharmacymaster..v_pm_rebates_chaap
     WHERE pmid = @pmid
           AND date =
     (
         SELECT MAX(date)
         FROM pharmacymaster..v_pm_rebates_chaap
         WHERE pmid = @pmid
     );
GO
