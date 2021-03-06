USE [WebTest]
GO
/****** Object:  StoredProcedure [dbo].[spweb_survey_RetailClinics]    Script Date: 12/22/2020 5:26:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		CHRIS STONE
-- Create date: 07/15/2013
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spweb_survey_RetailClinics]
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
    @topInsCarrier1 nvarchar(255),
	@topInsCarrier2 nvarchar(255),
	@topInsCarrier3 nvarchar(255),
	@topInsCarrier4 nvarchar(255),
	@topInsCarrier5 nvarchar(255),
	@preferredHealthsSystemNumPatients nvarchar(255),
    @preferredHealthsSystemPersonalPref nvarchar(255),
	@pmid int
	)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	INSERT INTO [WebDev].[dbo].[survey_RetailClinics] 
([accountname],[ncpdp],[address],[city],[state],[zip],[contactName],[phone],[email]
           ,[sqFootage],[hasRoom],[hours],[townPop],[numHospitals],[PMID],[topInsCarrier1],[topInsCarrier2],[topInsCarrier3],[topInsCarrier4],[topInsCarrier5],
[preferredHealthsSystemNumPatients],[preferredHealthsSystemPersonalPref])

	VALUES (@accountname,@ncpdp,@address,@city,@state,@zip,@contactName,@phone,@email,
			@sqFootage,@hasRoom,@hours,@townPop,@numHospitals,@pmid,@topInsCarrier1 ,
			@topInsCarrier2,@topInsCarrier3,@topInsCarrier4,
			@topInsCarrier4,@preferredHealthsSystemNumPatients,@preferredHealthsSystemPersonalPref) 



END


GO
