USE [WebTest]
GO
/****** Object:  StoredProcedure [dbo].[spQC_ScanFilesAdd]    Script Date: 12/22/2020 5:26:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[spQC_ScanFilesAdd]
(
	@FileType nvarchar(50),
	@FileName nvarchar(350),
	@ProcessingInfo nvarchar(MAX)
)
AS
/*	jn add a new record when file is processed
*/
BEGIN

IF ( NOT EXISTS ( SELECT * FROM dbo.QC_ScanFiles WHERE (FileType like @FileType) AND  FromLocation LIKE '%' + @FileName + '%' )) 
BEGIN
	INSERT INTO [dbo].[QC_ScanFiles]
			   ([FileType]
			   ,[FromLocation]
			   --,[ToFileLocation]
			   ,[ProcessingInfo]
			   --,[CreateDateTime]  -- this default gatedate()
			   --,[IsProcess] -- this default is true
			)
		 VALUES
			   (@FileType
			   ,@FileName
			   --,<ToFileLocation, nvarchar(350),>
			   ,@ProcessingInfo
			   --,<CreateDateTime, datetime,>
			   --,<IsProcess, bit,>
			)
END -- end of the if

SELECT @@Error;

END -- end sp
GO
