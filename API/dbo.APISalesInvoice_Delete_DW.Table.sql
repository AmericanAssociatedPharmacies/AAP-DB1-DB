USE [API]
GO
/****** Object:  Table [dbo].[APISalesInvoice_Delete_DW]    Script Date: 12/22/2020 4:19:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[APISalesInvoice_Delete_DW](
	[RowID] [int] IDENTITY(1,1) NOT NULL,
	[ID] [int] NOT NULL,
	[WHAccountID] [varchar](100) NULL,
	[OrderNumber] [varchar](25) NULL,
	[InvNbr] [varchar](50) NULL,
	[RowCreatedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_APISalesInvoice_Delete_DW] PRIMARY KEY CLUSTERED 
(
	[RowID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[APISalesInvoice_Delete_DW] ADD  DEFAULT (getdate()) FOR [RowCreatedDate]
GO
