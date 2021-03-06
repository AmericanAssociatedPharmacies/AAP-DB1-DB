USE [Reports]
GO
/****** Object:  StoredProcedure [dbo].[sppm_create_ProgramsMCStartEndCount_RPT_B4MCChange]    Script Date: 12/22/2020 5:00:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		< Joni Wilson>
-- Create date: <09/15/2011>
-- Description:	Create table for Managed care that has Start End Counts by month
-- =============================================
CREATE PROCEDURE [dbo].[sppm_create_ProgramsMCStartEndCount_RPT_B4MCChange]
(@in_startDate varchar(10), @in_endDate varchar(10) )
AS
BEGIN
 
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
  
	   --- Drop the previous runs table

    --FOR TESTING TAKE OUT WHEN DONE!!!!!!!!!!!!!!!!!!
	--SET @in_startDate = '12/01/2009';
	--SET @in_endDate = '09/01/2011';
------------------------------------------
	DECLARE @SQL varchar(max); 
	DECLARE @SQL1 varchar(max); 
	DECLARE @SQLStart varchar(max);
	DECLARE @SQLEnd varchar(max);
	DECLARE @daysInMonthStartDate varchar(2);
	DECLARE @monthsToCount int;
	DECLARE @varDate datetime;
	DECLARE @varDate3 varchar(10);
	DECLARE @varDate4 varchar(20);
	DECLARE @varDate5 varchar(20);
	DECLARE @varDateStart varchar(10);
	DECLARE @startCountDate varchar(10);
	DECLARE @startMonth int;
	DECLARE @startYear int;
	DECLARE @changeMonth varchar(2);
	DECLARE @changeYear  varchar(4);
	DECLARE @startCount int;
	SET @startMonth = cast(month(@in_startDate) as varchar(2));
	SET @startYear  = cast(year(@in_startDate) as varchar(4));

	SET @daysInMonthStartDate = dbo.DaysInMonth(month(@in_startDate),year(@in_startDate));
	SET @startCountDate = cast(@startMonth as varchar(2)) + '/' + @daysInMonthStartDate + '/' + cast(@startYear as varchar(4));
 
	SET @monthsToCount =  datediff(mm,@in_startDate,@in_endDate) ;
 
    SET @startCount = 1;
	SET @SQLStart = '';

	SET @varDateStart =  dbo.fDate3(DATEADD(m,0,@in_startDate));
	 IF EXISTS(SELECT name FROM sys.tables
		 WHERE name = 'tmp_MemberGroups')
	 BEGIN
      DROP TABLE tmp_MemberGroups
     END
---------------BUILD the Start End counts by Month 
---------To get active members prior to 12/31/2009    Managed Care
	SET @SQL1 = '  SELECT *   into Reports..tmp_MemberGroups     from ( '+
            '   select * from ( '+
            ' Select ( select  cast(''Managed Care'' as varchar(100))) as Program ,(SELECT count(*)from   pharmacymaster..v_pm_allwithaffiliates where  '+
			' (mceffectivedate is not null   or  mcquitdate is not null or chaincode is not null) '+
			' and ( aapeffectivedate <= ''' + @startCountDate + ''' or (mceffectivedate <= ''' + @startCountDate + ''' and aapeffectivedate > ''' +
			 @startCountDate + '''))and (mceffectivedate is null or mceffectivedate <= ''' + @startCountDate + ''')' +
			' and ' +
			' ( mcquitdate > ''' + @startCountDate + ''' or (mcquitdate is null and (aapquitdate > ''' + @startCountDate + ''' or aapquitdate is null))) ' +
            ' and aapaccountno is not null and aapaccountno != '''' ) as ''Count' + @varDateStart + ''',';
 
 
---  These are Managed Care
	WHILE @startCount < = @monthsToCount
	BEGIN
        SET @varDate3 = dbo.fDate3(DATEADD(m,@startCount,@in_startDate));
		SET @varDate = DATEADD(m,@startCount,@in_startDate);
		SET @changeMonth = cast (month(@varDate) as varchar(2));
	    SET @changeYear = cast (year(@varDate) as varchar(4));
 
		SET @SQLStart =  @SQLStart + '( SELECT count(*)   from pharmacymaster..v_pm_allwithaffiliates where month(mceffectivedate) = ' + @changeMonth + ' and year(mceffectivedate) = ' + @changeYear + 
				   ' and   aapaccountno is not null and aapaccountno != '''' )  as ''Start' + @varDate3 +  ''',';

        SET @SQLStart =  @SQLStart + '(SELECT count(*) from pharmacymaster..v_pm_allwithaffiliates where '+
						'( ( aapquitdate is   null and ( month(mcquitdate) = ' + @changeMonth + ' and year(mcquitdate) = ' + @changeYear + ' )) or  '+
						' ( mcquitdate is   null and ( month(aapquitdate) = ' + @changeMonth + ' and year(aapquitdate) = ' + @changeYear + ' )) or  '+
						' ( aapquitdate is not  null and ( month(mcquitdate) = ' + @changeMonth + ' and year(mcquitdate) = ' + @changeYear + ' )) )  '+
						' and '+
						' (chaincode is not null or mceffectivedate is not null or mcquitdate is not null)  and aapaccountno is not null and aapaccountno != '''') as ''End' + @varDate3 +  ''',';

		SET @startCount = @startCount + 1;
   
	END
	
    SET @SQLStart = substring(@SQLStart,0,len(@SQLStart) );
	SET @SQL  = @SQL1 + @SQLStart + ')pmInner   )pmOuter';
      
	EXEC (@SQL);

---- This is for all the other programs this will be an insert into as the table is already created above

	DECLARE @progid int;
	DECLARE @progidV varchar(10);
	DECLARE @id int;
	SELECT @progid =  min( programid ) from pharmacymaster..pm_programs where programid in (select distinct programid from  pharmacymaster..pm_memberprograms) ;

	 
	WHILE @progid is not null
		BEGIN
		--DO All processing for each program

           	SET @startCount = 1;
            SET @SQLStart = '';
			SET @SQL1 = '';
			SET @SQL  = '';
			SET @progidV = cast(@progid as varchar(10));
            SET @SQL1 = ' INSERT  into  Reports..tmp_MemberGroups '+
				' SELECT * from ( '+
				' SELECT (SELECT description from pharmacymaster..pm_programs where programid = ''' + @progidV + ''') as Program, '+
				' (SELECT  count(*) from ( '+
				' SELECT distinct pm.pmid from pharmacymaster..pm_memberprograms pm '+
				' join '+
				' ( '+
				'     SELECT  pmid,aapquitdate from pharmacymaster..pm_pharmacy where (aapaccountno is not null and  aapaccountno != '''')  '+
				' ) p  '+
	            ' on pm.pmid = p.pmid  '+
				' where startdate <= ''' + @startCountDate + ''' and (reports.dbo.mindate(enddate,aapquitdate) >  ''' + @startCountDate + '''  '+
                '  or reports.dbo.mindate(enddate,aapquitdate) is null)  and programid = ''' + @progidV +'''' +
                '  and pm.pmid in(select pmid from pharmacymaster..pm_pharmacy where aapaccountno is not null and  aapaccountno != '''' )  '+
	            ' ) ch '+	 
                ' ) as ''Count' + @varDateStart + ''',';
		

			WHILE @startCount < = @monthsToCount
			BEGIN
				SET @varDate3 = dbo.fDate3(DATEADD(m,@startCount,@in_startDate));
				SET @varDate = DATEADD(m,@startCount,@in_startDate);
				SET @changeMonth = cast (month(@varDate) as varchar(2));
				SET @changeYear = cast (year(@varDate) as varchar(4));
				
				SET @SQLStart = @SQLStart + '(SELECT count(*) from ( '+
                      ' SELECT distinct pmid from pharmacymaster..pm_memberprograms where month(startdate) = ' + @changeMonth + ' and year(startdate) = ' + @changeYear +  
                      ' and programid =  '''+ @progidV + ''' and pmid in ( select pmid from pharmacymaster..pm_pharmacy where aapaccountno is not null and aapaccountno != ''''))ch ) as ''Start' + @varDate3 +  ''',';

				SET @SQLStart =  @SQLStart + '(SELECT   count(CountPM)  as counts from '+
					  ' (SELECT  distinct pm.pmid , count(*)  as CountPM, Programid ,aapquitdate,enddate from pharmacymaster..pm_memberprograms pm '+
					  ' left outer join  '+
					  ' (  '+
							' SELECT * from pharmacymaster..pm_pharmacy where aapaccountno is not null and  aapaccountno != ''''     '+
                            
                      ' ) p '+
                      ' on pm.pmid = p.pmid  where month(reports.dbo.mindate(enddate,aapquitdate)) =  ' + @changeMonth + ' and year(reports.dbo.mindate(enddate,aapquitdate)) = ' + @changeYear +
                      ' and reports.dbo.mindate(enddate,aapquitdate) is not null ' +
                      ' group by pm.pmid , Programid  ,aapquitdate ,enddate '+
                      ' )ch '+
                      ' where programid =  '''+ @progidV + '''    '+
                      ' and  pmid in(select pmid from pharmacymaster..pm_pharmacy where aapaccountno is not null and  aapaccountno != '''' )   '+
                      ' group by programid   ) as ''End' + @varDate3 +  ''',';
				SET @startCount = @startCount + 1;                
			END

                SET @SQLStart = substring(@SQLStart,0,len(@SQLStart) );
                print @SQLStart;
 				SET @SQL  = @SQL1 + @SQLStart + ')pmInner';
				EXEC (@SQL);

        --End all processing for each program
		SELECT @progid =  min( programid ) from pharmacymaster..pm_programs where programid in (select distinct programid from  pharmacymaster..pm_memberprograms) and programid > @progid ;

	END

 ----------Update fields set to null
	SET @startCount = 1;
	SET @SQL = '';
	WHILE @startCount < = @monthsToCount
	BEGIN
        SET @varDate3 = dbo.fDate3(DATEADD(m,@startCount,@in_startDate));

	    SET @SQL = 'UPDATE Reports..tmp_MemberGroups   set End' + @varDate3 + ' = 0 where  End' + @varDate3 + ' is null';
	    EXEC (@SQL);
		SET @startCount = @startCount + 1;
	END
----BUILD the Count by Month table
	SET @SQL = '';
	SET @SQL1 = '';

	SET @startCount = 0;

	IF EXISTS(SELECT name FROM sys.tables
		 WHERE name = 'tmp_MemberGroupsCount')
	BEGIN
      DROP TABLE tmp_MemberGroupsCount
    END

    SET @SQL = ' CREATE TABLE tmp_MemberGroupsCount ' +
			   ' ( ' +
			   ' Program varchar(50), ';
   	WHILE @startCount < = @monthsToCount
	BEGIN
        SET @varDate4 = dbo.fDate4(DATEADD(m,@startCount,@in_startDate));
		SET @SQL1 = @SQL1 + '[Count as of ' + @varDate4 + '] int,';
		SET @startCount = @startCount + 1;
	END
		SET @SQL1 = substring(@SQL1,0,len(@SQL1) );
		SET @SQL1 = @SQL1 + ')';
		EXEC (@SQL + @SQL1);

--- Now update the table you just built
	SET @SQL = '';
	SET @varDate4 = dbo.fDate4(DATEADD(m,0,@in_startDate));
	SET @varDate3 = dbo.fDate3(DATEADD(m,0,@in_startDate));
	
	--First need to populate the program field
		Insert into tmp_MemberGroupsCount (Program)   select Program from Reports..tmp_MemberGroups;  
	
	-- Do the first column - it's a little different than the others
	 	SET @SQL = '	UPDATE  su  set '+
			 '[Count as of ' + @varDate4 + '] = ch.Count' + @varDate3 +  
			 ' FROM Reports..tmp_MemberGroupsCount   su '+
		     ' inner join '+
			 '  ( select Count' + @varDate3 + ',program from Reports..tmp_MemberGroups  ) ch '+
			 ' on su.program = ch.program ';
		EXEC (@SQL);
  -- Now do the second column - this one is different also
		SET @varDate3 = dbo.fDate3(DATEADD(m,1,@in_startDate));
		SET @varDate4 = dbo.fDate4(DATEADD(m,1,@in_startDate));
		SET @varDate5 = dbo.fDate3(DATEADD(m,0,@in_startDate));
	 	SET @SQL = '	UPDATE  su  set '+
			'   [Count as of ' + @varDate4 + '] = ch.countMo  '+
	        '  FROM Reports..tmp_MemberGroupsCount   su '+
		    '  inner join '+
			'   ( select (Start' + @varDate3 + ' - End' + + @varDate3 + ' ) + Count' + @varDate5 + ' as countMo,program from Reports..tmp_MemberGroups ) ch '+
	        '  on su.program = ch.program   ';
		EXEC (@SQL);
	
   -- Now do the rest of the columns
	SET @startCount = 2;
	WHILE @startCount < = @monthsToCount
	BEGIN
        SET @varDate3 = dbo.fDate3(DATEADD(m,@startCount,@in_startDate));
		SET @varDate4 = dbo.fDate4(DATEADD(m,@startCount,@in_startDate));
		SET @varDate5 = dbo.fDate4(DATEADD(m,@startCount - 1 ,@in_startDate));
		SET @SQL = '	UPDATE  su  set '+
			' [Count as of ' + @varDate4 + '] = ch.countMo + [Count as of ' + @varDate5 + ']'+
	        ' FROM Reports..tmp_MemberGroupsCount   su '+
		    ' inner join '+
			'   ( select (Start' + @varDate3 + ' - End' + + @varDate3 + ' )  as countMo ,program from Reports..tmp_MemberGroups  ) ch '+
	        ' on su.program = ch.program   ';
	print @sql;
		EXEC (@SQL);
		SET @startCount = @startCount + 1;
	END

----BUILD the NET Count by Month table
	SET @SQL = '';
	SET @SQL1 = '';

	SET @startCount = 1;

	IF EXISTS(SELECT name FROM sys.tables
		 WHERE name = 'tmp_MemberGroupsNetCount')
	BEGIN
      DROP TABLE tmp_MemberGroupsNetCount
    END

    SET @SQL = ' CREATE TABLE tmp_MemberGroupsNetCount ' +
			   ' ( ' +
			   ' Program varchar(50), ';
   	WHILE @startCount < = @monthsToCount
	BEGIN
        SET @varDate4 = dbo.fDate4(DATEADD(m,@startCount,@in_startDate));
		SET @SQL1 = @SQL1 + '[Net Change ' + @varDate4 + '] int,';
		SET @startCount = @startCount + 1;
	END
		SET @SQL1 = substring(@SQL1,0,len(@SQL1) );
		SET @SQL1 = @SQL1 + ')';
		EXEC (@SQL + @SQL1);

 

--- Now update the table you just built
	SET @SQL = '';
	SET @varDate4 = dbo.fDate4(DATEADD(m,0,@in_startDate));
	SET @varDate3 = dbo.fDate3(DATEADD(m,0,@in_startDate));
	
	--First need to populate the program field
		Insert into tmp_MemberGroupsNetCount (Program)   select Program from Reports..tmp_MemberGroups;  
	
	
   -- Now do the rest of the columns
	SET @startCount = 1;
	WHILE @startCount < = @monthsToCount
	BEGIN
        SET @varDate3 = dbo.fDate3(DATEADD(m,@startCount,@in_startDate));
		SET @varDate4 = dbo.fDate4(DATEADD(m,@startCount,@in_startDate));
		SET @varDate5 = dbo.fDate4(DATEADD(m,@startCount - 1 ,@in_startDate));
		SET @SQL = '	UPDATE  su  set '+
			' [Net Change ' + @varDate4 + '] = ch.countMo '+
	        ' FROM Reports..tmp_MemberGroupsNetCount   su '+
		    ' inner join '+
			'   ( select (Start' + @varDate3 + ' - End' + + @varDate3 + ' )  as countMo ,program from Reports..tmp_MemberGroups  ) ch '+
	        ' on su.program = ch.program   ';
	print @sql;
		EXEC (@SQL);
		SET @startCount = @startCount + 1;
	END
END








GO
