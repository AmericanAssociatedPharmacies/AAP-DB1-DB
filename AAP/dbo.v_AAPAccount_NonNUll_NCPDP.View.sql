USE [AAP]
GO
/****** Object:  View [dbo].[v_AAPAccount_NonNUll_NCPDP]    Script Date: 12/22/2020 9:04:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_AAPAccount_NonNUll_NCPDP]
AS

select * from AAPAccount  where NCPDP is not null;  
GO
