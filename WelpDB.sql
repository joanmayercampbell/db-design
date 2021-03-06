USE [master]
GO
/****** Object:  Database [WelpDB]    Script Date: 7/25/2016 11:21:16 AM ******/
CREATE DATABASE [WelpDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'WelpDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\WelpDB.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'WelpDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\WelpDB_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [WelpDB] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [WelpDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [WelpDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [WelpDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [WelpDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [WelpDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [WelpDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [WelpDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [WelpDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [WelpDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [WelpDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [WelpDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [WelpDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [WelpDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [WelpDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [WelpDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [WelpDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [WelpDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [WelpDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [WelpDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [WelpDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [WelpDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [WelpDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [WelpDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [WelpDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [WelpDB] SET  MULTI_USER 
GO
ALTER DATABASE [WelpDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [WelpDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [WelpDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [WelpDB] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [WelpDB] SET DELAYED_DURABILITY = DISABLED 
GO
USE [WelpDB]
GO
/****** Object:  Table [dbo].[Business]    Script Date: 7/25/2016 11:21:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Business](
	[BusinessID] [int] IDENTITY(1,1) NOT NULL,
	[BusinessTypeID] [int] NOT NULL,
	[BusinessName] [nvarchar](50) NOT NULL,
	[Hours] [nvarchar](100) NOT NULL,
	[Address] [nvarchar](100) NOT NULL,
	[PhoneNumber] [nvarchar](50) NOT NULL,
	[MenuID] [int] NULL,
	[OwnerID] [int] NOT NULL,
 CONSTRAINT [PK_Business] PRIMARY KEY CLUSTERED 
(
	[BusinessID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[BusinessType]    Script Date: 7/25/2016 11:21:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BusinessType](
	[BusinessTypeID] [int] IDENTITY(1,1) NOT NULL,
	[BusinessTypeName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_BusinessType] PRIMARY KEY CLUSTERED 
(
	[BusinessTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Menu]    Script Date: 7/25/2016 11:21:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Menu](
	[MenuID] [int] IDENTITY(1,1) NOT NULL,
	[Menu] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Menu] PRIMARY KEY CLUSTERED 
(
	[MenuID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Owner]    Script Date: 7/25/2016 11:21:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Owner](
	[OwnerID] [int] IDENTITY(1,1) NOT NULL,
	[BusinessID] [int] NOT NULL,
	[UserID] [int] NOT NULL,
 CONSTRAINT [PK_Owner] PRIMARY KEY CLUSTERED 
(
	[OwnerID] ASC,
	[BusinessID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Reviews]    Script Date: 7/25/2016 11:21:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reviews](
	[ReviewID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[BusinessID] [int] NOT NULL,
	[ReviewText] [nvarchar](max) NULL,
	[ReviewStars] [int] NULL,
 CONSTRAINT [PK_Reviews] PRIMARY KEY CLUSTERED 
(
	[ReviewID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[User]    Script Date: 7/25/2016 11:21:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[EmailAddress] [nvarchar](50) NOT NULL,
	[Location] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[BusinessType] ON 

INSERT [dbo].[BusinessType] ([BusinessTypeID], [BusinessTypeName]) VALUES (1, N'Restaurant')
INSERT [dbo].[BusinessType] ([BusinessTypeID], [BusinessTypeName]) VALUES (2, N'Service')
INSERT [dbo].[BusinessType] ([BusinessTypeID], [BusinessTypeName]) VALUES (3, N'Shoppping')
SET IDENTITY_INSERT [dbo].[BusinessType] OFF
ALTER TABLE [dbo].[Business]  WITH CHECK ADD  CONSTRAINT [FK_Business_BusinessType] FOREIGN KEY([BusinessTypeID])
REFERENCES [dbo].[BusinessType] ([BusinessTypeID])
GO
ALTER TABLE [dbo].[Business] CHECK CONSTRAINT [FK_Business_BusinessType]
GO
ALTER TABLE [dbo].[Business]  WITH CHECK ADD  CONSTRAINT [FK_Business_Menu] FOREIGN KEY([MenuID])
REFERENCES [dbo].[Menu] ([MenuID])
GO
ALTER TABLE [dbo].[Business] CHECK CONSTRAINT [FK_Business_Menu]
GO
ALTER TABLE [dbo].[BusinessType]  WITH CHECK ADD  CONSTRAINT [FK_BusinessType_BusinessType] FOREIGN KEY([BusinessTypeID])
REFERENCES [dbo].[BusinessType] ([BusinessTypeID])
GO
ALTER TABLE [dbo].[BusinessType] CHECK CONSTRAINT [FK_BusinessType_BusinessType]
GO
ALTER TABLE [dbo].[Owner]  WITH CHECK ADD  CONSTRAINT [FK_Owner_Owner] FOREIGN KEY([OwnerID], [BusinessID])
REFERENCES [dbo].[Owner] ([OwnerID], [BusinessID])
GO
ALTER TABLE [dbo].[Owner] CHECK CONSTRAINT [FK_Owner_Owner]
GO
ALTER TABLE [dbo].[Owner]  WITH CHECK ADD  CONSTRAINT [FK_Owner_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[Owner] CHECK CONSTRAINT [FK_Owner_User]
GO
ALTER TABLE [dbo].[Reviews]  WITH CHECK ADD  CONSTRAINT [FK_Reviews_Business] FOREIGN KEY([BusinessID])
REFERENCES [dbo].[Business] ([BusinessID])
GO
ALTER TABLE [dbo].[Reviews] CHECK CONSTRAINT [FK_Reviews_Business]
GO
ALTER TABLE [dbo].[Reviews]  WITH CHECK ADD  CONSTRAINT [FK_Reviews_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[Reviews] CHECK CONSTRAINT [FK_Reviews_User]
GO
USE [master]
GO
ALTER DATABASE [WelpDB] SET  READ_WRITE 
GO
