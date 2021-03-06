USE [Reports]
GO
/****** Object:  StoredProcedure [dbo].[sppm_create_RebateCardMSILeader_Dashboard_MY]    Script Date: 12/22/2020 5:00:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		< Joni Wilson>
-- Create date: <10/14/2010>
-- Description:	Create table for Cardinal Generic Rebates for Dashboard
-- =============================================
CREATE PROCEDURE [dbo].[sppm_create_RebateCardMSILeader_Dashboard_MY]

AS
BEGIN
 
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
  
DECLARE @year varchar(4);
DECLARE @prevYear varchar(4);
DECLARE @SQL varchar(max);

SET @year = (select max(year(date))  from pharmacymaster..pm_rebates_chaap);
SET @prevYear = @year - 1 ; 
 

SET @SQL = 
' SELECT Year,Quarter,CardinalRebate from '+
' ( '+
'	SELECT year(date) as Year, '+	 
	 ' case when date = ''03/01/' +  @year  + ''' then ''Q1''' +
	 ' when date =  ''06/01/' +  @year + ''' then  ''Q2'''  +
	 ' when date =  ''09/01/' +  @year + '''  then  ''Q3'''  +
	 ' when date =  ''12/01/' +  @year  + ''' then ''Q4''   else null end  as Quarter,  '+
	'		  sum(round(isnull(LeaderRebate,0),2)+ round(isnull(MSIRebate,0),2))as CardinalRebate   '+
	'  FROM  pharmacymaster..PM_Rebates_CHAAP where year(date) = ' + @year + ' group by date  '+
' ) ch where Quarter is not null '+

' UNION '+

' SELECT Year,Quarter,CardinalRebate from '+
' ( '+
'	SELECT year(date) as Year, '+	 
	 ' case when date = ''03/01/' +  @prevYear  + ''' then ''Q1''' +
	 ' when date =  ''06/01/' +  @prevYear + '''  then  ''Q2'''  +
	 ' when date =  ''09/01/' +  @prevYear + '''  then  ''Q3'''  +
	 ' when date =  ''12/01/' +  @prevYear  + ''' then ''Q4''   else null end  as Quarter,  '+
	'		  sum(round(isnull(LeaderRebate,0),2)+ round(isnull(MSIRebate,0),2))as CardinalRebate   '+
	'  FROM  pharmacymaster..PM_Rebates_CHAAP where year(date) = ' + @prevYear + ' group by date  '+
' ) ch where Quarter is not null '; 

EXEC (@SQL);

END








GO
