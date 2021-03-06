USE [AAP]
GO
/****** Object:  StoredProcedure [dbo].[UpdatePharmacyMaster]    Script Date: 12/22/2020 4:10:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Rudy Hinojosa
-- Create date: 2-4-2010
-- Description:	Update pharmacy Master
-- =============================================
CREATE PROCEDURE [dbo].[UpdatePharmacyMaster] 
	-- Add the parameters for the stored procedure here
	@pAccountMasterID_toUpdate INT ,
	@pFieldName nvarchar(500) , 
	@pFieldNewValue nvarchar(500) 
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
    IF UPPER(@pFieldName) = 'ADDR2'
    UPDATE dbo.PharmacyMaster SET [ADDR2] = @pFieldNewvalue WHERE AccountMasterID = @pAccountMasterID_toUpdate
    
    IF UPPER(@pFieldName) = 'ACCOUNTNAME'
    UPDATE dbo.PharmacyMaster SET [ACCOUNTNAME] = @pFieldNewvalue WHERE AccountMasterID = @pAccountMasterID_toUpdate

    IF UPPER(@pFieldName) = 'AAPACCOUNTNO'
    UPDATE dbo.PharmacyMaster SET [AAPACCOUNTNO] = @pFieldNewvalue WHERE AccountMasterID = @pAccountMasterID_toUpdate

    IF UPPER(@pFieldName) = 'AAPPARENTNO'
    UPDATE dbo.PharmacyMaster SET [AAPPARENTNO] = @pFieldNewvalue WHERE AccountMasterID = @pAccountMasterID_toUpdate

    IF UPPER(@pFieldName) = 'UDACCOUNTNO'
    UPDATE dbo.PharmacyMaster SET [UDACCOUNTNO] = @pFieldNewvalue WHERE AccountMasterID = @pAccountMasterID_toUpdate

    IF UPPER(@pFieldName) = 'UDPARENTNO'
    UPDATE dbo.PharmacyMaster SET [UDPARENTNO] = @pFieldNewvalue WHERE AccountMasterID = @pAccountMasterID_toUpdate
    
    
END

GO
