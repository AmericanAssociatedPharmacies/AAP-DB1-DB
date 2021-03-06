USE [reporting]
GO
/****** Object:  View [dbo].[v_SLXAccount_DEV]    Script Date: 12/22/2020 9:27:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_SLXAccount_DEV]
AS
SELECT     a.ACCOUNT, me.NCPDP, me.DEA, si.NPI_NUMBER, mms.UDACCTNO, aap.WHACCOUNTID, aap.AAPID, d.ADDRESS1, d.CITY, d.STATE, 
                      d.POSTALCODE, a.STATUS, a.TYPE, a.SUBTYPE, a.BUSINESSDESCRIPTION, a.MAINPHONE, a.FAX, me.TERRITORY, mmc.RXNETWORK, 
                      me.RXCOMPUTER, a.CREATEDATE, a.MODIFYDATE, a.ACCOUNTID, aap.APPLICATIONMEMSTATUS, aap.APPLICATIONWHSTATUS, 
                      aap.APPLICATIONMCSTATUS, aap.APPLICATIONMEMDATERECD, aap.APPLICATIONWHDATERECD, aap.APPLICATIONMEMDATECOMPLETE, 
                      aap.APPLICATIONMCDATEDSRECD, aap.AAPPREVIOUSGROUP, aap.APPLICATIONFEEPAID, aap.APPLICATIONWHDATECREDAPPVD, 
                      aap.APPLICATIONWHDATEACTIVATED, aap.WHPAYTERMS, aap.WHPAYMETHOD, aap.WHVOLUMEMONTHLY, aap.WHVOLUMEBRANDRX, 
                      aap.WHVOLUMEGENERICRX, aap.WHVOLUMEOTC, aap.WHCREDITLIMIT, aap.MCDATEEFFECTIVE, aap.MCPREVAFFILIATION, aap.AAPPARENTID, 
                      aap.APPLICATIONWHSTSTATUS, aap.APPLICATIONWHSTDATERECD, aap.APPLICATIONWHSTDATEACTIVE, aap.WHCREDITALERT, aap.WHMOT, 
                      aap.WHFREIGHTOPTION, aap.AAPWHPLANOGRAM, aap.WHCUSTOMERSTATUS, aap.APPLICATIONWHDATETOCREDIT, aap.WHORDERCUTOFF, 
                      si.MEDBPROVIDER, aap.QPS, CASE aap.applicationwhststatus WHEN 'complete' THEN 'Yes' ELSE NULL END AS ScanAndToss, 
                      aap.AAPWHPLANOGRAM AS Planogram, me.STORETYPE AS CHAINCODE, si.MCAFFILIATION,me.Category
FROM         testsql2k.slx_devel.sysdba.account AS a LEFT OUTER JOIN
                      testsql2k.slx_devel.sysdba.address AS d ON a.ADDRESSID = d.ADDRESSID LEFT OUTER JOIN
                      testsql2k.slx_devel.sysdba.maximizer_extension AS me ON a.ACCOUNTID = me.ACCOUNTID LEFT OUTER JOIN
                      testsql2k.slx_devel.sysdba.storeidentifier AS si ON a.ACCOUNTID = si.ACCOUNTID LEFT OUTER JOIN
                      testsql2k.slx_devel.sysdba.maximizermemserv AS mms ON a.ACCOUNTID = mms.ACCOUNTID LEFT OUTER JOIN
                      testsql2k.slx_devel.sysdba.maximizermanagedcare AS mmc ON a.ACCOUNTID = mmc.ACCOUNTID LEFT OUTER JOIN
                      testsql2k.slx_devel.sysdba.accountaap AS aap ON a.ACCOUNTID = aap.ACCOUNTID
GO
