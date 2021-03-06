USE [Reports]
GO
/****** Object:  StoredProcedure [dbo].[usp_oprpt_stores]    Script Date: 12/22/2020 5:00:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_oprpt_stores]
AS
     SELECT pmid, 
            LTRIM(RTRIM(AccountName)) + ', ' + RTRIM(city) + ',  ' + RTRIM(state) + ' ( ' + RTRIM(pmid) + ')' AS storename, 
            AccountName
     FROM PharmacyMaster.dbo.v_PM_AllWithAffiliates
     ORDER BY StoreName;
GO
