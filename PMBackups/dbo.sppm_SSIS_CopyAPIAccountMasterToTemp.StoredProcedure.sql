USE [PMBackups]
GO
/****** Object:  StoredProcedure [dbo].[sppm_SSIS_CopyAPIAccountMasterToTemp]    Script Date: 12/22/2020 4:47:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		< Joni Wilson>
-- Create date: <08/29/2008>
-- Description:	Update the API Store Names (get garbage out) for the AccountMaster table
-- =============================================
CREATE PROCEDURE [dbo].[sppm_SSIS_CopyAPIAccountMasterToTemp]

AS
	BEGIN
 
    IF EXISTS(SELECT name FROM sys.tables
        WHERE name = 'tmp_APICustomerList')
          DROP TABLE tmp_APICustomerList
  
    SELECT * into  tmp_APICustomerList from tmp_APIAccountMaster_Orig

   -- SELECT * into  tmp_APICustomerList from api..APIAccountMaster_Orig


	UPDATE tmp_APICustomerList  set accountname  = replace(accountname,'(M)','')

	UPDATE tmp_APICustomerList set accountname  = replace(accountname,'*QPS','')

	UPDATE tmp_APICustomerList set accountname  = replace(accountname,'NE-','')

	UPDATE tmp_APICustomerList set accountname  = replace(accountname,'*QP','')

	UPDATE tmp_APICustomerList SET AccountName = null where AccountName = '';
	UPDATE tmp_APICustomerList SET Addr1 = null where Addr1 = '';
	UPDATE tmp_APICustomerList SET Addr2 = null where Addr2 = '';
	UPDATE tmp_APICustomerList SET City = null where City = '';
	UPDATE tmp_APICustomerList SET State = null where State = '';
	UPDATE tmp_APICustomerList SET Zip = null where Zip = '';
	UPDATE tmp_APICustomerList SET ContactFullName = null where ContactFullName = '';
	UPDATE tmp_APICustomerList SET Territory = null where Territory = '';
	UPDATE tmp_APICustomerList SET QPS = null where QPS = '';
	UPDATE tmp_APICustomerList SET APIMemberNo = null where APIMemberNo = '';
	UPDATE tmp_APICustomerList SET BusinessClass = null where BusinessClass = '';
	UPDATE tmp_APICustomerList SET Phone = null where Phone = '';
	UPDATE tmp_APICustomerList SET Fax = null where Fax = '';
	UPDATE tmp_APICustomerList SET Email = null where Email = '';
	UPDATE tmp_APICustomerList SET NumReactivated = null where NumReactivated = '';
	UPDATE tmp_APICustomerList SET Wholesaler = null where Wholesaler = '';
	UPDATE tmp_APICustomerList SET WholesalerAccountNo = null where WholesalerAccountNo = '';
	UPDATE tmp_APICustomerList SET StateLicNo = null where StateLicNo = '';
	UPDATE tmp_APICustomerList SET FedID = null where FedID = '';
	UPDATE tmp_APICustomerList SET Status = null where Status = '';
	UPDATE tmp_APICustomerList SET CustPayTermsAPI = null where CustPayTermsAPI = '';
	UPDATE tmp_APICustomerList SET APIStatus = null where APIStatus = '';
    UPDATE tmp_APICustomerList SET DEA = null where DEA = '';
	UPDATE tmp_APICustomerList SET WHSNUM = null where WHSNUM = '';
	UPDATE tmp_APICustomerList SET NCPDP = null where NCPDP = '';

    END
BEGIN
 
   IF EXISTS(SELECT name FROM sys.tables
        WHERE name = 'tmp_APICustomerList_bkp')
          DROP TABLE tmp_APICustomerList_bkp
  
    SELECT * into  tmp_APICustomerList_bkp from tmp_APIAccountMaster_Orig_bkp

  -- SELECT * into  tmp_APICustomerList_bkp from api..apiaccountmaster_orig_bkp_041910

	UPDATE tmp_APICustomerList_bkp  set accountname  = replace(accountname,'(M)','')

	UPDATE tmp_APICustomerList_bkp set accountname  = replace(accountname,'*QPS','')

	UPDATE tmp_APICustomerList_bkp set accountname  = replace(accountname,'NE-','')

	UPDATE tmp_APICustomerList_bkp set accountname  = replace(accountname,'*QP','')

	UPDATE tmp_APICustomerList_bkp SET AccountName = null where AccountName = '';
	UPDATE tmp_APICustomerList_bkp SET Addr1 = null where Addr1 = '';
	UPDATE tmp_APICustomerList_bkp SET Addr2 = null where Addr2 = '';
	UPDATE tmp_APICustomerList_bkp SET City = null where City = '';
	UPDATE tmp_APICustomerList_bkp SET State = null where State = '';
	UPDATE tmp_APICustomerList_bkp SET Zip = null where Zip = '';
	UPDATE tmp_APICustomerList_bkp SET ContactFullName = null where ContactFullName = '';
	UPDATE tmp_APICustomerList_bkp SET Territory = null where Territory = '';
	UPDATE tmp_APICustomerList_bkp SET QPS = null where QPS = '';
	UPDATE tmp_APICustomerList_bkp SET APIMemberNo = null where APIMemberNo = '';
	UPDATE tmp_APICustomerList_bkp SET BusinessClass = null where BusinessClass = '';
	UPDATE tmp_APICustomerList_bkp SET Phone = null where Phone = '';
	UPDATE tmp_APICustomerList_bkp SET Fax = null where Fax = '';
	UPDATE tmp_APICustomerList_bkp SET Email = null where Email = '';
	UPDATE tmp_APICustomerList_bkp SET NumReactivated = null where NumReactivated = '';
	UPDATE tmp_APICustomerList_bkp SET Wholesaler = null where Wholesaler = '';
	UPDATE tmp_APICustomerList_bkp SET WholesalerAccountNo = null where WholesalerAccountNo = '';
	UPDATE tmp_APICustomerList_bkp SET StateLicNo = null where StateLicNo = '';
	UPDATE tmp_APICustomerList_bkp SET FedID = null where FedID = '';
	UPDATE tmp_APICustomerList_bkp SET Status = null where Status = '';
	UPDATE tmp_APICustomerList_bkp SET CustPayTermsAPI = null where CustPayTermsAPI = '';
	UPDATE tmp_APICustomerList_bkp SET APIStatus = null where APIStatus = '';
    UPDATE tmp_APICustomerList_bkp SET DEA = null where DEA = '';
	UPDATE tmp_APICustomerList_bkp SET WHSNUM = null where WHSNUM = '';
	UPDATE tmp_APICustomerList_bkp SET NCPDP = null where NCPDP = '';


    END









GO
