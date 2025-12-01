USE [GymDB]
GO

/****** Object:  Table [dbo].[GymTable]    Script Date: 1.12.2025 21:33:43 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[GymTable](
	[GymId] [int] NOT NULL,
	[GymName] [nvarchar](50) NULL,
	[GymType] [nvarchar](20) NOT NULL,
	[GymDescription] [nvarchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO


