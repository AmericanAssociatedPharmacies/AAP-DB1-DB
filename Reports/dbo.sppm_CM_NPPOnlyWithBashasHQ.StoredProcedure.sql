USE [Reports]
GO
/****** Object:  StoredProcedure [dbo].[sppm_CM_NPPOnlyWithBashasHQ]    Script Date: 12/22/2020 5:00:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
-- =============================================
-- Author:		Joni Wilson
-- Create date:  9/28/2015
-- Description:	list fax No from PM
-- =============================================
CREATE PROCEDURE [dbo].[sppm_CM_NPPOnlyWithBashasHQ] 
 (@listType varchar(20))
AS
 

BEGIN
	--SET NOCOUNT ON;
 
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

SET @sql =  ' SELECT * from ('+
			' SELECT *  from pharmacymaster..v_Address_CommMaster where isNpp = -1 ' +
		    '    and pmid not in (select pmid from pharmacymaster..v_Address_CommMaster  where groupno = ''11377'') ' + @listTypeCode +
            ' UNION ' +
            ' SELECT * from pharmacymaster..v_Address_CommMaster_Corporate where Source = ''UD-BASHAS'' ' +  + @listTypeCode +
            ' )ch    ' 

EXEC (@SQL);


END

GO
