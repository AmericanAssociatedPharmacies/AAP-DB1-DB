USE [AAP]
GO
/****** Object:  StoredProcedure [dbo].[Update_Contact_Information]    Script Date: 12/22/2020 4:10:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Rudy Hinojosa
-- Create date: 1-25-2010
-- Description:	Update contact information with owner information if contact information is blank or set with the word "same"
-- =============================================
CREATE PROCEDURE [dbo].[Update_Contact_Information] 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE dbo.aapaccount SET contactfirst = m.ownerfirst, contactlast = m.ownerlast
	FROM dbo.AAPAccount m 
	WHERE (m.contactfirst IS NULL OR LOWER(m.contactfirst) = 'same') OR
	(m.contactlast IS NULL OR LOWER(m.contactlast) = 'same')
	
END
GO
