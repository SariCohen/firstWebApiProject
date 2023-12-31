USE [master]
GO
/****** Object:  Database [store_214493777]    Script Date: 07/12/2023 13:51:14 ******/
CREATE DATABASE [store_214493777]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Products', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Products.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Products_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Products_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [store_214493777] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [store_214493777].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [store_214493777] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [store_214493777] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [store_214493777] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [store_214493777] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [store_214493777] SET ARITHABORT OFF 
GO
ALTER DATABASE [store_214493777] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [store_214493777] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [store_214493777] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [store_214493777] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [store_214493777] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [store_214493777] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [store_214493777] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [store_214493777] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [store_214493777] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [store_214493777] SET  DISABLE_BROKER 
GO
ALTER DATABASE [store_214493777] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [store_214493777] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [store_214493777] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [store_214493777] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [store_214493777] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [store_214493777] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [store_214493777] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [store_214493777] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [store_214493777] SET  MULTI_USER 
GO
ALTER DATABASE [store_214493777] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [store_214493777] SET DB_CHAINING OFF 
GO
ALTER DATABASE [store_214493777] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [store_214493777] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [store_214493777] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [store_214493777] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [store_214493777] SET QUERY_STORE = OFF
GO
USE [store_214493777]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 07/12/2023 13:51:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [nchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderItem]    Script Date: 07/12/2023 13:51:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderItem](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProductId] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[OrderId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 07/12/2023 13:51:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[OrderDate] [date] NOT NULL,
	[OrderSum] [int] NOT NULL,
	[UserId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 07/12/2023 13:51:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProdName] [nchar](20) NOT NULL,
	[Price] [int] NOT NULL,
	[ProdImage] [nchar](20) NOT NULL,
	[CategoryId] [int] NULL,
	[prodDescription] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rating]    Script Date: 07/12/2023 13:51:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rating](
	[RATING_ID] [int] IDENTITY(1,1) NOT NULL,
	[HOST] [nvarchar](50) NULL,
	[METHOD] [nchar](10) NULL,
	[PATH] [nvarchar](50) NULL,
	[REFERER] [nvarchar](100) NULL,
	[USER_AGENT] [nvarchar](max) NULL,
	[Record_Date] [datetime] NULL,
 CONSTRAINT [PK_RATING] PRIMARY KEY CLUSTERED 
(
	[RATING_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 07/12/2023 13:51:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nchar](50) NOT NULL,
	[Password] [nchar](50) NOT NULL,
	[Name] [nchar](30) NOT NULL,
	[LastName] [nchar](30) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([Id], [CategoryName]) VALUES (1, N'סירים               ')
INSERT [dbo].[Category] ([Id], [CategoryName]) VALUES (2, N'מגבות               ')
INSERT [dbo].[Category] ([Id], [CategoryName]) VALUES (3, N'צלחות               ')
INSERT [dbo].[Category] ([Id], [CategoryName]) VALUES (4, N'הגשה                ')
INSERT [dbo].[Category] ([Id], [CategoryName]) VALUES (5, N'כוסות               ')
INSERT [dbo].[Category] ([Id], [CategoryName]) VALUES (6, N'סכום                ')
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
SET IDENTITY_INSERT [dbo].[OrderItem] ON 

INSERT [dbo].[OrderItem] ([Id], [ProductId], [Quantity], [OrderId]) VALUES (1, 2011, 4, 3004)
INSERT [dbo].[OrderItem] ([Id], [ProductId], [Quantity], [OrderId]) VALUES (2, 2011, 4, 3004)
INSERT [dbo].[OrderItem] ([Id], [ProductId], [Quantity], [OrderId]) VALUES (3, 2011, 4, 3004)
INSERT [dbo].[OrderItem] ([Id], [ProductId], [Quantity], [OrderId]) VALUES (4, 2011, 4, 3004)
INSERT [dbo].[OrderItem] ([Id], [ProductId], [Quantity], [OrderId]) VALUES (5, 2015, 1, 3004)
INSERT [dbo].[OrderItem] ([Id], [ProductId], [Quantity], [OrderId]) VALUES (6, 2018, 3, 3004)
INSERT [dbo].[OrderItem] ([Id], [ProductId], [Quantity], [OrderId]) VALUES (7, 2018, 3, 3004)
INSERT [dbo].[OrderItem] ([Id], [ProductId], [Quantity], [OrderId]) VALUES (8, 2018, 3, 3004)
INSERT [dbo].[OrderItem] ([Id], [ProductId], [Quantity], [OrderId]) VALUES (9, 2015, 1, 3006)
INSERT [dbo].[OrderItem] ([Id], [ProductId], [Quantity], [OrderId]) VALUES (10, 2013, 3, 3006)
INSERT [dbo].[OrderItem] ([Id], [ProductId], [Quantity], [OrderId]) VALUES (11, 2013, 3, 3006)
INSERT [dbo].[OrderItem] ([Id], [ProductId], [Quantity], [OrderId]) VALUES (12, 2013, 3, 3006)
INSERT [dbo].[OrderItem] ([Id], [ProductId], [Quantity], [OrderId]) VALUES (13, 2034, 2, 3006)
INSERT [dbo].[OrderItem] ([Id], [ProductId], [Quantity], [OrderId]) VALUES (14, 2034, 2, 3006)
INSERT [dbo].[OrderItem] ([Id], [ProductId], [Quantity], [OrderId]) VALUES (15, 2014, 4, 3006)
INSERT [dbo].[OrderItem] ([Id], [ProductId], [Quantity], [OrderId]) VALUES (16, 2014, 4, 3006)
INSERT [dbo].[OrderItem] ([Id], [ProductId], [Quantity], [OrderId]) VALUES (17, 2014, 4, 3006)
INSERT [dbo].[OrderItem] ([Id], [ProductId], [Quantity], [OrderId]) VALUES (18, 2014, 4, 3006)
INSERT [dbo].[OrderItem] ([Id], [ProductId], [Quantity], [OrderId]) VALUES (19, 2024, 2, 3006)
INSERT [dbo].[OrderItem] ([Id], [ProductId], [Quantity], [OrderId]) VALUES (20, 2024, 2, 3006)
INSERT [dbo].[OrderItem] ([Id], [ProductId], [Quantity], [OrderId]) VALUES (21, 2015, 1, 3007)
INSERT [dbo].[OrderItem] ([Id], [ProductId], [Quantity], [OrderId]) VALUES (22, 2013, 3, 3007)
INSERT [dbo].[OrderItem] ([Id], [ProductId], [Quantity], [OrderId]) VALUES (23, 2013, 3, 3007)
INSERT [dbo].[OrderItem] ([Id], [ProductId], [Quantity], [OrderId]) VALUES (24, 2013, 3, 3007)
INSERT [dbo].[OrderItem] ([Id], [ProductId], [Quantity], [OrderId]) VALUES (25, 2034, 2, 3007)
INSERT [dbo].[OrderItem] ([Id], [ProductId], [Quantity], [OrderId]) VALUES (26, 2034, 2, 3007)
INSERT [dbo].[OrderItem] ([Id], [ProductId], [Quantity], [OrderId]) VALUES (27, 2014, 4, 3007)
INSERT [dbo].[OrderItem] ([Id], [ProductId], [Quantity], [OrderId]) VALUES (28, 2014, 4, 3007)
INSERT [dbo].[OrderItem] ([Id], [ProductId], [Quantity], [OrderId]) VALUES (29, 2014, 4, 3007)
INSERT [dbo].[OrderItem] ([Id], [ProductId], [Quantity], [OrderId]) VALUES (30, 2014, 4, 3007)
INSERT [dbo].[OrderItem] ([Id], [ProductId], [Quantity], [OrderId]) VALUES (31, 2024, 2, 3007)
INSERT [dbo].[OrderItem] ([Id], [ProductId], [Quantity], [OrderId]) VALUES (32, 2024, 2, 3007)
INSERT [dbo].[OrderItem] ([Id], [ProductId], [Quantity], [OrderId]) VALUES (33, 2015, 1, 3008)
INSERT [dbo].[OrderItem] ([Id], [ProductId], [Quantity], [OrderId]) VALUES (34, 2013, 3, 3008)
INSERT [dbo].[OrderItem] ([Id], [ProductId], [Quantity], [OrderId]) VALUES (35, 2013, 3, 3008)
INSERT [dbo].[OrderItem] ([Id], [ProductId], [Quantity], [OrderId]) VALUES (36, 2013, 3, 3008)
INSERT [dbo].[OrderItem] ([Id], [ProductId], [Quantity], [OrderId]) VALUES (37, 2034, 2, 3008)
INSERT [dbo].[OrderItem] ([Id], [ProductId], [Quantity], [OrderId]) VALUES (38, 2034, 2, 3008)
INSERT [dbo].[OrderItem] ([Id], [ProductId], [Quantity], [OrderId]) VALUES (39, 2015, 1, 3009)
INSERT [dbo].[OrderItem] ([Id], [ProductId], [Quantity], [OrderId]) VALUES (40, 2013, 3, 3009)
INSERT [dbo].[OrderItem] ([Id], [ProductId], [Quantity], [OrderId]) VALUES (41, 2013, 3, 3009)
INSERT [dbo].[OrderItem] ([Id], [ProductId], [Quantity], [OrderId]) VALUES (42, 2013, 3, 3009)
INSERT [dbo].[OrderItem] ([Id], [ProductId], [Quantity], [OrderId]) VALUES (43, 2034, 2, 3009)
INSERT [dbo].[OrderItem] ([Id], [ProductId], [Quantity], [OrderId]) VALUES (44, 2034, 2, 3009)
INSERT [dbo].[OrderItem] ([Id], [ProductId], [Quantity], [OrderId]) VALUES (45, 2011, 3, 3010)
INSERT [dbo].[OrderItem] ([Id], [ProductId], [Quantity], [OrderId]) VALUES (46, 2011, 3, 3010)
INSERT [dbo].[OrderItem] ([Id], [ProductId], [Quantity], [OrderId]) VALUES (47, 2011, 3, 3010)
INSERT [dbo].[OrderItem] ([Id], [ProductId], [Quantity], [OrderId]) VALUES (48, 2011, 3, 3011)
INSERT [dbo].[OrderItem] ([Id], [ProductId], [Quantity], [OrderId]) VALUES (49, 2011, 3, 3011)
INSERT [dbo].[OrderItem] ([Id], [ProductId], [Quantity], [OrderId]) VALUES (50, 2011, 3, 3011)
INSERT [dbo].[OrderItem] ([Id], [ProductId], [Quantity], [OrderId]) VALUES (51, 2011, 3, 3012)
INSERT [dbo].[OrderItem] ([Id], [ProductId], [Quantity], [OrderId]) VALUES (52, 2011, 3, 3012)
INSERT [dbo].[OrderItem] ([Id], [ProductId], [Quantity], [OrderId]) VALUES (53, 2011, 3, 3012)
INSERT [dbo].[OrderItem] ([Id], [ProductId], [Quantity], [OrderId]) VALUES (54, 2015, 3, 3013)
INSERT [dbo].[OrderItem] ([Id], [ProductId], [Quantity], [OrderId]) VALUES (55, 2015, 3, 3013)
INSERT [dbo].[OrderItem] ([Id], [ProductId], [Quantity], [OrderId]) VALUES (56, 2015, 3, 3013)
INSERT [dbo].[OrderItem] ([Id], [ProductId], [Quantity], [OrderId]) VALUES (57, 2036, 1, 3014)
INSERT [dbo].[OrderItem] ([Id], [ProductId], [Quantity], [OrderId]) VALUES (58, 2031, 1, 3014)
INSERT [dbo].[OrderItem] ([Id], [ProductId], [Quantity], [OrderId]) VALUES (59, 2012, 1, 3014)
INSERT [dbo].[OrderItem] ([Id], [ProductId], [Quantity], [OrderId]) VALUES (60, 2003, 1, 3014)
INSERT [dbo].[OrderItem] ([Id], [ProductId], [Quantity], [OrderId]) VALUES (61, 2036, 1, 3015)
INSERT [dbo].[OrderItem] ([Id], [ProductId], [Quantity], [OrderId]) VALUES (62, 2031, 1, 3015)
INSERT [dbo].[OrderItem] ([Id], [ProductId], [Quantity], [OrderId]) VALUES (63, 2012, 1, 3015)
INSERT [dbo].[OrderItem] ([Id], [ProductId], [Quantity], [OrderId]) VALUES (64, 2003, 1, 3015)
INSERT [dbo].[OrderItem] ([Id], [ProductId], [Quantity], [OrderId]) VALUES (65, 2036, 1, 3016)
INSERT [dbo].[OrderItem] ([Id], [ProductId], [Quantity], [OrderId]) VALUES (66, 2031, 1, 3016)
INSERT [dbo].[OrderItem] ([Id], [ProductId], [Quantity], [OrderId]) VALUES (67, 2012, 1, 3016)
INSERT [dbo].[OrderItem] ([Id], [ProductId], [Quantity], [OrderId]) VALUES (68, 2003, 1, 3016)
INSERT [dbo].[OrderItem] ([Id], [ProductId], [Quantity], [OrderId]) VALUES (69, 2036, 1, 3017)
INSERT [dbo].[OrderItem] ([Id], [ProductId], [Quantity], [OrderId]) VALUES (70, 2031, 1, 3017)
INSERT [dbo].[OrderItem] ([Id], [ProductId], [Quantity], [OrderId]) VALUES (71, 2012, 1, 3017)
INSERT [dbo].[OrderItem] ([Id], [ProductId], [Quantity], [OrderId]) VALUES (72, 2003, 1, 3017)
INSERT [dbo].[OrderItem] ([Id], [ProductId], [Quantity], [OrderId]) VALUES (73, 2004, 1, 3018)
INSERT [dbo].[OrderItem] ([Id], [ProductId], [Quantity], [OrderId]) VALUES (74, 2007, 2, 3018)
INSERT [dbo].[OrderItem] ([Id], [ProductId], [Quantity], [OrderId]) VALUES (75, 2007, 2, 3018)
INSERT [dbo].[OrderItem] ([Id], [ProductId], [Quantity], [OrderId]) VALUES (76, 2037, 1, 3018)
INSERT [dbo].[OrderItem] ([Id], [ProductId], [Quantity], [OrderId]) VALUES (77, 2032, 1, 3018)
INSERT [dbo].[OrderItem] ([Id], [ProductId], [Quantity], [OrderId]) VALUES (78, 2010, 1, 3019)
INSERT [dbo].[OrderItem] ([Id], [ProductId], [Quantity], [OrderId]) VALUES (79, 2038, 1, 3019)
INSERT [dbo].[OrderItem] ([Id], [ProductId], [Quantity], [OrderId]) VALUES (80, 2020, 1, 3019)
INSERT [dbo].[OrderItem] ([Id], [ProductId], [Quantity], [OrderId]) VALUES (81, 2029, 3, 3020)
INSERT [dbo].[OrderItem] ([Id], [ProductId], [Quantity], [OrderId]) VALUES (82, 2029, 3, 3020)
INSERT [dbo].[OrderItem] ([Id], [ProductId], [Quantity], [OrderId]) VALUES (83, 2029, 3, 3020)
INSERT [dbo].[OrderItem] ([Id], [ProductId], [Quantity], [OrderId]) VALUES (84, 2030, 1, 3020)
INSERT [dbo].[OrderItem] ([Id], [ProductId], [Quantity], [OrderId]) VALUES (85, 2026, 1, 3020)
INSERT [dbo].[OrderItem] ([Id], [ProductId], [Quantity], [OrderId]) VALUES (86, 2039, 1, 3021)
INSERT [dbo].[OrderItem] ([Id], [ProductId], [Quantity], [OrderId]) VALUES (87, 2032, 1, 3021)
INSERT [dbo].[OrderItem] ([Id], [ProductId], [Quantity], [OrderId]) VALUES (88, 2025, 1, 3021)
INSERT [dbo].[OrderItem] ([Id], [ProductId], [Quantity], [OrderId]) VALUES (89, 2039, 1, 3022)
INSERT [dbo].[OrderItem] ([Id], [ProductId], [Quantity], [OrderId]) VALUES (90, 2032, 1, 3022)
INSERT [dbo].[OrderItem] ([Id], [ProductId], [Quantity], [OrderId]) VALUES (91, 2025, 1, 3022)
INSERT [dbo].[OrderItem] ([Id], [ProductId], [Quantity], [OrderId]) VALUES (92, 2015, 1, 3023)
INSERT [dbo].[OrderItem] ([Id], [ProductId], [Quantity], [OrderId]) VALUES (93, 2011, 1, 3023)
INSERT [dbo].[OrderItem] ([Id], [ProductId], [Quantity], [OrderId]) VALUES (94, 2018, 1, 3023)
INSERT [dbo].[OrderItem] ([Id], [ProductId], [Quantity], [OrderId]) VALUES (95, 2015, 1, 3024)
INSERT [dbo].[OrderItem] ([Id], [ProductId], [Quantity], [OrderId]) VALUES (96, 2015, 1, 3025)
INSERT [dbo].[OrderItem] ([Id], [ProductId], [Quantity], [OrderId]) VALUES (97, 2011, 4, 3025)
INSERT [dbo].[OrderItem] ([Id], [ProductId], [Quantity], [OrderId]) VALUES (98, 2011, 4, 3024)
INSERT [dbo].[OrderItem] ([Id], [ProductId], [Quantity], [OrderId]) VALUES (99, 2018, 1, 3024)
GO
INSERT [dbo].[OrderItem] ([Id], [ProductId], [Quantity], [OrderId]) VALUES (100, 2018, 1, 3025)
INSERT [dbo].[OrderItem] ([Id], [ProductId], [Quantity], [OrderId]) VALUES (101, 2011, 4, 3025)
INSERT [dbo].[OrderItem] ([Id], [ProductId], [Quantity], [OrderId]) VALUES (102, 2011, 4, 3024)
INSERT [dbo].[OrderItem] ([Id], [ProductId], [Quantity], [OrderId]) VALUES (103, 2011, 4, 3024)
INSERT [dbo].[OrderItem] ([Id], [ProductId], [Quantity], [OrderId]) VALUES (104, 2011, 4, 3025)
INSERT [dbo].[OrderItem] ([Id], [ProductId], [Quantity], [OrderId]) VALUES (105, 2011, 4, 3025)
INSERT [dbo].[OrderItem] ([Id], [ProductId], [Quantity], [OrderId]) VALUES (106, 2011, 4, 3024)
INSERT [dbo].[OrderItem] ([Id], [ProductId], [Quantity], [OrderId]) VALUES (107, 2011, 2, 3026)
INSERT [dbo].[OrderItem] ([Id], [ProductId], [Quantity], [OrderId]) VALUES (108, 2011, 2, 3026)
INSERT [dbo].[OrderItem] ([Id], [ProductId], [Quantity], [OrderId]) VALUES (109, 2018, 1, 3027)
INSERT [dbo].[OrderItem] ([Id], [ProductId], [Quantity], [OrderId]) VALUES (110, 2018, 1, 3028)
INSERT [dbo].[OrderItem] ([Id], [ProductId], [Quantity], [OrderId]) VALUES (111, 2018, 1, 3029)
INSERT [dbo].[OrderItem] ([Id], [ProductId], [Quantity], [OrderId]) VALUES (112, 2011, 1, 3029)
INSERT [dbo].[OrderItem] ([Id], [ProductId], [Quantity], [OrderId]) VALUES (113, 2018, 1, 3030)
INSERT [dbo].[OrderItem] ([Id], [ProductId], [Quantity], [OrderId]) VALUES (114, 2011, 1, 3030)
INSERT [dbo].[OrderItem] ([Id], [ProductId], [Quantity], [OrderId]) VALUES (115, 2018, 1, 3031)
INSERT [dbo].[OrderItem] ([Id], [ProductId], [Quantity], [OrderId]) VALUES (116, 2011, 1, 3031)
INSERT [dbo].[OrderItem] ([Id], [ProductId], [Quantity], [OrderId]) VALUES (117, 2034, 1, 3032)
INSERT [dbo].[OrderItem] ([Id], [ProductId], [Quantity], [OrderId]) VALUES (118, 2013, 1, 3032)
INSERT [dbo].[OrderItem] ([Id], [ProductId], [Quantity], [OrderId]) VALUES (119, 2022, 1, 3032)
INSERT [dbo].[OrderItem] ([Id], [ProductId], [Quantity], [OrderId]) VALUES (120, 2004, 1, 3033)
INSERT [dbo].[OrderItem] ([Id], [ProductId], [Quantity], [OrderId]) VALUES (121, 2019, 1, 3033)
INSERT [dbo].[OrderItem] ([Id], [ProductId], [Quantity], [OrderId]) VALUES (122, 2038, 1, 3033)
INSERT [dbo].[OrderItem] ([Id], [ProductId], [Quantity], [OrderId]) VALUES (123, 2020, 1, 3033)
INSERT [dbo].[OrderItem] ([Id], [ProductId], [Quantity], [OrderId]) VALUES (124, 2012, 1, 3033)
INSERT [dbo].[OrderItem] ([Id], [ProductId], [Quantity], [OrderId]) VALUES (125, 2004, 1, 3034)
INSERT [dbo].[OrderItem] ([Id], [ProductId], [Quantity], [OrderId]) VALUES (126, 2019, 1, 3034)
INSERT [dbo].[OrderItem] ([Id], [ProductId], [Quantity], [OrderId]) VALUES (127, 2038, 1, 3034)
INSERT [dbo].[OrderItem] ([Id], [ProductId], [Quantity], [OrderId]) VALUES (128, 2020, 1, 3034)
INSERT [dbo].[OrderItem] ([Id], [ProductId], [Quantity], [OrderId]) VALUES (129, 2012, 1, 3034)
INSERT [dbo].[OrderItem] ([Id], [ProductId], [Quantity], [OrderId]) VALUES (130, 2022, 3, 3035)
INSERT [dbo].[OrderItem] ([Id], [ProductId], [Quantity], [OrderId]) VALUES (131, 2022, 3, 3035)
INSERT [dbo].[OrderItem] ([Id], [ProductId], [Quantity], [OrderId]) VALUES (132, 2022, 3, 3035)
INSERT [dbo].[OrderItem] ([Id], [ProductId], [Quantity], [OrderId]) VALUES (133, 2034, 1, 3035)
INSERT [dbo].[OrderItem] ([Id], [ProductId], [Quantity], [OrderId]) VALUES (1109, 2011, 5, 4027)
INSERT [dbo].[OrderItem] ([Id], [ProductId], [Quantity], [OrderId]) VALUES (1110, 2011, 5, 4027)
INSERT [dbo].[OrderItem] ([Id], [ProductId], [Quantity], [OrderId]) VALUES (1111, 2011, 5, 4027)
INSERT [dbo].[OrderItem] ([Id], [ProductId], [Quantity], [OrderId]) VALUES (1112, 2011, 5, 4027)
INSERT [dbo].[OrderItem] ([Id], [ProductId], [Quantity], [OrderId]) VALUES (1113, 2011, 5, 4027)
INSERT [dbo].[OrderItem] ([Id], [ProductId], [Quantity], [OrderId]) VALUES (1114, 2022, 5, 4028)
INSERT [dbo].[OrderItem] ([Id], [ProductId], [Quantity], [OrderId]) VALUES (1115, 2022, 5, 4028)
INSERT [dbo].[OrderItem] ([Id], [ProductId], [Quantity], [OrderId]) VALUES (1116, 2022, 5, 4028)
INSERT [dbo].[OrderItem] ([Id], [ProductId], [Quantity], [OrderId]) VALUES (1117, 2022, 5, 4028)
INSERT [dbo].[OrderItem] ([Id], [ProductId], [Quantity], [OrderId]) VALUES (1118, 2022, 5, 4028)
INSERT [dbo].[OrderItem] ([Id], [ProductId], [Quantity], [OrderId]) VALUES (1119, 2022, 5, 4029)
INSERT [dbo].[OrderItem] ([Id], [ProductId], [Quantity], [OrderId]) VALUES (1120, 2022, 5, 4029)
INSERT [dbo].[OrderItem] ([Id], [ProductId], [Quantity], [OrderId]) VALUES (1121, 2022, 5, 4029)
INSERT [dbo].[OrderItem] ([Id], [ProductId], [Quantity], [OrderId]) VALUES (1122, 2022, 5, 4029)
INSERT [dbo].[OrderItem] ([Id], [ProductId], [Quantity], [OrderId]) VALUES (1123, 2022, 5, 4029)
INSERT [dbo].[OrderItem] ([Id], [ProductId], [Quantity], [OrderId]) VALUES (1124, 2022, 5, 4030)
INSERT [dbo].[OrderItem] ([Id], [ProductId], [Quantity], [OrderId]) VALUES (1125, 2022, 5, 4030)
INSERT [dbo].[OrderItem] ([Id], [ProductId], [Quantity], [OrderId]) VALUES (1126, 2022, 5, 4030)
INSERT [dbo].[OrderItem] ([Id], [ProductId], [Quantity], [OrderId]) VALUES (1127, 2022, 5, 4030)
INSERT [dbo].[OrderItem] ([Id], [ProductId], [Quantity], [OrderId]) VALUES (1128, 2022, 5, 4030)
INSERT [dbo].[OrderItem] ([Id], [ProductId], [Quantity], [OrderId]) VALUES (1129, 2022, 5, 4031)
INSERT [dbo].[OrderItem] ([Id], [ProductId], [Quantity], [OrderId]) VALUES (1130, 2022, 5, 4031)
INSERT [dbo].[OrderItem] ([Id], [ProductId], [Quantity], [OrderId]) VALUES (1131, 2022, 5, 4031)
INSERT [dbo].[OrderItem] ([Id], [ProductId], [Quantity], [OrderId]) VALUES (1132, 2022, 5, 4031)
INSERT [dbo].[OrderItem] ([Id], [ProductId], [Quantity], [OrderId]) VALUES (1133, 2022, 5, 4031)
SET IDENTITY_INSERT [dbo].[OrderItem] OFF
GO
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([Id], [OrderDate], [OrderSum], [UserId]) VALUES (1, CAST(N'2023-11-23' AS Date), 291, 5)
INSERT [dbo].[Orders] ([Id], [OrderDate], [OrderSum], [UserId]) VALUES (2, CAST(N'2023-11-23' AS Date), 151, 5)
INSERT [dbo].[Orders] ([Id], [OrderDate], [OrderSum], [UserId]) VALUES (1002, CAST(N'2023-11-24' AS Date), 767, 5)
INSERT [dbo].[Orders] ([Id], [OrderDate], [OrderSum], [UserId]) VALUES (2002, CAST(N'2023-11-26' AS Date), 345, 2)
INSERT [dbo].[Orders] ([Id], [OrderDate], [OrderSum], [UserId]) VALUES (2003, CAST(N'2023-11-26' AS Date), 96, 5)
INSERT [dbo].[Orders] ([Id], [OrderDate], [OrderSum], [UserId]) VALUES (3002, CAST(N'2023-11-27' AS Date), 330, 5)
INSERT [dbo].[Orders] ([Id], [OrderDate], [OrderSum], [UserId]) VALUES (3003, CAST(N'2023-11-27' AS Date), 318, 5)
INSERT [dbo].[Orders] ([Id], [OrderDate], [OrderSum], [UserId]) VALUES (3004, CAST(N'2023-11-28' AS Date), 309, 5)
INSERT [dbo].[Orders] ([Id], [OrderDate], [OrderSum], [UserId]) VALUES (3005, CAST(N'2023-11-29' AS Date), 880, 5)
INSERT [dbo].[Orders] ([Id], [OrderDate], [OrderSum], [UserId]) VALUES (3006, CAST(N'2023-11-29' AS Date), 1598, 5)
INSERT [dbo].[Orders] ([Id], [OrderDate], [OrderSum], [UserId]) VALUES (3007, CAST(N'2023-11-29' AS Date), 1598, 5)
INSERT [dbo].[Orders] ([Id], [OrderDate], [OrderSum], [UserId]) VALUES (3008, CAST(N'2023-11-29' AS Date), 382, 5)
INSERT [dbo].[Orders] ([Id], [OrderDate], [OrderSum], [UserId]) VALUES (3009, CAST(N'2023-11-29' AS Date), 382, 5)
INSERT [dbo].[Orders] ([Id], [OrderDate], [OrderSum], [UserId]) VALUES (3010, CAST(N'2023-11-29' AS Date), 123, 5)
INSERT [dbo].[Orders] ([Id], [OrderDate], [OrderSum], [UserId]) VALUES (3011, CAST(N'2023-11-29' AS Date), 123, 5)
INSERT [dbo].[Orders] ([Id], [OrderDate], [OrderSum], [UserId]) VALUES (3012, CAST(N'2023-11-29' AS Date), 123, 5)
INSERT [dbo].[Orders] ([Id], [OrderDate], [OrderSum], [UserId]) VALUES (3013, CAST(N'2023-11-29' AS Date), 165, 5)
INSERT [dbo].[Orders] ([Id], [OrderDate], [OrderSum], [UserId]) VALUES (3014, CAST(N'2023-11-29' AS Date), 1110, 5)
INSERT [dbo].[Orders] ([Id], [OrderDate], [OrderSum], [UserId]) VALUES (3015, CAST(N'2023-11-29' AS Date), 1110, 5)
INSERT [dbo].[Orders] ([Id], [OrderDate], [OrderSum], [UserId]) VALUES (3016, CAST(N'2023-11-29' AS Date), 1110, 5)
INSERT [dbo].[Orders] ([Id], [OrderDate], [OrderSum], [UserId]) VALUES (3017, CAST(N'2023-11-29' AS Date), 1110, 5)
INSERT [dbo].[Orders] ([Id], [OrderDate], [OrderSum], [UserId]) VALUES (3018, CAST(N'2023-11-29' AS Date), 2520, 5)
INSERT [dbo].[Orders] ([Id], [OrderDate], [OrderSum], [UserId]) VALUES (3019, CAST(N'2023-11-29' AS Date), 414, 5)
INSERT [dbo].[Orders] ([Id], [OrderDate], [OrderSum], [UserId]) VALUES (3020, CAST(N'2023-11-29' AS Date), 3150, 5)
INSERT [dbo].[Orders] ([Id], [OrderDate], [OrderSum], [UserId]) VALUES (3021, CAST(N'2023-11-29' AS Date), 1550, 5)
INSERT [dbo].[Orders] ([Id], [OrderDate], [OrderSum], [UserId]) VALUES (3022, CAST(N'2023-11-29' AS Date), 1550, 5)
INSERT [dbo].[Orders] ([Id], [OrderDate], [OrderSum], [UserId]) VALUES (3023, CAST(N'2023-11-29' AS Date), 126, 5)
INSERT [dbo].[Orders] ([Id], [OrderDate], [OrderSum], [UserId]) VALUES (3024, CAST(N'2023-11-29' AS Date), 741, 5)
INSERT [dbo].[Orders] ([Id], [OrderDate], [OrderSum], [UserId]) VALUES (3025, CAST(N'2023-11-29' AS Date), 741, 5)
INSERT [dbo].[Orders] ([Id], [OrderDate], [OrderSum], [UserId]) VALUES (3026, CAST(N'2023-11-29' AS Date), 164, 5)
INSERT [dbo].[Orders] ([Id], [OrderDate], [OrderSum], [UserId]) VALUES (3027, CAST(N'2023-12-02' AS Date), 30, 5)
INSERT [dbo].[Orders] ([Id], [OrderDate], [OrderSum], [UserId]) VALUES (3028, CAST(N'2023-12-02' AS Date), 30, 5)
INSERT [dbo].[Orders] ([Id], [OrderDate], [OrderSum], [UserId]) VALUES (3029, CAST(N'2023-12-02' AS Date), 71, 5)
INSERT [dbo].[Orders] ([Id], [OrderDate], [OrderSum], [UserId]) VALUES (3030, CAST(N'2023-12-02' AS Date), 0, 5)
INSERT [dbo].[Orders] ([Id], [OrderDate], [OrderSum], [UserId]) VALUES (3031, CAST(N'2023-12-02' AS Date), 0, 5)
INSERT [dbo].[Orders] ([Id], [OrderDate], [OrderSum], [UserId]) VALUES (3032, CAST(N'2023-12-02' AS Date), 0, 5)
INSERT [dbo].[Orders] ([Id], [OrderDate], [OrderSum], [UserId]) VALUES (3033, CAST(N'2023-12-02' AS Date), 770, 5)
INSERT [dbo].[Orders] ([Id], [OrderDate], [OrderSum], [UserId]) VALUES (3034, CAST(N'2023-12-02' AS Date), 770, 5)
INSERT [dbo].[Orders] ([Id], [OrderDate], [OrderSum], [UserId]) VALUES (3035, CAST(N'2023-12-02' AS Date), 690, 5)
INSERT [dbo].[Orders] ([Id], [OrderDate], [OrderSum], [UserId]) VALUES (4027, CAST(N'2023-12-04' AS Date), 1025, 5)
INSERT [dbo].[Orders] ([Id], [OrderDate], [OrderSum], [UserId]) VALUES (4028, CAST(N'2023-12-05' AS Date), 1750, 5)
INSERT [dbo].[Orders] ([Id], [OrderDate], [OrderSum], [UserId]) VALUES (4029, CAST(N'2023-12-05' AS Date), 1750, 5)
INSERT [dbo].[Orders] ([Id], [OrderDate], [OrderSum], [UserId]) VALUES (4030, CAST(N'2023-12-05' AS Date), 1750, 5)
INSERT [dbo].[Orders] ([Id], [OrderDate], [OrderSum], [UserId]) VALUES (4031, CAST(N'2023-12-05' AS Date), 1750, 5)
SET IDENTITY_INSERT [dbo].[Orders] OFF
GO
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([Id], [ProdName], [Price], [ProdImage], [CategoryId], [prodDescription]) VALUES (2002, N'כוסות זכוכית חגיגיות', 120, N'azurGlasses.jpg     ', 5, N'6 כוסות זכוכית חגיגיות צרות ומתרחבות כלפי מעלה')
INSERT [dbo].[Products] ([Id], [ProdName], [Price], [ProdImage], [CategoryId], [prodDescription]) VALUES (2003, N'סט צלחות דגם לונה   ', 360, N'pinkPlates.jpg      ', 3, N'סט צלחות עשויות חרסינה ובעלות גימור מעט מעוגל')
INSERT [dbo].[Products] ([Id], [ProdName], [Price], [ProdImage], [CategoryId], [prodDescription]) VALUES (2004, N'סט צלחות דגם עץ     ', 120, N'woodenPlates.jpg    ', 3, N'סט צלחות בעלות מרקם חלק בשילוב דפוס עץ')
INSERT [dbo].[Products] ([Id], [ProdName], [Price], [ProdImage], [CategoryId], [prodDescription]) VALUES (2005, N'סט צלחות דגם פלאט   ', 360, N'whitePlates.jpg     ', 3, N'סט צלחות קרמיקה בעיצוב מודרני נקי וקלאסי')
INSERT [dbo].[Products] ([Id], [ProdName], [Price], [ProdImage], [CategoryId], [prodDescription]) VALUES (2006, N'סט צלחות דגם וינטאג ', 690, N'greenPlates.jpg     ', 3, N'סט צלחות מעוצבות בטקסטורת צביעה לא אחידה ובגימור טבעי')
INSERT [dbo].[Products] ([Id], [ProdName], [Price], [ProdImage], [CategoryId], [prodDescription]) VALUES (2007, N'סט צלחות דגם יפן    ', 700, N'grayPlates.jpg      ', 3, N'סט צלחות עשויות קרמיקה ומעוצבות במראה מודרני ולא שיגרתי')
INSERT [dbo].[Products] ([Id], [ProdName], [Price], [ProdImage], [CategoryId], [prodDescription]) VALUES (2008, N'סכום דגם טוקיו      ', 379, N'blackCutlery.jpg    ', 6, N'סט סכום עשוי מפלדת אל חלד PVD 18/10 בגווני השחור')
INSERT [dbo].[Products] ([Id], [ProdName], [Price], [ProdImage], [CategoryId], [prodDescription]) VALUES (2009, N'סכום זהב דגם דיאנה  ', 499, N'goldCutlery.jpg     ', 6, N'סט סכום המגיע בצבע זהב יוקרתי ובעל גימור קלאסי')
INSERT [dbo].[Products] ([Id], [ProdName], [Price], [ProdImage], [CategoryId], [prodDescription]) VALUES (2010, N'סכום דגם אידן       ', 139, N'whiteCutlery.jpg    ', 6, N'סט סכום עשוי מתכת כסף איכותית ומבריקה בשילוב ידיות פלסטיק מעוצבות')
INSERT [dbo].[Products] ([Id], [ProdName], [Price], [ProdImage], [CategoryId], [prodDescription]) VALUES (2011, N'כפות דגם דינר       ', 41, N'spoons.jpg          ', 6, N'כפות נירוסטה במראה אלגנטי ויוקרתי')
INSERT [dbo].[Products] ([Id], [ProdName], [Price], [ProdImage], [CategoryId], [prodDescription]) VALUES (2012, N'סכום דגם ניקו       ', 250, N'silverCutlery.jpg   ', 6, N'סט סכו"ם כסף 24 חלקים עשוי נירוסטה')
INSERT [dbo].[Products] ([Id], [ProdName], [Price], [ProdImage], [CategoryId], [prodDescription]) VALUES (2013, N'צלחת הגשה מלבנית    ', 69, N'woodenPlate.jpg     ', 4, N'צלחת מלבנית, מעוגלת בקצוות במראה סירה. עשוי עץ במראה כפרי טבעי')
INSERT [dbo].[Products] ([Id], [ProdName], [Price], [ProdImage], [CategoryId], [prodDescription]) VALUES (2014, N'מגש עגול קש         ', 79, N'naturalTray.jpg     ', 4, N'מגש עגול במראה כפרי ודוגמת קש קלועה. מתאים לאירוח והגשה')
INSERT [dbo].[Products] ([Id], [ProdName], [Price], [ProdImage], [CategoryId], [prodDescription]) VALUES (2015, N'צלחת הגשה לעוגות    ', 55, N'goldTray.jpg        ', 4, N'צלחת שקופה במרקם זהב מעניין ומושלמת לאירוח יוקרתי')
INSERT [dbo].[Products] ([Id], [ProdName], [Price], [ProdImage], [CategoryId], [prodDescription]) VALUES (2016, N'קערת זכוכית מוזהבת  ', 55, N'goldBowl.jpg        ', 4, N'הקערה שקופה במרקם זהב מעניין ומושלמת לאירוח יוקרתי')
INSERT [dbo].[Products] ([Id], [ProdName], [Price], [ProdImage], [CategoryId], [prodDescription]) VALUES (2017, N'קערת זכוכית דגם אורו', 55, N'shimmeringBowl.jpg  ', 4, N'קערה במרקם צביעה לא אחיד, עם משיכות צבע בגוון זהוב')
INSERT [dbo].[Products] ([Id], [ProdName], [Price], [ProdImage], [CategoryId], [prodDescription]) VALUES (2018, N'מגבת אירוח דגם דיטה ', 30, N'badRoomTowel.jpg    ', 2, N'מגבת במרקם חלק ונעימה למגע. רמת ספיגה גבוהה, 100% כותנה')
INSERT [dbo].[Products] ([Id], [ProdName], [Price], [ProdImage], [CategoryId], [prodDescription]) VALUES (2019, N'סט מגבות יוקרתיות   ', 125, N'bathTowels.jpg      ', 2, N'מגבות רכות, עם אריגה ייחודית היוצרת פסים רכים לאורך המגבת')
INSERT [dbo].[Products] ([Id], [ProdName], [Price], [ProdImage], [CategoryId], [prodDescription]) VALUES (2020, N'סט כוסות לקפה       ', 150, N'coffeGlasses.jpg    ', 5, N'סט 4 כוסות להגשת קפה בצבע שחור עם ידית מעוגלת')
INSERT [dbo].[Products] ([Id], [ProdName], [Price], [ProdImage], [CategoryId], [prodDescription]) VALUES (2021, N'סט כוסות דגם ענבר   ', 350, N'AmberGlasses.jpg    ', 5, N'סט 6 כוסות על רגל צרה עבור ארועים ואירוח דגם ענבר')
INSERT [dbo].[Products] ([Id], [ProdName], [Price], [ProdImage], [CategoryId], [prodDescription]) VALUES (2022, N'כוס אומנות דגם ציפור', 70, N'birdGlass.jpg       ', 5, N'כוס אומנות מצויירת עם ציור של ציפור מובלט על הכוס')
INSERT [dbo].[Products] ([Id], [ProdName], [Price], [ProdImage], [CategoryId], [prodDescription]) VALUES (2023, N'סט כוסות גבוהות     ', 550, N'longGlasses.jpg     ', 5, N'סט 6 כוסות זכוכית גבוהות במראה עשיר ויוקרתי לארועים מיוחדים')
INSERT [dbo].[Products] ([Id], [ProdName], [Price], [ProdImage], [CategoryId], [prodDescription]) VALUES (2024, N'סט כוסות יהלום      ', 450, N'DiamondGlasses.jpg  ', 5, N'סט 6 כוסות דגם יהלום לשימוש יומיומי איכותיות ולא שבירות')
INSERT [dbo].[Products] ([Id], [ProdName], [Price], [ProdImage], [CategoryId], [prodDescription]) VALUES (2025, N'סט סירים ומחבתות    ', 950, N'pots&pen.jpg        ', 1, N'סט 4 סירים ו-3 מחבתות בייצור מיוחד המתנקה בקלות עם מכסים זכוכית')
INSERT [dbo].[Products] ([Id], [ProdName], [Price], [ProdImage], [CategoryId], [prodDescription]) VALUES (2026, N'סט סירים כחול       ', 750, N'setPots.jpg         ', 1, N'סט 4 סירים כחולים בגדלים שונים ומחבת כחול סט + סכין חדה מתנה')
INSERT [dbo].[Products] ([Id], [ProdName], [Price], [ProdImage], [CategoryId], [prodDescription]) VALUES (2027, N'סט 3 סירים          ', 600, N'3pots.jpg           ', 1, N'סט 3 סירים מיוצר באיטליה ייצור מיוחד')
INSERT [dbo].[Products] ([Id], [ProdName], [Price], [ProdImage], [CategoryId], [prodDescription]) VALUES (2028, N'סט 3 מחבתות         ', 600, N'3RedPens.jpg        ', 1, N'סט 3 מחבתות בצבע אדום, תחתית מתכת עם ציפוי קרמי')
INSERT [dbo].[Products] ([Id], [ProdName], [Price], [ProdImage], [CategoryId], [prodDescription]) VALUES (2029, N'מחבת פנקייק         ', 600, N'pancakePen.jpg      ', 1, N'מחבת לפנקייק, יצור מיוחד לפנקייק מושלמים פריכים וטעימים')
INSERT [dbo].[Products] ([Id], [ProdName], [Price], [ProdImage], [CategoryId], [prodDescription]) VALUES (2030, N'מחבת מוחלק          ', 600, N'dividedPen.jpg      ', 1, N'מחבת מחולק לבישול כמה דברים ביחד בצורה יעילה')
INSERT [dbo].[Products] ([Id], [ProdName], [Price], [ProdImage], [CategoryId], [prodDescription]) VALUES (2031, N'סט מגבות מדוגמות    ', 250, N'towelSet.jpg        ', 2, N'סט מגבות עם דוגמת פסים בכמה צבעים רכות ונעימות למגע')
INSERT [dbo].[Products] ([Id], [ProdName], [Price], [ProdImage], [CategoryId], [prodDescription]) VALUES (2032, N'סט מגבות יוקרתיות   ', 300, N'PinkTowels.jpg      ', 2, N'סט מגבות בגדלים שונים בצבע ורוד ענברי בגימור גלי ולא שווה ')
INSERT [dbo].[Products] ([Id], [ProdName], [Price], [ProdImage], [CategoryId], [prodDescription]) VALUES (2034, N'צלחת הגשה שטוחה     ', 60, N'pinkPlate.jpg       ', 4, N'צלחת הגשה שטוחה עם שוליים נמוכים בגימור גלי ומענין במראה יוקרתי ומרשים')
INSERT [dbo].[Products] ([Id], [ProdName], [Price], [ProdImage], [CategoryId], [prodDescription]) VALUES (2036, N'סט סכום זהב         ', 250, N'GoldCultrey.jpg     ', 6, N'סט סכו"ם זהב בגימור מרשים ויוקרתי לאירוח וחגים')
INSERT [dbo].[Products] ([Id], [ProdName], [Price], [ProdImage], [CategoryId], [prodDescription]) VALUES (2037, N'סט צלחות דגם טיפה   ', 700, N'tipPlate.jpg        ', 3, N'סט צלחות עשויות קרמיקה ומעוצבות בצורת טיפה צורה מעניינת המשווה לזה מראה מודרני ולא שיגרתי')
INSERT [dbo].[Products] ([Id], [ProdName], [Price], [ProdImage], [CategoryId], [prodDescription]) VALUES (2038, N'מגבת עם חריטה של שם ', 125, N'nameTowel.jpg       ', 2, N'מגבת יוקרתית ונעימה למגע עם חריטה של שם או לוגו אישי על המגבת ')
INSERT [dbo].[Products] ([Id], [ProdName], [Price], [ProdImage], [CategoryId], [prodDescription]) VALUES (2039, N'מארז מגבות          ', 300, N'packTowel.jpg       ', 2, N'מארז מגבות קשורות בסרט רכות ונעימות למגע ')
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
SET IDENTITY_INSERT [dbo].[Rating] ON 

INSERT [dbo].[Rating] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (1, N'localhost:44326', N'GET       ', N'/login.html', N'localhost:44326HTTP/2', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Safari/537.36', CAST(N'2023-12-05T01:11:20.007' AS DateTime))
INSERT [dbo].[Rating] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (2, N'localhost:44326', N'GET       ', N'/favicon.ico', N'localhost:44326HTTP/2', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Safari/537.36', CAST(N'2023-12-05T01:11:53.847' AS DateTime))
INSERT [dbo].[Rating] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (3, N'localhost:44326', N'POST      ', N'/api/users/login', N'localhost:44326HTTP/2', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Safari/537.36', CAST(N'2023-12-05T01:12:16.160' AS DateTime))
INSERT [dbo].[Rating] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (4, N'localhost:44326', N'POST      ', N'/api/users/login', N'localhost:44326HTTP/2', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Safari/537.36', CAST(N'2023-12-05T01:12:47.140' AS DateTime))
INSERT [dbo].[Rating] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (5, N'localhost:44326', N'POST      ', N'/api/users/login', N'localhost:44326HTTP/2', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Safari/537.36', CAST(N'2023-12-05T01:20:13.160' AS DateTime))
INSERT [dbo].[Rating] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (6, N'localhost:44326', N'GET       ', N'/favicon.ico', N'localhost:44326HTTP/2', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Safari/537.36', CAST(N'2023-12-05T01:24:46.780' AS DateTime))
INSERT [dbo].[Rating] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (7, N'localhost:44326', N'POST      ', N'/api/users/login', N'localhost:44326HTTP/2', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Safari/537.36', CAST(N'2023-12-05T01:25:29.693' AS DateTime))
INSERT [dbo].[Rating] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (8, N'localhost:44326', N'GET       ', N'/favicon.ico', N'localhost:44326HTTP/2', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Safari/537.36', CAST(N'2023-12-05T01:30:43.303' AS DateTime))
INSERT [dbo].[Rating] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (9, N'localhost:44326', N'POST      ', N'/api/users/login', N'localhost:44326HTTP/2', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Safari/537.36', CAST(N'2023-12-05T01:30:58.137' AS DateTime))
INSERT [dbo].[Rating] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (10, N'localhost:44326', N'GET       ', N'/favicon.ico', N'localhost:44326HTTP/2', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Safari/537.36', CAST(N'2023-12-05T01:32:38.530' AS DateTime))
INSERT [dbo].[Rating] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (11, N'localhost:44326', N'POST      ', N'/api/users/login', N'localhost:44326HTTP/2', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Safari/537.36', CAST(N'2023-12-05T01:32:56.303' AS DateTime))
INSERT [dbo].[Rating] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (12, N'localhost:44326', N'POST      ', N'/api/users/login', N'localhost:44326HTTP/2', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Safari/537.36', CAST(N'2023-12-05T01:33:06.617' AS DateTime))
INSERT [dbo].[Rating] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (13, N'localhost:44326', N'GET       ', N'/login.html', N'localhost:44326HTTP/2', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Safari/537.36', CAST(N'2023-12-05T01:33:17.363' AS DateTime))
INSERT [dbo].[Rating] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (14, N'localhost:44326', N'GET       ', N'/Scripts/login.js', N'localhost:44326HTTP/2', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Safari/537.36', CAST(N'2023-12-05T01:33:17.460' AS DateTime))
INSERT [dbo].[Rating] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (15, N'localhost:44326', N'GET       ', N'/Style/login.css', N'localhost:44326HTTP/2', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Safari/537.36', CAST(N'2023-12-05T01:33:17.477' AS DateTime))
INSERT [dbo].[Rating] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (16, N'localhost:44326', N'GET       ', N'/favicon.ico', N'localhost:44326HTTP/2', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Safari/537.36', CAST(N'2023-12-05T01:33:18.170' AS DateTime))
INSERT [dbo].[Rating] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (17, N'localhost:44326', N'GET       ', N'/login.html', N'localhost:44326HTTP/2', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Safari/537.36', CAST(N'2023-12-05T01:33:26.293' AS DateTime))
INSERT [dbo].[Rating] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (18, N'localhost:44326', N'GET       ', N'/Style/login.css', N'localhost:44326HTTP/2', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Safari/537.36', CAST(N'2023-12-05T01:33:26.363' AS DateTime))
INSERT [dbo].[Rating] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (19, N'localhost:44326', N'GET       ', N'/Scripts/login.js', N'localhost:44326HTTP/2', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Safari/537.36', CAST(N'2023-12-05T01:33:26.363' AS DateTime))
INSERT [dbo].[Rating] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (20, N'localhost:44326', N'GET       ', N'/favicon.ico', N'localhost:44326HTTP/2', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Safari/537.36', CAST(N'2023-12-05T01:33:26.677' AS DateTime))
INSERT [dbo].[Rating] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (21, N'localhost:44326', N'GET       ', N'/favicon.ico', N'localhost:44326HTTP/2', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Safari/537.36', CAST(N'2023-12-05T01:33:41.610' AS DateTime))
INSERT [dbo].[Rating] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (22, N'localhost:44326', N'GET       ', N'/favicon.ico', N'localhost:44326HTTP/2', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Safari/537.36', CAST(N'2023-12-05T01:33:54.333' AS DateTime))
INSERT [dbo].[Rating] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (23, N'localhost:44326', N'GET       ', N'/login.html', N'localhost:44326HTTP/2', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Safari/537.36', CAST(N'2023-12-05T01:34:22.497' AS DateTime))
INSERT [dbo].[Rating] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (24, N'localhost:44326', N'GET       ', N'/Style/login.css', N'localhost:44326HTTP/2', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Safari/537.36', CAST(N'2023-12-05T01:34:22.727' AS DateTime))
INSERT [dbo].[Rating] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (25, N'localhost:44326', N'GET       ', N'/Scripts/login.js', N'localhost:44326HTTP/2', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Safari/537.36', CAST(N'2023-12-05T01:34:22.727' AS DateTime))
INSERT [dbo].[Rating] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (26, N'localhost:44326', N'GET       ', N'/favicon.ico', N'localhost:44326HTTP/2', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Safari/537.36', CAST(N'2023-12-05T01:34:23.040' AS DateTime))
INSERT [dbo].[Rating] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (27, N'localhost:44326', N'POST      ', N'/api/users/login', N'localhost:44326HTTP/2', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Safari/537.36', CAST(N'2023-12-05T01:34:26.950' AS DateTime))
INSERT [dbo].[Rating] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (28, N'localhost:44326', N'GET       ', N'/favicon.ico', N'localhost:44326HTTP/2', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Safari/537.36', CAST(N'2023-12-05T01:35:16.890' AS DateTime))
INSERT [dbo].[Rating] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (29, N'localhost:44326', N'POST      ', N'/api/users/login', N'localhost:44326HTTP/2', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Safari/537.36', CAST(N'2023-12-05T01:35:20.110' AS DateTime))
INSERT [dbo].[Rating] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (30, N'localhost:44326', N'POST      ', N'/api/users/login', N'localhost:44326HTTP/2', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Safari/537.36', CAST(N'2023-12-05T01:38:33.287' AS DateTime))
INSERT [dbo].[Rating] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (31, N'localhost:44326', N'GET       ', N'/favicon.ico', N'localhost:44326HTTP/2', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Safari/537.36', CAST(N'2023-12-05T01:40:44.793' AS DateTime))
INSERT [dbo].[Rating] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (32, N'localhost:44326', N'POST      ', N'/api/users/login', N'localhost:44326HTTP/2', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Safari/537.36', CAST(N'2023-12-05T01:40:46.870' AS DateTime))
INSERT [dbo].[Rating] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (33, N'localhost:44326', N'GET       ', N'/favicon.ico', N'localhost:44326HTTP/2', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Safari/537.36', CAST(N'2023-12-05T01:53:34.717' AS DateTime))
INSERT [dbo].[Rating] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (34, N'localhost:44326', N'GET       ', N'/api/categories', N'localhost:44326HTTP/2', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Safari/537.36', CAST(N'2023-12-05T01:53:37.830' AS DateTime))
INSERT [dbo].[Rating] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (35, N'localhost:44326', N'GET       ', N'/favicon.ico', N'localhost:44326HTTP/2', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Safari/537.36', CAST(N'2023-12-05T01:54:24.983' AS DateTime))
INSERT [dbo].[Rating] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (36, N'localhost:44326', N'GET       ', N'/api/categories', N'localhost:44326HTTP/2', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Safari/537.36', CAST(N'2023-12-05T01:54:31.537' AS DateTime))
INSERT [dbo].[Rating] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (37, N'localhost:44326', N'GET       ', N'/shoppingBag', N'localhost:44326HTTP/2', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Safari/537.36', CAST(N'2023-12-05T01:57:52.443' AS DateTime))
INSERT [dbo].[Rating] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (38, N'localhost:44326', N'GET       ', N'/api/categories', N'localhost:44326HTTP/2', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Safari/537.36', CAST(N'2023-12-05T01:59:24.683' AS DateTime))
INSERT [dbo].[Rating] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (39, N'localhost:44326', N'GET       ', N'/Scripts/login.js', N'localhost:44326HTTP/2', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Safari/537.36', CAST(N'2023-12-05T19:17:50.513' AS DateTime))
INSERT [dbo].[Rating] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (40, N'localhost:44326', N'GET       ', N'/favicon.ico', N'localhost:44326HTTP/2', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Safari/537.36', CAST(N'2023-12-05T19:17:55.793' AS DateTime))
INSERT [dbo].[Rating] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (41, N'localhost:44326', N'GET       ', N'/Scripts/login.js', N'localhost:44326HTTP/2', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Safari/537.36', CAST(N'2023-12-05T19:19:37.937' AS DateTime))
INSERT [dbo].[Rating] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (42, N'localhost:44326', N'GET       ', N'/favicon.ico', N'localhost:44326HTTP/2', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Safari/537.36', CAST(N'2023-12-05T19:19:38.970' AS DateTime))
INSERT [dbo].[Rating] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (43, N'localhost:44326', N'GET       ', N'/favicon.ico', N'localhost:44326HTTP/2', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Safari/537.36', CAST(N'2023-12-05T19:19:58.720' AS DateTime))
INSERT [dbo].[Rating] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (44, N'localhost:44326', N'GET       ', N'/api/Products', N'localhost:44326HTTP/2', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Safari/537.36', CAST(N'2023-12-05T19:20:10.297' AS DateTime))
INSERT [dbo].[Rating] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (45, N'localhost:44326', N'POST      ', N'/api/Users/login', N'localhost:44326HTTP/2', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Safari/537.36', CAST(N'2023-12-05T19:21:26.420' AS DateTime))
INSERT [dbo].[Rating] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (46, N'localhost:44326', N'GET       ', N'/Scripts/login.js', N'localhost:44326HTTP/2', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Safari/537.36', CAST(N'2023-12-05T19:23:21.297' AS DateTime))
INSERT [dbo].[Rating] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (47, N'localhost:44326', N'GET       ', N'/favicon.ico', N'localhost:44326HTTP/2', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Safari/537.36', CAST(N'2023-12-05T19:23:22.853' AS DateTime))
INSERT [dbo].[Rating] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (48, N'localhost:44326', N'POST      ', N'/api/users/login', N'localhost:44326HTTP/2', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Safari/537.36', CAST(N'2023-12-05T19:23:58.687' AS DateTime))
INSERT [dbo].[Rating] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (49, N'localhost:44326', N'GET       ', N'/api/categories', N'localhost:44326HTTP/2', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Safari/537.36', CAST(N'2023-12-05T19:24:51.507' AS DateTime))
INSERT [dbo].[Rating] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (50, N'localhost:44326', N'GET       ', N'/api/products', N'localhost:44326HTTP/2', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Safari/537.36', CAST(N'2023-12-05T19:24:51.720' AS DateTime))
INSERT [dbo].[Rating] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (51, N'localhost:44326', N'GET       ', N'/Products.html', N'localhost:44326HTTP/2', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Safari/537.36', CAST(N'2023-12-05T19:25:14.737' AS DateTime))
INSERT [dbo].[Rating] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (52, N'localhost:44326', N'GET       ', N'/api/categories', N'localhost:44326HTTP/2', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Safari/537.36', CAST(N'2023-12-05T19:25:14.950' AS DateTime))
INSERT [dbo].[Rating] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (53, N'localhost:44326', N'GET       ', N'/api/products', N'localhost:44326HTTP/2', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Safari/537.36', CAST(N'2023-12-05T19:25:14.980' AS DateTime))
INSERT [dbo].[Rating] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (54, N'localhost:44326', N'GET       ', N'/Scripts/login.js', N'localhost:44326HTTP/2', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Safari/537.36', CAST(N'2023-12-05T19:25:31.080' AS DateTime))
INSERT [dbo].[Rating] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (55, N'localhost:44326', N'GET       ', N'/favicon.ico', N'localhost:44326HTTP/2', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Safari/537.36', CAST(N'2023-12-05T19:25:32.353' AS DateTime))
INSERT [dbo].[Rating] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (56, N'localhost:44326', N'POST      ', N'/api/users/login', N'localhost:44326HTTP/2', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Safari/537.36', CAST(N'2023-12-05T19:25:47.660' AS DateTime))
INSERT [dbo].[Rating] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (57, N'localhost:44326', N'GET       ', N'/api/categories', N'localhost:44326HTTP/2', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Safari/537.36', CAST(N'2023-12-05T19:25:52.240' AS DateTime))
INSERT [dbo].[Rating] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (58, N'localhost:44326', N'GET       ', N'/api/products', N'localhost:44326HTTP/2', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Safari/537.36', CAST(N'2023-12-05T19:25:52.380' AS DateTime))
INSERT [dbo].[Rating] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (59, N'localhost:44326', N'GET       ', N'/Scripts/ShoppingBag.js', N'localhost:44326HTTP/2', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Safari/537.36', CAST(N'2023-12-05T19:26:03.563' AS DateTime))
INSERT [dbo].[Rating] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (60, N'localhost:44326', N'POST      ', N'/api/orders', N'localhost:44326HTTP/2', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Safari/537.36', CAST(N'2023-12-05T19:26:06.507' AS DateTime))
INSERT [dbo].[Rating] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (61, N'localhost:44326', N'POST      ', N'/api/orders', N'localhost:44326HTTP/2', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Safari/537.36', CAST(N'2023-12-05T19:26:12.027' AS DateTime))
INSERT [dbo].[Rating] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (62, N'localhost:44326', N'POST      ', N'/api/orders', N'localhost:44326HTTP/2', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Safari/537.36', CAST(N'2023-12-05T19:26:45.303' AS DateTime))
INSERT [dbo].[Rating] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (63, N'localhost:44326', N'GET       ', N'/api/orders', N'localhost:44326HTTP/2', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Safari/537.36', CAST(N'2023-12-05T19:26:59.873' AS DateTime))
INSERT [dbo].[Rating] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (64, N'localhost:44326', N'POST      ', N'/api/orders', N'localhost:44326HTTP/2', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Safari/537.36', CAST(N'2023-12-05T19:27:08.013' AS DateTime))
INSERT [dbo].[Rating] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (65, N'localhost:44326', N'GET       ', N'/api/orders', N'localhost:44326HTTP/2', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Safari/537.36', CAST(N'2023-12-05T19:27:35.850' AS DateTime))
INSERT [dbo].[Rating] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (66, N'localhost:44326', N'GET       ', N'/Products.html', N'localhost:44326HTTP/2', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Safari/537.36', CAST(N'2023-12-05T20:36:29.873' AS DateTime))
INSERT [dbo].[Rating] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (67, N'localhost:44326', N'GET       ', N'/api/categories', N'localhost:44326HTTP/2', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Safari/537.36', CAST(N'2023-12-05T20:36:30.290' AS DateTime))
INSERT [dbo].[Rating] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (68, N'localhost:44326', N'GET       ', N'/api/products', N'localhost:44326HTTP/2', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Safari/537.36', CAST(N'2023-12-05T20:36:30.417' AS DateTime))
SET IDENTITY_INSERT [dbo].[Rating] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([Id], [UserName], [Password], [Name], [LastName]) VALUES (1, N'SariC@gmail.com                                   ', N'214493777                                         ', N'Sari                          ', N'Cohen                         ')
INSERT [dbo].[Users] ([Id], [UserName], [Password], [Name], [LastName]) VALUES (2, N'sc3257725@gmail.com                               ', N'3257725sc                                         ', N'Sari                          ', N'Cohen                         ')
INSERT [dbo].[Users] ([Id], [UserName], [Password], [Name], [LastName]) VALUES (3, N'R0527603016@gmail.com                             ', N'060739133                                         ', N'Rachel                        ', N'Cohen                         ')
INSERT [dbo].[Users] ([Id], [UserName], [Password], [Name], [LastName]) VALUES (4, N'rachelc@kavnaki.net                               ', N'603016raa                                         ', N'Rachel                        ', N'Cohen                         ')
INSERT [dbo].[Users] ([Id], [UserName], [Password], [Name], [LastName]) VALUES (5, N'1                                                 ', N'1                                                 ', N'11                            ', N'1                             ')
INSERT [dbo].[Users] ([Id], [UserName], [Password], [Name], [LastName]) VALUES (1002, N'qa@gmail.com                                      ', N'qa01010qa                                         ', N'qa                            ', N'qa01                          ')
INSERT [dbo].[Users] ([Id], [UserName], [Password], [Name], [LastName]) VALUES (2002, N'test@gmail.com                                    ', N'test234512                                        ', N'test                          ', N'test                          ')
INSERT [dbo].[Users] ([Id], [UserName], [Password], [Name], [LastName]) VALUES (2003, N'user@example.com                                  ', N'string                                            ', N'string                        ', N'string                        ')
INSERT [dbo].[Users] ([Id], [UserName], [Password], [Name], [LastName]) VALUES (2004, N'user@example.com                                  ', N'string                                            ', N'string                        ', N'string                        ')
INSERT [dbo].[Users] ([Id], [UserName], [Password], [Name], [LastName]) VALUES (2005, N'user@example.com                                  ', N'string                                            ', N'string1                       ', N'string                        ')
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
ALTER TABLE [dbo].[OrderItem]  WITH CHECK ADD FOREIGN KEY([OrderId])
REFERENCES [dbo].[Orders] ([Id])
GO
ALTER TABLE [dbo].[OrderItem]  WITH CHECK ADD FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([Id])
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Category] ([Id])
GO
USE [master]
GO
ALTER DATABASE [store_214493777] SET  READ_WRITE 
GO
