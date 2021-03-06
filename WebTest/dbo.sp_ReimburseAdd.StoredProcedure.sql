USE [WebTest]
GO
/****** Object:  StoredProcedure [dbo].[sp_ReimburseAdd]    Script Date: 12/22/2020 5:26:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		JOSHILA NARAYANAN
-- Create date: 10/25/2012
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_ReimburseAdd]
	(
		@BIN nvarchar(10),
		@Group nvarchar(10),
		@PatName nvarchar(100),
		@PatID nvarchar(50),
		@PatDOB smalldatetime,
		@Wholesaler int,
		@NDC nvarchar(11),
		@Filldate smalldatetime,
		@Quantity int,
		@RxNbr nvarchar(20),
		@TotalCost float,
		@TotalPaid float,
		@Maced bit,
		@NCPDP nvarchar(20),
		@ContactName nvarchar(100),
		@email nvarchar(100),
		@Phone nvarchar(20),
		@Fax nvarchar(20),		
		@username nvarchar(50),		
		@Notes text
	)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	DECLARE @trackid int
	DECLARE @requestid int
	DECLARE @body nvarchar(500)	
	DECLARE @exist int

	set @exist=0
		
	INSERT INTO claims.dbo.UPRequests (BIN,[Group],PatName,PatID,PatDOB,Wholesaler,NDC,Filldate,Quantity,RxNbr,TotalCost,TotalPaid,Maced,NCPDP,ContactName,email,Phone,Fax,CreatedOn,CreatedBy,Notes) 
	VALUES (@BIN,@Group,@PatName,@PatID,@PatDOB,@Wholesaler,@NDC,@Filldate,@Quantity,@RxNbr,@TotalCost,@TotalPaid,@Maced,@NCPDP,@ContactName,@email,@Phone,@Fax,getdate(),@username,@Notes)
	
	--Check if this request exists in Tracking tool already
	Set @exist = (SELECT Top 1 LinkID FROM claims.dbo.v_UPTrackDetails where PharmID=@NCPDP and [Rx Nbr] = @RxNbr and (Status IS NULL OR Status <> 2))
	
	--Get request ID to add to tracking tool
	Set @requestid = (Select Top 1 requestid from claims.dbo.UPRequests WHERE CreatedBy = @username ORDER BY requestid Desc)

	
	if @exist = '0' --Create a Tracking ID and then add to UPTrackLink
	BEGIN	
		INSERT INTO claims.dbo.UPTrackLink (Source,RequestID, TrackID,NDC,BIN,PharmID,CreatedOn) VALUES (2,@requestid,@trackid,@NDC,@BIN,@NCPDP,getdate())
	END

	--If exists then Update UpTrackLink with the new WebRequest 
	if @exist <> '0' 
	BEGIN		
		Update claims.dbo.UPTrackLink Set Source=2,RequestID=@requestid WHERE LinkID=@exist
	END


	if @email IS NULL or @email = ''
	BEGIN
		
		Set @email = (Select Top 1 Email from PharmacyMaster.dbo.v_PM_Allwithaffiliates WHERE NCPDP=@NCPDP )

		if @email IS NULL or @email =''
		BEGIN
			set @email = 'sdishmon@uniteddrugs.com'
		END
	END


	set @body = 'Dear Pharmacy Owner/Manager:

This is to acknowledge that we have received your Third Party Plan Reimbursement Research Request for prescription number ' + @RxNbr + ' filled on ' + Cast(@Filldate as nvarchar(12)) + '. We will contact you regarding the progress of this request as soon as information is available.

Should you have any questions, please don’t hesitate to contact me at (602) 678-1179 ext 103.

Sincerely, 

Stacie Dishmon'

	EXEC msdb.dbo.sp_send_dbmail 
    @recipients=@email, 
    @body=@body,  

    @subject ='Third Party Plan Reimbursement Research Request', 
    @profile_name = 'UnderPaidClaims', 
    @query ='',  
    @attach_query_result_as_file = 0 
   
	

END
GO
