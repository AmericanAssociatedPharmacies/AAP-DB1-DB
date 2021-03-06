USE [reporting]
GO
/****** Object:  StoredProcedure [dbo].[spud_UpdateVolumeCHPH]    Script Date: 12/22/2020 4:58:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spud_UpdateVolumeCHPH]
 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
   -- drop table udVolume_jmw

	DECLARE @adate  datetime;
	DECLARE @cdate  datetime;
	DECLARE @cdate_use  datetime;
	DECLARE @LAST_YEAR_VAR varchar(4);
	DECLARE @LAST_MO_VAR  varchar(2);
	DECLARE @LAST_DAY_VAR varchar(2);
	DECLARE @LAST_YEAR int;
	DECLARE @LAST_MO  int;
	DECLARE @counter int;
	DECLARE @MO_DIFF int;
    DECLARE @SQL varchar(500);

	DECLARE @MO_CHPH int;
	DECLARE @MO_YEAR int;
	DECLARE @MO_YEAR_VAR varchar(4);
    DECLARE @MO_NAME varchar(25);
    DECLARE @CH_MO_NAME varchar(25);
	DECLARE @DIFF_DATE datetime;
 
	--Get Dates from Last Loaded for Admin and last date of CHPH
    SET @adate = (select max(data_date)  from Load_log where load_type_id = 1);
	SET @cdate = (select max(inv_date) from chph_1)
	SET @LAST_MO = month(@cdate);
	SET @LAST_YEAR = year(@cdate);
 
	SET @LAST_DAY_VAR = dbo.DaysInMonth(@LAST_MO,@LAST_YEAR);
   
	SET @LAST_YEAR_VAR = @LAST_YEAR;
	SET @LAST_MO_VAR = @LAST_MO;
	-- Use the last day of last month in CHPH to make sure we get total months in between
	SET @cdate_use = cast(@LAST_YEAR_VAR + '/' + @LAST_MO_VAR  + '/' + @LAST_DAY_VAR as datetime);
	SET @counter      = 1;

	SET @MO_DIFF  = (DATEDIFF(MONTH, @adate, @cdate_use));

	WHILE @counter <= @MO_DIFF
		BEGIN 
			SET  @DIFF_DATE = (DATEADD(mm, @counter, @adate));
			SET  @MO_CHPH = month(@DIFF_DATE);
			SET  @MO_YEAR = year(@DIFF_DATE);
			SET  @MO_YEAR_VAR = @MO_YEAR;
            SET  @MO_NAME =  DateName(month, convert( datetime, '2009-' + cast( @MO_CHPH as varchar(2)) + '-01', 120))
            SET  @CH_MO_NAME = 'ch.' + @MO_NAME
			print @MO_CHPH;
			print @MO_YEAR;


		BEGIN TRAN updNull

		SET @SQL = 'UPDATE VolumeCHPH set ' + @MO_NAME + ' = null where  year = ' + @MO_YEAR_VAR ;
        EXEC (@SQL);
  print @sql;
		COMMIT TRAN updNull

		BEGIN TRAN volchph
        
           
 
		SET @SQL = 'UPDATE  vc  set ' + @MO_NAME + ' = ' + @CH_MO_NAME +
			 ' FROM VolumeCHPH vc ' +
				 ' left join v_all_members_withtypes  am on ' +
				 ' am.acct_no = vc.acct_no and vc.vendor_id = am.primaryws '+
				 ' inner join '+
					'(  SELECT store, year, ' + @MO_NAME +
					' FROM  chph_sum_ext_cost_mnthly  '+
					' WHERE     year = ' + @MO_YEAR_VAR + ') ch '+
					' on vc.acct_no = ch.store and vc.year = ch.year and vc.vendor_id = am.primaryws ';
		EXEC (@SQL);
       print @sql;
	    COMMIT TRAN volchph
     
	    BEGIN TRAN volchphUpd
     
  		SET @SQL = 'INSERT  into VolumeCHPH (year,acct_no, vendor_id,' + @MO_NAME +  ') ' +    
		   ' SELECT   year ,cast(ch.STORE as varchar(4)), am.primaryws, ' +  @MO_NAME +  		      
				' FROM  chph_sum_ext_cost_mnthly ch '+
				'  join v_all_members_withtypes  am on '+
				' am.acct_no = ch.store '+
				' WHERE     ( year = ' + @MO_YEAR_VAR + ' and  ch.store != '''' and ch.store not in '+
					' (select acct_no from VolumeCHPH where year = ' + @MO_YEAR_VAR + ' and vendor_id = am.primaryws));';
		EXEC (@SQL);
	    	    SET @counter = @counter + 1;
        print @sql;
        COMMIT TRAN volchphUpd


	    END
          
    update VolumeCHPH set JANUARY = 0 where JANUARY is null;
	update VolumeCHPH set FEBRUARY = 0 where FEBRUARY is null;
	update VolumeCHPH set MARCH = 0 where MARCH is null;
	update VolumeCHPH set APRIL = 0 where APRIL is null;
	update VolumeCHPH set MAY = 0 where MAY is null;
	update VolumeCalYY set JUNE = 0 where JUNE is null;
	update VolumeCHPH set JULY = 0 where JULY is null;
	update VolumeCHPH set AUGUST = 0 where AUGUST is null;
	update VolumeCHPH set SEPTEMBER = 0 where SEPTEMBER is null;
	update VolumeCHPH set OCTOBER = 0 where OCTOBER is null;
	update VolumeCHPH set NOVEMBER = 0 where NOVEMBER is null;
	update VolumeCHPH set DECEMBER = 0 where DECEMBER is null;
    
END


GO
