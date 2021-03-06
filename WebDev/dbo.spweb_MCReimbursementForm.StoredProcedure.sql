USE [WebDev]
GO
/****** Object:  StoredProcedure [dbo].[spweb_MCReimbursementForm]    Script Date: 12/22/2020 5:21:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spweb_MCReimbursementForm]
	(
		@BIN nvarchar(10),
		@PCN nvarchar(50),
		@Group nvarchar(10),
		@PatName nvarchar(100),
		@PatID nvarchar(50),
		@PatDOB smalldatetime,
		@Wholesaler nvarchar(100),
		@NDC nvarchar(11),
		@Filldate smalldatetime,
		@Quantity int,
		@RxNbr nvarchar(20),
		@DaySupply nvarchar(20),
		@TotalCost float,
		@TotalPaid float,
		@DispensingFee float,
		@Compound bit,
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
		
	INSERT INTO rform_claims_research (BIN,PCN,[Group],PatName,PatID,PatDOB,Wholesaler,NDC,
Filldate,Quantity,RxNbr,DaySupply,TotalCost,TotalPaid,Maced,NCPDP,ContactName,email,
Phone,Fax,CreatedOn,CreatedBy,Notes,DispensingFee,Compound) 
	VALUES (@BIN,@PCN,@Group,@PatName,@PatID,@PatDOB,
@Wholesaler,@NDC,@Filldate,@Quantity,@RxNbr,@DaySupply,@TotalCost,
@TotalPaid,@Maced,@NCPDP,@ContactName,@email,@Phone,@Fax,getdate(),@username,@Notes,@DispensingFee,@Compound)



END
GO
