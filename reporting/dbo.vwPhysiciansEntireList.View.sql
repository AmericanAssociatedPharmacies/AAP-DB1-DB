USE [reporting]
GO
/****** Object:  View [dbo].[vwPhysiciansEntireList]    Script Date: 12/22/2020 9:27:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE VIEW [dbo].[vwPhysiciansEntireList]

WITH schemabinding

AS

SELECT TOP 100 PERCENT 
	Practice,
	[First Name],
	[Last Name],
	[Full Name], 
	Address,
	Address2,
	City,
	State,
	Zip,
	Email,
	Specialty
	--[Specialty 2],
	--[Specialty 3],
	--[Specialty 4],
	--[Specialty 5] 
FROM dbo.PhysiciansEntireList
WHERE State in ('CO', 'CT', 'FL', 'IL', 'IA', 'MA', 'MT', 'ND', 'OK', 'UT') AND
	--State in ('AL', 'AZ', 'ID', 'IN', 'MN', 'MS', 'MO', 'NV', 'NC', 'OH',
	--'OR', 'PA', 'SC', 'SD', 'TN', 'WA', 'WV', 'WI', 'WY', 'NY', 'GA', 'NJ') AND
	(Specialty in ('Rheumatology', 'Hematology', 'Oncology', 'Cardiology', 'Allergy & Immunology',
		'Allergy, Immunology', 'Gastroenterology'))
	--This will not run
	--OR
	--[Specialty 2] in ('Rheumatology', 'Hematology', 'Oncology', 'Cardiology', 'Allergy & Immunology',
	--	'Allergy, Immunology', 'Gastroenterology')
	--OR
	--[Specialty 3] in ('Rheumatology', 'Hematology', 'Oncology', 'Cardiology', 'Allergy & Immunology',
	--	'Allergy, Immunology', 'Gastroenterology')
	--OR
	--[Specialty 4] in ('Rheumatology', 'Hematology', 'Oncology', 'Cardiology', 'Allergy & Immunology',
	--	'Allergy, Immunology', 'Gastroenterology')
	--OR
	--[Specialty 5] in ('Rheumatology', 'Hematology', 'Oncology', 'Cardiology', 'Allergy & Immunology',
	--	'Allergy, Immunology', 'Gastroenterology')
	--)
ORDER BY State

GO
