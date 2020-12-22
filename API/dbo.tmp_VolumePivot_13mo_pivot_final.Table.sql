USE [API]
GO
/****** Object:  Table [dbo].[tmp_VolumePivot_13mo_pivot_final]    Script Date: 12/22/2020 4:19:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_VolumePivot_13mo_pivot_final](
	[TM] [varchar](4) NULL,
	[pmid] [int] NULL,
	[AAP#] [varchar](20) NULL,
	[Parent#] [varchar](20) NULL,
	[API#] [varchar](20) NULL,
	[AAP Eff] [datetime] NULL,
	[AAP Quit] [datetime] NULL,
	[Description] [varchar](200) NULL,
	[Affiliate] [varchar](125) NULL,
	[Account DBA Name] [varchar](65) NULL,
	[Account Corporate Name] [varchar](100) NULL,
	[Address] [varchar](100) NULL,
	[City] [varchar](50) NULL,
	[St] [varchar](2) NULL,
	[Contact] [varchar](255) NULL,
	[Whse Date Opened] [datetime] NULL,
	[Status] [varchar](32) NULL,
	[API 01/10 Brand] [float] NULL,
	[API 01/10 Generic] [float] NULL,
	[API 01/10 OTC] [float] NULL,
	[API 01/10 Total] [float] NULL,
	[API 02/10 Brand] [float] NULL,
	[API 02/10 Generic] [float] NULL,
	[API 02/10 OTC] [float] NULL,
	[API 02/10 Total] [float] NULL,
	[API 03/10 Brand] [float] NULL,
	[API 03/10 Generic] [float] NULL,
	[API 03/10 OTC] [float] NULL,
	[API 03/10 Total] [float] NULL,
	[API 04/10 Brand] [float] NULL,
	[API 04/10 Generic] [float] NULL,
	[API 04/10 OTC] [float] NULL,
	[API 04/10 Total] [float] NULL,
	[API 05/10 Brand] [float] NULL,
	[API 05/10 Generic] [float] NULL,
	[API 05/10 OTC] [float] NULL,
	[API 05/10 Total] [float] NULL,
	[API 06/10 Brand] [float] NULL,
	[API 06/10 Generic] [float] NULL,
	[API 06/10 OTC] [float] NULL,
	[API 06/10 Total] [float] NULL,
	[API 07/10 Brand] [float] NULL,
	[API 07/10 Generic] [float] NULL,
	[API 07/10 OTC] [float] NULL,
	[API 07/10 Total] [float] NULL,
	[API 08/09 Brand] [float] NULL,
	[API 08/09 Generic] [float] NULL,
	[API 08/09 OTC] [float] NULL,
	[API 08/09 Total] [float] NULL,
	[API 08/10 Brand] [float] NULL,
	[API 08/10 Generic] [float] NULL,
	[API 08/10 OTC] [float] NULL,
	[API 08/10 Total] [float] NULL,
	[API 09/09 Brand] [float] NULL,
	[API 09/09 Generic] [float] NULL,
	[API 09/09 OTC] [float] NULL,
	[API 09/09 Total] [float] NULL,
	[API 10/09 Brand] [float] NULL,
	[API 10/09 Generic] [float] NULL,
	[API 10/09 OTC] [float] NULL,
	[API 10/09 Total] [float] NULL,
	[API 11/09 Brand] [float] NULL,
	[API 11/09 Generic] [float] NULL,
	[API 11/09 OTC] [float] NULL,
	[API 11/09 Total] [float] NULL,
	[API 12/09 Brand] [float] NULL,
	[API 12/09 Generic] [float] NULL,
	[API 12/09 OTC] [float] NULL,
	[API 12/09 Total] [float] NULL,
	[CAH 01/10 AAP Brand] [float] NULL,
	[CAH 01/10 AAP Generic] [float] NULL,
	[CAH 01/10 AAP OTC] [float] NULL,
	[CAH 01/10 AAP Total] [float] NULL,
	[CAH 02/10 AAP Brand] [float] NULL,
	[CAH 02/10 AAP Generic] [float] NULL,
	[CAH 02/10 AAP OTC] [float] NULL,
	[CAH 02/10 AAP Total] [float] NULL,
	[CAH 03/10 AAP Brand] [float] NULL,
	[CAH 03/10 AAP Generic] [float] NULL,
	[CAH 03/10 AAP OTC] [float] NULL,
	[CAH 03/10 AAP Total] [float] NULL,
	[CAH 04/10 AAP Brand] [float] NULL,
	[CAH 04/10 AAP Generic] [float] NULL,
	[CAH 04/10 AAP OTC] [float] NULL,
	[CAH 04/10 AAP Total] [float] NULL,
	[CAH 05/10 AAP Brand] [float] NULL,
	[CAH 05/10 AAP Generic] [float] NULL,
	[CAH 05/10 AAP OTC] [float] NULL,
	[CAH 05/10 AAP Total] [float] NULL,
	[CAH 06/10 AAP Brand] [float] NULL,
	[CAH 06/10 AAP Generic] [float] NULL,
	[CAH 06/10 AAP OTC] [float] NULL,
	[CAH 06/10 AAP Total] [float] NULL,
	[CAH 07/10 AAP Brand] [float] NULL,
	[CAH 07/10 AAP Generic] [float] NULL,
	[CAH 07/10 AAP OTC] [float] NULL,
	[CAH 07/10 AAP Total] [float] NULL,
	[CAH 08/10 AAP Brand] [float] NULL,
	[CAH 08/10 AAP Generic] [float] NULL,
	[CAH 08/10 AAP OTC] [float] NULL,
	[CAH 08/10 AAP Total] [float] NULL,
	[Total CAH Sales YTD] [float] NULL
) ON [PRIMARY]
GO
