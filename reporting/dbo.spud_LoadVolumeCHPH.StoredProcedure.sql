USE [reporting]
GO
/****** Object:  StoredProcedure [dbo].[spud_LoadVolumeCHPH]    Script Date: 12/22/2020 4:58:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spud_LoadVolumeCHPH]
 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
   -- drop table udVolume_jmw

        IF EXISTS(SELECT name FROM sys.tables
        WHERE name = 'VolumeCHPH')
		BEGIN
          DROP TABLE VolumeCHPH;
        END
          
    select * into VolumeCHPH from (select   * from VolumeCalYY )n

	-- Create Index on Acct_no
	CREATE NONCLUSTERED INDEX [IDX_Acct_no] ON [dbo].VolumeCHPH 
	(
		[acct_no] ASC
	)
	WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF,
    ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]

	-- Create Index on DT
	CREATE NONCLUSTERED INDEX [IDX_Date] ON [dbo].VolumeCHPH 
   (
		[year] ASC
   )
   WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF,
	 DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]


	-- Create Index on Acct_no,DT,Vendor_id
    CREATE NONCLUSTERED INDEX [IDX_AcctNo_Date_VendorID] ON [dbo].VolumeCHPH 
	(
		[acct_no] ASC,
		[year] ASC,
		[vendor_id] ASC
	)
	WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, 
	DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]

END


GO
