USE [reporting]
GO
/****** Object:  StoredProcedure [dbo].[spud_loadCardmain]    Script Date: 12/22/2020 4:58:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spud_loadCardmain] 
AS
BEGIN
	bulk insert CHUSource0508 from 'c:\tmp\Cardmain0508.txt' 
	with (firstrow=2, errorfile='c:\tmp\cardmain0508.err')
END

GO
