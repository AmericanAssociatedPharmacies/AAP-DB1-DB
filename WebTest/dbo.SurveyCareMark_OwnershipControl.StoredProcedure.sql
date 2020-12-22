USE [WebTest]
GO
/****** Object:  StoredProcedure [dbo].[SurveyCareMark_OwnershipControl]    Script Date: 12/22/2020 5:26:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		John, Ngo
-- Create date: 3/31/2015
-- Description:	Generate The Excel Credentialing File for CareMark
-- =============================================
CREATE PROCEDURE [dbo].[SurveyCareMark_OwnershipControl]
	@PMId INT,
	@Opt INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT 
	'' LocationType,'' [NPI],'' [Title],'' [Effective Date],'' [% Ownership],'' [Pharmacist's License],'' [Expiration Date]
	,'' [Entity] ,'' [Entity's DBA],'' [First Name],'' [Middle Name],'' [Last Name],'' [SSN],'' [FEIN],'' [DOB]
	,'' [Address],'' [Address 2],'' [City],'' [State],'' [Zip],'' [Reserved21],'' [Criminal Offense],'' [Reserved23],'' [Other Ownerhip],'' [Relation]  
--,'' [],'' [],'' [],'' [],'' [],'' [],'' [],'' [],'' [],'' [],'' [],'' [],'' [],'' [],'' [],'' [],'' []  
--,'' [],'' [],'' [],'' [],'' [],'' [],'' [],'' [],'' [],'' [],'' [],'' [],'' [],'' [],'' [],'' [],'' []  
--,'' [],'' [],'' [],'' [],'' [],'' [],'' [],'' [],'' [],'' [],'' [],'' [],'' [],'' [],'' [],'' [],'' []  
--,'' [],'' [],'' [],'' [],'' [],'' [],'' [],'' [],'' [],'' [],'' [],'' [],'' [],'' [],'' [],'' [],'' []  
--,'' [],'' [],'' [],'' [],'' [],'' [],'' [],'' [],'' [],'' [],'' [],'' [],'' [],'' [],'' [],'' [],'' []  
--,'' [],'' [],'' [],'' [],'' [],'' [],'' [],'' [],'' [],'' [],'' [],'' [],'' [],'' [],'' [],'' [],'' []  
--,'' [],'' [],'' [],'' [],'' [],'' [],'' [],'' [],'' [],'' [],'' [],'' [],'' [],'' [],'' [],'' [],'' []  
--,'' [],'' [],'' [],'' [],'' [],'' [],'' [],'' [],'' [],'' [],'' [],'' [],'' [],'' [],'' [],'' [],'' []  
--,'' [],'' [],'' [],'' [],'' [],'' [],'' [],'' [],'' [],'' [],'' [],'' [],'' [],'' [],'' [],'' [],'' []  
--,'' [],'' [],'' [],'' [],'' [],'' [],'' [],'' [],'' [],'' [],'' [],'' [],'' [],'' [],'' [],'' [],'' []  
--,'' [],'' [],'' [],'' [],'' [],'' [],'' [],'' [],'' [],'' [],'' [],'' [],'' [],'' [],'' [],'' [],'' []  
--,'' [],'' [],'' [],'' [],'' [],'' [],'' [],'' [],'' [],'' [],'' [],'' [],'' [],'' [],'' [],'' [],'' []  
--,'' [],'' [],'' [],'' [],'' [],'' [],'' [],'' [],'' [],'' [],'' [],'' [],'' [],'' [],'' [],'' [],'' []  
--,'' [],'' [],'' [],'' [],'' [],'' [],'' [],'' [],'' [],'' [],'' [],'' [],'' [],'' [],'' [],'' [],'' []  

END
GO
