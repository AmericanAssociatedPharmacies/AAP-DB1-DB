USE [Reports]
GO
/****** Object:  StoredProcedure [dbo].[sppm_exec_ControlSub_RPT]    Script Date: 12/22/2020 5:00:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





-- =============================================
-- Author:		< Joni Wilson>
-- Create date: <10/14/2010>
-- Description:	Call Controlled Substance report
-- =============================================
CREATE PROCEDURE [dbo].[sppm_exec_ControlSub_RPT]
 (@in_month varchar(2),@in_year varchar(4))

AS
BEGIN
 
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
    DECLARE @in_date varchar(20);
	DECLARE @startCount int
	DECLARE @moBuildDate varchar(20);
    DECLARE @prevMoDate varchar(20);
  	DECLARE @monthCount int;
    DECLARE @in_prior_month varchar(2);
	DECLARE @in_prior_year varchar(4);
 ---------************* change to -3 when done testing
	SET @startCount = -3
	SET @monthCount = 1
	SET @in_date = @in_month + '/01/' + @in_year
	SET @prevMoDate =   (DATEADD(m,-1,@in_date));

	PRINT '0'
  
	-- Check if you need to rerun the 3 months prior
	 IF EXISTS( Select period 
				from  tmp_ControlSub_3MO 
				where period = 'M3' + replace(str(datepart(month,@prevMoDate),2),' ','0')+   cast(datepart(year,@prevMoDate) as varchar(4))
				)

		BEGIN -- Do not need to run prior months
 
			EXEC dbo.sppm_create_ControlSub_RPT @in_month, @in_year
			PRINT '1'

		END

	 ELSE

		BEGIN -- Need to run prior months to populate the tmp_ControlSub_3MO
            TRUNCATE TABLE tmp_ControlSub_3MO

			WHILE @startCount < 0
			BEGIN
				SET @moBuildDate =   (DATEADD(m,@startCount,@in_date));
				SET @in_prior_month =  replace(str(datepart(month,@moBuildDate),2),' ','0');
				SET @in_prior_year = cast(datepart(year,@moBuildDate) as varchar(4));

                EXEC dbo.sppm_create_ControlSub_RPT @in_prior_month, @in_prior_year
				PRINT '2'

                UPDATE tmp_ControlSub_ALL set period = (SELECT 'M' + cast(@monthCount as varchar(1)) + period);
				PRINT '3'
                --Update the 3MO table with what you just created
                
				INSERT into  tmp_ControlSub_3MO   
				SELECT * from tmp_ControlSub_ALL ;
				PRINT '4'
		 
				SET @startCount = @startCount + 1;
				SET @monthCount = @monthCount + 1;
			END

          -- Now execute to build the current table
			EXEC dbo.sppm_create_ControlSub_RPT @in_date,@in_year
			PRINT '5'

		END
-- No matter what ran need to update the averages

	UPDATE p  
	set p.[WH_%CII_AVG3MO] = whc2.[3MOAvg]
	from tmp_ControlSub_ALL p
	left outer join (SELECT (sum([WH_%CII])/count(pmid )) as  [3MOAvg] ,pmid ,count(pmid) as [count] --[WH_%CII]
		from tmp_ControlSub_3MO  
		where [WH_%CII] is not null group by pmid
		) AS whc2 ON p.pmid = whc2.pmid;

	UPDATE p  
	set p.[WH_%CII-CV_AVG3MO] = whc35.[3MOAvg]
	from tmp_ControlSub_ALL AS p
	left outer join  (SELECT (sum([WH_%CII-CV])/count(pmid )) as [3MOAvg] ,pmid ,count(pmid) as [count] 
		from tmp_ControlSub_3MO 
		where [WH_%CII-CV] is not null  
		group by pmid
		) AS whc35
	on p.pmid = whc35.pmid;

	UPDATE p  set
	  p.[WH_GXtoBXRatio_AVG3MO] = whgb.[3MOAvg]

	 from tmp_ControlSub_ALL p

	left outer join -- WH_GXtoBXRatio
	(
		SELECT (sum([WH_GXtoBXRatio])/count(pmid )) as [3MOAvg] ,pmid ,count(pmid) as [count] from tmp_ControlSub_3MO where [WH_GXtoBXRatio] is not null  group by pmid

	)whgb
	on p.pmid = whgb.pmid;

	UPDATE p  set
	  p.[CH_%CII_AVG3MO] = chc2.[3MOAvg]

	 from tmp_ControlSub_ALL p
	----Cardinal
	left outer join  --[CH_%CII]
	(	  
		SELECT (sum([CH_%CII])/count(pmid )) as  [3MOAvg] ,pmid ,count(pmid) as [count] from tmp_ControlSub_3MO  where [CH_%CII] is not null group by pmid
	)chc2 
	on p.pmid = chc2.pmid;

	UPDATE p  set
	  p.[CH_%CII-CV_AVG3MO] = chc35.[3MOAvg]
	 from tmp_ControlSub_ALL p

	left outer join  --[CH_%CII-CV]
	(	  
		SELECT (sum([CH_%CII-CV])/count(pmid )) as [3MOAvg] ,pmid ,count(pmid) as [count] from tmp_ControlSub_3MO where [CH_%CII-CV] is not null  group by pmid

	)chc35
	on p.pmid = chc35.pmid;

	UPDATE p  set
	  p.[CH_GXtoBXRatio_AVG3MO] = chgb.[3MOAvg]
	 from tmp_ControlSub_ALL p
	left outer join -- CH_GXtoBXRatio
	(
		SELECT (sum([CH_GXtoBXRatio])/count(pmid )) as [3MOAvg] ,pmid ,count(pmid) as [count] from tmp_ControlSub_3MO where [CH_GXtoBXRatio] is not null  group by pmid

	)chgb
	on p.pmid = chgb.pmid;



select [WH_%CII-CV],a.pmid,MOAvg,[count] from tmp_ControlSub_ALL a
join
(
select (sum([WH_%CII-CV])/count(pmid)) as  MOAvg ,pmid ,count(pmid) as [count] from tmp_ControlSub_3MO
group by pmid
) t
on a.pmid = t.pmid
 
	SELECT * from tmp_ControlSub_ALL
END











GO
