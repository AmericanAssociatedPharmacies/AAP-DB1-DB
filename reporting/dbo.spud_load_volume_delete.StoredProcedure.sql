USE [reporting]
GO
/****** Object:  StoredProcedure [dbo].[spud_load_volume_delete]    Script Date: 12/22/2020 4:58:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spud_load_volume_delete]
 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
   -- drop table udVolume_jmw
    select *
             into udVolume_jmw
            from openquery(UNITEDDB,'select * from united.volume') AS Rowset_1

END


GO
