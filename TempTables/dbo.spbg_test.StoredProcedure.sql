USE [TempTables]
GO
/****** Object:  StoredProcedure [dbo].[spbg_test]    Script Date: 12/22/2020 5:19:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[spbg_test]
as
begin
-- declare XML variable
DECLARE @InputXML XML
DECLARE @idoc int

-- import file from disk
SELECT @InputXML = CAST(x AS XML)
FROM OPENROWSET(BULK 'c:\tmp\masterconfig.xml', SINGLE_BLOB) AS T(x)

SELECT @InputXML 
EXEC sp_xml_preparedocument @idoc OUTPUT, @InputXML

SELECT    *
FROM       OPENXML (@idoc, '/instances/instance',1)
            WITH (id  varchar(50),
                  description varchar(50))

end
EXEC sp_xml_removedocument @idoc
--spbg_test
GO
