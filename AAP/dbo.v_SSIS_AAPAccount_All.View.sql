USE [AAP]
GO
/****** Object:  View [dbo].[v_SSIS_AAPAccount_All]    Script Date: 12/22/2020 9:04:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_SSIS_AAPAccount_All]
AS

--select * from AAPAccount  where aapid is not null;  Now Allowing Nulls - don't know how that's gonna fly
select * from AAPAccount   
GO
