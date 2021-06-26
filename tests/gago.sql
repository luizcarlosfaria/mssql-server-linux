CREATE DATABASE [gago]
GO

USE [gago]
GO

/****** Object:  Table [dbo].[Teste]    Script Date: 26/06/2021 01:44:17 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Teste](
	[TesteId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nchar](20) NOT NULL,
	[Date] [datetime2](7) NULL,
 	CONSTRAINT [PK_Teste] PRIMARY KEY CLUSTERED 
	(
		[TesteId] ASC
	) ON [PRIMARY]
) ON [PRIMARY]
GO


  insert into [gago].[dbo].[Teste] ([Name]) values ('A1');
  insert into [gago].[dbo].[Teste] ([Name]) values ('A2');