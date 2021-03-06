USE [AAP]
GO
/****** Object:  StoredProcedure [dbo].[spaap_APIAccountMaster_OrigSetToNULL]    Script Date: 12/22/2020 4:10:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		< Joni Wilson>
-- Create date: <08/29/2008>
-- Description:	Truncate PMUpdate_Active_staging table
-- =============================================
CREATE PROCEDURE [dbo].[spaap_APIAccountMaster_OrigSetToNULL]

AS
	BEGIN
 
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
  
	UPDATE api..APIAccountMaster_Orig SET AccountName = null where AccountName = '';
	UPDATE api..APIAccountMaster_Orig SET Addr1 = null where Addr1 = '';
	UPDATE api..APIAccountMaster_Orig SET Addr2 = null where Addr2 = '';
	UPDATE api..APIAccountMaster_Orig SET City = null where City = '';
	UPDATE api..APIAccountMaster_Orig SET State = null where State = '';
	UPDATE api..APIAccountMaster_Orig SET Zip = null where Zip = '';
	UPDATE api..APIAccountMaster_Orig SET ContactFullName = null where ContactFullName = '';
	UPDATE api..APIAccountMaster_Orig SET Territory = null where Territory = '';
	UPDATE api..APIAccountMaster_Orig SET QPS = null where QPS = '';
	UPDATE api..APIAccountMaster_Orig SET APIMemberNo = null where APIMemberNo = '';
	UPDATE api..APIAccountMaster_Orig SET BusinessClass = null where BusinessClass = '';
	UPDATE api..APIAccountMaster_Orig SET Phone = null where Phone = '';
	UPDATE api..APIAccountMaster_Orig SET Fax = null where Fax = '';
	UPDATE api..APIAccountMaster_Orig SET Email = null where Email = '';
	UPDATE api..APIAccountMaster_Orig SET NumReactivated = null where NumReactivated = '';
	UPDATE api..APIAccountMaster_Orig SET Wholesaler = null where Wholesaler = '';
	UPDATE api..APIAccountMaster_Orig SET WholesalerAccountNo = null where WholesalerAccountNo = '';
	UPDATE api..APIAccountMaster_Orig SET StateLicNo = null where StateLicNo = '';
	UPDATE api..APIAccountMaster_Orig SET FedID = null where FedID = '';
	UPDATE api..APIAccountMaster_Orig SET Status = null where Status = '';
	UPDATE api..APIAccountMaster_Orig SET CAHStatus = null where CAHStatus = '';
	UPDATE api..APIAccountMaster_Orig SET CardinalDC = null where CardinalDC = '';
	UPDATE api..APIAccountMaster_Orig SET PrimaryCAAccountNo = null where PrimaryCAAccountNo = '';
	UPDATE api..APIAccountMaster_Orig SET CustPayTermsAPI = null where CustPayTermsAPI = '';
	UPDATE api..APIAccountMaster_Orig SET APIStatus = null where APIStatus = '';
    UPDATE api..APIAccountMaster_Orig SET DEA = null where DEA = '';


    END









GO
