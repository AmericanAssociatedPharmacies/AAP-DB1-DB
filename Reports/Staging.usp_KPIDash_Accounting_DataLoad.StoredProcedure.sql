USE [Reports]
GO
/****** Object:  StoredProcedure [Staging].[usp_KPIDash_Accounting_DataLoad]    Script Date: 12/22/2020 5:00:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:		LeeAnn Carrell
-- Create date: 02/23/2018
-- Description:	Insert new row in staging.KPIDash_Accounting
	--check to make sure that date and rebate type is not already in the table
	--insert new row into Reports.staging.KPIDash_Accounting
	--execute merge statement to load data into dbo.KPIDash_Accounting and update audit table
	--parameters passed are date, type, amount, and original user login
-- =============================================
CREATE PROCEDURE [Staging].[usp_KPIDash_Accounting_DataLoad]
	@Date DATE, @Type VARCHAR(50), @Amount DECIMAL(18,2), @Login VARCHAR(100), @Action VARCHAR(10)

AS
BEGIN

	SET NOCOUNT ON;

	DECLARE @LoginForDelete VARCHAR(100)

	TRUNCATE TABLE Reports.Staging.KPIDash_Accounting;

	IF(@Action = 'Insert')
	BEGIN 
		IF (SELECT DISTINCT 1 FROM Reports.dbo.KPIDash_Accounting WHERE RebateDate = @Date AND RebateType = @Type AND IsValid = 1) = 1
		BEGIN
			SELECT 2 as ReturnStatus
				, 'Not successful. Rebate Date and Rebate Type have already been loaded. Either edit the data that has already been entered or load a different date or rebate type.' as ReturnMessage
		END

		ELSE
		BEGIN
			INSERT INTO Reports.Staging.KPIDash_Accounting (RebateDate, RebateType, RebateAmount, UserOriginalLogin)
			VALUES (@Date, @Type, @Amount, @Login);

			EXEC dbo.usp_KPIDash_Accounting_DataLoad;
		
			SELECT 1 as ReturnStatus
				, 'Loaded Successfully' as ReturnMessage	
		END
	END

	ELSE 
	BEGIN
		IF (@Action = 'Update')
		BEGIN
			INSERT INTO Reports.Staging.KPIDash_Accounting (RebateDate, RebateType, RebateAmount, UserOriginalLogin)
			VALUES (@Date, @Type, @Amount, @Login);

			EXEC dbo.usp_KPIDash_Accounting_DataLoad;
		
			SELECT 4 as ReturnStatus
				, 'Updated Successfully' as ReturnMessage
		END

		ELSE
		BEGIN
			IF (@Action = 'Delete')
			BEGIN 
				SELECT @LoginForDelete = UserOriginalLogin FROM Reports.dbo.KPIDash_Accounting WHERE RebateDate = @Date AND RebateType = @Type AND IsValid = 1

				INSERT INTO Reports.Staging.KPIDash_Accounting (RebateDate, RebateType, RebateAmount, UserOriginalLogin, DeletedBy, DeletedOn, IsValid)
				VALUES (@Date, @Type, @Amount, @LoginForDelete, @Login, GETDATE(), 0);

				EXEC dbo.usp_KPIDash_Accounting_DataLoad;
		
				SELECT 3 as ReturnStatus
					, 'Deleted Successfully' as ReturnMessage
			END

			ELSE
			BEGIN
				SELECT 0 as ReturnStatus
					, 'Stored Procedure expects Insert, Update, or Delete as a parameter.' as ReturnMessage
			END
		END
	END
END




GO
