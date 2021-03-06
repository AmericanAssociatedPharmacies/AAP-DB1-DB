USE [HSMonitor]
GO
/****** Object:  Table [dbo].[WindowsServiceRegistrations]    Script Date: 12/22/2020 4:30:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WindowsServiceRegistrations](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ServiceName] [nvarchar](50) NOT NULL,
	[Action] [nvarchar](50) NOT NULL,
	[LastRan] [datetime2](7) NOT NULL,
	[OrderIndex] [int] NOT NULL,
 CONSTRAINT [PK_WindowsServiceRegistrations] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[WindowsServiceRegistrations] ADD  CONSTRAINT [DF_WindowsServiceRegistrations_OrderIndex]  DEFAULT ((0)) FOR [OrderIndex]
GO
