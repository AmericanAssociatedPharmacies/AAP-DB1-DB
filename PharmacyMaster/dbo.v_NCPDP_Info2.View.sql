USE [PharmacyMaster]
GO
/****** Object:  View [dbo].[v_NCPDP_Info2]    Script Date: 12/22/2020 9:24:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[v_NCPDP_Info2]
AS
SELECT     dbo.NCPDP_Provider.ProviderID AS NCPDP, dbo.NCPDP_Provider.NPI, dbo.NCPDP_Provider.DEA, dbo.NCPDP_Provider.[DEA Expiration Date] AS DEAEXP, 
                      dbo.NCPDP_Provider.Name, dbo.NCPDP_Provider.[Physical Location Address 1] AS Address, dbo.NCPDP_Provider.[Physical Location Address 2] AS Address1, 
                      dbo.NCPDP_Provider.[Physical Location City] AS City, dbo.NCPDP_Provider.[Physical Location State Code] AS State, 
                      dbo.NCPDP_Provider.[Physical Location Zip Code] AS Zip, dbo.NCPDP_Provider.[Physical Location Phone Number] AS Phone, 
                      dbo.NCPDP_Provider.[Physical Location Extension] AS Ext, dbo.NCPDP_Provider.[Physical Location FAX Number] AS Fax, 
                      dbo.NCPDP_Provider.[Physical Location E-Mail Address] AS Email, dbo.NCPDP_ProviderRelationship.[Relationship ID] AS ChainCode, 
                      dbo.NCPDP_RelationshipDemographicInformation.Name AS AffiliateName, dbo.NCPDP_RelationshipType_Affiliates.TypeName AS AffiliateType
FROM         dbo.NCPDP_RelationshipDemographicInformation LEFT OUTER JOIN
                      dbo.NCPDP_RelationshipType_Affiliates ON 
                      dbo.NCPDP_RelationshipDemographicInformation.[Relationship Type] = dbo.NCPDP_RelationshipType_Affiliates.RelationshipType RIGHT OUTER JOIN
                      dbo.NCPDP_ProviderRelationship ON 
                      dbo.NCPDP_RelationshipDemographicInformation.RelationshipID = dbo.NCPDP_ProviderRelationship.[Relationship ID] RIGHT OUTER JOIN
                      dbo.NCPDP_Provider ON dbo.NCPDP_ProviderRelationship.[NCPDP Provider ID] = dbo.NCPDP_Provider.ProviderID

GO
