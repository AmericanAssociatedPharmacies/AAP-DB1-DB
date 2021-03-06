USE [AAP]
GO
/****** Object:  View [dbo].[v_SSIS_APIAccountActive]    Script Date: 12/22/2020 9:04:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_SSIS_APIAccountActive]
AS
SELECT     *
FROM         api.dbo.APIAccountMaster_Orig
WHERE      status = 'active' and businessclass != 'C99' and businessclass != 'C06' and businessclass != 'CZZ' and businessclass != 'SDFT'
					and Territory != 'XX' and accountNo !=  '_CREATIVE' and accountNo != 'SECRETARY'  and accountNo != '00APSLLC'
GO
