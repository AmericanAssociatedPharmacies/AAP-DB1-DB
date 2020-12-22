USE [ODSIntake]
GO
/****** Object:  Table [dbo].[StoreVol_API1118_PVA1018$]    Script Date: 12/22/2020 4:42:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StoreVol_API1118_PVA1018$](
	[TM] [nvarchar](255) NULL,
	[PMID] [float] NULL,
	[AAP#] [nvarchar](255) NULL,
	[Parent#] [nvarchar](255) NULL,
	[Group#] [nvarchar](255) NULL,
	[API#] [nvarchar](255) NULL,
	[AAP Eff] [nvarchar](255) NULL,
	[AAP Quit] [nvarchar](255) NULL,
	[Description] [nvarchar](255) NULL,
	[Affiliate] [nvarchar](255) NULL,
	[ChainCode] [nvarchar](255) NULL,
	[Account DBA Name] [nvarchar](255) NULL,
	[Account Corporate Name] [nvarchar](255) NULL,
	[Software] [nvarchar](255) NULL,
	[Address] [nvarchar](255) NULL,
	[City] [nvarchar](255) NULL,
	[ST] [nvarchar](255) NULL,
	[Contact] [nvarchar](255) NULL,
	[Whse Acct Date Opened] [nvarchar](255) NULL,
	[Status] [nvarchar](255) NULL,
	[Wholesaler] [nvarchar](255) NULL,
	[API Nov 17 Brand] [money] NULL,
	[API Nov 17 Generic] [money] NULL,
	[API Nov 17 OTC] [money] NULL,
	[API Nov 17 Total Whse] [money] NULL,
	[API Dec 17 Brand] [money] NULL,
	[API Dec 17 Generic] [money] NULL,
	[API Dec 17 OTC] [money] NULL,
	[API Dec 17 Total Whse] [money] NULL,
	[API Jan 18 Brand] [money] NULL,
	[API Jan 18 Generic] [money] NULL,
	[API Jan 18 OTC] [money] NULL,
	[API Jan 18 Total Whse] [money] NULL,
	[API Feb 18 Brand] [money] NULL,
	[API Feb 18 Generic] [money] NULL,
	[API Feb 18 OTC] [money] NULL,
	[API Feb 18 Total Whse] [money] NULL,
	[API Mar 18 Brand] [money] NULL,
	[API Mar 18 Generic] [money] NULL,
	[API Mar 18 OTC] [money] NULL,
	[API Mar 18 Total Whse] [money] NULL,
	[API Apr 18 Brand] [money] NULL,
	[API Apr 18 Generic] [money] NULL,
	[API Apr 18 OTC] [money] NULL,
	[API Apr 18 Total Whse] [money] NULL,
	[API May 18 Brand] [money] NULL,
	[API May 18 Generic] [money] NULL,
	[API May 18 OTC] [money] NULL,
	[API May 18 Total Whse] [money] NULL,
	[API Jun 18 Brand] [money] NULL,
	[API Jun 18 Generic] [money] NULL,
	[API Jun 18 OTC] [money] NULL,
	[API Jun 18 Total Whse] [money] NULL,
	[API Jul 18 Brand] [money] NULL,
	[API Jul 18 Generic] [money] NULL,
	[API Jul 18 OTC] [money] NULL,
	[API Jul 18 Total Whse] [money] NULL,
	[API Aug 18 Brand] [money] NULL,
	[API Aug 18 Generic] [money] NULL,
	[API Aug 18 OTC] [money] NULL,
	[API Aug 18 Total Whse] [money] NULL,
	[API Sep 18 Brand] [money] NULL,
	[API Sep 18 Generic] [money] NULL,
	[API Sep 18 OTC] [money] NULL,
	[API Sep 18 Total Whse] [money] NULL,
	[API Oct 18 Brand] [money] NULL,
	[API Oct 18 Generic] [money] NULL,
	[API Oct 18 OTC] [money] NULL,
	[API Oct 18 Total Whse] [money] NULL,
	[API Nov 18 Brand] [money] NULL,
	[API Nov 18 Generic] [money] NULL,
	[API Nov 18 OTC] [money] NULL,
	[API Nov 18 Total Whse] [money] NULL,
	[API Total Brand Sales] [money] NULL,
	[API Total Generic Sales] [money] NULL,
	[API Total OTC Sales] [money] NULL,
	[API TOTAL SALES] [money] NULL,
	[CAH Oct 17 AAP Brand] [money] NULL,
	[CAH New Oct 17 AAP Brand] [money] NULL,
	[CAH Oct 17 AAP Src Generics] [money] NULL,
	[CAH Oct 17 AAP Other Sales] [money] NULL,
	[CAH Oct 17 AAP Total RX] [money] NULL,
	[CAH Oct 17 Other RX] [money] NULL,
	[CAH Oct 17 AAP Excluded from Total RX] [money] NULL,
	[CAH Oct 17 AAP NonRX - OTC&HH] [money] NULL,
	[CAH Oct 17 AAP Source Compliance] [float] NULL,
	[CAH Oct 17 AAP Total Sales] [money] NULL,
	[CAH Nov 17 AAP Brand] [money] NULL,
	[CAH New Nov 17 AAP Brand] [money] NULL,
	[CAH Nov 17 AAP Src Generics] [money] NULL,
	[CAH Nov 17 AAP Other Sales] [money] NULL,
	[CAH Nov 17 AAP Total RX] [money] NULL,
	[CAH Nov 17 Other RX] [money] NULL,
	[CAH Nov 17 AAP Excluded from Total RX] [money] NULL,
	[CAH Nov 17 AAP NonRX - OTC&HH] [money] NULL,
	[CAH Nov 17 AAP Source Compliance] [float] NULL,
	[CAH Nov 17 AAP Total Sales] [money] NULL,
	[CAH Dec 17 AAP Brand] [money] NULL,
	[CAH New Dec 17 AAP Brand] [money] NULL,
	[CAH Dec 17 AAP Src Generics] [money] NULL,
	[CAH Dec 17 AAP Other Sales] [money] NULL,
	[CAH Dec 17 AAP Total RX] [money] NULL,
	[CAH Dec 17 Other RX] [money] NULL,
	[CAH Dec 17 AAP Excluded from Total RX] [money] NULL,
	[CAH Dec 17 AAP NonRX - OTC&HH] [money] NULL,
	[CAH Dec 17 AAP Source Compliance] [float] NULL,
	[CAH Dec 17 AAP Total Sales] [money] NULL,
	[CAH Jan 18 AAP Brand] [money] NULL,
	[CAH New Jan 18 AAP Brand] [money] NULL,
	[CAH Jan 18 AAP Src Generics] [money] NULL,
	[CAH Jan 18 AAP Other Sales] [money] NULL,
	[CAH Jan 18 AAP Total RX] [money] NULL,
	[CAH Jan 18 Other RX] [money] NULL,
	[CAH Jan 18 AAP Excluded from Total RX] [money] NULL,
	[CAH Jan 18 AAP NonRX - OTC&HH] [money] NULL,
	[CAH Jan 18 AAP Source Compliance] [float] NULL,
	[CAH Jan 18 AAP Total Sales] [money] NULL,
	[CAH Feb 18 AAP Brand] [money] NULL,
	[CAH New Feb 18 AAP Brand] [money] NULL,
	[CAH Feb 18 AAP Src Generics] [money] NULL,
	[CAH Feb 18 AAP Other Sales] [money] NULL,
	[CAH Feb 18 AAP Total RX] [money] NULL,
	[CAH Feb 18 Other RX] [money] NULL,
	[CAH Feb 18 AAP Excluded from Total RX] [money] NULL,
	[CAH Feb 18 AAP NonRX - OTC&HH] [money] NULL,
	[CAH Feb 18 AAP Source Compliance] [float] NULL,
	[CAH Feb 18 AAP Total Sales] [money] NULL,
	[CAH Mar 18 AAP Brand] [money] NULL,
	[CAH New Mar 18 AAP Brand] [money] NULL,
	[CAH Mar 18 AAP Src Generics] [money] NULL,
	[CAH Mar 18 AAP Other Sales] [money] NULL,
	[CAH Mar 18 AAP Total RX] [money] NULL,
	[CAH Mar 18 Other RX] [money] NULL,
	[CAH Mar 18 AAP Excluded from Total RX] [money] NULL,
	[CAH Mar 18 AAP NonRX - OTC&HH] [money] NULL,
	[CAH Mar 18 AAP Source Compliance] [float] NULL,
	[CAH Mar 18 AAP Total Sales] [money] NULL,
	[CAH Apr 18 AAP Brand] [money] NULL,
	[CAH New Apr 18 AAP Brand] [money] NULL,
	[CAH Apr 18 AAP Src Generics] [money] NULL,
	[CAH Apr 18 AAP Other Sales] [money] NULL,
	[CAH Apr 18 AAP Total RX] [money] NULL,
	[CAH Apr 18 Other RX] [money] NULL,
	[CAH Apr 18 AAP Excluded from Total RX] [money] NULL,
	[CAH Apr 18 AAP NonRX - OTC&HH] [money] NULL,
	[CAH Apr 18 AAP Source Compliance] [float] NULL,
	[CAH Apr 18 AAP Total Sales] [money] NULL,
	[CAH May 18 AAP Brand] [money] NULL,
	[CAH New May 18 AAP Brand] [money] NULL,
	[CAH May 18 AAP Src Generics] [money] NULL,
	[CAH May 18 AAP Other Sales] [money] NULL,
	[CAH May 18 AAP Total RX] [money] NULL,
	[CAH May 18 Other RX] [money] NULL,
	[CAH May 18 AAP Excluded from Total RX] [money] NULL,
	[CAH May 18 AAP NonRX - OTC&HH] [money] NULL,
	[CAH May 18 AAP Source Compliance] [float] NULL,
	[CAH May 18 AAP Total Sales] [money] NULL,
	[CAH Jun 18 AAP Brand] [money] NULL,
	[CAH New Jun 18 AAP Brand] [money] NULL,
	[CAH Jun 18 AAP Src Generics] [money] NULL,
	[CAH Jun 18 AAP Other Sales] [money] NULL,
	[CAH Jun 18 AAP Total RX] [money] NULL,
	[CAH Jun 18 Other RX] [money] NULL,
	[CAH Jun 18 AAP Excluded from Total RX] [money] NULL,
	[CAH Jun 18 AAP NonRX - OTC&HH] [money] NULL,
	[CAH Jun 18 AAP Source Compliance] [float] NULL,
	[CAH Jun 18 AAP Total Sales] [money] NULL,
	[CAH Jul 18 AAP Brand] [money] NULL,
	[CAH New Jul 18 AAP Brand] [money] NULL,
	[CAH Jul 18 AAP Src Generics] [money] NULL,
	[CAH Jul 18 AAP Other Sales] [money] NULL,
	[CAH Jul 18 AAP Total RX] [money] NULL,
	[CAH Jul 18 Other RX] [money] NULL,
	[CAH Jul 18 AAP Excluded from Total RX] [money] NULL,
	[CAH Jul 18 AAP NonRX - OTC&HH] [money] NULL,
	[CAH Jul 18 AAP Source Compliance] [float] NULL,
	[CAH Jul 18 AAP Total Sales] [money] NULL,
	[CAH Aug 18 AAP Brand] [money] NULL,
	[CAH New Aug 18 AAP Brand] [money] NULL,
	[CAH Aug 18 AAP Src Generics] [money] NULL,
	[CAH Aug 18 AAP Other Sales] [money] NULL,
	[CAH Aug 18 AAP Total RX] [money] NULL,
	[CAH Aug 18 Other RX] [money] NULL,
	[CAH Aug 18 AAP Excluded from Total RX] [money] NULL,
	[CAH Aug 18 AAP NonRX - OTC&HH] [money] NULL,
	[CAH Aug 18 AAP Source Compliance] [float] NULL,
	[CAH Aug 18 AAP Total Sales] [money] NULL,
	[CAH Sep 18 AAP Brand] [money] NULL,
	[CAH New Sep 18 AAP Brand] [money] NULL,
	[CAH Sep 18 AAP Src Generics] [money] NULL,
	[CAH Sep 18 AAP Other Sales] [money] NULL,
	[CAH Sep 18 AAP Total RX] [money] NULL,
	[CAH Sep 18 Other RX] [money] NULL,
	[CAH Sep 18 AAP Excluded from Total RX] [money] NULL,
	[CAH Sep 18 AAP NonRX - OTC&HH] [money] NULL,
	[CAH Sep 18 AAP Source Compliance] [float] NULL,
	[CAH Sep 18 AAP Total Sales] [money] NULL,
	[CAH Oct 18 AAP Brand] [money] NULL,
	[CAH New Oct 18 AAP Brand] [money] NULL,
	[CAH Oct 18 AAP Src Generics] [money] NULL,
	[CAH Oct 18 AAP Other Sales] [money] NULL,
	[CAH Oct 18 AAP Total RX] [money] NULL,
	[CAH Oct 18 Other RX] [money] NULL,
	[CAH Oct 18 AAP Excluded from Total RX] [money] NULL,
	[CAH Oct 18 AAP NonRX - OTC&HH] [money] NULL,
	[CAH Oct 18 AAP Source Compliance] [float] NULL,
	[CAH Oct 18 AAP Total Sales] [money] NULL,
	[CAH Total Brand Sales] [money] NULL,
	[CAH Total New Brand Sales] [money] NULL,
	[CAH Total Src Generic Sales] [money] NULL,
	[CAH Total Other Sales] [money] NULL,
	[CAH Total Total RX] [money] NULL,
	[CAH Total Other RX] [money] NULL,
	[CAH Total Excluded from Total RX] [money] NULL,
	[CAH Total NonRX - OTC&HH] [money] NULL,
	[CAH TOTAL SALES] [money] NULL,
	[Total Oct 17 Combined Mthly Sales] [money] NULL,
	[Total Nov 17 Combined Mthly Sales] [money] NULL,
	[Total Dec 17 Combined Mthly Sales] [money] NULL,
	[Total Jan 18 Combined Mthly Sales] [money] NULL,
	[Total Feb 18 Combined Mthly Sales] [money] NULL,
	[Total Mar 18 Combined Mthly Sales] [money] NULL,
	[Total Apr 18 Combined Mthly Sales] [money] NULL,
	[Total May 18 Combined Mthly Sales] [money] NULL,
	[Total Jun 18 Combined Mthly Sales] [money] NULL,
	[Total Jul 18 Combined Mthly Sales] [money] NULL,
	[Total Aug 18 Combined Mthly Sales] [money] NULL,
	[Total Sep 18 Combined Mthly Sales] [money] NULL,
	[Total Oct 18 Combined Mthly Sales] [money] NULL,
	[Total Nov 18 Combined Mthly Sales] [money] NULL,
	[TOTAL COMBINED SALES] [money] NULL
) ON [PRIMARY]
GO
