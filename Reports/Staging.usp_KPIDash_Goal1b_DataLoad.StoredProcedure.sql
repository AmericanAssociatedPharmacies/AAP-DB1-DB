USE [Reports]
GO
/****** Object:  StoredProcedure [Staging].[usp_KPIDash_Goal1b_DataLoad]    Script Date: 12/22/2020 5:00:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





CREATE PROCEDURE [Staging].[usp_KPIDash_Goal1b_DataLoad]

AS

SET NOCOUNT ON;

BEGIN

	TRUNCATE TABLE Reports.staging.KPIDash_Goal1b;

	DECLARE @p1 DATE
		, @StartDate  DATETIME
		, @EndDate    DATETIME;

		SELECT   @StartDate = '20160101'        
			,@EndDate   = GETDATE();

	--Declare the CURSOR and get values from query
	DECLARE C2 CURSOR FOR
	SELECT  DATEADD(MONTH, x.number, @StartDate) as date
	FROM    master.dbo.spt_values x
	WHERE   x.type = 'P'        
	AND     x.number <= DATEDIFF(MONTH, @StartDate, @EndDate);


	--Open the cursor
	OPEN C2

	--Get the 1st row
	FETCH NEXT
	FROM C2
	INTO @p1

	--While the CURSOR is not busy, aka "WHILE @@FETCH_STATUS = 0", do something
	WHILE @@FETCH_STATUS = 0

	--Use this BEGIN\END for whatever action needs to be done
	BEGIN

		INSERT INTO Reports.staging.KPIDash_Goal1b(Date, [Type], Amount)
		EXEC dbo.[usp_PenetrationByType]
			@Date = @p1

		--Go get the next row, if there is one. If not, the CURSOR will exit and go to the DEALLOCATE and CLOSE lines of code
		FETCH NEXT
		FROM C2
		INTO @p1

	END
	--Close the CURSOR. Always, always, always close the CURSOR
	CLOSE C2
	--Deallocate the CURSOR from memory
	DEALLOCATE C2

END




GO
