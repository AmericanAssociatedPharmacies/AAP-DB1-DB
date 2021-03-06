USE [PharmacyMaster]
GO
/****** Object:  StoredProcedure [dbo].[sp_Email]    Script Date: 12/22/2020 4:45:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
-- =============================================
-- Author:		John Ngo
-- Create date: 12/2/2014
-- Description:	Sending PRS latest file to specific emails or default to roz
-- =============================================
CREATE PROCEDURE [dbo].[sp_Email] 
(
	@SendToEmails NVARCHAR(max), 
	@Subject NVARCHAR(MAX),
	@Body NVARCHAR(MAX),
	@ReplyProfile NVARCHAR(25) = 'uddw1', -- 'CSOS_Operations'
	@Attachments NVARCHAR(MAX) = null
)
	 AS 
BEGIN 

EXEC msdb.dbo.sp_send_dbmail
  @profile_name=@ReplyProfile,
  @recipients=@SendToEmails,
  @subject=@Subject,
  @body=@Body,
  @file_attachments=@Attachments,
  @body_format = 'HTML' ;

END

/*

EXEC [dbo].[spCG_EmailPRSFiles] 'john.medema@uniteddrugs.com'

*/
GO
