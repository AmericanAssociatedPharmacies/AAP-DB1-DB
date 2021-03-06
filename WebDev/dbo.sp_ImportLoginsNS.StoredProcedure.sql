USE [WebDev]
GO
/****** Object:  StoredProcedure [dbo].[sp_ImportLoginsNS]    Script Date: 12/22/2020 5:21:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		JOSHILA NARAYANAN
-- Create date: 05/09/2012
-- Description:	Imports Logins from Netstore Users File
-- =============================================
CREATE PROCEDURE [dbo].[sp_ImportLoginsNS]

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	--Drop Table NetstoreUsers
	TRUNCATE TABLE NetstoreUsers

	--Bulk Insert NetstoreUsers file
	Bulk insert NetstoreUsers from 'C:\Data\Website\NetstoreUsers.txt'


	--Remove spaces
	UPDATE    NetstoreUsers
	SET              ClientID = RTRIM(ClientID), Password = RTRIM(Password)
	      


	--Match with UD NCPDP Populate NSlogin for clickthrough
	UPDATE    userlogin
	SET              nslogin = v_netstorelogin.ClientID, nspwd = v_netstorelogin.password
	FROM         userlogin INNER JOIN
						  v_netstorelogin ON userlogin.login = v_netstorelogin.NCPDP


	--Populate ALL API Active Logins
	INSERT INTO userlogin
						  (login, password, nslogin, nspwd, source)
	SELECT     ClientID, Password, ClientID AS Expr1, Password AS Expr2, 2 AS Expr3
	FROM         v_netstoreAll

	--Update Netstore logins with available PMID
	UPDATE    userlogin
	SET            defaultpmid = (Case When IsNumeric(NSPMID) = 1 Then NSPMID Else v_netstoreall.PMID End)
	FROM         userlogin LEFT JOIN
						  v_netstoreall ON userlogin.login = v_netstoreall.APIAccountNo
	WHERE source=2


	--API Sales role Update

	UPDATE userlogin set roleid=1 WHERE source=2 and isnumeric(login)=0 

	--ADD API Disabled Account with Inactive status

	INSERT INTO userlogin
						  (login, password, nslogin, nspwd, defaultpmid, source,Active)
	SELECT     ClientID, Password, ClientID AS Expr1, Password AS Expr2, PMID, 2 AS Expr3,'False'
	FROM         v_netstoreDisabled


	
	
END
GO
