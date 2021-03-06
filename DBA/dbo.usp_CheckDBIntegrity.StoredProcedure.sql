USE [DBA]
GO
/****** Object:  StoredProcedure [dbo].[usp_CheckDBIntegrity]    Script Date: 12/22/2020 4:25:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_CheckDBIntegrity]

	
AS

BEGIN

	DECLARE @DbName VARCHAR(25)
	

	DECLARE C1 CURSOR FOR
	SELECT name 
	FROM sys.databases db
	WHERE name NOT IN ('master','model','msdb','tempdb') 
	AND db.state_desc = 'ONLINE'
	AND source_database_id IS NULL -- REAL DBS ONLY (Not Snapshots)
	AND is_read_only = 0

	OPEN C1

	FETCH NEXT
	FROM C1
	INTO @DbName



	WHILE @@FETCH_STATUS=0
	BEGIN

		INSERT INTO DBA.dbo.DBCCHistory ([Error], [Level], [State], MessageText, RepairLevel, [Status],[DbId], DbFragId, ObjectId, IndexId, PartitionId, AllocUnitId, RidDbId
									, RidPruId, [File], Page, Slot, RefDbId, RefPruId, RefFile, RefPage, RefSlot,Allocation
									)
		EXEC ('dbcc checkdb(''' + @DbName + ''') with tableresults')


	FETCH NEXT
	FROM C1
	INTO @DbName

	END

	CLOSE C1
	DEALLOCATE C1

END
GO
