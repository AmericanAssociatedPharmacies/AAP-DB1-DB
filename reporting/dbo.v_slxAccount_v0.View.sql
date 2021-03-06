USE [reporting]
GO
/****** Object:  View [dbo].[v_slxAccount_v0]    Script Date: 12/22/2020 9:27:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[v_slxAccount_v0]
as
SELECT     a.ACCOUNT, me.NCPDP, mms.UDACCTNO, me.DEA, si.NPI_NUMBER, aap.AAPID, aap.WHACCOUNTID AS api_id, d.ADDRESS1, d.CITY, d.STATE, 
                      d.POSTALCODE, a.STATUS, a.SUBTYPE, a.BUSINESSDESCRIPTION, a.MAINPHONE, a.FAX, me.TERRITORY, mmc.RXNETWORK, me.RXCOMPUTER, 
                      a.CREATEDATE, a.MODIFYDATE, a.ACCOUNTID, a.TYPE
FROM         MSSQLSERVER.saleslogix.sysdba.account AS a LEFT OUTER JOIN
                      MSSQLSERVER.saleslogix.sysdba.address AS d ON a.ADDRESSID = d.ADDRESSID LEFT OUTER JOIN
                      MSSQLSERVER.saleslogix.sysdba.maximizer_extension AS me ON a.ACCOUNTID = me.ACCOUNTID LEFT OUTER JOIN
                      MSSQLSERVER.saleslogix.sysdba.storeidentifier AS si ON a.ACCOUNTID = si.ACCOUNTID LEFT OUTER JOIN
                      MSSQLSERVER.saleslogix.sysdba.maximizermemserv AS mms ON a.ACCOUNTID = mms.ACCOUNTID LEFT OUTER JOIN
                      MSSQLSERVER.saleslogix.sysdba.maximizermanagedcare AS mmc ON a.ACCOUNTID = mmc.ACCOUNTID LEFT OUTER JOIN
                      MSSQLSERVER.saleslogix.sysdba.accountaap AS aap ON a.ACCOUNTID = aap.ACCOUNTID
GO
