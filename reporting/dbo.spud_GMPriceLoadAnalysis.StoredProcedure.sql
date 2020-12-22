USE [reporting]
GO
/****** Object:  StoredProcedure [dbo].[spud_GMPriceLoadAnalysis]    Script Date: 12/22/2020 4:58:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[spud_GMPriceLoadAnalysis]

	(
		@dateloaded smalldatetime,
		@ws int
		
	)

	
AS
BEGIN	
	
	Delete from GMPrice	

	INSERT INTO GMPrice Select * from WSPriceAll Where Month(dateloaded) = Month(@dateloaded)
	
	--If Lowest in UDS and Top100 List
	if @ws = 3
	Begin
		Update GMPrice Set [Price Per Unit] = Case When [Price Per Unit] > PricePerUnit Then  PricePerUnit ELSE [Price Per Unit] END FROM CHTop100 JOIN GMPrice ON Month(Filedate) = Month(dateloaded) and [NDC UPC] = CHTop100.NDC 
	End


END





















GO
