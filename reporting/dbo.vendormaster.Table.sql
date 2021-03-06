USE [reporting]
GO
/****** Object:  Table [dbo].[vendormaster]    Script Date: 12/22/2020 4:58:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[vendormaster](
	[vendorid] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[vendorname] [nvarchar](25) NOT NULL,
	[vendortype] [int] NULL,
	[status] [int] NULL,
	[effectivedate] [smalldatetime] NULL,
	[address1] [nvarchar](50) NULL,
	[address2] [nvarchar](50) NULL,
	[city] [nvarchar](50) NULL,
	[state] [char](2) NULL,
	[zip] [nvarchar](10) NULL,
	[phone1] [nvarchar](15) NULL,
	[phone2] [nvarchar](15) NULL,
	[email] [nvarchar](50) NULL,
	[website] [nvarchar](50) NULL,
	[comments] [text] NULL,
	[oldvendorid] [int] NULL,
	[vendorpair] [int] NULL,
	[lastmodifiedon] [datetime] NULL,
	[lastmodifiedby] [nvarchar](50) NULL,
	[createdon] [datetime] NULL,
	[createdby] [nvarchar](50) NULL,
	[diffname] [bit] NULL,
 CONSTRAINT [PK_vendormaster] PRIMARY KEY CLUSTERED 
(
	[vendorid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
