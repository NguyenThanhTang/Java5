USE [master]
GO
/****** Object:  Database [DB_ASM_JAVA5]    Script Date: 6/19/2023 4:08:07 PM ******/
CREATE DATABASE [DB_ASM_JAVA5]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DB_ASM_JAVA5', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.K03785\MSSQL\DATA\DB_ASM_JAVA5.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'DB_ASM_JAVA5_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.K03785\MSSQL\DATA\DB_ASM_JAVA5_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [DB_ASM_JAVA5] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DB_ASM_JAVA5].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DB_ASM_JAVA5] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DB_ASM_JAVA5] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DB_ASM_JAVA5] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DB_ASM_JAVA5] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DB_ASM_JAVA5] SET ARITHABORT OFF 
GO
ALTER DATABASE [DB_ASM_JAVA5] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DB_ASM_JAVA5] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DB_ASM_JAVA5] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DB_ASM_JAVA5] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DB_ASM_JAVA5] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DB_ASM_JAVA5] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DB_ASM_JAVA5] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DB_ASM_JAVA5] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DB_ASM_JAVA5] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DB_ASM_JAVA5] SET  DISABLE_BROKER 
GO
ALTER DATABASE [DB_ASM_JAVA5] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DB_ASM_JAVA5] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DB_ASM_JAVA5] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DB_ASM_JAVA5] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DB_ASM_JAVA5] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DB_ASM_JAVA5] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DB_ASM_JAVA5] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DB_ASM_JAVA5] SET RECOVERY FULL 
GO
ALTER DATABASE [DB_ASM_JAVA5] SET  MULTI_USER 
GO
ALTER DATABASE [DB_ASM_JAVA5] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DB_ASM_JAVA5] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DB_ASM_JAVA5] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DB_ASM_JAVA5] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DB_ASM_JAVA5] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [DB_ASM_JAVA5] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'DB_ASM_JAVA5', N'ON'
GO
ALTER DATABASE [DB_ASM_JAVA5] SET QUERY_STORE = OFF
GO
USE [DB_ASM_JAVA5]
GO
/****** Object:  Table [dbo].[Accounts]    Script Date: 6/19/2023 4:08:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Accounts](
	[Username] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[Fullname] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[Photo] [nvarchar](50) NOT NULL,
	[Activated] [bit] NOT NULL,
	[Admin] [bit] NOT NULL,
 CONSTRAINT [PK_Accounts] PRIMARY KEY CLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Carts]    Script Date: 6/19/2023 4:08:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Carts](
	[username] [nvarchar](50) NOT NULL,
	[product_id] [int] NOT NULL,
	[quantity] [int] NULL,
 CONSTRAINT [PK_Carts] PRIMARY KEY CLUSTERED 
(
	[username] ASC,
	[product_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 6/19/2023 4:08:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[Id] [char](4) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[is_delete] [bit] NOT NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order_Details]    Script Date: 6/19/2023 4:08:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order_Details](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[order_id] [bigint] NULL,
	[product_id] [int] NULL,
	[Price] [float] NULL,
	[Quantity] [int] NULL,
 CONSTRAINT [PK_OrderDetails] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 6/19/2023 4:08:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](50) NOT NULL,
	[create_date] [date] NOT NULL,
	[Address] [nvarchar](100) NOT NULL,
	[total] [float] NOT NULL,
	[status] [nvarchar](100) NOT NULL,
	[phone] [nchar](10) NULL,
	[name] [nvarchar](50) NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 6/19/2023 4:08:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Image] [nvarchar](max) NULL,
	[Price] [float] NOT NULL,
	[create_date] [date] NOT NULL,
	[Quantity] [int] NOT NULL,
	[category_id] [char](4) NOT NULL,
	[is_delete] [bit] NOT NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Activated], [Admin]) VALUES (N'NV001', N'123', N'Trương Đăng Khoa', N'khoatdpc03785@fpt.edu.vn', N'vuong.jpg', 1, 1)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Activated], [Admin]) VALUES (N'NV002', N'123', N'Tester', N'morethanblue2003@gmail.com', N'nhat.jpg', 0, 1)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Activated], [Admin]) VALUES (N'NV003', N'123', N'Nguyễn Thị Đăng', N'dangnhpc03881@fpt.edu.vn', N'loan.jpg', 1, 0)
GO
INSERT [dbo].[Categories] ([Id], [Name], [is_delete]) VALUES (N'ca01', N'Đèn 1', 0)
INSERT [dbo].[Categories] ([Id], [Name], [is_delete]) VALUES (N'ca02', N'Đèn 2', 0)
INSERT [dbo].[Categories] ([Id], [Name], [is_delete]) VALUES (N'ca03', N'Ghế', 0)
INSERT [dbo].[Categories] ([Id], [Name], [is_delete]) VALUES (N'ca04', N'SP4', 0)
INSERT [dbo].[Categories] ([Id], [Name], [is_delete]) VALUES (N'ca05', N'SP5', 0)
INSERT [dbo].[Categories] ([Id], [Name], [is_delete]) VALUES (N'ca06', N'Sp6', 1)
GO
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [create_date], [Quantity], [category_id], [is_delete]) VALUES (5, N'den1', N'den1.png', 165000, CAST(N'2023-05-26' AS Date), 100, N'ca01', 0)
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [create_date], [Quantity], [category_id], [is_delete]) VALUES (7, N'den2', N'den2.png', 159000, CAST(N'2023-05-26' AS Date), 200, N'ca02', 0)
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [create_date], [Quantity], [category_id], [is_delete]) VALUES (8, N'ghecaocap1', N'ghecaocap.jpg', 159000, CAST(N'2023-05-16' AS Date), 149, N'ca03', 0)
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [create_date], [Quantity], [category_id], [is_delete]) VALUES (10, N'den4', N'den3.jpg', 132000, CAST(N'2023-05-15' AS Date), 499, N'ca02', 0)
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [create_date], [Quantity], [category_id], [is_delete]) VALUES (11, N'den5', N'den4.jpg', 129000, CAST(N'2023-05-12' AS Date), 130, N'ca01', 0)
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [create_date], [Quantity], [category_id], [is_delete]) VALUES (15, N'ghecaocap2', N'ghe1.jpg', 175000, CAST(N'2023-05-16' AS Date), 125, N'ca03', 0)
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [create_date], [Quantity], [category_id], [is_delete]) VALUES (20, N'den7', N'den5.jpg', 325000, CAST(N'2023-05-17' AS Date), 174, N'ca01', 0)
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [create_date], [Quantity], [category_id], [is_delete]) VALUES (29, N'den8', N'den6.jpg', 69000, CAST(N'2023-05-18' AS Date), 74, N'ca02', 0)
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [create_date], [Quantity], [category_id], [is_delete]) VALUES (30, N'ghecaocap3', N'ghe2.jpg', 63000, CAST(N'2023-05-19' AS Date), 19, N'ca03', 0)
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [create_date], [Quantity], [category_id], [is_delete]) VALUES (31, N'den10', N'den7.jpg', 29000, CAST(N'2023-05-19' AS Date), 8, N'ca02', 0)
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [create_date], [Quantity], [category_id], [is_delete]) VALUES (36, N'den11', N'den8.jpg', 75000, CAST(N'2023-05-26' AS Date), 245, N'ca01', 0)
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [create_date], [Quantity], [category_id], [is_delete]) VALUES (42, N'ghecaocap4', N'ghe3.jpg', 99000, CAST(N'2023-05-21' AS Date), 299, N'ca03', 0)
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [create_date], [Quantity], [category_id], [is_delete]) VALUES (43, N'den13', N'den3.jpg', 127000, CAST(N'2023-05-21' AS Date), 99, N'ca01', 0)
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [create_date], [Quantity], [category_id], [is_delete]) VALUES (44, N'den14', N'den4.jpg', 139000, CAST(N'2023-05-21' AS Date), 48, N'ca02', 0)
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [create_date], [Quantity], [category_id], [is_delete]) VALUES (45, N'ghecaocap5', N'ghe4.jpg', 239000, CAST(N'2023-05-21' AS Date), 4, N'ca03', 0)
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [create_date], [Quantity], [category_id], [is_delete]) VALUES (46, N'den16', N'den5.jpg', 105000, CAST(N'2023-05-21' AS Date), 3, N'ca02', 1)
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
ALTER TABLE [dbo].[Carts]  WITH CHECK ADD  CONSTRAINT [FK_Carts_Accounts] FOREIGN KEY([username])
REFERENCES [dbo].[Accounts] ([Username])
GO
ALTER TABLE [dbo].[Carts] CHECK CONSTRAINT [FK_Carts_Accounts]
GO
ALTER TABLE [dbo].[Carts]  WITH CHECK ADD  CONSTRAINT [FK_Carts_Products] FOREIGN KEY([product_id])
REFERENCES [dbo].[Products] ([Id])
GO
ALTER TABLE [dbo].[Carts] CHECK CONSTRAINT [FK_Carts_Products]
GO
ALTER TABLE [dbo].[Order_Details]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Orders] FOREIGN KEY([order_id])
REFERENCES [dbo].[Orders] ([Id])
GO
ALTER TABLE [dbo].[Order_Details] CHECK CONSTRAINT [FK_OrderDetails_Orders]
GO
ALTER TABLE [dbo].[Order_Details]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Products] FOREIGN KEY([product_id])
REFERENCES [dbo].[Products] ([Id])
GO
ALTER TABLE [dbo].[Order_Details] CHECK CONSTRAINT [FK_OrderDetails_Products]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Accounts] FOREIGN KEY([Username])
REFERENCES [dbo].[Accounts] ([Username])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Accounts]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Categories] FOREIGN KEY([category_id])
REFERENCES [dbo].[Categories] ([Id])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Categories]
GO
USE [master]
GO
ALTER DATABASE [DB_ASM_JAVA5] SET  READ_WRITE 
GO
