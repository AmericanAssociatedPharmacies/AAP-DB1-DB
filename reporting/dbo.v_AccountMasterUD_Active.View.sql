USE [reporting]
GO
/****** Object:  View [dbo].[v_AccountMasterUD_Active]    Script Date: 12/22/2020 9:27:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create VIEW [dbo].[v_AccountMasterUD_Active]
AS
SELECT  * from storemember where quitdate is null
                      
GO
