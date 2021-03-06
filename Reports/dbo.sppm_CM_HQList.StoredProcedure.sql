USE [Reports]
GO
/****** Object:  StoredProcedure [dbo].[sppm_CM_HQList]    Script Date: 12/22/2020 5:00:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:		< Joni Wilson>
-- Create date: <5/18/2015>
-- Description:	Get List of HQ for Comm UI
-- =============================================
CREATE PROCEDURE [dbo].[sppm_CM_HQList]
(@in_source varchar(1026),@listType varchar(20))
AS
BEGIN
 
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

DECLARE @SQL varchar(max)
DECLARE @emailListTypeCode  varchar(max); 
DECLARE @faxListTypeCode  varchar(max); 
DECLARE @emailFaxFaxListTypeCode  varchar(max); -- this is for when they are sending both fax and emails
DECLARE @listTypeCode  varchar(max);
SET @listTypeCode = '';

SET @SQL = '';


SET @emailListTypeCode = (SELECT EmailListTypeCode from CommCode);
SET @faxListTypeCode = (SELECT FaxListTypeCode from CommCode);
SET @emailFaxFaxListTypeCode= (SELECT EmailFaxFaxListTypeCode from CommCode);

IF(@listType = 'e' or @listType = 'efe')  
	BEGIN
		SET @listTypeCode =   @emailListTypeCode;
	END
IF(@listType = 'f' )
	BEGIN
		SET @listTypeCode =   @faxListTypeCode;
	END
IF(@listType = 'eff')
	BEGIN
		SET @listTypeCode = @emailFaxFaxListTypeCode;
	END 
 SET @SQL = 'SELECT AccountName,Email,Fax,ContactFullName,Phone,Addr1,Addr2,City,State,Zip
	from pharmacymaster..v_Address_CommMaster_Corporate where source in ( '+   @in_source + ')' + @listTypeCode;
    
print @sql
EXEC (@SQL);
		

END










GO
