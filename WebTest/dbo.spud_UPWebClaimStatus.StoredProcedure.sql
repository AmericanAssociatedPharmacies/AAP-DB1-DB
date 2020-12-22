USE [WebTest]
GO
/****** Object:  StoredProcedure [dbo].[spud_UPWebClaimStatus]    Script Date: 12/22/2020 5:26:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		JOSHILA NARAYANAN
-- Create date: 07/11/2013
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[spud_UPWebClaimStatus]
(
	@pharmid nvarchar(15)
)
	
AS
BEGIN
	
	SET NOCOUNT ON;

	
  Select  BIN, PlanName, NDC, RxNbr, RxDate, DrugName, Result, Status, Source,CreatedOn from UPStatus WHERE (PharmID = @pharmid) ORDER BY Status DESC,PlanName ASC,RxNbr ASC
	

END
GO
