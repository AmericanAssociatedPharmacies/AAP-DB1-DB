USE [AAP]
GO
/****** Object:  View [dbo].[v_SSIS_PMUpdate_Active_StagingNULL]    Script Date: 12/22/2020 9:04:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_SSIS_PMUpdate_Active_StagingNULL]
AS

select * from PMUpdate_Active_staging  where dea is null;  
GO
