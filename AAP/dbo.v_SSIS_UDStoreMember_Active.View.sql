USE [AAP]
GO
/****** Object:  View [dbo].[v_SSIS_UDStoreMember_Active]    Script Date: 12/22/2020 9:04:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_SSIS_UDStoreMember_Active]
AS
SELECT  * from reporting..storemember where quitdate is null
                      
GO
