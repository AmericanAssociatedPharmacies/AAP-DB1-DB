USE [WebDev]
GO
/****** Object:  StoredProcedure [dbo].[spRLGL_UPFormFill3]    Script Date: 12/22/2020 5:21:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		JOSHILA NARAYANAN rev BG 11/13/13
-- Description:	claimguard status with RLGL board feedback changes
-- =============================================
CREATE PROCEDURE [dbo].[spRLGL_UPFormFill3]
(
		@NCPDP int,
		@RxNbr nvarchar(50),
		@filldate smalldatetime	
)

AS
BEGIN
	SET NOCOUNT ON;
	Select p.PlanName,
	[BIN Nbr],
	--[Group Nbr],
	NDC,
	--[Qty Dispensed],
	--[Day Supply],
	--[Cost Submitted],
	--round([Total Price]-[Fee Paid],2) as [Paid],
	--round([Fee Paid],2) as [Disp Fee],
	--round([Total Price],2) as [Total Paid]
	[Total Price]-[Fee Paid] as [Paid],
	[Fee Paid] as [Disp Fee],
	[Total Price] as [Total Paid]
	FROM Webdev.dbo.Rx30Latest r left join claims_planbins p on p.bin=r.[bin nbr]
	WHERE [Pharm ID]=@NCPDP AND [Rx Nbr]=@RxNbr AND [Rx Date] = @filldate 
END
GO
