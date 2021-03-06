USE [AAPReportServer]
GO
/****** Object:  StoredProcedure [dbo].[RemoveSegment]    Script Date: 12/22/2020 4:16:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[RemoveSegment]
	@DeleteCountPermanent int, 
	@DeleteCountTemp int
as
begin
	SET DEADLOCK_PRIORITY LOW
	
	-- Locking:
	-- Similar idea as in RemovedSegmentedMapping.  Readpast
	-- any Segments which are currently locked and run the 
	-- inner scan with nolock.	
	declare @numDeleted int;
	declare @toDeleteMapping table (
		SegmentId uniqueidentifier );
	
	insert into @toDeleteMapping (SegmentId)	
	select top (@DeleteCountPermanent) SegmentId 
	from Segment with (readpast)	
	where not exists (
		select 1 from ChunkSegmentMapping CSM with (nolock)
		where CSM.SegmentId = Segment.SegmentId
		) ;
		
	delete from Segment with (readpast)
	where Segment.SegmentId in (
		select td.SegmentId from @toDeleteMapping td
		where not exists (
			select 1 from ChunkSegmentMapping CSM
			where CSM.SegmentId = td.SegmentId ));
			
	select @numDeleted = @@rowcount ;
	
	declare @toDeleteTempSegment table (
		SegmentId uniqueidentifier );
	
	insert into @toDeleteTempSegment (SegmentId)		
	select top (@DeleteCountTemp) SegmentId
	from [AAPReportServerTempDB].dbo.Segment with (readpast)	
	where not exists (
		select 1 from [AAPReportServerTempDB].dbo.ChunkSegmentMapping CSM with (nolock)
		where CSM.SegmentId = [AAPReportServerTempDB].dbo.Segment.SegmentId
		) ;
		
	delete from [AAPReportServerTempDB].dbo.Segment with (readpast)
	where [AAPReportServerTempDB].dbo.Segment.SegmentId in (
		select td.SegmentId from @toDeleteTempSegment td 
		where not exists (
			select 1 from [AAPReportServerTempDB].dbo.ChunkSegmentMapping CSM
			where CSM.SegmentId = td.SegmentId
			)) ;
	select @numDeleted = @numDeleted + @@rowcount ;
	
	select @numDeleted;
end
GO
