USE [TempTables]
GO
/****** Object:  StoredProcedure [dbo].[spcs_test1]    Script Date: 12/22/2020 5:19:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc   [dbo].[spcs_test1]
as
begin
-- declare XML variable
DECLARE @InputXML XML
DECLARE @idoc int

-- import file from disk
SELECT @InputXML = CAST(x AS XML)
FROM OPENROWSET(BULK 'C:\tmp\comm_alerts.xml', SINGLE_BLOB) AS T(x)

SELECT @InputXML 
EXEC sp_xml_preparedocument @idoc OUTPUT, @InputXML

drop table tmp_config_commercialAlerts
SELECT *
into tmp_config_commercialAlerts
FROM OPENXML (@idoc, '/resources/resource',1)
WITH (id varchar(100) ,
  type varchar (10) 'type',
	[file] Varchar(255) 'file', 
    [description] varchar(255) 'description',
	date Varchar(20) 'date',
	directory varchar(100) 'directory',
    category varchar(100) 'category')
  

EXEC sp_xml_removedocument @idoc

end
GO
