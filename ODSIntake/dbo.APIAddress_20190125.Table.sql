USE [ODSIntake]
GO
/****** Object:  Table [dbo].[APIAddress_20190125]    Script Date: 12/22/2020 4:42:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[APIAddress_20190125](
	[APIID] [char](11) NOT NULL,
	[PMID] [char](6) NOT NULL,
	[ADSTAT] [char](1) NOT NULL,
	[ADNUM] [char](11) NOT NULL,
	[ADADNO] [numeric](3, 0) NOT NULL,
	[ADNAME] [char](30) NOT NULL,
	[ADADR1] [char](35) NOT NULL,
	[ADADR2] [char](35) NOT NULL,
	[ADADR3] [char](35) NOT NULL,
	[ADADR4] [char](35) NOT NULL,
	[ADPOCD] [char](16) NOT NULL,
	[ADCOUN] [char](4) NOT NULL,
	[ADTREG] [char](16) NOT NULL,
	[ADPIDE] [char](17) NOT NULL,
	[ADTRPT] [numeric](3, 0) NOT NULL,
	[ADPLRN] [numeric](8, 0) NOT NULL,
	[ADGANN] [numeric](8, 0) NOT NULL,
	[ADROUT] [char](10) NOT NULL,
	[ADDEPA] [char](10) NOT NULL,
	[ADDEST] [char](10) NOT NULL,
	[ADSHPA] [char](11) NOT NULL,
	[ADAD01] [char](1) NOT NULL,
	[ADAD02] [char](1) NOT NULL,
	[ADAD03] [char](1) NOT NULL,
	[ADAD04] [char](1) NOT NULL,
	[ADAD05] [char](1) NOT NULL,
	[ADAD06] [char](1) NOT NULL,
	[ADBART] [char](10) NOT NULL,
	[ADCNTY] [char](5) NOT NULL,
	[ADSPCD] [char](2) NOT NULL,
	[ADTAXJ] [char](12) NOT NULL,
	[ADLBCD] [char](3) NOT NULL,
	[ADAD07] [char](1) NOT NULL,
	[ADCAID] [char](5) NOT NULL,
	[ADAD08] [char](1) NOT NULL,
	[ADUSDLMO] [char](1) NOT NULL,
	[ADUSDLTU] [char](1) NOT NULL,
	[ADUSDLWE] [char](1) NOT NULL,
	[ADUSDLTH] [char](1) NOT NULL,
	[ADUSDLFR] [char](1) NOT NULL,
	[ADUSDLSA] [char](1) NOT NULL,
	[ADUSDLSU] [char](1) NOT NULL
) ON [PRIMARY]
GO
