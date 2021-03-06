USE [Reports]
GO
/****** Object:  StoredProcedure [dbo].[sppm_create_MemberNonCompliance_DYN]    Script Date: 12/22/2020 5:00:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		< Joni Wilson>
-- Create date: <03/29/2010>
-- Description:	Create table to use for load to THIS USES BRUCES FUNCTION *******************88
-- =============================================
CREATE PROCEDURE [dbo].[sppm_create_MemberNonCompliance_DYN]
(@in_month varchar(02), @in_year varchar(4), @insert varchar(4) )
 
AS
BEGIN

	-- Used to insert into the AAPMemNonCompAll table (each month when the tmp_memNonCompAll is created if the @insert is set to 'Yes' the whole table will be inserted with the date).
	DECLARE @endDate   datetime  ;
	DECLARE @startDateStr varchar(20);
   	DECLARE @startDate  datetime;
    DECLARE @startMonthCount int;
    DECLARE @startMonthCount2 int;
    DECLARE @SQL  varchar(max);
    DECLARE @SQL2  varchar(max);
    DECLARE @SQLColWH varchar(max);
    DECLARE @SQLColCard varchar(max);
    DECLARE @SQLColML varchar(max);

    DECLARE @SQLWH varchar(max);
    DECLARE @SQLCard varchar(max);
    DECLARE @SQLML varchar(max);

    DECLARE @varDate varchar(20);

    DECLARE @SQLMo_Curr_YR varchar(50);
    DECLARE @SQLMo_Prev_YR varchar(50);

    DECLARE @yearStart varchar(10);
    DECLARE @yearEnd varchar(10);

    DECLARE @moEndFromOne int;

    DECLARE @moStart int;
    DECLARE @moEnd int;

	Declare @mo int;
	Declare @yr int;
 

	SET @startMonthCount = -3;
	SET @startMonthCount2 = -3;
	SET @endDate = @in_month + '/01/' + @in_year;
 
--    SET @startDateStr = dbo.fDate1(DATEADD(m,-3,@endDate)); --Set Start date 4 months back
    SET @startDateStr =  DATEADD(month,-3,@endDate); --Set Start date 4 months back

	SET @startDate =  @startDateStr;

	SET @SQLColWH = '';
	SET @SQLColCard = '';
	SET @SQLColML = '';
	SET @SQLWH = '';
	SET @SQLCard = '';
	SET @SQLML = '';
	SET @SQL2 = '';
	SET @SQLMo_Curr_YR = '';
	SET @SQLMo_Prev_YR = '';

	SET @yearStart = year(@startDate);
	SET @yearEnd = year(@endDate);
	SET @moEndFromOne = 1;

	SET @moStart = month(@startDate);
	SET @moEnd = month(@endDate);



--Create the table with Active members
	 IF EXISTS(SELECT name FROM sys.tables
		 WHERE name = 'tmp_memNonCompAll')
	 BEGIN
      DROP TABLE tmp_memNonCompAll
     END

	WHILE @startMonthCount < 1
	BEGIN
		SET  @varDate = dbo.fDate1(DATEADD(m,@startMonthCount,@endDate));

		SET @SQLColWH = @SQLColWH +  ' MAX([WH ' + @varDate +  ' Vol])  as [WH ' + @varDate + ' Vol], ';
		SET @SQLColCard = @SQLColCard +  ' MAX([Cardinal ' + @varDate +  ' Vol])  as [Cardinal ' + @varDate + ' Vol], ';
		SET @SQLColML = @SQLColML +  ' MAX([ML ' + @varDate +  ' Vol])  as [ML ' +@varDate + ' Vol], ';

	    SET @SQLWH = @SQLWH + ' [WH ' +@varDate + ' Vol], '; 
	    SET @SQLCard = @SQLCard + ' [Cardinal ' +@varDate + ' Vol], '; 
	    SET @SQLML = @SQLML + ' [ML ' +@varDate + ' Vol], '; 
    
    	SET @startMonthCount = @startMonthCount + 1;
	END
   -- Now take of trailing comma
       SET @SQLColML = substring(@SQLColML,0,len(@SQLColML) );
       SET @SQLWH = substring(@SQLWH,0,len(@SQLWH) );
       SET @SQLCard = substring(@SQLCard,0,len(@SQLCard) );
       SET @SQLML = substring(@SQLML,0,len(@SQLML) );


-- Set SQL for selecting Months if in same year
		IF(@yearStart = @yearEnd)
			BEGIN
				WHILE @moStart < = month(@endDate)
				BEGIN
					print  @moStart
				 
				  SET @SQLMo_Curr_YR = @SQLMo_Curr_YR + cast(@moStart as varchar(2)) + ',';
				  SET @moStart = @moStart + 1;
				END 
				-- Take off the last comma
				SET @SQLMo_Curr_YR = substring(@SQLMo_Curr_YR,0,len(@SQLMo_Curr_YR) );
			END
		ELSE
			BEGIN
				WHILE @moStart < = 12  -- Get the Previous Year
				BEGIN
				  SET @SQLMo_Prev_YR = @SQLMo_Prev_YR + cast(@moStart as varchar(2)) + ',';
				  SET @moStart = @moStart + 1;
				END 
				-- Take off the last comma
				SET @SQLMo_Prev_YR = substring(@SQLMo_Prev_YR,0,len(@SQLMo_Prev_YR) );
 
				WHILE @moEndFromOne < = month(@endDate) -- Get the Current Year
				BEGIN
				  SET @SQLMo_Curr_YR = @SQLMo_Curr_YR + cast(@moEndFromOne as varchar(2)) + ',';
				  SET @moEndFromOne = @moEndFromOne + 1;
				END 
				-- Take off the last comma
				SET @SQLMo_Curr_YR = substring(@SQLMo_Curr_YR,0,len(@SQLMo_Curr_YR) );
 

			END
		 
print @SQLMo_Curr_YR
  

	SET @SQL =  ' SELECT * into tmp_memNonCompAll from ( ' +
              
            ' SELECT PMID, ' +  
			'  cast(null as  varchar(100)) as [Account DBA Name] , '+
			'  cast(null as varchar(20)) as AAP# , '+
			'  cast(null as  varchar(100)) as [City] , '+
			'  cast(null as  varchar(100)) as ST , '+   
            '  cast('''' as varchar(10)) as TM , '+
		    '  cast(null as varchar(10)) as [AAP Eff] , '+
			'  cast(null as varchar(20)) as API# , '+
			'  cast(null as  varchar(200)) as Description , '+
			'  cast(null as  varchar(200)) as Affiliate , '+
			'  cast(null as  varchar(200)) as [AAP Elite] , '+
			'  cast(null as varchar(20)) as [Warehouse Active] , '+
			'  cast(null as varchar(20)) as [Cardinal/ML Status] , '+

            ' cast(null as varchar(20)) as [IsManagedCare] ,  '+
            ' cast(null as varchar(20)) as [Is LTC] ,  '+
              @SQLColWH + @SQLColCard + @SQLColML ;
 
    SET @SQL2 = ' FROM ( ' +
	         '  SELECT c.PMID,date,c.aapaccountno,aapquitdate ,' +
		     '''WH '' + SUBSTRING(CONVERT(VARCHAR(9), date, 6), 4, 6) + '' Vol'' as dateWH,' +
		     ' sum(isnull(whapitotal,0))as whapitotal  , ' +
		     '''Cardinal '' + SUBSTRING(CONVERT(VARCHAR(9), date, 6), 4, 6) + '' Vol'' as dateCard, ' +
		     ' sum(isnull(aapnetsales,0))+ sum(isnull(udnetsales,0)) as cardnetsales , ' +
		     '''ML ''+ SUBSTRING(CONVERT(VARCHAR(9), date, 6), 4, 6) + '' Vol''    AS dateML , '+
		     ' sum(isnull(MLTotal,0)) as MLTotal '+

   	     	'	 from  pharmacymaster..v_PM_AllWithAffiliates c ' +
        	'	left outer join ' +
			'	(select  pmid,date,whapitotal,aapnetsales,udnetsales,mltotal   from pharmacymaster..ALL_Volume '+

               '  where ( month(date) in ( ' +
                  @SQLMo_Curr_YR + ')'+
                ' and year(date) = ' + @yearEnd + ') ';
 
                 IF(@yearStart != @yearEnd)
			       SET @SQL2 = @SQL2    + '	 or (month(date) in ( ' +
					 @SQLMo_Prev_YR + ')' +
					 ' and year(date) =  ' + @yearStart + ')' ;
         
		    	SET @SQL2 = @SQL2  + '  group by   PMID ,date,whapitotal,aapnetsales,udnetsales,mltotal    ' +


            ' ) p ' +
			'	on p.pmid = c.pmid ' +
			'	where   c.aapaccountno is not null and c.aapaccountno != ''''  and c.aapquitdate is null ' +
            ' group by  c.PMID,date,c.aapaccountno,aapquitdate '+
	         ' ) as TableDate ' +

   	' PIVOT ' +  
	' ( '+
	'  SUM(whapitotal)  '+
	'  FOR dateWH IN  ( ' + @SQLWH + ')' + 
	' )as P7  '+

	' PIVOT ' +  
	' ( '+
	'  SUM(cardnetsales)  '+
	'  FOR dateCard IN  ( ' +  @SQLCard + ')' +   
	' )as P8 '+

	' PIVOT ' +  
	' ( '+
	' SUM(MLTotal) '+
	' FOR dateML IN  ( ' +  @SQLML + ')' +    
	' )as P9 '+
	' group by PMID  '+

    ' )vol ';

print @sql + @sql2
 EXEC (@SQL + @SQL2)


	UPDATE v set
		TM = p.territory  ,
		[AAP#] = p.aapaccountno,
		[API#] = p.apiaccountno ,
		[AAP Eff] =    CONVERT(VARCHAR(10), p.AAPEffectiveDate, 101) ,
		[Description] = p.AccountDescription ,
		Affiliate = p.Affiliate,
        [AAP Elite] = mp.eliteStatus,
		[Account DBA Name] = p.[accountname],
		City = p.City, 
		ST = p.State ,
		 [Warehouse Active] = case when p.APIStatus = 'ACTIVE' then 'Yes' else 'No' end   ,
         [Cardinal/ML Status] = case when  c.pmid is not null then 'Yes' else null end  ,
         [IsManagedCare] = case when  p.chaincode is not null and p.mcquitdate is null then 'Yes' else 'No' end ,
         [Is LTC] = case when  p.categoryid = 3 then 'Yes' else 'No' end 

	FROM tmp_memNonCompAll v
	left join pharmacymaster..v_PM_AllWithAffiliates p on v.pmid=p.pmid
    left   join
      (select pmid from pharmacymaster..pm_chaccounts_adj union select pmid from pharmacymaster..pm_chaccounts_bas) c
      on v.pmid = c.pmid
    left outer join
	(
		select pmid,'Yes' as eliteStatus from pharmacymaster..pm_memberprograms where programid = 184 and enddate is null
	) mp
	on v.pmid = mp.pmid


--SET TO ZERO WHERE NULL
	WHILE @startMonthCount2 < 1
	BEGIN
		SET  @varDate = dbo.fDate1(DATEADD(m,@startMonthCount2,@endDate));
		SET @SQL  = ' UPDATE tmp_memNonCompAll SET [WH ' + @varDate + ' Vol]= 0.0 where   [WH ' + @varDate + ' Vol] is null ';
        Exec (@SQL);
		SET @SQL = ' UPDATE tmp_memNonCompAll SET [Cardinal ' + @varDate + ' Vol] = 0.0 where  [Cardinal ' + @varDate + ' Vol] is null ';
        Exec (@SQL);
		SET @SQL = ' UPDATE tmp_memNonCompAll SET  [ML ' +@varDate + ' Vol] = 0.0 where  [ML ' +@varDate + ' Vol] is null ';
        Exec (@SQL);

		SET @startMonthCount2 = @startMonthCount2 + 1;
	END


UPDATE nc set 
   [Cardinal/ML Status] = 'Yes'
         from tmp_memNonCompAll nc
    inner join (select vendor,pmid from pharmacymaster..v_wholesaler_primary where vendor = 'ML' )w
            on nc.pmid=w.pmid

--Update where ML and Cardinal are not yes to no

UPDATE tmp_memNonCompAll set  [Cardinal/ML Status] = 'No' where  [Cardinal/ML Status] is null



 IF EXISTS(SELECT name FROM sys.tables
	 WHERE name = 'tmp_memNonComp')
 BEGIN
  DROP TABLE tmp_memNonComp
 END

SELECT * into tmp_memNonComp from (
SELECT t.* from tmp_memNonCompAll t
 join pharmacymaster..pm_pharmacy p on t.pmid = p.pmid 
WHERE ( ([Warehouse Active] = 'Yes' and [Cardinal/ML Status] = 'No' and t.[IsManagedCare] = 'No' and Affiliate is null)
or ([Warehouse Active] = 'No' and [Cardinal/ML Status] = 'No' and t.[IsManagedCare] = 'Yes' and Affiliate is null)
or ([Warehouse Active] = 'No' and [Cardinal/ML Status] = 'Yes' and t.[IsManagedCare] = 'No' and Affiliate is null)
or ([Warehouse Active] = 'No' and [Cardinal/ML Status] = 'No' and t.[IsManagedCare] = 'No' and Affiliate is null)
or ([Cardinal/ML Status] = 'No' and [Warehouse Active] = 'No' and t.[IsManagedCare] = 'No'and Affiliate is not null)
or([Cardinal/ML Status] = 'No' and [Warehouse Active] = 'Yes' and t.[IsManagedCare] = 'No'and Affiliate is not null)
or([Cardinal/ML Status] = 'No' and [Warehouse Active] = 'No' and t.[IsManagedCare] = 'Yes'and Affiliate is not null) )
and ( p.categoryID  != 3 or p.categoryID is null)
) ch

IF (@insert = 'Yes')
BEGIN
INSERT into AAPMemNonCompAll
SELECT @endDate, * from tmp_memNonCompAll;
END

END

		 








GO
