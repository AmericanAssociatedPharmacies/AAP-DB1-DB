USE [reporting]
GO
/****** Object:  StoredProcedure [dbo].[spud_LoadVolumeCalYY]    Script Date: 12/22/2020 4:58:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		Joni Wilson
-- Create date: 08/20/2009
-- Description:	Year to year comparison Report
-- =============================================
CREATE PROCEDURE [dbo].[spud_LoadVolumeCalYY]
	
AS
BEGIN
     --Drop the previous runs table
      IF EXISTS(SELECT name FROM sys.tables
        WHERE name = 'VolumeCalYY')
		BEGIN
          DROP TABLE VolumeCalYY;
        END

CREATE TABLE [dbo].[VolumeCalYY](
	[YEAR] [varchar](4) NULL,
	[ACCT_NO] [varchar](8) NULL,
	[VENDOR_ID] [int] NULL,
	[VENDOR] [varchar] (64) NULL,
	[REPORTS] [varchar] (1) NULL,
	[JANUARY] [numeric](38, 2) NULL,
	[FEBRUARY] [numeric](38, 2) NULL,
	[MARCH] [numeric](38, 2) NULL,
	[APRIL] [numeric](38, 2) NULL,
	[MAY] [numeric](38, 2) NULL,
	[JUNE] [numeric](38, 2) NULL,
	[JULY] [numeric](38, 2) NULL,
	[AUGUST] [numeric](38, 2) NULL,
	[SEPTEMBER] [numeric](38, 2) NULL,
	[OCTOBER] [numeric](38, 2) NULL,
	[NOVEMBER] [numeric](38, 2) NULL,
	[DECEMBER] [numeric](38, 2) NULL,
	[PMID] [bigint] NULL,
	[VendorID] [int] NULL
) ON [PRIMARY]


CREATE NONCLUSTERED INDEX [IDX_VidActNoYY] ON [dbo].[VolumeCalYY] 
(
	[VENDOR_ID] ASC,
	[ACCT_NO] ASC,
	[YEAR] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF,
 IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
 

INSERT INTO VolumeCalYY    
    SELECT  distinct   year(dt) as YEAR , acct_no,vendor_id, vendor,reports,
			SUM(CASE when month(dt) = '01' then volume  END) as JANUARY,
			SUM(CASE when month(dt) = '02' then volume  END) as FEBRUARY,
			SUM(CASE when month(dt) = '03' then volume  END) as MARCH,
			SUM(CASE when month(dt) = '04' then volume  END) as APRIL,
			SUM(CASE when month(dt) = '05' then volume  END) as MAY,
			SUM(CASE when month(dt) = '06' then volume  END) as JUNE,
			SUM(CASE when month(dt) = '07' then volume  END) as JULY,
			SUM(CASE when month(dt) = '08' then volume  END) as AUGUST,
			SUM(CASE when month(dt) = '09' then volume  END) as SEPTEMBER,
			SUM(CASE when month(dt) = '10' then volume  END) as OCTOBER,
			SUM(CASE when month(dt) = '11' then volume  END) as NOVEMBER,
			SUM(CASE when month(dt) = '12' then volume  END) as DECEMBER,null,null   
          
    FROM  VolumeNorm  
group by year(dt),acct_no ,vendor_id   ,vendor,reports;


	update VolumeCalYY set JANUARY = 0 where JANUARY is null;
	update VolumeCalYY set FEBRUARY = 0 where FEBRUARY is null;
	update VolumeCalYY set MARCH = 0 where MARCH is null;
	update VolumeCalYY set APRIL = 0 where APRIL is null;
	update VolumeCalYY set MAY = 0 where MAY is null;
	update VolumeCalYY set JUNE = 0 where JUNE is null;
	update VolumeCalYY set JULY = 0 where JULY is null;
	update VolumeCalYY set AUGUST = 0 where AUGUST is null;
	update VolumeCalYY set SEPTEMBER = 0 where SEPTEMBER is null;
	update VolumeCalYY set OCTOBER = 0 where OCTOBER is null;
	update VolumeCalYY set NOVEMBER = 0 where NOVEMBER is null;
	update VolumeCalYY set DECEMBER = 0 where DECEMBER is null;
END










GO
