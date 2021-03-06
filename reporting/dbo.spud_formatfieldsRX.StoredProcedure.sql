USE [reporting]
GO
/****** Object:  StoredProcedure [dbo].[spud_formatfieldsRX]    Script Date: 12/22/2020 4:58:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





-- =============================================
-- Author:		JOSHILA NARAYANAN
-- Create date: 09/02/08
-- Description:	Formatting Rx30 Files
-- =============================================
CREATE PROCEDURE [dbo].[spud_formatfieldsRX]
	
AS


	BEGIN
		SET NOCOUNT ON;

		DECLARE @SQL varchar(2000)
			
				

				ALTER Table Rx30Load	ALTER COLUMN [Qty Dispensed]  numeric(38,0)
				ALTER Table Rx30Load	ALTER COLUMN [fee Submitted]  numeric(38,3)
				ALTER Table Rx30Load	ALTER COLUMN [Cost Submitted]  numeric(38,3)
				ALTER Table Rx30Load	ALTER COLUMN [Fee Paid]  numeric(38,3)
				ALTER Table Rx30Load	ALTER COLUMN [Cost Paid]  numeric(38,3)
				ALTER Table Rx30Load	ALTER COLUMN [Plan amount]  numeric(38,3)
				ALTER Table Rx30Load	ALTER COLUMN [Co pay Amount]  numeric(38,3)
				ALTER Table Rx30Load	ALTER COLUMN [U and C]  numeric(38,3)
				ALTER Table Rx30Load	ALTER COLUMN [Total Price]  numeric(38,3)
				ALTER Table Rx30Load	ALTER COLUMN [Submitted]  datetime
				ALTER Table Rx30Load	ALTER COLUMN [Rx Date]  datetime
				ALTER Table Rx30Load	ALTER COLUMN [Gross Amt due]  numeric(38,3)
				ALTER Table Rx30Load	ALTER COLUMN [Patient Paid]  numeric(38,3)
				

				Update Rx30Load
						Set 
							/*Submitted = Convert(datetime,RIGHT('0' + rtrim(day(Submitted)), 2) + '-' + RIGHT('0' + rtrim(month(Submitted)), 2) + '-' + rtrim(year(Submitted)),105),*/
							/*Submitted = Convert(datetime,Submitted,100),
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
							
							
						
			
	END					

			



























GO
