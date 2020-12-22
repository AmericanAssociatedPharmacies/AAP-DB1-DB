USE [AAP]
GO
/****** Object:  View [dbo].[v_AAPCorporateMailList]    Script Date: 12/22/2020 9:04:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_AAPCorporateMailList]
AS

 SELECT AccountName,AAPAccountNo,AAPParentNo,APIAccountNo,UDAccountNo,UDParentNo,Addr1,Addr2,City,State,Zip,ContactFirst,ContactLast,ContactFullName,
	    AreaCode,Phone,FaxAreaCode,Fax,Email   FROM AAPCorporateMailList 
 
GO
