USE [WebDev]
GO
/****** Object:  StoredProcedure [dbo].[spweb_survey_RetailClinics_07172013]    Script Date: 12/22/2020 5:21:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		JOSHILA NARAYANAN
-- Create date: 10/25/2012
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spweb_survey_RetailClinics_07172013]
	(

	@accountname nvarchar(255),
	@ncpdp nvarchar(20),
	@address nvarchar(255),
	@city nvarchar(255),
	@state nvarchar(255),
	@zip nvarchar(255),
	@contactName nvarchar(100),
	@phone nvarchar(50),
	@email nvarchar(100),
	@sqFootage nvarchar(100),
	@hasRoom bit,
	@hours nvarchar(255),
	@townPop nvarchar(255),
	@numHospitals nvarchar(255),
	@pmid int
	)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	INSERT INTO [WebDev].[dbo].[survey_RetailClinics] 
([accountname],[ncpdp],[address],[city],[state],[zip],[contactName],[phone],[email]
           ,[sqFootage],[hasRoom],[hours],[townPop],[numHospitals],[PMID])

	VALUES (@accountname,@ncpdp,@address,@city,@state,@zip,@contactName,@phone,@email,
@sqFootage,@hasRoom,@hours,@townPop,@numHospitals,@pmid) 



END

GO
