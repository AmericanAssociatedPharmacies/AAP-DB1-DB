USE [PharmacyMaster]
GO
/****** Object:  StoredProcedure [dbo].[spud_ReverseFile]    Script Date: 12/22/2020 4:45:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spud_ReverseFile]
	(
		@fileID int
	)
AS

	SET NOCOUNT ON

BEGIN

	
     DELETE 
	 FROM dbo.VendorVolumeRebate 
	 WHERE FileID = @fileID

	 DECLARE @tranID int

	 Select @tranID = TransactionID 
	 from dbo.vendorLoad 
	 Where FileID = @fileID

	 DELETE 
	 FROM dbo.VendorLoad 
	 WHERE FileID = @fileID

	 DELETE 
	 FROM dbo.VendorTransaction 
	 WHERE TransactionID = @tranid

	 
	 
END

GO
