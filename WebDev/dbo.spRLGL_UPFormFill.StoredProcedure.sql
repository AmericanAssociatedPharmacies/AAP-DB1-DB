USE [WebDev]
GO
/****** Object:  StoredProcedure [dbo].[spRLGL_UPFormFill]    Script Date: 12/22/2020 5:21:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		JOSHILA NARAYANAN
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spRLGL_UPFormFill]
(
		@NCPDP int,
		@RxNbr nvarchar(11),
		@filldate smalldatetime	
)

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	

	Select [BIN Nbr],[Group Nbr],NDC,[Qty Dispensed],[Day Supply],[Cost Submitted],[Total Price] FROM Webdev.dbo.Rx30Latest WHERE [Pharm ID]=@NCPDP AND [Rx Nbr]=@RxNbr AND [Rx Date] = @filldate 

		
END
GO
