USE [reporting]
GO
/****** Object:  StoredProcedure [dbo].[spud_PMRx30Flush]    Script Date: 12/22/2020 4:58:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spud_PMRx30Flush]
	
AS
BEGIN
-- SET NOCOUNT ON added to prevent extra result sets from
-- interfering with SELECT statements.
SET NOCOUNT ON;

-- Import File
-- Back up Rx30Master
-- Flush all Rx30Master 
-- Data delete and add RxID field
-- Run below queries

Update Rx30April Set	[Fee Paid] = 0 Where [Fee Paid] = ''
	

Update Rx30April Set	[Cost Paid] = 0 Where [Cost Paid] = ''

		
		ALTER Table Rx30April	ALTER COLUMN [Qty Dispensed]  numeric(38,0)
				ALTER Table Rx30April	ALTER COLUMN [fee Submitted]  numeric(38,3)
				ALTER Table Rx30April	ALTER COLUMN [Cost Submitted]  numeric(38,3)
				ALTER Table Rx30April	ALTER COLUMN [Fee Paid]  numeric(38,3)
				ALTER Table Rx30April	ALTER COLUMN [Cost Paid]  numeric(38,3)
				ALTER Table Rx30April	ALTER COLUMN [Plan amount]  numeric(38,3)
				ALTER Table Rx30April	ALTER COLUMN [Co pay Amount]  numeric(38,3)
				ALTER Table Rx30April	ALTER COLUMN [U and C]  numeric(38,3)
				ALTER Table Rx30April	ALTER COLUMN [Total Price]  numeric(38,3)
				ALTER Table Rx30April	ALTER COLUMN [Submitted]  datetime
				ALTER Table Rx30April	ALTER COLUMN [Rx Date]  datetime
				ALTER Table Rx30April	ALTER COLUMN [Gross Amt due]  numeric(38,3)
				ALTER Table Rx30April	ALTER COLUMN [Patient Paid]  numeric(38,3)
				

				Update Rx30April
						Set /*Submitted = Convert(datetime,Submitted,113),
							[Rx Date] = Convert(datetime,RIGHT('0' + rtrim(day([Rx Date])), 2) + '-' + RIGHT('0' + rtrim(month([Rx Date])), 2) + '-' + rtrim(year([Rx Date])),105),*/
							[Cost Submitted] = ([Cost Submitted] * .01),
							[Fee Paid]	= ([Fee Paid] * .01),
							[Cost Paid]	= ([Cost Paid] * .01), 
							[Plan Amount]	= ([Plan Amount] * .01),
							[Co Pay Amount] = ([Co Pay Amount] * .01),
							[Total Price] = ([Total Price] * .01),
							[Qty Dispensed] = ([Qty Dispensed] * .001),
							[Fee Submitted] = ([Fee Submitted] * .01),
							[U and C] = ([U and C] * .01),
							[Gross Amt due] = ([Gross Amt due] * .01),
							[Patient Paid] = ([Patient Paid] * .01)

	
		--5.	Append new fields to master Table
		Insert into Rx30Master([Pharm ID],[BIN Nbr],PCN,[Group Nbr],Submitted,[Rx Date],[Qty Dispensed],[Day Supply],NDC,[Fee Submitted],[Cost Submitted],
		[Fee Paid],[Cost Paid],[Plan Amount],[Co Pay Amount],[U and C],[Total Price],BS,BR,OI,DAW,[DAW Desc],[Patient Paid], [Gross Amt Due],[Bill Code],[Rej Code],[Message Response],[Tx Response],[Rx Nbr],RfNbr,PID_Q,PID,Doctor)
		 Select * from Rx30April
	
		
		Update Rx30Master Set updatedon = getdate() WHERE (updatedon is null or updatedon = '')
		
END



GO
