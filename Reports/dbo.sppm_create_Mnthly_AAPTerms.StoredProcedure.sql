USE [Reports]
GO
/****** Object:  StoredProcedure [dbo].[sppm_create_Mnthly_AAPTerms]    Script Date: 12/22/2020 5:00:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		< Joni Wilson>
-- Create date: <10/14/2010>
-- Description:	Create monthly MC Terminations for LindaReport for Chriss S.
-- =============================================
CREATE PROCEDURE [dbo].[sppm_create_Mnthly_AAPTerms]
(@in_month varchar(02), @in_year varchar(04) )
AS
BEGIN

	DECLARE @strDate varchar(50);
    DECLARE @endDate varchar(50);
	DECLARE @strEnddate varchar(50);
	DECLARE @endMonth varchar(02);
	DECLARE @endYear varchar(04);


	SET @strDate =  @in_month + '/01/' + @in_year  ;
	SET @strEnddate =  DATEADD(m,1,@strDate);
	SET @endMonth = month(@strEnddate);
	SET @endYear = year(@strEnddate);
	SET @endDate = @endMonth + '/01/' + @endYear;
 
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
  
	   --- Drop the previous runs table

	DECLARE @SQL varchar(1000);

	SET @SQL = ' SELECT  '+
				'	territory as TM, '+
				'	aapaccountno as [AAP#], '+
				'	aapparentno as [AAP Parent#], '+
				'	apiaccountno as [API#], ' +
				'	accountname as [Account DBA Name], '+
				'	state as St, '+
				'	Affiliate, '+
                '	v.aapeffectivedate as [AAP Start Date], '+
				'	v.aapquitdate as [AAP Quit Date], '+
				'	v.mcquitdate as [MC Quit Date], '+
				'	v.whyresigned as [AAP Quit Reason] '+
	     		'	FROM pharmacymaster..v_pm_allwithaffiliates v left join pharmacymaster..PM_ManagedCare m on v.pmid=m.pmid '+
				'	WHERE aapaccountno is not null  '+
				'	and v.aapquitdate is not null and v.aapquitdate >= ''' + @strDate +  ''' and v.aapquitdate < ''' + @endDate + '''' +
				'	order by aapaccountno';

       print (@SQL);
        EXEC(@SQL);
END








GO
