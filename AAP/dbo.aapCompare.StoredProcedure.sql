USE [AAP]
GO
/****** Object:  StoredProcedure [dbo].[aapCompare]    Script Date: 12/22/2020 4:10:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		Rudy Hinojosa
-- Create date: 3-3-2010
-- Description:	Report what fields were changed
-- =============================================
CREATE PROCEDURE [dbo].[aapCompare] 
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	declare @ACCOUNTNO VARCHAR(20),
            @ACCOUNTNAME VARCHAR(65),
			@ADDR1 VARCHAR(80),
			@ADDR2 VARCHAR(80),
			@CITY VARCHAR(25),
			@STATE VARCHAR(2),
			@ZIP VARCHAR(10),
			@CONTACTFULLNAME VARCHAR(255),
			@TERRITORY VARCHAR(4),
			@QPS VARCHAR(4),
			@APIMEMBERNO VARCHAR(30),
			@BUSINESSCLASS VARCHAR(4),
			@PHONE VARCHAR(5),
			@FAX VARCHAR(50),
            @Email varchar(80),
            @DateOpened datetime,
            @OrigStartDate datetime,
            @NumReactivated int,
            @Wholesaler varchar(25),
            @WholesalerAccountNo varchar(32),
            @DEA varchar(50),
            @DEAEXP datetime,
            @StateLicNo varchar(15),
            @StateLicExpDate datetime,
            @FedID varchar(12),
            @Status varchar(32),
            @CAHStatus varchar(32),
            @CardinalDC varchar(32),
            @PrimaryCAAccountNo varchar(32),
            @ContractDate datetime,
            @Source varchar(25),
            @CustPayTermsAPI varchar(20),
            @APIStatus varchar(32),
            @AllowDupDEA varchar(1),
			@DISTINCTACCOUNTNO varchar(20)

	

	--CREATE A COPY TABLE VERSION OF THE TARGET TABLE
	SELECT * INTO #COMPAREAPI_WORK FROM dbo.COMPAREAPI

	--CREATE A BLANK TABLE VERSION OF THE TARGET TABLE
	IF EXISTS (SELECT TABLE_NAME FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME='CompareAPI_Results') 
		   drop table AAP.dbo.COMPAREAPI_RESULTS
	
	CREATE TABLE [dbo].[CompareAPI_Results](
	[TableName] [varchar](16) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[NDUPS] [int] NULL,
	[AccountNo] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[AccountName] [varchar](65) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Addr1] [varchar](80) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Addr2] [varchar](80) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[City] [varchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[State] [varchar](2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Zip] [varchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ContactFullName] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Territory] [varchar](4) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[QPS] [varchar](4) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[APIMemberNo] [varchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[BusinessClass] [varchar](4) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Phone] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Fax] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Email] [varchar](80) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[DateOpened] [datetime] NULL,
	[OrigStartDate] [datetime] NULL,
	[NumReactivated] [int] NULL,
	[Wholesaler] [varchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[WholesalerAccountNo] [varchar](32) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[DEA] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[DEAEXP] [datetime] NULL,
	[StateLicNo] [varchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[StateLicExpDate] [datetime] NULL,
	[FedID] [varchar](12) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Status] [varchar](32) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CAHStatus] [varchar](32) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CardinalDC] [varchar](32) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PrimaryCAAccountNo] [varchar](32) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ContractDate] [datetime] NULL,
	[Source] [varchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CustPayTermsAPI] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[APIStatus] [varchar](32) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[AllowDupDEA] [varchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]

	
	--NOW INSERT FROM WORK TABLE RECORDS ONLY HAVING ONE ACCOUNT NUMBER FOR THESE WILL BE CONSIDERED NEW RECORDS
	INSERT INTO COMPAREAPI_RESULTS SELECT * FROM #COMPAREAPI_WORK WHERE ACCOUNTNO IN ( SELECT ACCOUNTNO FROM #COMPAREAPI_WORK GROUP BY ACCOUNTNO HAVING COUNT(*) = 1 )

	--NOW REMOVE THE RECORDS FROM THE SCRATCH TABLE ONLY HAVING ONE ACCOUNT NUMBER
	DELETE #COMPAREAPI_WORK WHERE ACCOUNTNO IN ( SELECT ACCOUNTNO FROM #COMPAREAPI_WORK GROUP BY ACCOUNTNO HAVING COUNT(*) = 1 )
	
	WHILE (SELECT COUNT(*) FROM #COMPAREAPI_WORK) > 0
	BEGIN

		--GRAB DISTINCT ACCOUNT NUMBER
		SELECT  DISTINCT TOP 1 @DISTINCTACCOUNTNO = ACCOUNTNO FROM #COMPAREAPI_WORK	

		--DROP TEMP TABLE IF EXISTS
		IF EXISTS (SELECT TABLE_NAME FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME='TMPCOMPAREWORK') 
		   drop table dbo.TMPCOMPAREWORK;

		--SEND TOP RECORD INTO TEMP TABLE TO COMPARE
		SELECT TOP 1 * INTO TMPCOMPAREWORK FROM #COMPAREAPI_WORK WHERE ACCOUNTNO = @DISTINCTACCOUNTNO
        DELETE TOP (1) FROM #COMPAREAPI_WORK WHERE ACCOUNTNO = @DISTINCTACCOUNTNO

		--NOW COMPARE RESULTS FROM BOTH TABLES
		INSERT INTO dbo.COMPAREAPI_RESULTS
		SELECT 'Changed' AS 'TableName',Null as 'NDUPS',A.ACCOUNTNO, 
        CASE WHEN A.ACCOUNTNAME = B.ACCOUNTNAME THEN '' ELSE A.ACCOUNTNAME END AS 'ACCOUNTNAME',
        CASE WHEN A.ADDR1 = B.ADDR1 THEN '' ELSE A.ADDR1 END AS 'ADDR1',
        CASE WHEN A.ADDR2 = B.ADDR2 THEN ' ' ELSE A.ADDR2 END AS 'ADDR2',
        CASE WHEN A.CITY = B.CITY THEN '' ELSE A.CITY END AS 'CITY',
        CASE WHEN A.STATE = B.STATE THEN '' ELSE A.STATE END AS 'STATE',
        CASE WHEN A.ZIP = B.ZIP THEN '' ELSE A.ZIP END AS 'ZIP',
        CASE WHEN A.CONTACTFULLNAME = B.CONTACTFULLNAME THEN ' ' ELSE A.CONTACTFULLNAME END AS 'CONTACTFULLNAME',
        CASE WHEN A.TERRITORY = B.TERRITORY THEN '' ELSE A.TERRITORY END AS 'TERRITORY',
		CASE WHEN A.QPS = B.QPS THEN '' ELSE A.QPS END AS 'QPS',
		CASE WHEN A.APIMEMBERNO = B.APIMEMBERNO THEN '' ELSE A.APIMEMBERNO END AS 'APIMEMBERNO',
		CASE WHEN A.BUSINESSCLASS = B.BUSINESSCLASS THEN '' ELSE A.BUSINESSCLASS END AS 'BUSINESSCLASS',
		CASE WHEN A.PHONE = B.PHONE THEN '' ELSE A.PHONE END AS 'PHONE',
		CASE WHEN A.FAX = B.FAX THEN '' ELSE A.FAX END AS 'FAX',
		CASE WHEN A.EMAIL = B.EMAIL THEN '' ELSE A.EMAIL END AS 'EMAIL',
		CASE WHEN A.DATEOPENED = B.DATEOPENED THEN '' ELSE A.DATEOPENED END AS 'TERRITORY',
		CASE WHEN A.ORIGSTARTDATE = B.ORIGSTARTDATE THEN '' ELSE A.ORIGSTARTDATE END AS 'ORIGSTARTDATE',
		CASE WHEN A.NUMREACTIVATED = B.NUMREACTIVATED THEN '' ELSE A.NUMREACTIVATED END AS 'NUMREACTIVATED',
		CASE WHEN A.WHOLESALER = B.WHOLESALER THEN '' ELSE A.WHOLESALER END AS 'WHOLESALER',
		CASE WHEN A.WHOLESALERACCOUNTNO = B.WHOLESALERACCOUNTNO THEN '' ELSE A.WHOLESALERACCOUNTNO END AS 'WHOLESALERACCOUNTNO',
		CASE WHEN A.DEA = B.DEA THEN '' ELSE A.DEA END AS 'DEA',
		CASE WHEN A.DEAEXP = B.DEAEXP THEN '' ELSE A.DEAEXP END AS 'DEAEXP',
		CASE WHEN A.STATELICNO = B.STATELICNO THEN '' ELSE A.STATELICNO END AS 'STATELICNO',
		CASE WHEN A.STATELICEXPDATE = B.STATELICEXPDATE THEN '' ELSE A.STATELICEXPDATE END AS 'STATELICEXPDATE',
		CASE WHEN A.FEDID = B.FEDID THEN '' ELSE A.FEDID END AS 'FEDID',
		CASE WHEN A.STATUS = B.STATUS THEN '' ELSE A.STATUS END AS 'STATUS',
		CASE WHEN A.CAHSTATUS = B.CAHSTATUS THEN '' ELSE A.CAHSTATUS END AS 'CAHSTATUS',
		CASE WHEN A.CARDINALDC = B.CARDINALDC THEN '' ELSE A.CARDINALDC END AS 'CARDINALDC',
		CASE WHEN A.PRIMARYCAACCOUNTNO = B.PRIMARYCAACCOUNTNO THEN '' ELSE A.PRIMARYCAACCOUNTNO END AS 'PRIMARYCAACCOUNTNO',
		CASE WHEN A.CONTRACTDATE = B.CONTRACTDATE THEN '' ELSE A.CONTRACTDATE END AS 'CONTRACTDATE',
		CASE WHEN A.SOURCE = B.SOURCE THEN '' ELSE A.SOURCE END AS 'SOURCE',
		CASE WHEN A.CUSTPAYTERMSAPI = B.CUSTPAYTERMSAPI THEN '' ELSE A.CUSTPAYTERMSAPI END AS 'CUSTPAYTERMSAPI',
		CASE WHEN A.APISTATUS = B.APISTATUS THEN '' ELSE A.APISTATUS END AS 'APISTATUS',
		CASE WHEN A.ALLOWDUPDEA = B.ALLOWDUPDEA THEN '' ELSE A.ALLOWDUPDEA END AS 'ALLOWDUPDEA'
		FROM #COMPAREAPI_WORK A 
		INNER JOIN TMPCOMPAREWORK B ON B.ACCOUNTNO = A.ACCOUNTNO
		WHERE A.ACCOUNTNO = @DISTINCTACCOUNTNO

		DELETE FROM #COMPAREAPI_WORK WHERE ACCOUNTNO = @DISTINCTACCOUNTNO

		CONTINUE
	END
	update compareapi_results set dateopened = NULL where dateopened = '01/01/1900 12:00:00AM'
	update compareapi_results set origstartdate = NULL where origstartdate = '01/01/1900'
	update compareapi_results set deaexp = NULL where deaexp = '01/01/1900'
	update compareapi_results set statelicexpdate = NULL where statelicexpdate = '01/01/1900'
	update compareapi_results set CONTRACTdate = NULL where contractdate = '01/01/1900'
	update compareapi_results set addr2 = '' where addr2 is null
	update compareapi_results set qps = '' where qps is null
	update compareapi_results set apimemberno = '' where apimemberno is null
	update compareapi_results set email = '' where email is null
	
	alter table compareapi_results drop column NDUPS

END




GO
