USE [Medispan]
GO
/****** Object:  StoredProcedure [dbo].[sp_CMS_NADACLoad]    Script Date: 12/22/2020 4:38:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Chandni KL
-- Create date: 03/19/2015
-- Description:	Loads the records to CMS_NADAC table
-- =============================================
CREATE PROCEDURE [dbo].[sp_CMS_NADACLoad] 

AS

BEGIN

truncate table Medispan..nadacload
DECLARE @SQL varchar(2000)
declare @filename nvarchar(100)
set  @filename='T:\Data\NADAC\latestnadac\nadactarget.csv';
set @SQL = 'BULK INSERT Medispan..nadacload FROM ''' + @filename + ''' WITH (KEEPIDENTITY,fieldterminator='','',firstrow=5,rowterminator=''\n'')';
SET NOCOUNT ON;
EXEC(@SQL);

update Medispan..nadacload set explanationcode=replace(explanationcode,'||',',')

insert into Medispan..cms_nadac(NDC_Description,NDC,NADAC_per_unit,effective_date,pricing_unit,pharmachy_type_indicator,OTC,ExplanationCode,classification_for_rate_setting,Corresponding_generic_drug_nadac_per_unit,corresponding_generic_drug_effective_date,dateloaded)  select NDC_Description,NDC,NADAC_per_unit,effective_date,pricing_unit,pharmachy_type_indicator,OTC,ExplanationCode,convert(char(2),classification_for_rate_setting),Corresponding_generic_drug_nadac_per_unit,corresponding_generic_drug_effective_date,getdate() from  Medispan..nadacload

EXEC msdb.dbo.sp_send_dbmail  @profile_name='UDDW1',
@recipients='vrindha.nair@uniteddrugs.com',
@subject='NADAC LOAD for this week Successful'

END









GO
