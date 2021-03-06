USE [Reports]
GO
/****** Object:  UserDefinedFunction [dbo].[EmailToTableWithPMID]    Script Date: 12/22/2020 5:00:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[EmailToTableWithPMID] (@PMID INT, @InStr VARCHAR(MAX))
RETURNS @TempTab TABLE
   (tempid int IDENTITY(1,1) not null, 
   PMID int not null,
   Email NVARCHAR(MAX) not null)
AS
BEGIN
    ;-- Ensure input ends with comma
	SET @InStr = REPLACE(@InStr + ',', ',,', ',')
	DECLARE @SP INT
DECLARE @VALUE VARCHAR(1000)
WHILE PATINDEX('%,%', @INSTR ) <> 0 
BEGIN
   SELECT  @SP = PATINDEX('%,%',@INSTR)
   SELECT  @VALUE = LEFT(@INSTR , @SP - 1)
   SELECT  @INSTR = STUFF(@INSTR, 1, @SP, '')
   INSERT INTO @TempTab(PMID, Email) VALUES (@PMID,@VALUE)  
END
	RETURN
END
GO
