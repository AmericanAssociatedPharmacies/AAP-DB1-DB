USE [WebTest]
GO
/****** Object:  StoredProcedure [dbo].[sp_ImportLoginsOld]    Script Date: 12/22/2020 5:26:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		JOSHILA NARAYANAN
-- Create date: 05/09/2012
-- Description:	Imports Logins from Truescript.Auth_User and API File
-- =============================================
CREATE PROCEDURE [dbo].[sp_ImportLoginsOld]

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	BEGIN Tran LoadLogin

	--Back up userlogin Table
	DROP TABLE userloginbak
		If @@error <> 0 
			Begin				
				Rollback Tran LoadLogin
				Return
			End	

	Select * into userloginbak from userlogin
		If @@error <> 0 
			Begin
				Rollback Tran LoadLogin
				Return
			End	

	--Dump Truescript.Auth_User from MAXDB
	TRUNCATE TABLE WebDev..Auth_User
	If @@error <> 0 
			Begin				
				Rollback Tran LoadLogin
				Return
			End	

	INSERT INTO Auth_User select *
	FROM         
	OPENQUERY(UNITEDDB, 'select * from Truescript.Auth_User') AS Rowset_1
	If @@error <> 0 
			Begin
				Rollback Tran LoadLogin
				Return
			End	

	TRUNCATE TABLE WebDev..userlogin
	If @@error <> 0 
			Begin				
				Rollback Tran LoadLogin
				Return
			End	

    -- Insert Truescript.Auth_User INTO UserLogin Table
	INSERT INTO userlogin ([login],[password],perms,source)select username,password,perms,1
	FROM Auth_User
	If @@error <> 0 
			Begin				
				Rollback Tran LoadLogin
				Return
			End			


	--Update Sales User Role for non NCPDP logins
	UPDATE    userlogin
	SET             roleid = 1
	WHERE     isnumeric(userlogin.login)=0 AND userlogin.PERMS LIKE '%sales%'
	If @@error <> 0 
			Begin				
				Rollback Tran LoadLogin
				Return
			End						  

	--------------------------------------------------------Run API Import-----------------------------------------------------------------------
	

	--Drop Table NetstoreUsers
	TRUNCATE TABLE NetstoreUsers
	If @@error <> 0 
			Begin				
				Rollback Tran LoadLogin
				Return
			End			

	--Bulk Insert NetstoreUsers file
	Bulk insert NetstoreUsers from 'C:\Data\Website\NetstoreUsers.txt'
	If @@error <> 0 
			Begin				
				Rollback Tran LoadLogin
				Return
			End			

	--Remove spaces
	UPDATE    NetstoreUsers
	SET              ClientID = RTRIM(ClientID), Password = RTRIM(Password)	      
	If @@error <> 0 
			Begin				
				Rollback Tran LoadLogin
				Return
			End			

	--Match with UD NCPDP Populate NSlogin for clickthrough
	UPDATE    userlogin
	SET              nslogin = v_netstorelogin.ClientID, nspwd = v_netstorelogin.password
	FROM         userlogin INNER JOIN
						  v_netstorelogin ON userlogin.login = v_netstorelogin.NCPDP
	If @@error <> 0 
			Begin				
				Rollback Tran LoadLogin
				Return
			End			

	--Populate ALL API Active Logins
	INSERT INTO userlogin
						  (login, password, nslogin, nspwd, source)
	SELECT     ClientID, Password, ClientID AS Expr1, Password AS Expr2, 2 AS Expr3
	FROM         v_netstoreAll
	If @@error <> 0 
			Begin				
				Rollback Tran LoadLogin
				Return
			End			

	--Update Netstore logins with available PMID
	UPDATE    userlogin
	SET            defaultpmid = (Case When IsNumeric(NSPMID) = 1 Then NSPMID Else v_netstoreall.PMID End)
	FROM         userlogin LEFT JOIN
						  v_netstoreall ON userlogin.login = v_netstoreall.APIAccountNo
	WHERE source=2
	If @@error <> 0 
			Begin				
				Rollback Tran LoadLogin
				Return
			End			


		
	--ADD API Disabled Account with Inactive status
	INSERT INTO userlogin
						  (login, password, nslogin, nspwd, defaultpmid, source,Active)
	SELECT     ClientID, Password, ClientID AS Expr1, Password AS Expr2, PMID, 2 AS Expr3,'False'
	FROM         v_netstoreDisabled
	If @@error <> 0 
			Begin				
				Rollback Tran LoadLogin
				Return
			End			

----------------------------------------------------------------------------------------------------------------


	--Update Default PMID Process: First Update All available PMID (This is to avoid null defaultpmids)
	UPDATE    userlogin
	SET              userlogin.defaultpmid = PharmacyMaster.dbo.v_PM_AllWithAffiliates.PMID
	FROM         userlogin JOIN
						  PharmacyMaster.dbo.v_PM_AllWithAffiliates ON userlogin.login = PharmacyMaster.dbo.v_PM_AllWithAffiliates.NCPDP 
	WHERE userlogin.login = PharmacyMaster.dbo.v_PM_AllWithAffiliates.NCPDP	
	If @@error <> 0 
			Begin				
				Rollback Tran LoadLogin
				Return
			End	


	--Update All defaultPMID with active PMID	
	UPDATE    userlogin
	SET              userlogin.defaultpmid = PharmacyMaster.dbo.v_PM_AllWithAffiliates.PMID
	FROM         userlogin JOIN
						  PharmacyMaster.dbo.v_PM_AllWithAffiliates ON userlogin.login = PharmacyMaster.dbo.v_PM_AllWithAffiliates.NCPDP 
	WHERE userlogin.login = PharmacyMaster.dbo.v_PM_AllWithAffiliates.NCPDP	AND PharmacyMaster.dbo.v_PM_AllWithAffiliates.AAPAccountNo IS NOT NULL AND PharmacyMaster.dbo.v_PM_AllWithAffiliates.AAPQuitDate IS NULL
	If @@error <> 0 
			Begin				
				Rollback Tran LoadLogin
				Return
			End	
	

	--Update All NetStore Login's defaultPMID with active PMID	
	UPDATE    userlogin
	SET              userlogin.defaultpmid = PharmacyMaster.dbo.v_PM_AllWithAffiliates.PMID
	FROM         userlogin JOIN
						  PharmacyMaster.dbo.v_PM_AllWithAffiliates ON userlogin.login = PharmacyMaster.dbo.v_PM_AllWithAffiliates.APIAccountNo 
	WHERE userlogin.source=2 AND PharmacyMaster.dbo.v_PM_AllWithAffiliates.AAPAccountNo IS NOT NULL AND PharmacyMaster.dbo.v_PM_AllWithAffiliates.AAPQuitDate IS NULL
	If @@error <> 0 
			Begin				
				Rollback Tran LoadLogin
				Return
			End	


	--Get values to be retained from userloginbak table
	Update userlogin set roleid=userloginbak.roleid from userlogin join userloginbak ON userlogin.login = userloginbak.login WHERE userloginbak.roleid <> 1 and userloginbak.roleid is not null
	If @@error <> 0 
			Begin				
				Rollback Tran LoadLogin
				Return
			End	
	Update userlogin set defaultpmid = userloginbak.defaultpmid from userlogin join userloginbak ON userlogin.login = userloginbak.login WHERE isnumeric(userlogin.login)=0 and userlogin.roleid is null and userloginbak.defaultpmid is not null
	If @@error <> 0 
			Begin				
				Rollback Tran LoadLogin
				Return
			End	


	--API Sales role Update
	UPDATE userlogin set roleid=1 WHERE source=2 and isnumeric(login)=0 and defaultpmid IS NULL
	If @@error <> 0 
			Begin				
				Rollback Tran LoadLogin
				Return
			End	

	--API Sales role Update
	UPDATE userlogin set Active='False' WHERE isnumeric(login)=0 and defaultpmid = 99
	If @@error <> 0 
			Begin				
				Rollback Tran LoadLogin
				Return
			End	

	--Delete the duplicated first record due to OpenQuery Call from maxDB
	Delete from userlogin where loginid=1
	If @@error <> 0 
			Begin				
				Rollback Tran LoadLogin
				Return
			End	


	COMMIT Tran
	
END
GO
