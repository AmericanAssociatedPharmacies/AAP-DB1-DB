USE [WebTest]
GO
/****** Object:  StoredProcedure [dbo].[SurveyCareMark_Compounding]    Script Date: 12/22/2020 5:26:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		John, Ngo
-- Create date: 3/31/2015
-- Description:	Generate The Excel Credentialing File for CareMark
-- =============================================
CREATE PROCEDURE [dbo].[SurveyCareMark_Compounding]
	@PMId INT,
	@Opt INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT 
	'' LocationType,'' [NPI],'' [C1],'' [C2],'' [C3],'' [C4],'' [C5],'' [C6],'' [C7],'' [C8],'' [C9],'' [C10]
	,'' [C11],'' [C12],'' [C13],'' [C14],'' [C15],'' [C16],'' [C17],'' [C18],'' [C19],'' [C20]
	,'' [C21],'' [C22],'' [C23],'' [C24],'' [C25]
END
GO
