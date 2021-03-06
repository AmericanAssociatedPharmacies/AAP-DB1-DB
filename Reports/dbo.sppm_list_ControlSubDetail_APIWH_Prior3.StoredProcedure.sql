USE [Reports]
GO
/****** Object:  StoredProcedure [dbo].[sppm_list_ControlSubDetail_APIWH_Prior3]    Script Date: 12/22/2020 5:00:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		< Joni Wilson>
-- Create date: <08/01/2011>
-- Description:	Call Controlled Substance report for Prior 3 months for API WH
-- =============================================
CREATE PROCEDURE [dbo].[sppm_list_ControlSubDetail_APIWH_Prior3]
(@in_month varchar (2),@in_year varchar(4),@in_acctNo varchar(20) ,@in_acctName varchar(250))

AS
BEGIN
 
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
    DECLARE @in_date varchar(20);
	DECLARE @startCount int
	DECLARE @moBuildDate varchar(20);
    DECLARE @prevMoDate varchar(20);
	DECLARE @months   varchar(15);
	DECLARE @years   varchar(15);
	DECLARE @SQL   varchar(500);
    DECLARE @in_prior_month varchar(2);
	DECLARE @in_prior_year varchar(4);

    SET @startCount = -3
	SET @months = '';
	SET @years =  '';
	SET @in_date = @in_month + '/01/' + @in_year;

	BEGIN -- Need to run prior months to populate the tmp_ControlSub_3MO

	WHILE @startCount < 0
		BEGIN
			SET @moBuildDate =   (DATEADD(m,@startCount,@in_date));
			SET @in_prior_month =  replace(str(datepart(month,@moBuildDate),2),' ','0');
			SET @in_prior_year = cast(datepart(year,@moBuildDate) as varchar(4));
          
            SET @months = @months + @in_prior_month + ',';
			SET @years = @years + @in_prior_year + ',';
			SET @startCount = @startCount + 1;
 
		END
	END

	SET @months = substring(@months,0,len(@months) );
	SET @years = substring(@years,0,len(@years) );

	SET @SQL = ' SELECT * from api..v_apisalesdetail a '+
				' WHERE whaccountid = ' + @in_acctNo +
				' and month(invdate) in(' + @months + ') and year(invdate)  in(' + @years + ') order by invdate';

	PRINT @SQL;
	EXEC (@SQL);

END










GO
