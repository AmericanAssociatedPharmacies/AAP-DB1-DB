USE [AAP]
GO
/****** Object:  View [dbo].[v_AAPAccount_All_Acct_no]    Script Date: 12/22/2020 9:04:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_AAPAccount_All_Acct_no]
AS

select aap.storename ,aapaccountno,apiaccountno,udaccountno,aap.city,aap.state ,aap.effectiveaap from aapaccount aap
	left outer join pharmacymaster am on aap.aapid = am.aapaccountno
where aapid is not null;

GO
