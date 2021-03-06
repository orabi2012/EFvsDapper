USE [master]
GO
/****** Object:  Database [EFvsDapper]    Script Date: 16-Jan-22 9:27:24 PM ******/
CREATE DATABASE [EFvsDapper]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ORMComparison', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\ORMComparison.mdf' , SIZE = 73728KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ORMComparison_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\ORMComparison_log.ldf' , SIZE = 73728KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [EFvsDapper] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [EFvsDapper].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [EFvsDapper] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [EFvsDapper] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [EFvsDapper] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [EFvsDapper] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [EFvsDapper] SET ARITHABORT OFF 
GO
ALTER DATABASE [EFvsDapper] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [EFvsDapper] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [EFvsDapper] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [EFvsDapper] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [EFvsDapper] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [EFvsDapper] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [EFvsDapper] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [EFvsDapper] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [EFvsDapper] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [EFvsDapper] SET  DISABLE_BROKER 
GO
ALTER DATABASE [EFvsDapper] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [EFvsDapper] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [EFvsDapper] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [EFvsDapper] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [EFvsDapper] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [EFvsDapper] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [EFvsDapper] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [EFvsDapper] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [EFvsDapper] SET  MULTI_USER 
GO
ALTER DATABASE [EFvsDapper] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [EFvsDapper] SET DB_CHAINING OFF 
GO
ALTER DATABASE [EFvsDapper] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [EFvsDapper] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [EFvsDapper] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [EFvsDapper] SET QUERY_STORE = OFF
GO
USE [EFvsDapper]
GO
/****** Object:  Table [dbo].[Athlete_Team]    Script Date: 16-Jan-22 9:27:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Athlete_Team](
	[AthleteId] [bigint] NOT NULL,
	[TeamId] [bigint] NOT NULL,
 CONSTRAINT [PK_Athlete_Team] PRIMARY KEY CLUSTERED 
(
	[AthleteId] ASC,
	[TeamId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Athletes]    Script Date: 16-Jan-22 9:27:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Athletes](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](256) NULL,
	[LastName] [nvarchar](256) NULL,
	[Position] [nvarchar](256) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Teams]    Script Date: 16-Jan-22 9:27:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Teams](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](256) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Athlete_Team]  WITH CHECK ADD  CONSTRAINT [FK_Athlete_Team_Athletes] FOREIGN KEY([AthleteId])
REFERENCES [dbo].[Athletes] ([Id])
GO
ALTER TABLE [dbo].[Athlete_Team] CHECK CONSTRAINT [FK_Athlete_Team_Athletes]
GO
ALTER TABLE [dbo].[Athlete_Team]  WITH CHECK ADD  CONSTRAINT [FK_Athlete_Team_Teams] FOREIGN KEY([TeamId])
REFERENCES [dbo].[Teams] ([Id])
GO
ALTER TABLE [dbo].[Athlete_Team] CHECK CONSTRAINT [FK_Athlete_Team_Teams]
GO
USE [master]
GO
ALTER DATABASE [EFvsDapper] SET  READ_WRITE 
GO
