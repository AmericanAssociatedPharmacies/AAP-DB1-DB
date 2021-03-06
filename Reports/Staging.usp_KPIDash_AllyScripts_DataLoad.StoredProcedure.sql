USE [Reports]
GO
/****** Object:  StoredProcedure [Staging].[usp_KPIDash_AllyScripts_DataLoad]    Script Date: 12/22/2020 5:00:32 AM ******/
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
CREATE PROCEDURE [Staging].[usp_KPIDash_AllyScripts_DataLoad]
	@Date DATE
	, @Login VARCHAR(100)
	, @Action VARCHAR(10)

AS

BEGIN

	SET NOCOUNT ON;

	DECLARE @LoginForDelete VARCHAR(100)
	, @ExecutionID INT
	, @SSISStatus INT

	TRUNCATE TABLE [Staging].[KPIDash_AllyScripts];

	/*If a file for a date aas already been loaded and is valid, e.g. meaning a date has been loaded and not deleted, no file is loaded and return message stating such.
		If the file hasn't been loaded, the SSIS package is exected to load the file.
	*/
	IF(@Action = 'Insert')
		BEGIN 
		--(1)check to see if the date they selected is already in the table
			--if it is, notify them and do not load anything
		--(2)if it's not, load the file to the staging table. make sure there aren't multiple dates in the file. 
		--(3)Make sure the date from the data in the staging table matches the date they selected to load
		--if all of the above passes, execute the stored procedure than runs the merge statement
			IF (SELECT DISTINCT 1 
				FROM Reports.dbo.KPIDash_AllyScripts as al 
				WHERE DATEADD(month, DATEDIFF(month, 0, Date), 0) = @Date AND IsValid = 1) = 1

				BEGIN

					SELECT 2 as ReturnStatus
						, 'Not successful. Scripts have already been loaded for that date. Either select a different date to load, or remove the scripts loaded for this date and load the file again.' as ReturnMessage;
				END

			ELSE

				BEGIN

					TRUNCATE TABLE ODSIntake.[Staging].[KPI_AllyScripts]

					BEGIN TRY 
			
						BULK INSERT ODSIntake.Staging.vwKPIAllyScriptsDataLoad
						--FROM '\\DBDEV1\c$\data\AllyScriptDateEntry\KPIDash_AllyScripts.csv'
						FROM 'C:\data\AllyScriptDateEntry\KPIDash_AllyScripts.csv'
						WITH(
								FIELDTERMINATOR = ','
								, ROWTERMINATOR = '\n'	
								, FIRSTROW = 2
							)

						INSERT INTO [Staging].[KPIDash_AllyScripts](AccountName, [State], AAPAccountNumber, APIAccountNumber, [Date], RxReceived, RxFilled, UserOriginalLogin)
						SELECT AccountName, [State], AAPAccountNumber, APIAccountNumber, [Date], RxReceived, RxFilled, @Login as UserOriginalLogin
						FROM Staging.vwKPIDash_AllyScripts_DataLoad

					END TRY
					BEGIN CATCH

						SELECT 4 as ReturnStatus
						, 'Your file is not formatted correctly. Try again or notify IT Help Desk.' as ReturnMessage ;

						RETURN 0;

					END CATCH

					IF (SELECT COUNT(DISTINCT DATEADD(month, DATEDIFF(month, 0, Date), 0)) 
						FROM Reports.Staging.KPIDash_AllyScripts) > 1

						BEGIN

							SELECT 4 as ReturnStatus
							, 'Not successful. The file submitted contains multiple months of data. Please load one month at a time.' as ReturnMessage;
						END

					ELSE 
					
						BEGIN
							
							DELETE FROM Reports.Staging.KPIDash_AllyScripts WHERE Date IS NULL;

							IF (SELECT DISTINCT DATEADD(month, DATEDIFF(month, 0, Date), 0)
								FROM Reports.Staging.KPIDash_AllyScripts) = @Date

								BEGIN TRY
							
									EXEC dbo.usp_KPIDash_AllyScripts_DataLoad

									SELECT dt.ReturnStatus
									, dt.ReturnMessage
									FROM(SELECT 1 AS ReturnStatus
										, CONVERT(VARCHAR(250), 'Loaded Successfully') AS ReturnMessage
										) AS dt

								END TRY
								BEGIN CATCH

									SELECT 4 as ReturnStatus
									, CAST(ERROR_NUMBER() as VARCHAR(15)) + ': ' + ERROR_MESSAGE() + ' Try again or notify IT Help Desk.' as ReturnMessage ;

									RETURN 0;

								END CATCH

							ELSE 

								BEGIN

									SELECT 5 as ReturnStatus
									, 'Not successful. The dates in the file are not in the month and year selected.' as ReturnMessage;
							
								END
						END
				END
		END

	ELSE 
	BEGIN
		IF (@Action = 'Delete')
		BEGIN TRY

			INSERT INTO Reports.Staging.KPIDash_AllyScripts (AccountName, State, AAPAccountNumber, Date, RxReceived, RxFilled, UserOriginalLogin
				, DeletedBy, DeletedOn, IsValid)
			SELECT AccountName
				, State
				, AAPAccountNumber
				, DATEADD(month, DATEDIFF(month, 0, Date), 0) as Date
				, RxReceived
				, RxFilled
				, UserOriginalLogin
				, @Login as DeletedBy
				, GETDATE() as DeletedOn
				, 0 as IsValid
			FROM Reports.dbo.KPIDash_AllyScripts
			WHERE DATEADD(month, DATEDIFF(month, 0, Date), 0) = @Date 
			AND IsValid = 1;

			EXEC dbo.usp_KPIDash_AllyScripts_DataLoad;
		
			SELECT 3 as ReturnStatus
				, 'Deleted Successfully' as ReturnMessage
		END TRY
		BEGIN CATCH

			SELECT 4 as ReturnStatus
			, CAST(ERROR_NUMBER() as VARCHAR(15)) + ': ' + ERROR_MESSAGE() + ' Try again or notify IT Help Desk.' as ReturnMessage ;

			RETURN 0;

		END CATCH

		ELSE
		BEGIN
			SELECT 0 as ReturnStatus
				, 'Stored Procedure expects Insert or Delete as a parameter.' as ReturnMessage
		END
	END
END












GO
