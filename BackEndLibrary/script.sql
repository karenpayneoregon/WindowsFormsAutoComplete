USE [master]
GO
/****** Object:  Database [PatientTrackerDatabase]    Script Date: 5/20/2018 2:31:31 PM ******/
CREATE DATABASE [PatientTrackerDatabase]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'PatientTrackerDatabase', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\PatientTrackerDatabase.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'PatientTrackerDatabase_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\PatientTrackerDatabase_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [PatientTrackerDatabase] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PatientTrackerDatabase].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PatientTrackerDatabase] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PatientTrackerDatabase] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PatientTrackerDatabase] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PatientTrackerDatabase] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PatientTrackerDatabase] SET ARITHABORT OFF 
GO
ALTER DATABASE [PatientTrackerDatabase] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [PatientTrackerDatabase] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [PatientTrackerDatabase] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PatientTrackerDatabase] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PatientTrackerDatabase] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PatientTrackerDatabase] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PatientTrackerDatabase] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PatientTrackerDatabase] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PatientTrackerDatabase] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PatientTrackerDatabase] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PatientTrackerDatabase] SET  DISABLE_BROKER 
GO
ALTER DATABASE [PatientTrackerDatabase] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PatientTrackerDatabase] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PatientTrackerDatabase] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PatientTrackerDatabase] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PatientTrackerDatabase] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PatientTrackerDatabase] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [PatientTrackerDatabase] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PatientTrackerDatabase] SET RECOVERY FULL 
GO
ALTER DATABASE [PatientTrackerDatabase] SET  MULTI_USER 
GO
ALTER DATABASE [PatientTrackerDatabase] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [PatientTrackerDatabase] SET DB_CHAINING OFF 
GO
ALTER DATABASE [PatientTrackerDatabase] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [PatientTrackerDatabase] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [PatientTrackerDatabase]
GO
/****** Object:  Table [dbo].[Department]    Script Date: 5/20/2018 2:31:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Department](
	[DepartmentIdentifier] [int] IDENTITY(1,1) NOT NULL,
	[DepartmentName] [nvarchar](max) NULL,
 CONSTRAINT [PK_Department] PRIMARY KEY CLUSTERED 
(
	[DepartmentIdentifier] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[GenderTypes]    Script Date: 5/20/2018 2:31:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GenderTypes](
	[GenderIdentifier] [int] IDENTITY(1,1) NOT NULL,
	[Gender] [nvarchar](max) NULL,
 CONSTRAINT [PK_GenderTypes] PRIMARY KEY CLUSTERED 
(
	[GenderIdentifier] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Patient]    Script Date: 5/20/2018 2:31:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Patient](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](max) NULL,
	[LastName] [nvarchar](max) NULL,
	[GenderIdentifier] [int] NULL,
	[DepartmentIdentifier] [int] NULL,
 CONSTRAINT [PK_Patient] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Department] ON 

INSERT [dbo].[Department] ([DepartmentIdentifier], [DepartmentName]) VALUES (1, N'Admitting')
INSERT [dbo].[Department] ([DepartmentIdentifier], [DepartmentName]) VALUES (2, N'Cardiology and Cardiac Surgery')
INSERT [dbo].[Department] ([DepartmentIdentifier], [DepartmentName]) VALUES (3, N'Endocrinology')
INSERT [dbo].[Department] ([DepartmentIdentifier], [DepartmentName]) VALUES (4, N'Accident and emergency')
INSERT [dbo].[Department] ([DepartmentIdentifier], [DepartmentName]) VALUES (5, N'Anaesthetics')
INSERT [dbo].[Department] ([DepartmentIdentifier], [DepartmentName]) VALUES (6, N'Breast screening')
INSERT [dbo].[Department] ([DepartmentIdentifier], [DepartmentName]) VALUES (7, N'Cardiology')
INSERT [dbo].[Department] ([DepartmentIdentifier], [DepartmentName]) VALUES (8, N'Chaplaincy')
INSERT [dbo].[Department] ([DepartmentIdentifier], [DepartmentName]) VALUES (9, N'Critical care')
INSERT [dbo].[Department] ([DepartmentIdentifier], [DepartmentName]) VALUES (10, N'Diagnostic imaging')
INSERT [dbo].[Department] ([DepartmentIdentifier], [DepartmentName]) VALUES (11, N'Discharge lounge')
INSERT [dbo].[Department] ([DepartmentIdentifier], [DepartmentName]) VALUES (12, N'Ear nose and throat')
INSERT [dbo].[Department] ([DepartmentIdentifier], [DepartmentName]) VALUES (13, N'Elderly services')
INSERT [dbo].[Department] ([DepartmentIdentifier], [DepartmentName]) VALUES (14, N'Gastroenterology')
INSERT [dbo].[Department] ([DepartmentIdentifier], [DepartmentName]) VALUES (15, N'General surgery')
INSERT [dbo].[Department] ([DepartmentIdentifier], [DepartmentName]) VALUES (16, N'Gynaecology')
INSERT [dbo].[Department] ([DepartmentIdentifier], [DepartmentName]) VALUES (17, N'Haematology')
INSERT [dbo].[Department] ([DepartmentIdentifier], [DepartmentName]) VALUES (18, N'Maternity')
INSERT [dbo].[Department] ([DepartmentIdentifier], [DepartmentName]) VALUES (19, N'Microbiology')
INSERT [dbo].[Department] ([DepartmentIdentifier], [DepartmentName]) VALUES (20, N'Neonatal unit')
INSERT [dbo].[Department] ([DepartmentIdentifier], [DepartmentName]) VALUES (21, N'Nephrology')
INSERT [dbo].[Department] ([DepartmentIdentifier], [DepartmentName]) VALUES (22, N'Neurology')
INSERT [dbo].[Department] ([DepartmentIdentifier], [DepartmentName]) VALUES (23, N'Nutrition and dietetics')
INSERT [dbo].[Department] ([DepartmentIdentifier], [DepartmentName]) VALUES (24, N'Obstetrics and gynaecology units')
INSERT [dbo].[Department] ([DepartmentIdentifier], [DepartmentName]) VALUES (25, N'Occupational therapy')
INSERT [dbo].[Department] ([DepartmentIdentifier], [DepartmentName]) VALUES (26, N'Oncology')
INSERT [dbo].[Department] ([DepartmentIdentifier], [DepartmentName]) VALUES (27, N'Ophthalmology')
INSERT [dbo].[Department] ([DepartmentIdentifier], [DepartmentName]) VALUES (28, N'Orthopaedics')
INSERT [dbo].[Department] ([DepartmentIdentifier], [DepartmentName]) VALUES (29, N'Pain management clinics')
INSERT [dbo].[Department] ([DepartmentIdentifier], [DepartmentName]) VALUES (30, N'Pharmacy')
INSERT [dbo].[Department] ([DepartmentIdentifier], [DepartmentName]) VALUES (31, N'Physiotherapy')
INSERT [dbo].[Department] ([DepartmentIdentifier], [DepartmentName]) VALUES (32, N'Radiotherapy')
INSERT [dbo].[Department] ([DepartmentIdentifier], [DepartmentName]) VALUES (33, N'Rheumatology')
INSERT [dbo].[Department] ([DepartmentIdentifier], [DepartmentName]) VALUES (34, N'Sexual health (genitourinary medicine)')
INSERT [dbo].[Department] ([DepartmentIdentifier], [DepartmentName]) VALUES (35, N'Urology')
SET IDENTITY_INSERT [dbo].[Department] OFF
SET IDENTITY_INSERT [dbo].[GenderTypes] ON 

INSERT [dbo].[GenderTypes] ([GenderIdentifier], [Gender]) VALUES (1, N'Female')
INSERT [dbo].[GenderTypes] ([GenderIdentifier], [Gender]) VALUES (2, N'Male')
INSERT [dbo].[GenderTypes] ([GenderIdentifier], [Gender]) VALUES (3, N'Other')
SET IDENTITY_INSERT [dbo].[GenderTypes] OFF
ALTER TABLE [dbo].[Patient]  WITH CHECK ADD  CONSTRAINT [FK_Patient_Department] FOREIGN KEY([DepartmentIdentifier])
REFERENCES [dbo].[Department] ([DepartmentIdentifier])
GO
ALTER TABLE [dbo].[Patient] CHECK CONSTRAINT [FK_Patient_Department]
GO
ALTER TABLE [dbo].[Patient]  WITH CHECK ADD  CONSTRAINT [FK_Patient_GenderTypes] FOREIGN KEY([GenderIdentifier])
REFERENCES [dbo].[GenderTypes] ([GenderIdentifier])
GO
ALTER TABLE [dbo].[Patient] CHECK CONSTRAINT [FK_Patient_GenderTypes]
GO
USE [master]
GO
ALTER DATABASE [PatientTrackerDatabase] SET  READ_WRITE 
GO
