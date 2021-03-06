USE [Reports]
GO
/****** Object:  StoredProcedure [dbo].[sppm_Find_InvalidSeccodeID]    Script Date: 12/22/2020 5:00:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		< Joni Wilson>
-- Create date: <10/14/2010>
-- Description:	Call Report Card Volume and return table
-- =============================================
Create PROCEDURE [dbo].[sppm_Find_InvalidSeccodeID]
 

AS
BEGIN
 
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
SELECT a.Account,a.AccountID,a.SeccodeID as [Account SeccodeID],a2.SeccodeID as [Extension SeccodeID], 'Account2' As ExtensionTable
 from Saleslogix_Prod.sysdba.account a
join
(
	SELECT * from Saleslogix_Prod.sysdba.accountsummary
) a2
on a.accountid = a2.accountid and a.seccodeid != a2.seccodeid

UNION

SELECT a.Account,a.AccountID,a.SeccodeID as [Account SeccodeID],a2.SeccodeID as [Extension SeccodeID], 'Account2' As ExtensionTable
 from Saleslogix_Prod.sysdba.account a
join
(
	SELECT * from Saleslogix_Prod.sysdba.account2
) a2
on a.accountid = a2.accountid and a.seccodeid != a2.seccodeid

UNION

SELECT a.Account,a.AccountID,a.SeccodeID as [Account SeccodeID],a2.SeccodeID as [Extension SeccodeID], 'Programs' As ExtensionTable
 from Saleslogix_Prod.sysdba.account a
join
(
	SELECT * from Saleslogix_Prod.sysdba.programs
) a2
on a.accountid = a2.accountid and a.seccodeid != a2.seccodeid

UNION

SELECT a.Account,a.AccountID,a.SeccodeID as [Account SeccodeID],a2.SeccodeID as [Extension SeccodeID], 'ManagedCare' As ExtensionTable
 from Saleslogix_Prod.sysdba.account a
join
(
	SELECT * from Saleslogix_Prod.sysdba.managedcare
) a2
on a.accountid = a2.accountid and a.seccodeid != a2.seccodeid

UNION

SELECT a.Account,a.AccountID,a.SeccodeID as [Account SeccodeID],a2.SeccodeID as [Extension SeccodeID], 'APIAccount' As ExtensionTable
 from Saleslogix_Prod.sysdba.account a
join
(
	SELECT * from Saleslogix_Prod.sysdba.apiaccount
) a2
on a.accountid = a2.accountid and a.seccodeid != a2.seccodeid

UNION

SELECT a.Account,a.AccountID,a.SeccodeID as [Account SeccodeID],a2.SeccodeID as [Extension SeccodeID], 'AAPAccount' As ExtensionTable
 from Saleslogix_Prod.sysdba.account a
join
(
	SELECT * from Saleslogix_Prod.sysdba.aapaccount
) a2
on a.accountid = a2.accountid and a.seccodeid != a2.seccodeid

UNION

SELECT a.Account,a.AccountID,a.SeccodeID as [Account SeccodeID],a2.SeccodeID as [Extension SeccodeID], 'Purchasing' As ExtensionTable
 from Saleslogix_Prod.sysdba.account a
join
(
	SELECT * from Saleslogix_Prod.sysdba.purchasing
) a2
on a.accountid = a2.accountid and a.seccodeid != a2.seccodeid


END










GO
