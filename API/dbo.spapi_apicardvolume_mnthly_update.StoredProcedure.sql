USE [API]
GO
/****** Object:  StoredProcedure [dbo].[spapi_apicardvolume_mnthly_update]    Script Date: 12/22/2020 4:19:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		< Joni Wilson>
-- Create date: <02/12/2010>
-- Description:	<Aggregate ext-cost for the month by store>
-- =============================================
CREATE PROCEDURE [dbo].[spapi_apicardvolume_mnthly_update]
 (@in_month varchar(2), @in_year varchar(4))
AS
	BEGIN
 
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	DECLARE @MO varchar(15);
    DECLARE @SQL varchar(2000);
	 
	-- Here we set the months we need to be getting data from
	IF( @in_month = '01')
		 BEGIN
		   SET @MO = 'January';
		 END
	IF( @in_month = '02')
		 BEGIN
		   SET @MO = 'February';
		 END
	IF( @in_month = '03')
		 BEGIN
		   SET @MO = 'March';
		 END
	IF( @in_month = '04')
		 BEGIN
		   SET @MO = 'April';
		 END
	IF( @in_month = '05')
		 BEGIN
		   SET @MO = 'May';
		 END
	IF( @in_month = '06')
		 BEGIN
		   SET @MO = 'June';
		 END
	IF( @in_month = '07')
		 BEGIN
		   SET @MO = 'July';
		 END
	IF( @in_month = '08')
		 BEGIN
		   SET @MO = 'August';
		 END
	IF( @in_month = '09')
		 BEGIN
		   SET @MO = 'September';
		 END
	IF( @in_month = '10')
		 BEGIN
		   SET @MO = 'October';
		 END
	IF( @in_month = '11')
		 BEGIN
		   SET @MO = 'November';
		 END
	IF( @in_month = '12')
		 BEGIN
		   SET @MO = 'December';
		 END
  
        BEGIN TRAN upd_mnthly
        
       
	SET @SQL = 'UPDATE  api  set '+
		@MO + ' =   tmp.sales  '+
    'FROM apicardvolume api '+
	  'inner join '+
		'(  SELECT  dea,apiaccountno,sales '+
			 'FROM  tmp_apicardvolume_load  '+
			' ) tmp '+
      'on api.apiaccountno = tmp.apiaccountno and api.year =  '+ @in_year;

     exec (@SQL);
   
       

	COMMIT TRAN upd_mnthly
    BEGIN TRAN add_mnthly
 
    SET @SQL = 'INSERT INTO apicardvolume  (  year,DEA,APIAccountNO,CardinalNo,Name, ' + @MO + ')  '+
      '( SELECT ' + @in_year   + ',DEA,apiaccountno , CardinalNo,Name,Sales  '+
       ' FROM tmp_apicardvolume_load    where apiaccountno not in (select apiaccountno from apicardvolume  where year = '+ @in_year +')); ';
 
     exec (@SQL);

    COMMIT TRAN add_mnthly
    END
 
 --Change null to zeros

	UPDATE apicardvolume set January = 0 where January is null and year = @in_year
	UPDATE apicardvolume set February = 0 where February is null and year = @in_year
	UPDATE apicardvolume set March = 0 where March is null and year = @in_year
	UPDATE apicardvolume set April = 0 where April is null and year = @in_year
	UPDATE apicardvolume set May = 0 where May is null and year = @in_year
	UPDATE apicardvolume set June = 0 where June is null and year = @in_year
	UPDATE apicardvolume set July = 0 where July is null and year = @in_year
	UPDATE apicardvolume set August = 0 where August is null and year = @in_year
	UPDATE apicardvolume set September = 0 where September is null and year = @in_year
	UPDATE apicardvolume set October = 0 where October is null and year = @in_year
	UPDATE apicardvolume set November = 0 where November is null and year = @in_year
	UPDATE apicardvolume set December = 0 where December is null and year = @in_year

	UPDATE apicardvolume set dea = null where dea = ''
-- Use this to join and see if DEA's exist for those that are empty in the temp table
--select * from tmp_apicardvolume_load t
--left outer join pharmacymaster..pharmacy1 p1
--on t.apiaccountno = p1.apiaccountno
--where t.dea = ''







GO
