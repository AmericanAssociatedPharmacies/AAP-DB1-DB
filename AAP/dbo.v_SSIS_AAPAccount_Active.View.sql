USE [AAP]
GO
/****** Object:  View [dbo].[v_SSIS_AAPAccount_Active]    Script Date: 12/22/2020 9:04:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_SSIS_AAPAccount_Active]
AS

select * from AAPAccount  where quitdate is null and aapid is not null;  
GO
