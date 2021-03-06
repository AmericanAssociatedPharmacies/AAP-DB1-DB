USE [reporting]
GO
/****** Object:  View [dbo].[v_all_members_withtypes]    Script Date: 12/22/2020 9:27:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_all_members_withtypes]
AS
SELECT     m.ACCT_NO, m.NABP, m.STORE, m.CITY, m.STATE, m.NSTERRITORY, m.EFFECTIVE, m.quitdate, m.chain_code, t.type, t.primaryws
FROM         storemember AS m LEFT OUTER JOIN
                      dbo.membertype_all AS t ON m.ACCT_NO = t.acct_no

GO
