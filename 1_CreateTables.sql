USE [GymDB]
GO

--GymTable--

CREATE TABLE [dbo].[GymTable](
	[GymId] [int] NOT NULL,
	[GymName] [nvarchar](50) NULL,
	[GymType] [nvarchar](20) NOT NULL,
	[GymDescription] [nvarchar](max) NULL);
	GO

--LoginTable--

CREATE TABLE [dbo].[LoginTable](
	[LoginId] [int] NOT NULL,
	[LoginUsername] [nvarchar](50) NOT NULL,
	[LoginPassword] [nvarchar](40) NOT NULL);
	GO

--PaymentTable--

CREATE TABLE [dbo].[PaymentTable](
	[PaymentId] [int] NOT NULL,
	[CostumerId] [int] NOT NULL,
	[PaymentDate] [date] NULL,
	[PaymentDescription] [nvarchar](max) NOT NULL,
	[PaymentAmount] [smallmoney] NOT NULL);
	GO

--PermissionTable--

CREATE TABLE [dbo].[PermissionTable](
	[PermissionId] [int] NOT NULL,
	[PermissionModule] [nvarchar](50) NULL,
	[PermissionName] [nvarchar](40) NOT NULL,
	[PermissionDescription] [nvarchar](max) NULL);
	GO

--TrainerTable--

CREATE TABLE [dbo].[TrainerTable](
	[TrainerId] [smallint] NOT NULL,
	[TrainerName] [nvarchar](20) NOT NULL,
	[TrainerSurname] [nvarchar](20) NOT NULL,
	[TrainerPassword] [nvarchar](35) NOT NULL,
	[TrainerPhone] [int] NOT NULL,
	[TrainerAddress] [nvarchar](max) NULL);
	GO

--User Table--

CREATE TABLE [dbo].[UserTable](
	[UserId] [int] NOT NULL,
	[UserName] [nvarchar](25) NOT NULL,
	[UserSurname] [nvarchar](25) NOT NULL,
	[UserPhone] [int] NOT NULL,
	[UserEmail] [ntext] NULL,
	[UserAddress] [nvarchar](250) NULL);
	GO





