USE [SSISDB]
GO
/****** Object:  View [catalog].[catalog_properties]    Script Date: 12/22/2020 9:36:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [catalog].[catalog_properties]
AS
SELECT     [property_name], 
           [property_value]
FROM       [internal].[catalog_properties]
GO
