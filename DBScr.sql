USE [master]
GO
/****** Object:  Database [ПАО_Деньги_в_каждый_карман]    Script Date: 20.03.2023 7:58:50 ******/
CREATE DATABASE [ПАО_Деньги_в_каждый_карман]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ПАО_Деньги_в_каждый_карман', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\ПАО_Деньги_в_каждый_карман.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ПАО_Деньги_в_каждый_карман_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\ПАО_Деньги_в_каждый_карман_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [ПАО_Деньги_в_каждый_карман] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ПАО_Деньги_в_каждый_карман].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ПАО_Деньги_в_каждый_карман] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ПАО_Деньги_в_каждый_карман] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ПАО_Деньги_в_каждый_карман] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ПАО_Деньги_в_каждый_карман] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ПАО_Деньги_в_каждый_карман] SET ARITHABORT OFF 
GO
ALTER DATABASE [ПАО_Деньги_в_каждый_карман] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ПАО_Деньги_в_каждый_карман] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ПАО_Деньги_в_каждый_карман] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ПАО_Деньги_в_каждый_карман] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ПАО_Деньги_в_каждый_карман] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ПАО_Деньги_в_каждый_карман] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ПАО_Деньги_в_каждый_карман] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ПАО_Деньги_в_каждый_карман] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ПАО_Деньги_в_каждый_карман] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ПАО_Деньги_в_каждый_карман] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ПАО_Деньги_в_каждый_карман] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ПАО_Деньги_в_каждый_карман] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ПАО_Деньги_в_каждый_карман] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ПАО_Деньги_в_каждый_карман] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ПАО_Деньги_в_каждый_карман] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ПАО_Деньги_в_каждый_карман] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ПАО_Деньги_в_каждый_карман] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ПАО_Деньги_в_каждый_карман] SET RECOVERY FULL 
GO
ALTER DATABASE [ПАО_Деньги_в_каждый_карман] SET  MULTI_USER 
GO
ALTER DATABASE [ПАО_Деньги_в_каждый_карман] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ПАО_Деньги_в_каждый_карман] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ПАО_Деньги_в_каждый_карман] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ПАО_Деньги_в_каждый_карман] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ПАО_Деньги_в_каждый_карман] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ПАО_Деньги_в_каждый_карман] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'ПАО_Деньги_в_каждый_карман', N'ON'
GO
ALTER DATABASE [ПАО_Деньги_в_каждый_карман] SET QUERY_STORE = OFF
GO
USE [ПАО_Деньги_в_каждый_карман]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 20.03.2023 7:58:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[AccountNumber] [bigint] NOT NULL,
	[AccountUser] [int] NOT NULL,
	[AccountDateOpen] [date] NOT NULL,
	[AccountBalance] [decimal](10, 2) NOT NULL,
	[AccountType] [int] NOT NULL,
 CONSTRAINT [PK__Банковск__29AA80A1D74F3E96] PRIMARY KEY CLUSTERED 
(
	[AccountNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AccountType]    Script Date: 20.03.2023 7:58:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AccountType](
	[AccTypeID] [int] NOT NULL,
	[AccTypeName] [varchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[AccTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Address]    Script Date: 20.03.2023 7:58:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Address](
	[AddressID] [int] NOT NULL,
	[AddressStreet] [int] NOT NULL,
	[AddressHouse] [varchar](5) NOT NULL,
	[AddressBuilding] [varchar](5) NULL,
	[AddressApartment] [varchar](5) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[AddressID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[City]    Script Date: 20.03.2023 7:58:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[City](
	[CityID] [int] NOT NULL,
	[CityName] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CityID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Contract]    Script Date: 20.03.2023 7:58:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contract](
	[ContractID] [int] NOT NULL,
	[ContractAccountNumber] [bigint] NOT NULL,
	[ContractUser] [int] NOT NULL,
	[ContractAmount] [decimal](10, 2) NOT NULL,
	[ContractPeriod] [int] NOT NULL,
	[ContractExpirationDate] [date] NOT NULL,
	[ContractPercent] [float] NOT NULL,
 CONSTRAINT [PK__Договор__A3F77D9B639A927A] PRIMARY KEY CLUSTERED 
(
	[ContractID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OperationHistory]    Script Date: 20.03.2023 7:58:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OperationHistory](
	[OpID] [int] NOT NULL,
	[OpType] [int] NOT NULL,
	[OpTime] [datetime] NOT NULL,
	[OpAmount] [decimal](10, 2) NOT NULL,
	[OpAccount] [bigint] NOT NULL,
 CONSTRAINT [PK__История__BBC8E649E0A992CA] PRIMARY KEY CLUSTERED 
(
	[OpID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OperationType]    Script Date: 20.03.2023 7:58:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OperationType](
	[OpTypeID] [int] NOT NULL,
	[OpTypeName] [varchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[OpTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PassportIssueOrganization]    Script Date: 20.03.2023 7:58:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PassportIssueOrganization](
	[OrgID] [int] NOT NULL,
	[OrgName] [varchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[OrgID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PlaceOfBirth]    Script Date: 20.03.2023 7:58:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PlaceOfBirth](
	[PlaceID] [int] NOT NULL,
	[PlaceCity] [int] NOT NULL,
	[PlaceRegion] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[PlaceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Region]    Script Date: 20.03.2023 7:58:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Region](
	[RegionID] [int] NOT NULL,
	[RegionName] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[RegionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Street]    Script Date: 20.03.2023 7:58:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Street](
	[StreetID] [int] NOT NULL,
	[StreetName] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[StreetID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 20.03.2023 7:58:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [varchar](50) NOT NULL,
	[UserSurname] [varchar](50) NOT NULL,
	[UserPatronymic] [varchar](50) NULL,
	[Серия] [varchar](50) NULL,
	[Номер] [varchar](50) NULL,
	[UserPhone] [varchar](11) NOT NULL,
	[UserAddress] [int] NULL,
	[UserEmail] [varchar](25) NOT NULL,
	[UserPassword] [varchar](50) NOT NULL,
	[ДатаВыдачи] [date] NULL,
	[Выдан] [int] NULL,
	[UserDateOfBirth] [date] NULL,
	[UserPlaceOfBirth] [int] NULL,
 CONSTRAINT [PK__Пользова__90A39CA22E6DBDB0] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Account] ([AccountNumber], [AccountUser], [AccountDateOpen], [AccountBalance], [AccountType]) VALUES (7465986898, 5, CAST(N'2017-07-27' AS Date), CAST(274425.13 AS Decimal(10, 2)), 2)
INSERT [dbo].[Account] ([AccountNumber], [AccountUser], [AccountDateOpen], [AccountBalance], [AccountType]) VALUES (7465986948, 11, CAST(N'2017-08-17' AS Date), CAST(8171.69 AS Decimal(10, 2)), 2)
INSERT [dbo].[Account] ([AccountNumber], [AccountUser], [AccountDateOpen], [AccountBalance], [AccountType]) VALUES (7465986998, 1, CAST(N'2017-06-09' AS Date), CAST(63795.98 AS Decimal(10, 2)), 2)
INSERT [dbo].[Account] ([AccountNumber], [AccountUser], [AccountDateOpen], [AccountBalance], [AccountType]) VALUES (7465987048, 4, CAST(N'2017-08-16' AS Date), CAST(512933.89 AS Decimal(10, 2)), 3)
INSERT [dbo].[Account] ([AccountNumber], [AccountUser], [AccountDateOpen], [AccountBalance], [AccountType]) VALUES (7465987098, 10, CAST(N'2017-08-10' AS Date), CAST(73263.89 AS Decimal(10, 2)), 3)
INSERT [dbo].[Account] ([AccountNumber], [AccountUser], [AccountDateOpen], [AccountBalance], [AccountType]) VALUES (7465987148, 2, CAST(N'2018-01-01' AS Date), CAST(763774.34 AS Decimal(10, 2)), 2)
INSERT [dbo].[Account] ([AccountNumber], [AccountUser], [AccountDateOpen], [AccountBalance], [AccountType]) VALUES (7465987198, 15, CAST(N'2017-09-05' AS Date), CAST(54427.29 AS Decimal(10, 2)), 1)
INSERT [dbo].[Account] ([AccountNumber], [AccountUser], [AccountDateOpen], [AccountBalance], [AccountType]) VALUES (7465987248, 18, CAST(N'2018-03-05' AS Date), CAST(29173.36 AS Decimal(10, 2)), 1)
INSERT [dbo].[Account] ([AccountNumber], [AccountUser], [AccountDateOpen], [AccountBalance], [AccountType]) VALUES (7465987298, 13, CAST(N'2017-09-04' AS Date), CAST(25469.09 AS Decimal(10, 2)), 3)
INSERT [dbo].[Account] ([AccountNumber], [AccountUser], [AccountDateOpen], [AccountBalance], [AccountType]) VALUES (7465987348, 19, CAST(N'2017-10-20' AS Date), CAST(52846.89 AS Decimal(10, 2)), 1)
INSERT [dbo].[Account] ([AccountNumber], [AccountUser], [AccountDateOpen], [AccountBalance], [AccountType]) VALUES (7465987398, 12, CAST(N'2018-03-23' AS Date), CAST(49382.92 AS Decimal(10, 2)), 3)
INSERT [dbo].[Account] ([AccountNumber], [AccountUser], [AccountDateOpen], [AccountBalance], [AccountType]) VALUES (7465987448, 14, CAST(N'2017-05-30' AS Date), CAST(94527.50 AS Decimal(10, 2)), 2)
INSERT [dbo].[Account] ([AccountNumber], [AccountUser], [AccountDateOpen], [AccountBalance], [AccountType]) VALUES (7465987498, 25, CAST(N'2018-01-04' AS Date), CAST(98093.11 AS Decimal(10, 2)), 1)
INSERT [dbo].[Account] ([AccountNumber], [AccountUser], [AccountDateOpen], [AccountBalance], [AccountType]) VALUES (7465987548, 24, CAST(N'2017-11-08' AS Date), CAST(28868.08 AS Decimal(10, 2)), 2)
INSERT [dbo].[Account] ([AccountNumber], [AccountUser], [AccountDateOpen], [AccountBalance], [AccountType]) VALUES (7465987598, 29, CAST(N'2017-09-07' AS Date), CAST(95517.95 AS Decimal(10, 2)), 2)
INSERT [dbo].[Account] ([AccountNumber], [AccountUser], [AccountDateOpen], [AccountBalance], [AccountType]) VALUES (7465987648, 40, CAST(N'2017-09-11' AS Date), CAST(45680.02 AS Decimal(10, 2)), 2)
INSERT [dbo].[Account] ([AccountNumber], [AccountUser], [AccountDateOpen], [AccountBalance], [AccountType]) VALUES (7465987698, 1, CAST(N'2018-03-06' AS Date), CAST(226214.67 AS Decimal(10, 2)), 2)
INSERT [dbo].[Account] ([AccountNumber], [AccountUser], [AccountDateOpen], [AccountBalance], [AccountType]) VALUES (7465987748, 16, CAST(N'2017-10-19' AS Date), CAST(960290.92 AS Decimal(10, 2)), 2)
INSERT [dbo].[Account] ([AccountNumber], [AccountUser], [AccountDateOpen], [AccountBalance], [AccountType]) VALUES (7465987798, 26, CAST(N'2017-09-18' AS Date), CAST(84092.25 AS Decimal(10, 2)), 1)
INSERT [dbo].[Account] ([AccountNumber], [AccountUser], [AccountDateOpen], [AccountBalance], [AccountType]) VALUES (7465987848, 21, CAST(N'2017-05-17' AS Date), CAST(55103.53 AS Decimal(10, 2)), 3)
INSERT [dbo].[Account] ([AccountNumber], [AccountUser], [AccountDateOpen], [AccountBalance], [AccountType]) VALUES (7465987898, 48, CAST(N'2017-06-06' AS Date), CAST(69675.67 AS Decimal(10, 2)), 1)
INSERT [dbo].[Account] ([AccountNumber], [AccountUser], [AccountDateOpen], [AccountBalance], [AccountType]) VALUES (7465987948, 50, CAST(N'2017-06-23' AS Date), CAST(30578.58 AS Decimal(10, 2)), 3)
INSERT [dbo].[Account] ([AccountNumber], [AccountUser], [AccountDateOpen], [AccountBalance], [AccountType]) VALUES (7465987998, 6, CAST(N'2017-10-25' AS Date), CAST(74349.78 AS Decimal(10, 2)), 3)
INSERT [dbo].[Account] ([AccountNumber], [AccountUser], [AccountDateOpen], [AccountBalance], [AccountType]) VALUES (7465988048, 34, CAST(N'2017-08-08' AS Date), CAST(19419.86 AS Decimal(10, 2)), 3)
INSERT [dbo].[Account] ([AccountNumber], [AccountUser], [AccountDateOpen], [AccountBalance], [AccountType]) VALUES (7465988098, 3, CAST(N'2017-11-15' AS Date), CAST(870368.31 AS Decimal(10, 2)), 3)
INSERT [dbo].[Account] ([AccountNumber], [AccountUser], [AccountDateOpen], [AccountBalance], [AccountType]) VALUES (7465988148, 28, CAST(N'2017-09-27' AS Date), CAST(919979.74 AS Decimal(10, 2)), 2)
INSERT [dbo].[Account] ([AccountNumber], [AccountUser], [AccountDateOpen], [AccountBalance], [AccountType]) VALUES (7465988198, 9, CAST(N'2018-02-16' AS Date), CAST(405047.48 AS Decimal(10, 2)), 3)
INSERT [dbo].[Account] ([AccountNumber], [AccountUser], [AccountDateOpen], [AccountBalance], [AccountType]) VALUES (7465988248, 33, CAST(N'2018-02-05' AS Date), CAST(979076.86 AS Decimal(10, 2)), 2)
INSERT [dbo].[Account] ([AccountNumber], [AccountUser], [AccountDateOpen], [AccountBalance], [AccountType]) VALUES (7465988298, 16, CAST(N'2018-02-08' AS Date), CAST(680618.21 AS Decimal(10, 2)), 1)
INSERT [dbo].[Account] ([AccountNumber], [AccountUser], [AccountDateOpen], [AccountBalance], [AccountType]) VALUES (7465988348, 8, CAST(N'2017-03-24' AS Date), CAST(929954.87 AS Decimal(10, 2)), 3)
INSERT [dbo].[Account] ([AccountNumber], [AccountUser], [AccountDateOpen], [AccountBalance], [AccountType]) VALUES (7465988398, 43, CAST(N'2017-11-13' AS Date), CAST(55257.66 AS Decimal(10, 2)), 2)
INSERT [dbo].[Account] ([AccountNumber], [AccountUser], [AccountDateOpen], [AccountBalance], [AccountType]) VALUES (7465988448, 30, CAST(N'2018-02-27' AS Date), CAST(86201.13 AS Decimal(10, 2)), 3)
INSERT [dbo].[Account] ([AccountNumber], [AccountUser], [AccountDateOpen], [AccountBalance], [AccountType]) VALUES (7465988498, 7, CAST(N'2017-06-30' AS Date), CAST(65878.24 AS Decimal(10, 2)), 2)
INSERT [dbo].[Account] ([AccountNumber], [AccountUser], [AccountDateOpen], [AccountBalance], [AccountType]) VALUES (7465988548, 17, CAST(N'2017-06-15' AS Date), CAST(22562.29 AS Decimal(10, 2)), 1)
INSERT [dbo].[Account] ([AccountNumber], [AccountUser], [AccountDateOpen], [AccountBalance], [AccountType]) VALUES (7465988598, 40, CAST(N'2017-10-16' AS Date), CAST(62945.19 AS Decimal(10, 2)), 3)
INSERT [dbo].[Account] ([AccountNumber], [AccountUser], [AccountDateOpen], [AccountBalance], [AccountType]) VALUES (7465988648, 35, CAST(N'2017-09-12' AS Date), CAST(70773.29 AS Decimal(10, 2)), 2)
INSERT [dbo].[Account] ([AccountNumber], [AccountUser], [AccountDateOpen], [AccountBalance], [AccountType]) VALUES (7465988698, 38, CAST(N'2017-04-19' AS Date), CAST(42070.02 AS Decimal(10, 2)), 3)
INSERT [dbo].[Account] ([AccountNumber], [AccountUser], [AccountDateOpen], [AccountBalance], [AccountType]) VALUES (7465988748, 45, CAST(N'2017-11-07' AS Date), CAST(21932.71 AS Decimal(10, 2)), 1)
INSERT [dbo].[Account] ([AccountNumber], [AccountUser], [AccountDateOpen], [AccountBalance], [AccountType]) VALUES (7465988798, 48, CAST(N'2017-06-19' AS Date), CAST(4765.38 AS Decimal(10, 2)), 1)
INSERT [dbo].[Account] ([AccountNumber], [AccountUser], [AccountDateOpen], [AccountBalance], [AccountType]) VALUES (7465988848, 36, CAST(N'2017-04-21' AS Date), CAST(29367.11 AS Decimal(10, 2)), 3)
INSERT [dbo].[Account] ([AccountNumber], [AccountUser], [AccountDateOpen], [AccountBalance], [AccountType]) VALUES (7465988898, 41, CAST(N'2017-12-26' AS Date), CAST(96385.93 AS Decimal(10, 2)), 3)
INSERT [dbo].[Account] ([AccountNumber], [AccountUser], [AccountDateOpen], [AccountBalance], [AccountType]) VALUES (7465988948, 16, CAST(N'2017-04-06' AS Date), CAST(9113.20 AS Decimal(10, 2)), 1)
INSERT [dbo].[Account] ([AccountNumber], [AccountUser], [AccountDateOpen], [AccountBalance], [AccountType]) VALUES (7465988998, 49, CAST(N'2017-09-22' AS Date), CAST(5815.74 AS Decimal(10, 2)), 2)
INSERT [dbo].[Account] ([AccountNumber], [AccountUser], [AccountDateOpen], [AccountBalance], [AccountType]) VALUES (7465989048, 32, CAST(N'2017-06-22' AS Date), CAST(26922.70 AS Decimal(10, 2)), 2)
INSERT [dbo].[Account] ([AccountNumber], [AccountUser], [AccountDateOpen], [AccountBalance], [AccountType]) VALUES (7465989098, 47, CAST(N'2017-09-20' AS Date), CAST(83449.99 AS Decimal(10, 2)), 3)
INSERT [dbo].[Account] ([AccountNumber], [AccountUser], [AccountDateOpen], [AccountBalance], [AccountType]) VALUES (7465989148, 20, CAST(N'2017-10-30' AS Date), CAST(73140.58 AS Decimal(10, 2)), 3)
INSERT [dbo].[Account] ([AccountNumber], [AccountUser], [AccountDateOpen], [AccountBalance], [AccountType]) VALUES (7465989198, 44, CAST(N'2018-03-20' AS Date), CAST(20087.88 AS Decimal(10, 2)), 1)
INSERT [dbo].[Account] ([AccountNumber], [AccountUser], [AccountDateOpen], [AccountBalance], [AccountType]) VALUES (7465989248, 37, CAST(N'2018-01-30' AS Date), CAST(96037.70 AS Decimal(10, 2)), 1)
INSERT [dbo].[Account] ([AccountNumber], [AccountUser], [AccountDateOpen], [AccountBalance], [AccountType]) VALUES (7465989298, 35, CAST(N'2017-05-25' AS Date), CAST(69828.51 AS Decimal(10, 2)), 2)
INSERT [dbo].[Account] ([AccountNumber], [AccountUser], [AccountDateOpen], [AccountBalance], [AccountType]) VALUES (7465989348, 44, CAST(N'2017-12-29' AS Date), CAST(97814.04 AS Decimal(10, 2)), 3)
INSERT [dbo].[Account] ([AccountNumber], [AccountUser], [AccountDateOpen], [AccountBalance], [AccountType]) VALUES (7465989398, 39, CAST(N'2017-06-16' AS Date), CAST(87722.01 AS Decimal(10, 2)), 3)
INSERT [dbo].[Account] ([AccountNumber], [AccountUser], [AccountDateOpen], [AccountBalance], [AccountType]) VALUES (7465989448, 46, CAST(N'2017-06-29' AS Date), CAST(29980.55 AS Decimal(10, 2)), 2)
INSERT [dbo].[Account] ([AccountNumber], [AccountUser], [AccountDateOpen], [AccountBalance], [AccountType]) VALUES (7465989498, 22, CAST(N'2018-01-29' AS Date), CAST(4936.04 AS Decimal(10, 2)), 2)
INSERT [dbo].[Account] ([AccountNumber], [AccountUser], [AccountDateOpen], [AccountBalance], [AccountType]) VALUES (7465989548, 47, CAST(N'2018-03-16' AS Date), CAST(77326.57 AS Decimal(10, 2)), 3)
INSERT [dbo].[Account] ([AccountNumber], [AccountUser], [AccountDateOpen], [AccountBalance], [AccountType]) VALUES (7465989598, 41, CAST(N'2018-01-05' AS Date), CAST(79631.95 AS Decimal(10, 2)), 3)
INSERT [dbo].[Account] ([AccountNumber], [AccountUser], [AccountDateOpen], [AccountBalance], [AccountType]) VALUES (7465989648, 23, CAST(N'2017-08-02' AS Date), CAST(69382.80 AS Decimal(10, 2)), 3)
INSERT [dbo].[Account] ([AccountNumber], [AccountUser], [AccountDateOpen], [AccountBalance], [AccountType]) VALUES (7465989698, 43, CAST(N'2017-05-23' AS Date), CAST(53609.02 AS Decimal(10, 2)), 3)
INSERT [dbo].[Account] ([AccountNumber], [AccountUser], [AccountDateOpen], [AccountBalance], [AccountType]) VALUES (7465989748, 42, CAST(N'2017-10-11' AS Date), CAST(40371.40 AS Decimal(10, 2)), 2)
INSERT [dbo].[Account] ([AccountNumber], [AccountUser], [AccountDateOpen], [AccountBalance], [AccountType]) VALUES (7465989798, 31, CAST(N'2018-03-19' AS Date), CAST(47.87 AS Decimal(10, 2)), 1)
INSERT [dbo].[Account] ([AccountNumber], [AccountUser], [AccountDateOpen], [AccountBalance], [AccountType]) VALUES (7465989848, 27, CAST(N'2018-01-24' AS Date), CAST(14421.26 AS Decimal(10, 2)), 3)
GO
INSERT [dbo].[AccountType] ([AccTypeID], [AccTypeName]) VALUES (1, N'Кредитный')
INSERT [dbo].[AccountType] ([AccTypeID], [AccTypeName]) VALUES (2, N'Дебетовый')
INSERT [dbo].[AccountType] ([AccTypeID], [AccTypeName]) VALUES (3, N'Депозитный')
GO
INSERT [dbo].[Address] ([AddressID], [AddressStreet], [AddressHouse], [AddressBuilding], [AddressApartment]) VALUES (1, 1, N'25', N'', N'8')
INSERT [dbo].[Address] ([AddressID], [AddressStreet], [AddressHouse], [AddressBuilding], [AddressApartment]) VALUES (2, 2, N'1', N'', N'56')
INSERT [dbo].[Address] ([AddressID], [AddressStreet], [AddressHouse], [AddressBuilding], [AddressApartment]) VALUES (3, 3, N'9', N'', N'168')
INSERT [dbo].[Address] ([AddressID], [AddressStreet], [AddressHouse], [AddressBuilding], [AddressApartment]) VALUES (4, 4, N'52', N'2', N'52')
INSERT [dbo].[Address] ([AddressID], [AddressStreet], [AddressHouse], [AddressBuilding], [AddressApartment]) VALUES (5, 5, N'78', N'', N'63')
INSERT [dbo].[Address] ([AddressID], [AddressStreet], [AddressHouse], [AddressBuilding], [AddressApartment]) VALUES (6, 6, N'20', N'', N'45')
INSERT [dbo].[Address] ([AddressID], [AddressStreet], [AddressHouse], [AddressBuilding], [AddressApartment]) VALUES (7, 7, N'7', N'', N'36')
INSERT [dbo].[Address] ([AddressID], [AddressStreet], [AddressHouse], [AddressBuilding], [AddressApartment]) VALUES (8, 8, N'12', N'', N'157')
INSERT [dbo].[Address] ([AddressID], [AddressStreet], [AddressHouse], [AddressBuilding], [AddressApartment]) VALUES (9, 9, N'85', N'', N'69')
INSERT [dbo].[Address] ([AddressID], [AddressStreet], [AddressHouse], [AddressBuilding], [AddressApartment]) VALUES (10, 10, N'45', N'', N'49')
INSERT [dbo].[Address] ([AddressID], [AddressStreet], [AddressHouse], [AddressBuilding], [AddressApartment]) VALUES (11, 11, N'2', N'3', N'74')
INSERT [dbo].[Address] ([AddressID], [AddressStreet], [AddressHouse], [AddressBuilding], [AddressApartment]) VALUES (12, 12, N'74', N'', N'175')
INSERT [dbo].[Address] ([AddressID], [AddressStreet], [AddressHouse], [AddressBuilding], [AddressApartment]) VALUES (13, 13, N'4', N'5', N'95')
INSERT [dbo].[Address] ([AddressID], [AddressStreet], [AddressHouse], [AddressBuilding], [AddressApartment]) VALUES (14, 14, N'13', N'', N'198')
INSERT [dbo].[Address] ([AddressID], [AddressStreet], [AddressHouse], [AddressBuilding], [AddressApartment]) VALUES (15, 15, N'10', N'', N'216')
INSERT [dbo].[Address] ([AddressID], [AddressStreet], [AddressHouse], [AddressBuilding], [AddressApartment]) VALUES (16, 16, N'32', N'2', N'42')
INSERT [dbo].[Address] ([AddressID], [AddressStreet], [AddressHouse], [AddressBuilding], [AddressApartment]) VALUES (17, 17, N'8', N'', N'15')
INSERT [dbo].[Address] ([AddressID], [AddressStreet], [AddressHouse], [AddressBuilding], [AddressApartment]) VALUES (18, 18, N'9', N'', N'85')
INSERT [dbo].[Address] ([AddressID], [AddressStreet], [AddressHouse], [AddressBuilding], [AddressApartment]) VALUES (19, 19, N'6', N'', N'47')
INSERT [dbo].[Address] ([AddressID], [AddressStreet], [AddressHouse], [AddressBuilding], [AddressApartment]) VALUES (20, 20, N'2', N'', N'75')
INSERT [dbo].[Address] ([AddressID], [AddressStreet], [AddressHouse], [AddressBuilding], [AddressApartment]) VALUES (21, 21, N'6', N'', N'65')
INSERT [dbo].[Address] ([AddressID], [AddressStreet], [AddressHouse], [AddressBuilding], [AddressApartment]) VALUES (22, 22, N'16', N'', N'167')
INSERT [dbo].[Address] ([AddressID], [AddressStreet], [AddressHouse], [AddressBuilding], [AddressApartment]) VALUES (23, 23, N'36', N'3', N'45')
INSERT [dbo].[Address] ([AddressID], [AddressStreet], [AddressHouse], [AddressBuilding], [AddressApartment]) VALUES (24, 24, N'3', N'', N'115')
INSERT [dbo].[Address] ([AddressID], [AddressStreet], [AddressHouse], [AddressBuilding], [AddressApartment]) VALUES (25, 25, N'42', N'', N'128')
INSERT [dbo].[Address] ([AddressID], [AddressStreet], [AddressHouse], [AddressBuilding], [AddressApartment]) VALUES (26, 26, N'168', N'', N'42')
INSERT [dbo].[Address] ([AddressID], [AddressStreet], [AddressHouse], [AddressBuilding], [AddressApartment]) VALUES (27, 27, N'1', N'', N'95')
INSERT [dbo].[Address] ([AddressID], [AddressStreet], [AddressHouse], [AddressBuilding], [AddressApartment]) VALUES (28, 28, N'6', N'', N'53')
INSERT [dbo].[Address] ([AddressID], [AddressStreet], [AddressHouse], [AddressBuilding], [AddressApartment]) VALUES (29, 29, N'74', N'', N'132')
INSERT [dbo].[Address] ([AddressID], [AddressStreet], [AddressHouse], [AddressBuilding], [AddressApartment]) VALUES (30, 30, N'65', N'', N'32')
INSERT [dbo].[Address] ([AddressID], [AddressStreet], [AddressHouse], [AddressBuilding], [AddressApartment]) VALUES (31, 31, N'42', N'', N'213')
INSERT [dbo].[Address] ([AddressID], [AddressStreet], [AddressHouse], [AddressBuilding], [AddressApartment]) VALUES (32, 32, N'2', N'', N'52')
INSERT [dbo].[Address] ([AddressID], [AddressStreet], [AddressHouse], [AddressBuilding], [AddressApartment]) VALUES (33, 33, N'3', N'4', N'154')
INSERT [dbo].[Address] ([AddressID], [AddressStreet], [AddressHouse], [AddressBuilding], [AddressApartment]) VALUES (34, 34, N'62', N'', N'123')
INSERT [dbo].[Address] ([AddressID], [AddressStreet], [AddressHouse], [AddressBuilding], [AddressApartment]) VALUES (35, 35, N'52', N'', N'32')
INSERT [dbo].[Address] ([AddressID], [AddressStreet], [AddressHouse], [AddressBuilding], [AddressApartment]) VALUES (36, 36, N'2', N'', N'16')
INSERT [dbo].[Address] ([AddressID], [AddressStreet], [AddressHouse], [AddressBuilding], [AddressApartment]) VALUES (37, 37, N'6', N'', N'28')
INSERT [dbo].[Address] ([AddressID], [AddressStreet], [AddressHouse], [AddressBuilding], [AddressApartment]) VALUES (38, 38, N'34', N'', N'79')
INSERT [dbo].[Address] ([AddressID], [AddressStreet], [AddressHouse], [AddressBuilding], [AddressApartment]) VALUES (39, 39, N'165', N'', N'82')
INSERT [dbo].[Address] ([AddressID], [AddressStreet], [AddressHouse], [AddressBuilding], [AddressApartment]) VALUES (40, 40, N'19', N'', N'94')
INSERT [dbo].[Address] ([AddressID], [AddressStreet], [AddressHouse], [AddressBuilding], [AddressApartment]) VALUES (41, 41, N'40', N'', N'95')
INSERT [dbo].[Address] ([AddressID], [AddressStreet], [AddressHouse], [AddressBuilding], [AddressApartment]) VALUES (42, 42, N'31', N'', N'4')
INSERT [dbo].[Address] ([AddressID], [AddressStreet], [AddressHouse], [AddressBuilding], [AddressApartment]) VALUES (43, 43, N'75', N'', N'165')
INSERT [dbo].[Address] ([AddressID], [AddressStreet], [AddressHouse], [AddressBuilding], [AddressApartment]) VALUES (44, 44, N'46', N'', N'69')
INSERT [dbo].[Address] ([AddressID], [AddressStreet], [AddressHouse], [AddressBuilding], [AddressApartment]) VALUES (45, 45, N'3', N'1', N'177')
INSERT [dbo].[Address] ([AddressID], [AddressStreet], [AddressHouse], [AddressBuilding], [AddressApartment]) VALUES (46, 46, N'5', N'', N'132')
INSERT [dbo].[Address] ([AddressID], [AddressStreet], [AddressHouse], [AddressBuilding], [AddressApartment]) VALUES (47, 47, N'3', N'', N'28')
INSERT [dbo].[Address] ([AddressID], [AddressStreet], [AddressHouse], [AddressBuilding], [AddressApartment]) VALUES (48, 48, N'6', N'', N'30')
INSERT [dbo].[Address] ([AddressID], [AddressStreet], [AddressHouse], [AddressBuilding], [AddressApartment]) VALUES (49, 49, N'9', N'', N'74')
INSERT [dbo].[Address] ([AddressID], [AddressStreet], [AddressHouse], [AddressBuilding], [AddressApartment]) VALUES (50, 50, N'7', N'', N'36')
GO
INSERT [dbo].[City] ([CityID], [CityName]) VALUES (1, N'Приморск')
INSERT [dbo].[City] ([CityID], [CityName]) VALUES (2, N'Киров')
INSERT [dbo].[City] ([CityID], [CityName]) VALUES (3, N'Радужный')
INSERT [dbo].[City] ([CityID], [CityName]) VALUES (4, N'Красноармейск')
INSERT [dbo].[City] ([CityID], [CityName]) VALUES (5, N'Краснознаменск')
INSERT [dbo].[City] ([CityID], [CityName]) VALUES (6, N'Краснослободск')
INSERT [dbo].[City] ([CityID], [CityName]) VALUES (7, N'Благовещенск')
INSERT [dbo].[City] ([CityID], [CityName]) VALUES (8, N'Сергиев Посад')
INSERT [dbo].[City] ([CityID], [CityName]) VALUES (9, N'Советск')
INSERT [dbo].[City] ([CityID], [CityName]) VALUES (10, N'Ставрополь')
INSERT [dbo].[City] ([CityID], [CityName]) VALUES (11, N'Лобня')
INSERT [dbo].[City] ([CityID], [CityName]) VALUES (12, N'Тюмень')
INSERT [dbo].[City] ([CityID], [CityName]) VALUES (13, N'Никольск')
INSERT [dbo].[City] ([CityID], [CityName]) VALUES (14, N'Заречный')
INSERT [dbo].[City] ([CityID], [CityName]) VALUES (15, N'Озёрск')
INSERT [dbo].[City] ([CityID], [CityName]) VALUES (16, N'Орёл')
INSERT [dbo].[City] ([CityID], [CityName]) VALUES (17, N'Дмитров')
INSERT [dbo].[City] ([CityID], [CityName]) VALUES (18, N'Волгоград')
INSERT [dbo].[City] ([CityID], [CityName]) VALUES (19, N'Санкт-Петербург')
INSERT [dbo].[City] ([CityID], [CityName]) VALUES (20, N'Новосибирск')
INSERT [dbo].[City] ([CityID], [CityName]) VALUES (21, N'Екатеринбург')
INSERT [dbo].[City] ([CityID], [CityName]) VALUES (22, N'Москва')
INSERT [dbo].[City] ([CityID], [CityName]) VALUES (23, N'Казань')
INSERT [dbo].[City] ([CityID], [CityName]) VALUES (24, N'Самара')
INSERT [dbo].[City] ([CityID], [CityName]) VALUES (25, N'Челябинск')
INSERT [dbo].[City] ([CityID], [CityName]) VALUES (26, N'Омск')
INSERT [dbo].[City] ([CityID], [CityName]) VALUES (27, N'Ростов-на-Дону')
INSERT [dbo].[City] ([CityID], [CityName]) VALUES (28, N'Уфа')
GO
INSERT [dbo].[Contract] ([ContractID], [ContractAccountNumber], [ContractUser], [ContractAmount], [ContractPeriod], [ContractExpirationDate], [ContractPercent]) VALUES (1, 7465987048, 4, CAST(9243406.00 AS Decimal(10, 2)), 514, CAST(N'2018-12-23' AS Date), 5.45)
INSERT [dbo].[Contract] ([ContractID], [ContractAccountNumber], [ContractUser], [ContractAmount], [ContractPeriod], [ContractExpirationDate], [ContractPercent]) VALUES (2, 7465987098, 10, CAST(9262312.00 AS Decimal(10, 2)), 1806, CAST(N'2022-07-28' AS Date), 7.01)
INSERT [dbo].[Contract] ([ContractID], [ContractAccountNumber], [ContractUser], [ContractAmount], [ContractPeriod], [ContractExpirationDate], [ContractPercent]) VALUES (3, 7465987298, 13, CAST(7674776.00 AS Decimal(10, 2)), 538, CAST(N'2018-11-29' AS Date), 7.24)
INSERT [dbo].[Contract] ([ContractID], [ContractAccountNumber], [ContractUser], [ContractAmount], [ContractPeriod], [ContractExpirationDate], [ContractPercent]) VALUES (4, 7465987398, 12, CAST(4300921.00 AS Decimal(10, 2)), 1158, CAST(N'2020-10-17' AS Date), 7.09)
INSERT [dbo].[Contract] ([ContractID], [ContractAccountNumber], [ContractUser], [ContractAmount], [ContractPeriod], [ContractExpirationDate], [ContractPercent]) VALUES (5, 7465987848, 21, CAST(5930501.00 AS Decimal(10, 2)), 1404, CAST(N'2021-06-14' AS Date), 7.72)
INSERT [dbo].[Contract] ([ContractID], [ContractAccountNumber], [ContractUser], [ContractAmount], [ContractPeriod], [ContractExpirationDate], [ContractPercent]) VALUES (6, 7465987948, 50, CAST(8768245.00 AS Decimal(10, 2)), 1757, CAST(N'2022-10-24' AS Date), 5.26)
INSERT [dbo].[Contract] ([ContractID], [ContractAccountNumber], [ContractUser], [ContractAmount], [ContractPeriod], [ContractExpirationDate], [ContractPercent]) VALUES (7, 7465987998, 6, CAST(9636413.00 AS Decimal(10, 2)), 1415, CAST(N'2021-07-21' AS Date), 7.91)
INSERT [dbo].[Contract] ([ContractID], [ContractAccountNumber], [ContractUser], [ContractAmount], [ContractPeriod], [ContractExpirationDate], [ContractPercent]) VALUES (8, 7465988048, 34, CAST(4846960.00 AS Decimal(10, 2)), 1776, CAST(N'2023-01-14' AS Date), 7.66)
INSERT [dbo].[Contract] ([ContractID], [ContractAccountNumber], [ContractUser], [ContractAmount], [ContractPeriod], [ContractExpirationDate], [ContractPercent]) VALUES (9, 7465988098, 3, CAST(2264676.00 AS Decimal(10, 2)), 1292, CAST(N'2021-03-19' AS Date), 5.02)
INSERT [dbo].[Contract] ([ContractID], [ContractAccountNumber], [ContractUser], [ContractAmount], [ContractPeriod], [ContractExpirationDate], [ContractPercent]) VALUES (10, 7465988198, 9, CAST(3246609.00 AS Decimal(10, 2)), 850, CAST(N'2020-02-17' AS Date), 6.07)
INSERT [dbo].[Contract] ([ContractID], [ContractAccountNumber], [ContractUser], [ContractAmount], [ContractPeriod], [ContractExpirationDate], [ContractPercent]) VALUES (11, 7465988348, 8, CAST(8065098.00 AS Decimal(10, 2)), 1233, CAST(N'2021-08-07' AS Date), 5.3)
INSERT [dbo].[Contract] ([ContractID], [ContractAccountNumber], [ContractUser], [ContractAmount], [ContractPeriod], [ContractExpirationDate], [ContractPercent]) VALUES (12, 7465988448, 30, CAST(2503709.00 AS Decimal(10, 2)), 1491, CAST(N'2021-06-29' AS Date), 7.61)
INSERT [dbo].[Contract] ([ContractID], [ContractAccountNumber], [ContractUser], [ContractAmount], [ContractPeriod], [ContractExpirationDate], [ContractPercent]) VALUES (13, 7465988598, 40, CAST(2063445.00 AS Decimal(10, 2)), 1525, CAST(N'2022-03-09' AS Date), 5.66)
INSERT [dbo].[Contract] ([ContractID], [ContractAccountNumber], [ContractUser], [ContractAmount], [ContractPeriod], [ContractExpirationDate], [ContractPercent]) VALUES (14, 7465988698, 38, CAST(3887739.00 AS Decimal(10, 2)), 361, CAST(N'2018-11-04' AS Date), 7.95)
INSERT [dbo].[Contract] ([ContractID], [ContractAccountNumber], [ContractUser], [ContractAmount], [ContractPeriod], [ContractExpirationDate], [ContractPercent]) VALUES (15, 7465988848, 36, CAST(1648472.00 AS Decimal(10, 2)), 272, CAST(N'2018-06-06' AS Date), 7.74)
INSERT [dbo].[Contract] ([ContractID], [ContractAccountNumber], [ContractUser], [ContractAmount], [ContractPeriod], [ContractExpirationDate], [ContractPercent]) VALUES (16, 7465988898, 41, CAST(4565138.00 AS Decimal(10, 2)), 608, CAST(N'2019-05-12' AS Date), 6.85)
INSERT [dbo].[Contract] ([ContractID], [ContractAccountNumber], [ContractUser], [ContractAmount], [ContractPeriod], [ContractExpirationDate], [ContractPercent]) VALUES (17, 7465989098, 47, CAST(3207607.00 AS Decimal(10, 2)), 530, CAST(N'2019-08-18' AS Date), 5.8)
INSERT [dbo].[Contract] ([ContractID], [ContractAccountNumber], [ContractUser], [ContractAmount], [ContractPeriod], [ContractExpirationDate], [ContractPercent]) VALUES (18, 7465989148, 20, CAST(1730227.00 AS Decimal(10, 2)), 1784, CAST(N'2022-09-07' AS Date), 7.86)
INSERT [dbo].[Contract] ([ContractID], [ContractAccountNumber], [ContractUser], [ContractAmount], [ContractPeriod], [ContractExpirationDate], [ContractPercent]) VALUES (19, 7465989348, 44, CAST(6069953.00 AS Decimal(10, 2)), 646, CAST(N'2019-06-26' AS Date), 7.14)
INSERT [dbo].[Contract] ([ContractID], [ContractAccountNumber], [ContractUser], [ContractAmount], [ContractPeriod], [ContractExpirationDate], [ContractPercent]) VALUES (20, 7465989398, 39, CAST(8073914.00 AS Decimal(10, 2)), 1003, CAST(N'2020-02-14' AS Date), 6.48)
INSERT [dbo].[Contract] ([ContractID], [ContractAccountNumber], [ContractUser], [ContractAmount], [ContractPeriod], [ContractExpirationDate], [ContractPercent]) VALUES (21, 7465989548, 47, CAST(6581384.00 AS Decimal(10, 2)), 732, CAST(N'2019-06-08' AS Date), 5.48)
INSERT [dbo].[Contract] ([ContractID], [ContractAccountNumber], [ContractUser], [ContractAmount], [ContractPeriod], [ContractExpirationDate], [ContractPercent]) VALUES (22, 7465989598, 41, CAST(4124064.00 AS Decimal(10, 2)), 1799, CAST(N'2022-05-27' AS Date), 7.66)
INSERT [dbo].[Contract] ([ContractID], [ContractAccountNumber], [ContractUser], [ContractAmount], [ContractPeriod], [ContractExpirationDate], [ContractPercent]) VALUES (23, 7465989648, 23, CAST(6078127.00 AS Decimal(10, 2)), 1774, CAST(N'2022-09-03' AS Date), 5.97)
INSERT [dbo].[Contract] ([ContractID], [ContractAccountNumber], [ContractUser], [ContractAmount], [ContractPeriod], [ContractExpirationDate], [ContractPercent]) VALUES (24, 7465989698, 43, CAST(8432956.00 AS Decimal(10, 2)), 1007, CAST(N'2020-05-11' AS Date), 7.18)
INSERT [dbo].[Contract] ([ContractID], [ContractAccountNumber], [ContractUser], [ContractAmount], [ContractPeriod], [ContractExpirationDate], [ContractPercent]) VALUES (25, 7465989848, 27, CAST(7252815.00 AS Decimal(10, 2)), 1482, CAST(N'2021-12-06' AS Date), 7.83)
GO
INSERT [dbo].[OperationHistory] ([OpID], [OpType], [OpTime], [OpAmount], [OpAccount]) VALUES (1, 1, CAST(N'2018-04-07T00:00:00.000' AS DateTime), CAST(3084.00 AS Decimal(10, 2)), 7465986898)
INSERT [dbo].[OperationHistory] ([OpID], [OpType], [OpTime], [OpAmount], [OpAccount]) VALUES (2, 2, CAST(N'2018-04-11T00:00:00.000' AS DateTime), CAST(5600.00 AS Decimal(10, 2)), 7465986948)
INSERT [dbo].[OperationHistory] ([OpID], [OpType], [OpTime], [OpAmount], [OpAccount]) VALUES (3, 1, CAST(N'2018-03-24T00:00:00.000' AS DateTime), CAST(338.00 AS Decimal(10, 2)), 7465986898)
INSERT [dbo].[OperationHistory] ([OpID], [OpType], [OpTime], [OpAmount], [OpAccount]) VALUES (4, 1, CAST(N'2018-04-10T00:00:00.000' AS DateTime), CAST(3559.00 AS Decimal(10, 2)), 7465987448)
INSERT [dbo].[OperationHistory] ([OpID], [OpType], [OpTime], [OpAmount], [OpAccount]) VALUES (5, 1, CAST(N'2018-04-03T00:00:00.000' AS DateTime), CAST(2267.00 AS Decimal(10, 2)), 7465987198)
INSERT [dbo].[OperationHistory] ([OpID], [OpType], [OpTime], [OpAmount], [OpAccount]) VALUES (6, 2, CAST(N'2018-03-29T00:00:00.000' AS DateTime), CAST(5700.00 AS Decimal(10, 2)), 7465986998)
INSERT [dbo].[OperationHistory] ([OpID], [OpType], [OpTime], [OpAmount], [OpAccount]) VALUES (7, 2, CAST(N'2018-04-04T00:00:00.000' AS DateTime), CAST(8700.00 AS Decimal(10, 2)), 7465987048)
INSERT [dbo].[OperationHistory] ([OpID], [OpType], [OpTime], [OpAmount], [OpAccount]) VALUES (8, 2, CAST(N'2018-04-09T00:00:00.000' AS DateTime), CAST(5550.00 AS Decimal(10, 2)), 7465987098)
INSERT [dbo].[OperationHistory] ([OpID], [OpType], [OpTime], [OpAmount], [OpAccount]) VALUES (9, 1, CAST(N'2018-03-28T00:00:00.000' AS DateTime), CAST(820.00 AS Decimal(10, 2)), 7465987148)
INSERT [dbo].[OperationHistory] ([OpID], [OpType], [OpTime], [OpAmount], [OpAccount]) VALUES (10, 1, CAST(N'2018-04-06T00:00:00.000' AS DateTime), CAST(7476.00 AS Decimal(10, 2)), 7465987398)
INSERT [dbo].[OperationHistory] ([OpID], [OpType], [OpTime], [OpAmount], [OpAccount]) VALUES (11, 2, CAST(N'2018-03-29T00:00:00.000' AS DateTime), CAST(3600.00 AS Decimal(10, 2)), 7465987248)
INSERT [dbo].[OperationHistory] ([OpID], [OpType], [OpTime], [OpAmount], [OpAccount]) VALUES (12, 1, CAST(N'2018-04-06T00:00:00.000' AS DateTime), CAST(9267.00 AS Decimal(10, 2)), 7465987248)
INSERT [dbo].[OperationHistory] ([OpID], [OpType], [OpTime], [OpAmount], [OpAccount]) VALUES (13, 1, CAST(N'2018-03-24T00:00:00.000' AS DateTime), CAST(6321.00 AS Decimal(10, 2)), 7465987298)
INSERT [dbo].[OperationHistory] ([OpID], [OpType], [OpTime], [OpAmount], [OpAccount]) VALUES (14, 1, CAST(N'2018-03-30T00:00:00.000' AS DateTime), CAST(5949.00 AS Decimal(10, 2)), 7465987348)
INSERT [dbo].[OperationHistory] ([OpID], [OpType], [OpTime], [OpAmount], [OpAccount]) VALUES (15, 2, CAST(N'2018-03-26T00:00:00.000' AS DateTime), CAST(8500.00 AS Decimal(10, 2)), 7465987398)
INSERT [dbo].[OperationHistory] ([OpID], [OpType], [OpTime], [OpAmount], [OpAccount]) VALUES (16, 2, CAST(N'2018-04-09T00:00:00.000' AS DateTime), CAST(6050.00 AS Decimal(10, 2)), 7465987848)
INSERT [dbo].[OperationHistory] ([OpID], [OpType], [OpTime], [OpAmount], [OpAccount]) VALUES (17, 2, CAST(N'2018-04-10T00:00:00.000' AS DateTime), CAST(8200.00 AS Decimal(10, 2)), 7465987498)
INSERT [dbo].[OperationHistory] ([OpID], [OpType], [OpTime], [OpAmount], [OpAccount]) VALUES (18, 1, CAST(N'2018-03-27T00:00:00.000' AS DateTime), CAST(5013.00 AS Decimal(10, 2)), 7465987548)
INSERT [dbo].[OperationHistory] ([OpID], [OpType], [OpTime], [OpAmount], [OpAccount]) VALUES (19, 1, CAST(N'2018-04-02T00:00:00.000' AS DateTime), CAST(8571.00 AS Decimal(10, 2)), 7465987598)
INSERT [dbo].[OperationHistory] ([OpID], [OpType], [OpTime], [OpAmount], [OpAccount]) VALUES (20, 1, CAST(N'2018-03-25T00:00:00.000' AS DateTime), CAST(9569.00 AS Decimal(10, 2)), 7465987648)
INSERT [dbo].[OperationHistory] ([OpID], [OpType], [OpTime], [OpAmount], [OpAccount]) VALUES (21, 2, CAST(N'2018-04-09T00:00:00.000' AS DateTime), CAST(7900.00 AS Decimal(10, 2)), 7465987698)
INSERT [dbo].[OperationHistory] ([OpID], [OpType], [OpTime], [OpAmount], [OpAccount]) VALUES (22, 2, CAST(N'2018-04-10T00:00:00.000' AS DateTime), CAST(1700.00 AS Decimal(10, 2)), 7465987748)
INSERT [dbo].[OperationHistory] ([OpID], [OpType], [OpTime], [OpAmount], [OpAccount]) VALUES (23, 1, CAST(N'2018-03-29T00:00:00.000' AS DateTime), CAST(7441.00 AS Decimal(10, 2)), 7465987798)
INSERT [dbo].[OperationHistory] ([OpID], [OpType], [OpTime], [OpAmount], [OpAccount]) VALUES (24, 2, CAST(N'2018-03-27T00:00:00.000' AS DateTime), CAST(9750.00 AS Decimal(10, 2)), 7465987848)
INSERT [dbo].[OperationHistory] ([OpID], [OpType], [OpTime], [OpAmount], [OpAccount]) VALUES (25, 1, CAST(N'2018-03-25T00:00:00.000' AS DateTime), CAST(1112.00 AS Decimal(10, 2)), 7465987898)
INSERT [dbo].[OperationHistory] ([OpID], [OpType], [OpTime], [OpAmount], [OpAccount]) VALUES (26, 2, CAST(N'2018-04-03T00:00:00.000' AS DateTime), CAST(9400.00 AS Decimal(10, 2)), 7465987948)
INSERT [dbo].[OperationHistory] ([OpID], [OpType], [OpTime], [OpAmount], [OpAccount]) VALUES (27, 2, CAST(N'2018-03-24T00:00:00.000' AS DateTime), CAST(4550.00 AS Decimal(10, 2)), 7465987998)
INSERT [dbo].[OperationHistory] ([OpID], [OpType], [OpTime], [OpAmount], [OpAccount]) VALUES (28, 2, CAST(N'2018-03-28T00:00:00.000' AS DateTime), CAST(300.00 AS Decimal(10, 2)), 7465988048)
INSERT [dbo].[OperationHistory] ([OpID], [OpType], [OpTime], [OpAmount], [OpAccount]) VALUES (29, 1, CAST(N'2018-03-30T00:00:00.000' AS DateTime), CAST(8414.00 AS Decimal(10, 2)), 7465988098)
INSERT [dbo].[OperationHistory] ([OpID], [OpType], [OpTime], [OpAmount], [OpAccount]) VALUES (30, 1, CAST(N'2018-04-07T00:00:00.000' AS DateTime), CAST(474.00 AS Decimal(10, 2)), 7465988148)
INSERT [dbo].[OperationHistory] ([OpID], [OpType], [OpTime], [OpAmount], [OpAccount]) VALUES (31, 2, CAST(N'2018-04-05T00:00:00.000' AS DateTime), CAST(7400.00 AS Decimal(10, 2)), 7465988198)
INSERT [dbo].[OperationHistory] ([OpID], [OpType], [OpTime], [OpAmount], [OpAccount]) VALUES (32, 1, CAST(N'2018-04-09T00:00:00.000' AS DateTime), CAST(6955.00 AS Decimal(10, 2)), 7465988248)
INSERT [dbo].[OperationHistory] ([OpID], [OpType], [OpTime], [OpAmount], [OpAccount]) VALUES (33, 2, CAST(N'2018-03-24T00:00:00.000' AS DateTime), CAST(1000.00 AS Decimal(10, 2)), 7465988298)
INSERT [dbo].[OperationHistory] ([OpID], [OpType], [OpTime], [OpAmount], [OpAccount]) VALUES (34, 2, CAST(N'2018-04-08T00:00:00.000' AS DateTime), CAST(9200.00 AS Decimal(10, 2)), 7465988348)
INSERT [dbo].[OperationHistory] ([OpID], [OpType], [OpTime], [OpAmount], [OpAccount]) VALUES (35, 1, CAST(N'2018-04-07T00:00:00.000' AS DateTime), CAST(9254.00 AS Decimal(10, 2)), 7465988398)
INSERT [dbo].[OperationHistory] ([OpID], [OpType], [OpTime], [OpAmount], [OpAccount]) VALUES (36, 2, CAST(N'2018-03-27T00:00:00.000' AS DateTime), CAST(9800.00 AS Decimal(10, 2)), 7465988448)
INSERT [dbo].[OperationHistory] ([OpID], [OpType], [OpTime], [OpAmount], [OpAccount]) VALUES (37, 2, CAST(N'2018-03-25T00:00:00.000' AS DateTime), CAST(6000.00 AS Decimal(10, 2)), 7465988498)
INSERT [dbo].[OperationHistory] ([OpID], [OpType], [OpTime], [OpAmount], [OpAccount]) VALUES (38, 1, CAST(N'2018-04-01T00:00:00.000' AS DateTime), CAST(7754.00 AS Decimal(10, 2)), 7465988548)
INSERT [dbo].[OperationHistory] ([OpID], [OpType], [OpTime], [OpAmount], [OpAccount]) VALUES (39, 2, CAST(N'2018-04-04T00:00:00.000' AS DateTime), CAST(4200.00 AS Decimal(10, 2)), 7465988398)
INSERT [dbo].[OperationHistory] ([OpID], [OpType], [OpTime], [OpAmount], [OpAccount]) VALUES (40, 1, CAST(N'2018-03-28T00:00:00.000' AS DateTime), CAST(8257.00 AS Decimal(10, 2)), 7465987848)
GO
INSERT [dbo].[OperationType] ([OpTypeID], [OpTypeName]) VALUES (1, N'Снятие')
INSERT [dbo].[OperationType] ([OpTypeID], [OpTypeName]) VALUES (2, N'Пополнение')
GO
INSERT [dbo].[PassportIssueOrganization] ([OrgID], [OrgName]) VALUES (1, N'Отделение по району Арбат ОУФМС России по городу Москве в ЦАО')
INSERT [dbo].[PassportIssueOrganization] ([OrgID], [OrgName]) VALUES (2, N'Отделение по району Таганский ОУФМС России по городу Москве в ЦАО')
INSERT [dbo].[PassportIssueOrganization] ([OrgID], [OrgName]) VALUES (3, N'Отделение по району Тверской ОУФМС России по городу Москве в ЦАО')
INSERT [dbo].[PassportIssueOrganization] ([OrgID], [OrgName]) VALUES (4, N'Отделение по району Беговой ОУФМС России по городу Москве в САО')
INSERT [dbo].[PassportIssueOrganization] ([OrgID], [OrgName]) VALUES (5, N'Отделение по району Бескудниковский ОУФМС России по городу Москве в САО')
INSERT [dbo].[PassportIssueOrganization] ([OrgID], [OrgName]) VALUES (6, N'Отделение по району Коптево ОУФМС России по городу Москве в САО')
INSERT [dbo].[PassportIssueOrganization] ([OrgID], [OrgName]) VALUES (7, N'Отделение по району Левобережный ОУФМС России по городу Москве в САО')
INSERT [dbo].[PassportIssueOrganization] ([OrgID], [OrgName]) VALUES (8, N'Отделение по району Молжаниновский ОУФМС России по городу Москве в САО')
INSERT [dbo].[PassportIssueOrganization] ([OrgID], [OrgName]) VALUES (9, N'Отделение по району Савёловский ОУФМС России по городу Москве в САО')
INSERT [dbo].[PassportIssueOrganization] ([OrgID], [OrgName]) VALUES (10, N'Отделение по району Тимирязевский ОУФМС России по городу Москве в САО')
INSERT [dbo].[PassportIssueOrganization] ([OrgID], [OrgName]) VALUES (11, N'Отделение по району Ховрино ОУФМС России по городу Москве в САО')
INSERT [dbo].[PassportIssueOrganization] ([OrgID], [OrgName]) VALUES (12, N'Отделение по району Хорошёвский ОУФМС России по городу Москве в САО')
INSERT [dbo].[PassportIssueOrganization] ([OrgID], [OrgName]) VALUES (13, N'Отделение по району Алексеевский ОУФМС России по городу Москве в СВАО')
INSERT [dbo].[PassportIssueOrganization] ([OrgID], [OrgName]) VALUES (14, N'Отделение по району Бабушкинский ОУФМС России по городу Москве в СВАО')
INSERT [dbo].[PassportIssueOrganization] ([OrgID], [OrgName]) VALUES (15, N'Отделение по району Марфино ОУФМС России по городу Москве в СВАО')
INSERT [dbo].[PassportIssueOrganization] ([OrgID], [OrgName]) VALUES (16, N'Отделение по району Бибирево ОУФМС России по городу Москве в СВАО')
INSERT [dbo].[PassportIssueOrganization] ([OrgID], [OrgName]) VALUES (17, N'Отделение по району Бутырский ОУФМС России по городу Москве в СВАО')
INSERT [dbo].[PassportIssueOrganization] ([OrgID], [OrgName]) VALUES (18, N'Отделение по району Останкинский ОУФМС России по городу Москве в СВАО')
INSERT [dbo].[PassportIssueOrganization] ([OrgID], [OrgName]) VALUES (19, N'Отделение по району Отрадное ОУФМС России по городу Москве в СВАО')
INSERT [dbo].[PassportIssueOrganization] ([OrgID], [OrgName]) VALUES (20, N'Отделение по району Свиблово ОУФМС России по городу Москве в СВАО')
INSERT [dbo].[PassportIssueOrganization] ([OrgID], [OrgName]) VALUES (21, N'Отделение по району Северное Медведково ОУФМС России по городу Москве в СВАО')
INSERT [dbo].[PassportIssueOrganization] ([OrgID], [OrgName]) VALUES (22, N'Отделение по району Северный ОУФМС России по городу Москве в СВАО')
INSERT [dbo].[PassportIssueOrganization] ([OrgID], [OrgName]) VALUES (23, N'Отделение по району Южное Медведково ОУФМС России по городу Москве в СВАО')
INSERT [dbo].[PassportIssueOrganization] ([OrgID], [OrgName]) VALUES (24, N'Отделение по району Ярославский ОУФМС России по городу Москве в СВАО')
INSERT [dbo].[PassportIssueOrganization] ([OrgID], [OrgName]) VALUES (25, N'Отделение по району Богородское ОУФМС России по городу Москве в ВАО')
INSERT [dbo].[PassportIssueOrganization] ([OrgID], [OrgName]) VALUES (26, N'Отделение по району Восточное Измайлово ОУФМС России по городу Москве в ВАО')
INSERT [dbo].[PassportIssueOrganization] ([OrgID], [OrgName]) VALUES (27, N'Отделение по району Восточный ОУФМС России по городу Москве в ВАО')
INSERT [dbo].[PassportIssueOrganization] ([OrgID], [OrgName]) VALUES (28, N'Отделение по району Гольяново ОУФМС России по городу Москве в ВАО')
INSERT [dbo].[PassportIssueOrganization] ([OrgID], [OrgName]) VALUES (29, N'Отделение по району Ивановское ОУФМС России по городу Москве в ВАО')
INSERT [dbo].[PassportIssueOrganization] ([OrgID], [OrgName]) VALUES (30, N'Отделение по району Метрогородок ОУФМС России по городу Москве в ВАО')
INSERT [dbo].[PassportIssueOrganization] ([OrgID], [OrgName]) VALUES (31, N'Отделение по району Новокосино ОУФМС России по городу Москве в ВАО')
INSERT [dbo].[PassportIssueOrganization] ([OrgID], [OrgName]) VALUES (32, N'Отделение по району Преображенское ОУФМС России по городу Москве в ВАО')
INSERT [dbo].[PassportIssueOrganization] ([OrgID], [OrgName]) VALUES (33, N'Отделение по району Соколиная гора ОУФМС России по городу Москве в ВАО')
INSERT [dbo].[PassportIssueOrganization] ([OrgID], [OrgName]) VALUES (34, N'Отделение по району Выхино ОУФМС России по городу Москве в ЮВАО')
INSERT [dbo].[PassportIssueOrganization] ([OrgID], [OrgName]) VALUES (35, N'Отделение по району Жулебино ОУФМС России по городу Москве в ЮВАО')
INSERT [dbo].[PassportIssueOrganization] ([OrgID], [OrgName]) VALUES (36, N'Отделение по району Капотня ОУФМС России по городу Москве в ЮВАО')
INSERT [dbo].[PassportIssueOrganization] ([OrgID], [OrgName]) VALUES (37, N'Отделение по району Лефортово ОУФМС России по городу Москве в ЮВАО')
INSERT [dbo].[PassportIssueOrganization] ([OrgID], [OrgName]) VALUES (38, N'Отделение по району Марьино ОУФМС России по городу Москве в ЮВАО')
INSERT [dbo].[PassportIssueOrganization] ([OrgID], [OrgName]) VALUES (39, N'Отделение по району Марьинский парк ОУФМС России по городу Москве в ЮВАО')
INSERT [dbo].[PassportIssueOrganization] ([OrgID], [OrgName]) VALUES (40, N'Отделение по району Нижегородский ОУФМС России по городу Москве в ЮВАО')
INSERT [dbo].[PassportIssueOrganization] ([OrgID], [OrgName]) VALUES (41, N'Отделение по району Рязанский ОУФМС России по городу Москве в ЮВАО')
INSERT [dbo].[PassportIssueOrganization] ([OrgID], [OrgName]) VALUES (42, N'Отделение по району Текстильщики ОУФМС России по городу Москве в ЮВАО')
INSERT [dbo].[PassportIssueOrganization] ([OrgID], [OrgName]) VALUES (43, N'Отделение по району Южнопортовый ОУФМС России по городу Москве в ЮВАО')
INSERT [dbo].[PassportIssueOrganization] ([OrgID], [OrgName]) VALUES (44, N'Отделение по району Братеево ОУФМС России по городу Москве в ЮАО')
INSERT [dbo].[PassportIssueOrganization] ([OrgID], [OrgName]) VALUES (45, N'Отделение по району Донской ОУФМС России по городу Москве в ЮАО')
INSERT [dbo].[PassportIssueOrganization] ([OrgID], [OrgName]) VALUES (46, N'Отделение по району Нагатино-Садовники ОУФМС России по городу Москве в ЮАО')
INSERT [dbo].[PassportIssueOrganization] ([OrgID], [OrgName]) VALUES (47, N'Отделение по району Нагорный ОУФМС России по городу Москве в ЮАО')
INSERT [dbo].[PassportIssueOrganization] ([OrgID], [OrgName]) VALUES (48, N'Отделение по району Орехово-Борисово Северное ОУФМС России по городу Москве в ЮАО')
INSERT [dbo].[PassportIssueOrganization] ([OrgID], [OrgName]) VALUES (49, N'Отделение по району Чертаново Северное ОУФМС России по городу Москве в ЮАО')
INSERT [dbo].[PassportIssueOrganization] ([OrgID], [OrgName]) VALUES (50, N'Отделение по району Академический ОУФМС России по городу Москве в ЮЗАО')
GO
INSERT [dbo].[PlaceOfBirth] ([PlaceID], [PlaceCity], [PlaceRegion]) VALUES (1, 1, 1)
INSERT [dbo].[PlaceOfBirth] ([PlaceID], [PlaceCity], [PlaceRegion]) VALUES (2, 2, 2)
INSERT [dbo].[PlaceOfBirth] ([PlaceID], [PlaceCity], [PlaceRegion]) VALUES (3, 3, 3)
INSERT [dbo].[PlaceOfBirth] ([PlaceID], [PlaceCity], [PlaceRegion]) VALUES (4, 4, 4)
INSERT [dbo].[PlaceOfBirth] ([PlaceID], [PlaceCity], [PlaceRegion]) VALUES (5, 5, 1)
INSERT [dbo].[PlaceOfBirth] ([PlaceID], [PlaceCity], [PlaceRegion]) VALUES (6, 6, 5)
INSERT [dbo].[PlaceOfBirth] ([PlaceID], [PlaceCity], [PlaceRegion]) VALUES (7, 7, 6)
INSERT [dbo].[PlaceOfBirth] ([PlaceID], [PlaceCity], [PlaceRegion]) VALUES (8, 8, 4)
INSERT [dbo].[PlaceOfBirth] ([PlaceID], [PlaceCity], [PlaceRegion]) VALUES (9, 9, 7)
INSERT [dbo].[PlaceOfBirth] ([PlaceID], [PlaceCity], [PlaceRegion]) VALUES (10, 10, NULL)
INSERT [dbo].[PlaceOfBirth] ([PlaceID], [PlaceCity], [PlaceRegion]) VALUES (11, 11, 4)
INSERT [dbo].[PlaceOfBirth] ([PlaceID], [PlaceCity], [PlaceRegion]) VALUES (12, 12, NULL)
INSERT [dbo].[PlaceOfBirth] ([PlaceID], [PlaceCity], [PlaceRegion]) VALUES (13, 13, 8)
INSERT [dbo].[PlaceOfBirth] ([PlaceID], [PlaceCity], [PlaceRegion]) VALUES (14, 14, 9)
INSERT [dbo].[PlaceOfBirth] ([PlaceID], [PlaceCity], [PlaceRegion]) VALUES (15, 15, 1)
INSERT [dbo].[PlaceOfBirth] ([PlaceID], [PlaceCity], [PlaceRegion]) VALUES (16, 16, NULL)
INSERT [dbo].[PlaceOfBirth] ([PlaceID], [PlaceCity], [PlaceRegion]) VALUES (17, 17, NULL)
INSERT [dbo].[PlaceOfBirth] ([PlaceID], [PlaceCity], [PlaceRegion]) VALUES (18, 18, NULL)
INSERT [dbo].[PlaceOfBirth] ([PlaceID], [PlaceCity], [PlaceRegion]) VALUES (19, 19, NULL)
INSERT [dbo].[PlaceOfBirth] ([PlaceID], [PlaceCity], [PlaceRegion]) VALUES (20, 20, NULL)
INSERT [dbo].[PlaceOfBirth] ([PlaceID], [PlaceCity], [PlaceRegion]) VALUES (21, 21, NULL)
INSERT [dbo].[PlaceOfBirth] ([PlaceID], [PlaceCity], [PlaceRegion]) VALUES (22, 22, NULL)
INSERT [dbo].[PlaceOfBirth] ([PlaceID], [PlaceCity], [PlaceRegion]) VALUES (23, 23, NULL)
INSERT [dbo].[PlaceOfBirth] ([PlaceID], [PlaceCity], [PlaceRegion]) VALUES (24, 24, NULL)
INSERT [dbo].[PlaceOfBirth] ([PlaceID], [PlaceCity], [PlaceRegion]) VALUES (25, 25, NULL)
INSERT [dbo].[PlaceOfBirth] ([PlaceID], [PlaceCity], [PlaceRegion]) VALUES (26, 26, NULL)
INSERT [dbo].[PlaceOfBirth] ([PlaceID], [PlaceCity], [PlaceRegion]) VALUES (27, 27, NULL)
INSERT [dbo].[PlaceOfBirth] ([PlaceID], [PlaceCity], [PlaceRegion]) VALUES (28, 28, NULL)
INSERT [dbo].[PlaceOfBirth] ([PlaceID], [PlaceCity], [PlaceRegion]) VALUES (38, 15, 10)
INSERT [dbo].[PlaceOfBirth] ([PlaceID], [PlaceCity], [PlaceRegion]) VALUES (43, 1, 11)
INSERT [dbo].[PlaceOfBirth] ([PlaceID], [PlaceCity], [PlaceRegion]) VALUES (46, 14, 12)
INSERT [dbo].[PlaceOfBirth] ([PlaceID], [PlaceCity], [PlaceRegion]) VALUES (49, 2, 13)
GO
INSERT [dbo].[Region] ([RegionID], [RegionName]) VALUES (1, N'Калининградская')
INSERT [dbo].[Region] ([RegionID], [RegionName]) VALUES (2, N'Калужская')
INSERT [dbo].[Region] ([RegionID], [RegionName]) VALUES (3, N'Владимирская')
INSERT [dbo].[Region] ([RegionID], [RegionName]) VALUES (4, N'Московская')
INSERT [dbo].[Region] ([RegionID], [RegionName]) VALUES (5, N'Волгоградская')
INSERT [dbo].[Region] ([RegionID], [RegionName]) VALUES (6, N'Амурская')
INSERT [dbo].[Region] ([RegionID], [RegionName]) VALUES (7, N'Тульская')
INSERT [dbo].[Region] ([RegionID], [RegionName]) VALUES (8, N'Вологодская')
INSERT [dbo].[Region] ([RegionID], [RegionName]) VALUES (9, N'Пензенская')
INSERT [dbo].[Region] ([RegionID], [RegionName]) VALUES (10, N'Челябинская')
INSERT [dbo].[Region] ([RegionID], [RegionName]) VALUES (11, N'Ленинградская')
INSERT [dbo].[Region] ([RegionID], [RegionName]) VALUES (12, N'Свердловская')
INSERT [dbo].[Region] ([RegionID], [RegionName]) VALUES (13, N'Кировская')
GO
INSERT [dbo].[Street] ([StreetID], [StreetName]) VALUES (1, N'Площадь Соловецких Юнг')
INSERT [dbo].[Street] ([StreetID], [StreetName]) VALUES (2, N'Улица 1905 Года')
INSERT [dbo].[Street] ([StreetID], [StreetName]) VALUES (3, N'3-й Автозаводский проезд')
INSERT [dbo].[Street] ([StreetID], [StreetName]) VALUES (4, N'Улица Академика Янгеля')
INSERT [dbo].[Street] ([StreetID], [StreetName]) VALUES (5, N'Алтуфьевское шоссе')
INSERT [dbo].[Street] ([StreetID], [StreetName]) VALUES (6, N'Староватутинский проезд')
INSERT [dbo].[Street] ([StreetID], [StreetName]) VALUES (7, N'Андроньевская площадь')
INSERT [dbo].[Street] ([StreetID], [StreetName]) VALUES (8, N'Староорловская улица')
INSERT [dbo].[Street] ([StreetID], [StreetName]) VALUES (9, N'Анненская улица')
INSERT [dbo].[Street] ([StreetID], [StreetName]) VALUES (10, N'Улица Старый Гай')
INSERT [dbo].[Street] ([StreetID], [StreetName]) VALUES (11, N'Бабаевская улица')
INSERT [dbo].[Street] ([StreetID], [StreetName]) VALUES (12, N'Улица Строителей')
INSERT [dbo].[Street] ([StreetID], [StreetName]) VALUES (13, N'Барабанный переулок')
INSERT [dbo].[Street] ([StreetID], [StreetName]) VALUES (14, N'Улица Судакова')
INSERT [dbo].[Street] ([StreetID], [StreetName]) VALUES (15, N'Сходненский проезд')
INSERT [dbo].[Street] ([StreetID], [StreetName]) VALUES (16, N'Площадь Белы Куна')
INSERT [dbo].[Street] ([StreetID], [StreetName]) VALUES (17, N'Тамбовская улица')
INSERT [dbo].[Street] ([StreetID], [StreetName]) VALUES (18, N'Улица Берзарина')
INSERT [dbo].[Street] ([StreetID], [StreetName]) VALUES (19, N'Бесединский мост')
INSERT [dbo].[Street] ([StreetID], [StreetName]) VALUES (20, N'Тверской бульвар')
INSERT [dbo].[Street] ([StreetID], [StreetName]) VALUES (21, N'Улица Улофа Пальме')
INSERT [dbo].[Street] ([StreetID], [StreetName]) VALUES (22, N'Устьинский проезд')
INSERT [dbo].[Street] ([StreetID], [StreetName]) VALUES (23, N'Бурцевская улица')
INSERT [dbo].[Street] ([StreetID], [StreetName]) VALUES (24, N'Улица Фадеева')
INSERT [dbo].[Street] ([StreetID], [StreetName]) VALUES (25, N'Улица Вавилова')
INSERT [dbo].[Street] ([StreetID], [StreetName]) VALUES (26, N'Варшавское шоссе')
INSERT [dbo].[Street] ([StreetID], [StreetName]) VALUES (27, N'Гаврикова улица')
INSERT [dbo].[Street] ([StreetID], [StreetName]) VALUES (28, N'Фруктовая улица')
INSERT [dbo].[Street] ([StreetID], [StreetName]) VALUES (29, N'Давыдковская улица')
INSERT [dbo].[Street] ([StreetID], [StreetName]) VALUES (30, N'Хвалынский бульвар')
INSERT [dbo].[Street] ([StreetID], [StreetName]) VALUES (31, N'Егорьевская улица')
INSERT [dbo].[Street] ([StreetID], [StreetName]) VALUES (32, N'Хордовый проезд')
INSERT [dbo].[Street] ([StreetID], [StreetName]) VALUES (33, N'Жебрунова улица')
INSERT [dbo].[Street] ([StreetID], [StreetName]) VALUES (34, N'Улица Цандера')
INSERT [dbo].[Street] ([StreetID], [StreetName]) VALUES (35, N'Улица Цюрупы')
INSERT [dbo].[Street] ([StreetID], [StreetName]) VALUES (36, N'Чагинская улица')
INSERT [dbo].[Street] ([StreetID], [StreetName]) VALUES (37, N'Саратовская улица')
INSERT [dbo].[Street] ([StreetID], [StreetName]) VALUES (38, N'Улица Чкалова')
INSERT [dbo].[Street] ([StreetID], [StreetName]) VALUES (39, N'Шелепихинское шоссе')
INSERT [dbo].[Street] ([StreetID], [StreetName]) VALUES (40, N'Северянинский проезд')
INSERT [dbo].[Street] ([StreetID], [StreetName]) VALUES (41, N'Улица Шишкина')
INSERT [dbo].[Street] ([StreetID], [StreetName]) VALUES (42, N'Семёновский проезд')
INSERT [dbo].[Street] ([StreetID], [StreetName]) VALUES (43, N'Школьная улица')
INSERT [dbo].[Street] ([StreetID], [StreetName]) VALUES (44, N'Славянский бульвар')
INSERT [dbo].[Street] ([StreetID], [StreetName]) VALUES (45, N'Сумской проезд')
INSERT [dbo].[Street] ([StreetID], [StreetName]) VALUES (46, N'Банный проезд')
INSERT [dbo].[Street] ([StreetID], [StreetName]) VALUES (47, N'Сурский проезд')
INSERT [dbo].[Street] ([StreetID], [StreetName]) VALUES (48, N'Тарный проезд')
INSERT [dbo].[Street] ([StreetID], [StreetName]) VALUES (49, N'Бескудниковский проезд')
INSERT [dbo].[Street] ([StreetID], [StreetName]) VALUES (50, N'Улица Татьяны Макаровой')
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([UserID], [UserName], [UserSurname], [UserPatronymic], [Серия], [Номер], [UserPhone], [UserAddress], [UserEmail], [UserPassword], [ДатаВыдачи], [Выдан], [UserDateOfBirth], [UserPlaceOfBirth]) VALUES (0, N'Тихон', N'Суворин', N'Олегович', NULL, NULL, N'89884012884', NULL, N'suvorint@gmail.com', N'123456', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [UserName], [UserSurname], [UserPatronymic], [Серия], [Номер], [UserPhone], [UserAddress], [UserEmail], [UserPassword], [ДатаВыдачи], [Выдан], [UserDateOfBirth], [UserPlaceOfBirth]) VALUES (1, N'Александр ', N'Смирнов', N'Иванович', N'4513', N'989722', N'88005353535', 1, N'smirnov@qwer.ty', N'3QjGHM', CAST(N'2014-12-01' AS Date), 1, CAST(N'1987-02-16' AS Date), 1)
INSERT [dbo].[User] ([UserID], [UserName], [UserSurname], [UserPatronymic], [Серия], [Номер], [UserPhone], [UserAddress], [UserEmail], [UserPassword], [ДатаВыдачи], [Выдан], [UserDateOfBirth], [UserPlaceOfBirth]) VALUES (2, N'Максим ', N'Иванов', N'Петрович', N'4511', N'267981', N'85003296574', 2, N'ivanovmi@qwer.ty', N'6RElM44FHBa4g5S2VJ', CAST(N'2012-03-25' AS Date), 2, CAST(N'1997-06-13' AS Date), 2)
INSERT [dbo].[User] ([UserID], [UserName], [UserSurname], [UserPatronymic], [Серия], [Номер], [UserPhone], [UserAddress], [UserEmail], [UserPassword], [ДатаВыдачи], [Выдан], [UserDateOfBirth], [UserPlaceOfBirth]) VALUES (3, N'Дарья', N'Кузнецова', N'Николаевна', N'9852', N'161662', N'89004685299', 3, N'kuzn@qwer.ty', N'7vvOdp', CAST(N'2003-06-06' AS Date), 3, CAST(N'1974-08-13' AS Date), 3)
INSERT [dbo].[User] ([UserID], [UserName], [UserSurname], [UserPatronymic], [Серия], [Номер], [UserPhone], [UserAddress], [UserEmail], [UserPassword], [ДатаВыдачи], [Выдан], [UserDateOfBirth], [UserPlaceOfBirth]) VALUES (4, N'Артём', N'Соколов', N'Алексеевич', N'7542', N'230521', N'84569852365', 4, N'sokolov@qwer.ty', N'9OzMPyhHqTbvHMg3Y0', CAST(N'2007-11-08' AS Date), 4, CAST(N'1995-03-24' AS Date), 4)
INSERT [dbo].[User] ([UserID], [UserName], [UserSurname], [UserPatronymic], [Серия], [Номер], [UserPhone], [UserAddress], [UserEmail], [UserPassword], [ДатаВыдачи], [Выдан], [UserDateOfBirth], [UserPlaceOfBirth]) VALUES (5, N'Никита', N'Попов', N'Кириллович', N'4523', N'589923', N'84598523675', 5, N'popov@qwer.ty', N'a58JH1bxD5BN0mhfxM', CAST(N'2010-01-30' AS Date), 5, CAST(N'1970-09-10' AS Date), 5)
INSERT [dbo].[User] ([UserID], [UserName], [UserSurname], [UserPatronymic], [Серия], [Номер], [UserPhone], [UserAddress], [UserEmail], [UserPassword], [ДатаВыдачи], [Выдан], [UserDateOfBirth], [UserPlaceOfBirth]) VALUES (6, N'Дмитрий', N'Лебедев', N'Анатольевич', N'6321', N'169845', N'87596542365', 6, N'lebedev@qwer.ty', N'aJBTahvyRnOJlnl85g', CAST(N'2009-04-29' AS Date), 6, CAST(N'1983-04-27' AS Date), 6)
INSERT [dbo].[User] ([UserID], [UserName], [UserSurname], [UserPatronymic], [Серия], [Номер], [UserPhone], [UserAddress], [UserEmail], [UserPassword], [ДатаВыдачи], [Выдан], [UserDateOfBirth], [UserPlaceOfBirth]) VALUES (7, N'Егор ', N'Козлов', N'Александрович', N'1259', N'468520', N'84236985642', 7, N'kozlov@qwer.ty', N'CiYKA519tAMlqktBk7', CAST(N'2013-08-15' AS Date), 7, CAST(N'1983-07-26' AS Date), 7)
INSERT [dbo].[User] ([UserID], [UserName], [UserSurname], [UserPatronymic], [Серия], [Номер], [UserPhone], [UserAddress], [UserEmail], [UserPassword], [ДатаВыдачи], [Выдан], [UserDateOfBirth], [UserPlaceOfBirth]) VALUES (8, N'Даниил', N'Новиков', N'Сергеевич', N'6784', N'989604', N'89423015895', 8, N'novikov@qwer.ty', N'CTtpfJgrLszusmfKiS', CAST(N'2006-05-22' AS Date), 8, CAST(N'1993-09-29' AS Date), 8)
INSERT [dbo].[User] ([UserID], [UserName], [UserSurname], [UserPatronymic], [Серия], [Номер], [UserPhone], [UserAddress], [UserEmail], [UserPassword], [ДатаВыдачи], [Выдан], [UserDateOfBirth], [UserPlaceOfBirth]) VALUES (9, N'Михаил', N'Морозов', N'Павлович', N'7842', N'132588', N'84572268745', 9, N'morozov@qwer.ty', N'd6WYQjwinVWkTpm2xr', CAST(N'2016-10-23' AS Date), 9, CAST(N'1978-10-24' AS Date), 9)
INSERT [dbo].[User] ([UserID], [UserName], [UserSurname], [UserPatronymic], [Серия], [Номер], [UserPhone], [UserAddress], [UserEmail], [UserPassword], [ДатаВыдачи], [Выдан], [UserDateOfBirth], [UserPlaceOfBirth]) VALUES (10, N'Андрей', N'Петров', N'Владимирович', N'3685', N'597875', N'84215875215', 10, N'petrov@qwer.ty', N'egNPSVZbahCw9eGN7h', CAST(N'2004-07-25' AS Date), 10, CAST(N'1981-11-20' AS Date), 10)
INSERT [dbo].[User] ([UserID], [UserName], [UserSurname], [UserPatronymic], [Серия], [Номер], [UserPhone], [UserAddress], [UserEmail], [UserPassword], [ДатаВыдачи], [Выдан], [UserDateOfBirth], [UserPlaceOfBirth]) VALUES (11, N'Алексей', N'Волков', N'Романович', N'4653', N'498532', N'88452625254', 11, N'volkov@qwer.ty', N'eU1oxIwjZnfChSbMFT', CAST(N'2003-09-05' AS Date), 11, CAST(N'1977-03-01' AS Date), 11)
INSERT [dbo].[User] ([UserID], [UserName], [UserSurname], [UserPatronymic], [Серия], [Номер], [UserPhone], [UserAddress], [UserEmail], [UserPassword], [ДатаВыдачи], [Выдан], [UserDateOfBirth], [UserPlaceOfBirth]) VALUES (12, N'Илья', N'Соловьёв', N'Константинович', N'2156', N'164582', N'84526825526', 12, N'soloviev@qwer.ty', N'EzpJHEq1w1EVwXSvgO', CAST(N'2012-01-10' AS Date), 12, CAST(N'1985-10-08' AS Date), 12)
INSERT [dbo].[User] ([UserID], [UserName], [UserSurname], [UserPatronymic], [Серия], [Номер], [UserPhone], [UserAddress], [UserEmail], [UserPassword], [ДатаВыдачи], [Выдан], [UserDateOfBirth], [UserPlaceOfBirth]) VALUES (13, N'Кирилл', N'Васильев', N'Владиславович', N'9865', N'312654', N'86138420555', 13, N'vasiliev@qwer.ty', N'fGxtshkeKdK0qUWojz', CAST(N'2013-11-15' AS Date), 13, CAST(N'1975-05-28' AS Date), 13)
INSERT [dbo].[User] ([UserID], [UserName], [UserSurname], [UserPatronymic], [Серия], [Номер], [UserPhone], [UserAddress], [UserEmail], [UserPassword], [ДатаВыдачи], [Выдан], [UserDateOfBirth], [UserPlaceOfBirth]) VALUES (14, N'Сергей', N'Зайцев', N'Игоревич', N'2326', N'789582', N'84654851686', 14, N'zaycev@qwer.ty', N'gdbKuitHoZddoTPucD', CAST(N'2015-09-28' AS Date), 14, CAST(N'1989-05-15' AS Date), 14)
INSERT [dbo].[User] ([UserID], [UserName], [UserSurname], [UserPatronymic], [Серия], [Номер], [UserPhone], [UserAddress], [UserEmail], [UserPassword], [ДатаВыдачи], [Выдан], [UserDateOfBirth], [UserPlaceOfBirth]) VALUES (15, N'Владислав', N'Павлов', N'Викторович', N'9862', N'659874', N'85532875267', 15, N'pavlov@qwer.ty', N'GgvL9nMWcyHgHyMwxY', CAST(N'2008-06-12' AS Date), 15, CAST(N'1988-10-31' AS Date), 15)
INSERT [dbo].[User] ([UserID], [UserName], [UserSurname], [UserPatronymic], [Серия], [Номер], [UserPhone], [UserAddress], [UserEmail], [UserPassword], [ДатаВыдачи], [Выдан], [UserDateOfBirth], [UserPlaceOfBirth]) VALUES (16, N'Роман', N'Семёнов', N'Васильевич', N'3232', N'201265', N'82457157525', 16, N'semenov@qwer.ty', N'GRWAnx5BgWVsvH5A57', CAST(N'2005-10-03' AS Date), 16, CAST(N'1973-08-17' AS Date), 16)
INSERT [dbo].[User] ([UserID], [UserName], [UserSurname], [UserPatronymic], [Серия], [Номер], [UserPhone], [UserAddress], [UserEmail], [UserPassword], [ДатаВыдачи], [Выдан], [UserDateOfBirth], [UserPlaceOfBirth]) VALUES (17, N'Владимир', N'Голубев', N'Петрович', N'1328', N'745956', N'86459524585', 17, N'golubev@qwer.ty', N'hVfU4jfWLhuGKBqjKG', CAST(N'2012-03-23' AS Date), 17, CAST(N'1999-06-21' AS Date), 17)
INSERT [dbo].[User] ([UserID], [UserName], [UserSurname], [UserPatronymic], [Серия], [Номер], [UserPhone], [UserAddress], [UserEmail], [UserPassword], [ДатаВыдачи], [Выдан], [UserDateOfBirth], [UserPlaceOfBirth]) VALUES (18, N'Тимофей', N'Виноградов', N'Тимофеевич', N'6892', N'302123', N'84572252989', 18, N'vinogradov@qwer.ty', N'HW75uK9wGv64XVj00F', CAST(N'2018-02-16' AS Date), 18, CAST(N'1987-01-28' AS Date), 18)
INSERT [dbo].[User] ([UserID], [UserName], [UserSurname], [UserPatronymic], [Серия], [Номер], [UserPhone], [UserAddress], [UserEmail], [UserPassword], [ДатаВыдачи], [Выдан], [UserDateOfBirth], [UserPlaceOfBirth]) VALUES (19, N'Матвей', N'Богданов', N'Антонович', N'5986', N'656963', N'86482157555', 19, N'bogdanov@qwer.ty', N'iBQKgxitWVia1UcZLc', CAST(N'2007-12-28' AS Date), 19, CAST(N'1988-06-07' AS Date), 19)
INSERT [dbo].[User] ([UserID], [UserName], [UserSurname], [UserPatronymic], [Серия], [Номер], [UserPhone], [UserAddress], [UserEmail], [UserPassword], [ДатаВыдачи], [Выдан], [UserDateOfBirth], [UserPlaceOfBirth]) VALUES (20, N'Георгий', N'Воробьёв', N'Валерьевич', N'7964', N'154825', N'84688822852', 20, N'vorobiev@qwer.ty', N'Ih4bcxT0G6fYXmA7aC', CAST(N'2002-10-10' AS Date), 20, CAST(N'1979-04-09' AS Date), 20)
INSERT [dbo].[User] ([UserID], [UserName], [UserSurname], [UserPatronymic], [Серия], [Номер], [UserPhone], [UserAddress], [UserEmail], [UserPassword], [ДатаВыдачи], [Выдан], [UserDateOfBirth], [UserPlaceOfBirth]) VALUES (21, N'Николай', N'Фёдоров', N'Иванович', N'2394', N'743657', N'86459215585', 21, N'phedorov@qwer.ty', N'itRLonnM6Qx3ClPIXb', CAST(N'2003-11-25' AS Date), 21, CAST(N'1998-12-03' AS Date), 21)
INSERT [dbo].[User] ([UserID], [UserName], [UserSurname], [UserPatronymic], [Серия], [Номер], [UserPhone], [UserAddress], [UserEmail], [UserPassword], [ДатаВыдачи], [Выдан], [UserDateOfBirth], [UserPlaceOfBirth]) VALUES (22, N'Павел', N'Михайлов', N'Петрович', N'8623', N'953684', N'84589221015', 22, N'michailov@qwer.ty', N'J05dxx2uXzYsbFtOiz', CAST(N'2011-04-26' AS Date), 22, CAST(N'1978-01-18' AS Date), 22)
INSERT [dbo].[User] ([UserID], [UserName], [UserSurname], [UserPatronymic], [Серия], [Номер], [UserPhone], [UserAddress], [UserEmail], [UserPassword], [ДатаВыдачи], [Выдан], [UserDateOfBirth], [UserPlaceOfBirth]) VALUES (23, N'Арсений ', N'Беляев', N'Николаевич', N'2986', N'213025', N'85497522542', 23, N'belyaev@qwer.ty', N'j1UuMqx1ntqJkif42S', CAST(N'2016-01-05' AS Date), 23, CAST(N'1998-08-11' AS Date), 23)
INSERT [dbo].[User] ([UserID], [UserName], [UserSurname], [UserPatronymic], [Серия], [Номер], [UserPhone], [UserAddress], [UserEmail], [UserPassword], [ДатаВыдачи], [Выдан], [UserDateOfBirth], [UserPlaceOfBirth]) VALUES (24, N'Денис', N'Тарасов', N'Алексеевич', N'2966', N'956420', N'85485112358', 24, N'tarasov@qwer.ty', N'jdVOqCHWxaNi6NkzSt', CAST(N'2017-11-24' AS Date), 24, CAST(N'1984-11-13' AS Date), 24)
INSERT [dbo].[User] ([UserID], [UserName], [UserSurname], [UserPatronymic], [Серия], [Номер], [UserPhone], [UserAddress], [UserEmail], [UserPassword], [ДатаВыдачи], [Выдан], [UserDateOfBirth], [UserPlaceOfBirth]) VALUES (25, N'Степан', N'Белов', N'Кириллович', N'2368', N'369785', N'86596620154', 25, N'belov@qwer.ty', N'jFXpiR7K6sRZFLg2s1', CAST(N'2007-08-03' AS Date), 25, CAST(N'1987-01-22' AS Date), 25)
INSERT [dbo].[User] ([UserID], [UserName], [UserSurname], [UserPatronymic], [Серия], [Номер], [UserPhone], [UserAddress], [UserEmail], [UserPassword], [ДатаВыдачи], [Выдан], [UserDateOfBirth], [UserPlaceOfBirth]) VALUES (26, N'Фёдор', N'Комаров', N'Анатольевич', N'1359', N'546798', N'82156225962', 26, N'komarov@qwer.ty', N'k2TVAonWmrFnYiKNiX', CAST(N'2003-01-07' AS Date), 26, CAST(N'1998-02-25' AS Date), 26)
INSERT [dbo].[User] ([UserID], [UserName], [UserSurname], [UserPatronymic], [Серия], [Номер], [UserPhone], [UserAddress], [UserEmail], [UserPassword], [ДатаВыдачи], [Выдан], [UserDateOfBirth], [UserPlaceOfBirth]) VALUES (27, N'Данила', N'Орлов', N'Александрович', N'6795', N'132560', N'86520756586', 27, N'orlov@qwer.ty', N'Kk3Qd78OhyRa4opQU7', CAST(N'2010-05-03' AS Date), 27, CAST(N'1986-04-03' AS Date), 27)
INSERT [dbo].[User] ([UserID], [UserName], [UserSurname], [UserPatronymic], [Серия], [Номер], [UserPhone], [UserAddress], [UserEmail], [UserPassword], [ДатаВыдачи], [Выдан], [UserDateOfBirth], [UserPlaceOfBirth]) VALUES (28, N'Антон', N'Киселёв', N'Сергеевич', N'2386', N'258645', N'87549854856', 28, N'kisilev@qwer.ty', N'kp7tugUy3HsKCmmtlc', CAST(N'2005-05-16' AS Date), 28, CAST(N'1997-09-09' AS Date), 28)
INSERT [dbo].[User] ([UserID], [UserName], [UserSurname], [UserPatronymic], [Серия], [Номер], [UserPhone], [UserAddress], [UserEmail], [UserPassword], [ДатаВыдачи], [Выдан], [UserDateOfBirth], [UserPlaceOfBirth]) VALUES (29, N'Константин', N'Макаров', N'Павлович', N'2376', N'752346', N'84689522545', 29, N'makarov@qwer.ty', N'L983dBgTDQ1tGerWCq', CAST(N'2010-06-17' AS Date), 29, CAST(N'1994-02-15' AS Date), 1)
INSERT [dbo].[User] ([UserID], [UserName], [UserSurname], [UserPatronymic], [Серия], [Номер], [UserPhone], [UserAddress], [UserEmail], [UserPassword], [ДатаВыдачи], [Выдан], [UserDateOfBirth], [UserPlaceOfBirth]) VALUES (30, N'Глеб', N'Андреев', N'Владимирович', N'5985', N'213577', N'85498659855', 30, N'andreev@qwer.ty', N'LhS2dykZ2OTAscYf1g', CAST(N'2002-09-11' AS Date), 30, CAST(N'1994-12-01' AS Date), 10)
INSERT [dbo].[User] ([UserID], [UserName], [UserSurname], [UserPatronymic], [Серия], [Номер], [UserPhone], [UserAddress], [UserEmail], [UserPassword], [ДатаВыдачи], [Выдан], [UserDateOfBirth], [UserPlaceOfBirth]) VALUES (31, N'Ярослав', N'Ковалёв', N'Романович', N'2354', N'543258', N'82487628982', 31, N'kovalev@qwer.ty', N'M0JgTAhYpTmWUErWm7', CAST(N'2017-11-15' AS Date), 31, CAST(N'1986-02-05' AS Date), 11)
INSERT [dbo].[User] ([UserID], [UserName], [UserSurname], [UserPatronymic], [Серия], [Номер], [UserPhone], [UserAddress], [UserEmail], [UserPassword], [ДатаВыдачи], [Выдан], [UserDateOfBirth], [UserPlaceOfBirth]) VALUES (32, N'Григорий', N'Ильин', N'Константинович', N'7528', N'699505', N'82598525558', 32, N'ilin@qwer.ty', N'm6KjH5EZqxSkNqv1bk', CAST(N'2012-01-25' AS Date), 32, CAST(N'1990-11-30' AS Date), 12)
INSERT [dbo].[User] ([UserID], [UserName], [UserSurname], [UserPatronymic], [Серия], [Номер], [UserPhone], [UserAddress], [UserEmail], [UserPassword], [ДатаВыдачи], [Выдан], [UserDateOfBirth], [UserPlaceOfBirth]) VALUES (33, N'Игорь', N'Гусев', N'Владиславович', N'8087', N'321456', N'82265525855', 33, N'gusev@qwer.ty', N'87235890123', CAST(N'2009-02-26' AS Date), 33, CAST(N'1980-07-10' AS Date), 13)
INSERT [dbo].[User] ([UserID], [UserName], [UserSurname], [UserPatronymic], [Серия], [Номер], [UserPhone], [UserAddress], [UserEmail], [UserPassword], [ДатаВыдачи], [Выдан], [UserDateOfBirth], [UserPlaceOfBirth]) VALUES (34, N'Евгений', N'Титов', N'Игоревич', N'3057', N'275264', N'87897956626', 34, N'titov@qwer.ty', N'mcqGZcEu3uORGiX3gw', CAST(N'2007-11-06' AS Date), 34, CAST(N'1989-10-24' AS Date), 14)
INSERT [dbo].[User] ([UserID], [UserName], [UserSurname], [UserPatronymic], [Серия], [Номер], [UserPhone], [UserAddress], [UserEmail], [UserPassword], [ДатаВыдачи], [Выдан], [UserDateOfBirth], [UserPlaceOfBirth]) VALUES (35, N'Тимур', N'Кузьмин', N'Викторович', N'9731', N'579524', N'82058220820', 35, N'kuzmin@qwer.ty', N'n06XQfr9xIglyRxoBw', CAST(N'2001-03-16' AS Date), 35, CAST(N'1988-08-12' AS Date), 15)
INSERT [dbo].[User] ([UserID], [UserName], [UserSurname], [UserPatronymic], [Серия], [Номер], [UserPhone], [UserAddress], [UserEmail], [UserPassword], [ДатаВыдачи], [Выдан], [UserDateOfBirth], [UserPlaceOfBirth]) VALUES (36, N'Руслан', N'Кудрявцев', N'Васильевич', N'1388', N'698852', N'81358622258', 36, N'kudryavcev@qwer.ty', N'O8NmOA27AH5lrD7pck', CAST(N'2009-06-10' AS Date), 36, CAST(N'1992-11-11' AS Date), 16)
INSERT [dbo].[User] ([UserID], [UserName], [UserSurname], [UserPatronymic], [Серия], [Номер], [UserPhone], [UserAddress], [UserEmail], [UserPassword], [ДатаВыдачи], [Выдан], [UserDateOfBirth], [UserPlaceOfBirth]) VALUES (37, N'Пётр', N'Баранов', N'Петрович', N'5582', N'859856', N'83524988562', 37, N'baranov@qwer.ty', N'o9ReQIVwl7dO4xXo8A', CAST(N'2014-08-11' AS Date), 37, CAST(N'1972-10-25' AS Date), 17)
INSERT [dbo].[User] ([UserID], [UserName], [UserSurname], [UserPatronymic], [Серия], [Номер], [UserPhone], [UserAddress], [UserEmail], [UserPassword], [ДатаВыдачи], [Выдан], [UserDateOfBirth], [UserPlaceOfBirth]) VALUES (38, N'Олег', N'Куликов', N'Тимофеевич', N'8642', N'446852', N'89756982585', 38, N'kulikov@qwer.ty', N'ot2V54rFnT3FZa6ken', CAST(N'2010-12-20' AS Date), 38, CAST(N'1977-01-03' AS Date), 22)
INSERT [dbo].[User] ([UserID], [UserName], [UserSurname], [UserPatronymic], [Серия], [Номер], [UserPhone], [UserAddress], [UserEmail], [UserPassword], [ДатаВыдачи], [Выдан], [UserDateOfBirth], [UserPlaceOfBirth]) VALUES (39, N'Вадим', N'Алексеев', N'Антонович', N'2383', N'659798', N'82475285598', 39, N'alekseev@qwer.ty', N'Yt9CfHzuIzKd1QtbGQ', CAST(N'2016-03-02' AS Date), 39, CAST(N'1978-09-29' AS Date), 38)
INSERT [dbo].[User] ([UserID], [UserName], [UserSurname], [UserPatronymic], [Серия], [Номер], [UserPhone], [UserAddress], [UserEmail], [UserPassword], [ДатаВыдачи], [Выдан], [UserDateOfBirth], [UserPlaceOfBirth]) VALUES (40, N'Василий', N'Степанов', N'Валерьевич', N'3345', N'659887', N'81418569894', 40, N'stepanov@qwer.ty', N'pGoOH61p8NM6LfEmAT', CAST(N'2000-11-23' AS Date), 40, CAST(N'1995-09-28' AS Date), 28)
INSERT [dbo].[User] ([UserID], [UserName], [UserSurname], [UserPatronymic], [Серия], [Номер], [UserPhone], [UserAddress], [UserEmail], [UserPassword], [ДатаВыдачи], [Выдан], [UserDateOfBirth], [UserPlaceOfBirth]) VALUES (41, N'Вячеслав', N'Яковлев', N'Иванович', N'7057', N'2013456', N'86245225745', 41, N'yakovlev@qwer.ty', N'pRPYLY0fJYyUw9OCiY', CAST(N'2002-01-04' AS Date), 41, CAST(N'1992-03-02' AS Date), 9)
INSERT [dbo].[User] ([UserID], [UserName], [UserSurname], [UserPatronymic], [Серия], [Номер], [UserPhone], [UserAddress], [UserEmail], [UserPassword], [ДатаВыдачи], [Выдан], [UserDateOfBirth], [UserPlaceOfBirth]) VALUES (42, N'Виктор', N'Сорокин', N'Петрович', N'8080', N'976431', N'84575298740', 42, N'sorokin@qwer.ty', N'PrwWUvnFbwJ6JBgGiU', CAST(N'2003-07-08' AS Date), 42, CAST(N'1970-10-28' AS Date), 10)
INSERT [dbo].[User] ([UserID], [UserName], [UserSurname], [UserPatronymic], [Серия], [Номер], [UserPhone], [UserAddress], [UserEmail], [UserPassword], [ДатаВыдачи], [Выдан], [UserDateOfBirth], [UserPlaceOfBirth]) VALUES (43, N'Юрий', N'Сергеев', N'Алексеевич', N'7953', N'6478024', N'85082588625', 43, N'sergeev@qwer.ty', N'pvNJlnOJBrGltsZLXQ', CAST(N'2009-08-26' AS Date), 43, CAST(N'1985-04-15' AS Date), 11)
INSERT [dbo].[User] ([UserID], [UserName], [UserSurname], [UserPatronymic], [Серия], [Номер], [UserPhone], [UserAddress], [UserEmail], [UserPassword], [ДатаВыдачи], [Выдан], [UserDateOfBirth], [UserPlaceOfBirth]) VALUES (44, N'Артемий', N'Романов', N'Кириллович', N'2398', N'9761320', N'82862078528', 44, N'romanov@qwer.ty', N'PY2HtuVHtJ46zA7kkO', CAST(N'2015-10-15' AS Date), 44, CAST(N'1996-04-29' AS Date), 43)
INSERT [dbo].[User] ([UserID], [UserName], [UserSurname], [UserPatronymic], [Серия], [Номер], [UserPhone], [UserAddress], [UserEmail], [UserPassword], [ДатаВыдачи], [Выдан], [UserDateOfBirth], [UserPlaceOfBirth]) VALUES (45, N'Леонид', N'Захаров', N'Анатольевич', N'2525', N'764513', N'84579652112', 45, N'zaharov@qwer.ty', N'qDsF9DRzfIBoa9sKHp', CAST(N'2004-04-14' AS Date), 45, CAST(N'1974-04-19' AS Date), 22)
INSERT [dbo].[User] ([UserID], [UserName], [UserSurname], [UserPatronymic], [Серия], [Номер], [UserPhone], [UserAddress], [UserEmail], [UserPassword], [ДатаВыдачи], [Выдан], [UserDateOfBirth], [UserPlaceOfBirth]) VALUES (46, N'Давид', N'Борисов', N'Александрович', N'1348', N'794682', N'89564628528', 46, N'borisov@qwer.ty', N'QjkB8vTJLKhXxLF84Q', CAST(N'2009-10-22' AS Date), 46, CAST(N'1980-12-18' AS Date), 22)
INSERT [dbo].[User] ([UserID], [UserName], [UserSurname], [UserPatronymic], [Серия], [Номер], [UserPhone], [UserAddress], [UserEmail], [UserPassword], [ДатаВыдачи], [Выдан], [UserDateOfBirth], [UserPlaceOfBirth]) VALUES (47, N'Марк', N'Королёв', N'Сергеевич', N'1346', N'497256', N'87952826852', 47, N'korolev@qwer.ty', N'qqFHTtDNu06HVD6RWS', CAST(N'2013-11-12' AS Date), 47, CAST(N'1994-02-08' AS Date), 46)
INSERT [dbo].[User] ([UserID], [UserName], [UserSurname], [UserPatronymic], [Серия], [Номер], [UserPhone], [UserAddress], [UserEmail], [UserPassword], [ДатаВыдачи], [Выдан], [UserDateOfBirth], [UserPlaceOfBirth]) VALUES (48, N'Лев', N'Герасимов', N'Павлович', N'8643', N'498536', N'89752368520', 48, N'gerasimov@qwer.ty', N'qt7fm17taYOjWQmrPD', CAST(N'2009-05-07' AS Date), 48, CAST(N'1988-09-07' AS Date), 22)
INSERT [dbo].[User] ([UserID], [UserName], [UserSurname], [UserPatronymic], [Серия], [Номер], [UserPhone], [UserAddress], [UserEmail], [UserPassword], [ДатаВыдачи], [Выдан], [UserDateOfBirth], [UserPlaceOfBirth]) VALUES (49, N'Семён', N'Пономарёв', N'Владимирович', N'2597', N'187562', N'87525878556', 49, N'ponomarev@qwer.ty', N'R8NOISmTE1Fv2LWNPU', CAST(N'2016-03-16' AS Date), 49, CAST(N'1985-02-22' AS Date), 22)
INSERT [dbo].[User] ([UserID], [UserName], [UserSurname], [UserPatronymic], [Серия], [Номер], [UserPhone], [UserAddress], [UserEmail], [UserPassword], [ДатаВыдачи], [Выдан], [UserDateOfBirth], [UserPlaceOfBirth]) VALUES (50, N'Артур', N'Григорьев', N'Романович', N'1380', N'986458', N'85274163412', 50, N'grigoriev@qwer.ty', N'RczPSf3qZx6DRvXhzs', CAST(N'2014-12-14' AS Date), 50, CAST(N'1998-10-15' AS Date), 49)
SET IDENTITY_INSERT [dbo].[User] OFF
GO
ALTER TABLE [dbo].[Account]  WITH CHECK ADD  CONSTRAINT [FK__Банковски__ИДПол__4D94879B] FOREIGN KEY([AccountUser])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[Account] CHECK CONSTRAINT [FK__Банковски__ИДПол__4D94879B]
GO
ALTER TABLE [dbo].[Account]  WITH CHECK ADD  CONSTRAINT [FK__Банковски__ИДтип__4E88ABD4] FOREIGN KEY([AccountType])
REFERENCES [dbo].[AccountType] ([AccTypeID])
GO
ALTER TABLE [dbo].[Account] CHECK CONSTRAINT [FK__Банковски__ИДтип__4E88ABD4]
GO
ALTER TABLE [dbo].[Address]  WITH CHECK ADD FOREIGN KEY([AddressStreet])
REFERENCES [dbo].[Street] ([StreetID])
GO
ALTER TABLE [dbo].[Contract]  WITH CHECK ADD  CONSTRAINT [FK__Договор__ИД_Поль__4F7CD00D] FOREIGN KEY([ContractUser])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[Contract] CHECK CONSTRAINT [FK__Договор__ИД_Поль__4F7CD00D]
GO
ALTER TABLE [dbo].[Contract]  WITH CHECK ADD  CONSTRAINT [FK__Договор__НомерСч__5070F446] FOREIGN KEY([ContractAccountNumber])
REFERENCES [dbo].[Account] ([AccountNumber])
GO
ALTER TABLE [dbo].[Contract] CHECK CONSTRAINT [FK__Договор__НомерСч__5070F446]
GO
ALTER TABLE [dbo].[OperationHistory]  WITH CHECK ADD  CONSTRAINT [FK__История__Аккаунт__5165187F] FOREIGN KEY([OpAccount])
REFERENCES [dbo].[Account] ([AccountNumber])
GO
ALTER TABLE [dbo].[OperationHistory] CHECK CONSTRAINT [FK__История__Аккаунт__5165187F]
GO
ALTER TABLE [dbo].[OperationHistory]  WITH CHECK ADD  CONSTRAINT [FK__История__Тип__52593CB8] FOREIGN KEY([OpType])
REFERENCES [dbo].[OperationType] ([OpTypeID])
GO
ALTER TABLE [dbo].[OperationHistory] CHECK CONSTRAINT [FK__История__Тип__52593CB8]
GO
ALTER TABLE [dbo].[PlaceOfBirth]  WITH CHECK ADD FOREIGN KEY([PlaceCity])
REFERENCES [dbo].[City] ([CityID])
GO
ALTER TABLE [dbo].[PlaceOfBirth]  WITH CHECK ADD FOREIGN KEY([PlaceRegion])
REFERENCES [dbo].[Region] ([RegionID])
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK__Пользоват__Адрес__5535A963] FOREIGN KEY([UserAddress])
REFERENCES [dbo].[Address] ([AddressID])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK__Пользоват__Адрес__5535A963]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK__Пользоват__Выдан__5629CD9C] FOREIGN KEY([Выдан])
REFERENCES [dbo].[PassportIssueOrganization] ([OrgID])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK__Пользоват__Выдан__5629CD9C]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK__Пользоват__Место__571DF1D5] FOREIGN KEY([UserPlaceOfBirth])
REFERENCES [dbo].[PlaceOfBirth] ([PlaceID])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK__Пользоват__Место__571DF1D5]
GO
USE [master]
GO
ALTER DATABASE [ПАО_Деньги_в_каждый_карман] SET  READ_WRITE 
GO
