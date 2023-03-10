USE [master]
GO
/****** Object:  Database [21.106-09-CarService]    Script Date: 06.03.2023 15:02:49 ******/
CREATE DATABASE [21.106-09-CarService]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'21.106-09-CarService', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\21.106-09-CarService.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 10%)
 LOG ON 
( NAME = N'21.106-09-CarService_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\21.106-09-CarService_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [21.106-09-CarService] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [21.106-09-CarService].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [21.106-09-CarService] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [21.106-09-CarService] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [21.106-09-CarService] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [21.106-09-CarService] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [21.106-09-CarService] SET ARITHABORT OFF 
GO
ALTER DATABASE [21.106-09-CarService] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [21.106-09-CarService] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [21.106-09-CarService] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [21.106-09-CarService] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [21.106-09-CarService] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [21.106-09-CarService] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [21.106-09-CarService] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [21.106-09-CarService] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [21.106-09-CarService] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [21.106-09-CarService] SET  DISABLE_BROKER 
GO
ALTER DATABASE [21.106-09-CarService] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [21.106-09-CarService] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [21.106-09-CarService] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [21.106-09-CarService] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [21.106-09-CarService] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [21.106-09-CarService] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [21.106-09-CarService] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [21.106-09-CarService] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [21.106-09-CarService] SET  MULTI_USER 
GO
ALTER DATABASE [21.106-09-CarService] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [21.106-09-CarService] SET DB_CHAINING OFF 
GO
ALTER DATABASE [21.106-09-CarService] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [21.106-09-CarService] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [21.106-09-CarService] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [21.106-09-CarService] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [21.106-09-CarService] SET QUERY_STORE = OFF
GO
USE [21.106-09-CarService]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 06.03.2023 15:02:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[OrderID] [int] IDENTITY(1,1) NOT NULL,
	[OrderCreationDate] [datetime] NOT NULL,
	[OrderDeliveryDate] [datetime] NOT NULL,
	[OrderPickupPoint] [int] NOT NULL,
	[ClientFullName] [nvarchar](max) NULL,
	[OrderPickupCode] [int] NOT NULL,
	[OrderStatus] [int] NOT NULL,
 CONSTRAINT [PK__Order__C3905BAF6D9FAD8B] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderProduct]    Script Date: 06.03.2023 15:02:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderProduct](
	[OrderProductID] [int] IDENTITY(1,1) NOT NULL,
	[OrderID] [int] NOT NULL,
	[ProductArticleNumber] [nvarchar](100) NOT NULL,
	[ProductQuantity] [tinyint] NOT NULL,
 CONSTRAINT [PK_OrderProduct] PRIMARY KEY CLUSTERED 
(
	[OrderProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderStatus]    Script Date: 06.03.2023 15:02:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderStatus](
	[StatusID] [int] IDENTITY(1,1) NOT NULL,
	[StatusTitle] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_OrderStatus] PRIMARY KEY CLUSTERED 
(
	[StatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PickupPoint]    Script Date: 06.03.2023 15:02:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PickupPoint](
	[PickupPointID] [int] IDENTITY(1,1) NOT NULL,
	[PickupPointAddress] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_PickupPoint] PRIMARY KEY CLUSTERED 
(
	[PickupPointID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 06.03.2023 15:02:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ProductArticleNumber] [nvarchar](100) NOT NULL,
	[ProductName] [nvarchar](max) NOT NULL,
	[ProductDescription] [nvarchar](max) NOT NULL,
	[ProductCategory] [int] NOT NULL,
	[ProductPhoto] [nvarchar](100) NULL,
	[ProductManufacturer] [int] NOT NULL,
	[ProductCost] [money] NOT NULL,
	[ProductProvider] [int] NOT NULL,
	[ProductDiscountAmount] [tinyint] NULL,
	[ProductQuantityInStock] [int] NOT NULL,
	[ProductStatus] [nvarchar](max) NULL,
	[ProductMeasureUnit] [nvarchar](3) NOT NULL,
	[ProductMaxDiscountAmount] [tinyint] NOT NULL,
 CONSTRAINT [PK__Product__2EA7DCD5D8BC60B2] PRIMARY KEY CLUSTERED 
(
	[ProductArticleNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductCategory]    Script Date: 06.03.2023 15:02:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductCategory](
	[CategoryID] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [nvarchar](150) NOT NULL,
 CONSTRAINT [PK_ProductCategory] PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductManufacturer]    Script Date: 06.03.2023 15:02:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductManufacturer](
	[ManufacturerID] [int] IDENTITY(1,1) NOT NULL,
	[ManufacturerName] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_ProductManufacturer] PRIMARY KEY CLUSTERED 
(
	[ManufacturerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductProvider]    Script Date: 06.03.2023 15:02:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductProvider](
	[ProviderID] [int] IDENTITY(1,1) NOT NULL,
	[ProviderName] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_ProductProvider] PRIMARY KEY CLUSTERED 
(
	[ProviderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 06.03.2023 15:02:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[RoleID] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 06.03.2023 15:02:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[UserSurname] [nvarchar](100) NOT NULL,
	[UserName] [nvarchar](100) NOT NULL,
	[UserPatronymic] [nvarchar](100) NOT NULL,
	[UserLogin] [nvarchar](max) NOT NULL,
	[UserPassword] [nvarchar](max) NOT NULL,
	[UserRole] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Order] ON 

INSERT [dbo].[Order] ([OrderID], [OrderCreationDate], [OrderDeliveryDate], [OrderPickupPoint], [ClientFullName], [OrderPickupCode], [OrderStatus]) VALUES (1, CAST(N'2022-05-03T00:00:00.000' AS DateTime), CAST(N'2022-05-09T00:00:00.000' AS DateTime), 1, N'', 211, 1)
INSERT [dbo].[Order] ([OrderID], [OrderCreationDate], [OrderDeliveryDate], [OrderPickupPoint], [ClientFullName], [OrderPickupCode], [OrderStatus]) VALUES (2, CAST(N'2022-05-04T00:00:00.000' AS DateTime), CAST(N'2022-05-10T00:00:00.000' AS DateTime), 3, N'Никитин Артур Алексеевич', 212, 2)
INSERT [dbo].[Order] ([OrderID], [OrderCreationDate], [OrderDeliveryDate], [OrderPickupPoint], [ClientFullName], [OrderPickupCode], [OrderStatus]) VALUES (3, CAST(N'2022-05-05T00:00:00.000' AS DateTime), CAST(N'2022-05-11T00:00:00.000' AS DateTime), 5, N'', 213, 1)
INSERT [dbo].[Order] ([OrderID], [OrderCreationDate], [OrderDeliveryDate], [OrderPickupPoint], [ClientFullName], [OrderPickupCode], [OrderStatus]) VALUES (4, CAST(N'2022-05-06T00:00:00.000' AS DateTime), CAST(N'2022-05-12T00:00:00.000' AS DateTime), 6, N'', 214, 1)
INSERT [dbo].[Order] ([OrderID], [OrderCreationDate], [OrderDeliveryDate], [OrderPickupPoint], [ClientFullName], [OrderPickupCode], [OrderStatus]) VALUES (5, CAST(N'2022-05-07T00:00:00.000' AS DateTime), CAST(N'2022-05-13T00:00:00.000' AS DateTime), 7, N'Киселев Максим Сергеевич', 215, 2)
INSERT [dbo].[Order] ([OrderID], [OrderCreationDate], [OrderDeliveryDate], [OrderPickupPoint], [ClientFullName], [OrderPickupCode], [OrderStatus]) VALUES (6, CAST(N'2022-05-08T00:00:00.000' AS DateTime), CAST(N'2022-05-14T00:00:00.000' AS DateTime), 10, N'Борисов Тимур Егорович', 216, 1)
INSERT [dbo].[Order] ([OrderID], [OrderCreationDate], [OrderDeliveryDate], [OrderPickupPoint], [ClientFullName], [OrderPickupCode], [OrderStatus]) VALUES (7, CAST(N'2022-05-09T00:00:00.000' AS DateTime), CAST(N'2022-05-15T00:00:00.000' AS DateTime), 11, N'Климов Арсений Тимурович', 217, 1)
INSERT [dbo].[Order] ([OrderID], [OrderCreationDate], [OrderDeliveryDate], [OrderPickupPoint], [ClientFullName], [OrderPickupCode], [OrderStatus]) VALUES (8, CAST(N'2022-05-10T00:00:00.000' AS DateTime), CAST(N'2022-05-16T00:00:00.000' AS DateTime), 20, N'', 218, 1)
INSERT [dbo].[Order] ([OrderID], [OrderCreationDate], [OrderDeliveryDate], [OrderPickupPoint], [ClientFullName], [OrderPickupCode], [OrderStatus]) VALUES (9, CAST(N'2022-05-11T00:00:00.000' AS DateTime), CAST(N'2022-05-17T00:00:00.000' AS DateTime), 30, N'', 219, 2)
INSERT [dbo].[Order] ([OrderID], [OrderCreationDate], [OrderDeliveryDate], [OrderPickupPoint], [ClientFullName], [OrderPickupCode], [OrderStatus]) VALUES (10, CAST(N'2022-05-12T00:00:00.000' AS DateTime), CAST(N'2022-05-18T00:00:00.000' AS DateTime), 33, N'', 220, 1)
SET IDENTITY_INSERT [dbo].[Order] OFF
GO
SET IDENTITY_INSERT [dbo].[OrderProduct] ON 

INSERT [dbo].[OrderProduct] ([OrderProductID], [OrderID], [ProductArticleNumber], [ProductQuantity]) VALUES (1, 1, N'Z472R4', 1)
INSERT [dbo].[OrderProduct] ([OrderProductID], [OrderID], [ProductArticleNumber], [ProductQuantity]) VALUES (2, 1, N'D374E4', 2)
INSERT [dbo].[OrderProduct] ([OrderProductID], [OrderID], [ProductArticleNumber], [ProductQuantity]) VALUES (3, 2, N'A782R4', 1)
INSERT [dbo].[OrderProduct] ([OrderProductID], [OrderID], [ProductArticleNumber], [ProductQuantity]) VALUES (4, 2, N'K830R4', 1)
INSERT [dbo].[OrderProduct] ([OrderProductID], [OrderID], [ProductArticleNumber], [ProductQuantity]) VALUES (5, 3, N'K849L6', 1)
INSERT [dbo].[OrderProduct] ([OrderProductID], [OrderID], [ProductArticleNumber], [ProductQuantity]) VALUES (6, 3, N'O393R4', 2)
INSERT [dbo].[OrderProduct] ([OrderProductID], [OrderID], [ProductArticleNumber], [ProductQuantity]) VALUES (7, 4, N'Z469T7', 1)
INSERT [dbo].[OrderProduct] ([OrderProductID], [OrderID], [ProductArticleNumber], [ProductQuantity]) VALUES (8, 4, N'S983R4', 3)
INSERT [dbo].[OrderProduct] ([OrderProductID], [OrderID], [ProductArticleNumber], [ProductQuantity]) VALUES (9, 5, N'S037R9', 1)
INSERT [dbo].[OrderProduct] ([OrderProductID], [OrderID], [ProductArticleNumber], [ProductQuantity]) VALUES (10, 5, N'F938T5', 1)
INSERT [dbo].[OrderProduct] ([OrderProductID], [OrderID], [ProductArticleNumber], [ProductQuantity]) VALUES (11, 6, N'D799T6', 2)
INSERT [dbo].[OrderProduct] ([OrderProductID], [OrderID], [ProductArticleNumber], [ProductQuantity]) VALUES (12, 6, N'E679R3', 2)
INSERT [dbo].[OrderProduct] ([OrderProductID], [OrderID], [ProductArticleNumber], [ProductQuantity]) VALUES (13, 7, N'P023T2', 2)
INSERT [dbo].[OrderProduct] ([OrderProductID], [OrderID], [ProductArticleNumber], [ProductQuantity]) VALUES (14, 7, N'V892T6', 2)
INSERT [dbo].[OrderProduct] ([OrderProductID], [OrderID], [ProductArticleNumber], [ProductQuantity]) VALUES (15, 8, N'K702L6', 1)
INSERT [dbo].[OrderProduct] ([OrderProductID], [OrderID], [ProductArticleNumber], [ProductQuantity]) VALUES (16, 8, N'S625T5', 1)
INSERT [dbo].[OrderProduct] ([OrderProductID], [OrderID], [ProductArticleNumber], [ProductQuantity]) VALUES (17, 9, N'L802Y5', 3)
INSERT [dbo].[OrderProduct] ([OrderProductID], [OrderID], [ProductArticleNumber], [ProductQuantity]) VALUES (18, 9, N'P307T5', 1)
INSERT [dbo].[OrderProduct] ([OrderProductID], [OrderID], [ProductArticleNumber], [ProductQuantity]) VALUES (19, 10, N'M562Y7', 1)
INSERT [dbo].[OrderProduct] ([OrderProductID], [OrderID], [ProductArticleNumber], [ProductQuantity]) VALUES (20, 10, N'B702T6', 1)
SET IDENTITY_INSERT [dbo].[OrderProduct] OFF
GO
SET IDENTITY_INSERT [dbo].[OrderStatus] ON 

INSERT [dbo].[OrderStatus] ([StatusID], [StatusTitle]) VALUES (1, N'Новый')
INSERT [dbo].[OrderStatus] ([StatusID], [StatusTitle]) VALUES (2, N'Завершен')
SET IDENTITY_INSERT [dbo].[OrderStatus] OFF
GO
SET IDENTITY_INSERT [dbo].[PickupPoint] ON 

INSERT [dbo].[PickupPoint] ([PickupPointID], [PickupPointAddress]) VALUES (1, N'г. Вологда, ул. Чехова, 1')
INSERT [dbo].[PickupPoint] ([PickupPointID], [PickupPointAddress]) VALUES (2, N'г.Вологда,  ул. Степная, 30')
INSERT [dbo].[PickupPoint] ([PickupPointID], [PickupPointAddress]) VALUES (3, N'г. Вологда, ул. Коммунистическая, 43')
INSERT [dbo].[PickupPoint] ([PickupPointID], [PickupPointAddress]) VALUES (4, N'г. Вологда, ул. Солнечная, 25')
INSERT [dbo].[PickupPoint] ([PickupPointID], [PickupPointAddress]) VALUES (5, N'г. Вологда, ул. Шоссейная, 40')
INSERT [dbo].[PickupPoint] ([PickupPointID], [PickupPointAddress]) VALUES (6, N'г. Вологда, ул. Партизанская, 49')
INSERT [dbo].[PickupPoint] ([PickupPointID], [PickupPointAddress]) VALUES (7, N'г. Вологда, ул. Победы, 46')
INSERT [dbo].[PickupPoint] ([PickupPointID], [PickupPointAddress]) VALUES (8, N'г. Вологда, ул. Молодежная, 50')
INSERT [dbo].[PickupPoint] ([PickupPointID], [PickupPointAddress]) VALUES (9, N'г.Вологда, ул. Новая, 19')
INSERT [dbo].[PickupPoint] ([PickupPointID], [PickupPointAddress]) VALUES (10, N'г.Вологда, ул. Октябрьская, 19')
INSERT [dbo].[PickupPoint] ([PickupPointID], [PickupPointAddress]) VALUES (11, N'г. Вологда, ул. Садовая, 4')
INSERT [dbo].[PickupPoint] ([PickupPointID], [PickupPointAddress]) VALUES (12, N'г.Вологда, ул. Комсомольская, 26')
INSERT [dbo].[PickupPoint] ([PickupPointID], [PickupPointAddress]) VALUES (13, N'г. Вологда, ул. Чехова, 3')
INSERT [dbo].[PickupPoint] ([PickupPointID], [PickupPointAddress]) VALUES (14, N'г. Вологда, ул. Дзержинского, 28')
INSERT [dbo].[PickupPoint] ([PickupPointID], [PickupPointAddress]) VALUES (15, N'г. Вологда, ул. Набережная, 30')
INSERT [dbo].[PickupPoint] ([PickupPointID], [PickupPointAddress]) VALUES (16, N'г.Вологда, ул. Фрунзе, 43')
INSERT [dbo].[PickupPoint] ([PickupPointID], [PickupPointAddress]) VALUES (17, N'г. Вологда, ул. Школьная, 50')
INSERT [dbo].[PickupPoint] ([PickupPointID], [PickupPointAddress]) VALUES (18, N'г. Вологда, ул. Коммунистическая, 20')
INSERT [dbo].[PickupPoint] ([PickupPointID], [PickupPointAddress]) VALUES (19, N'г. Вологда, ул. 8 Марта')
INSERT [dbo].[PickupPoint] ([PickupPointID], [PickupPointAddress]) VALUES (20, N'г. Вологда, ул. Зеленая, 32')
INSERT [dbo].[PickupPoint] ([PickupPointID], [PickupPointAddress]) VALUES (21, N'г. Вологда, ул. Маяковского, 47')
INSERT [dbo].[PickupPoint] ([PickupPointID], [PickupPointAddress]) VALUES (22, N'г. Вологда, ул. Светлая, 46')
INSERT [dbo].[PickupPoint] ([PickupPointID], [PickupPointAddress]) VALUES (23, N'г. Вологда, ул. Цветочная, 8')
INSERT [dbo].[PickupPoint] ([PickupPointID], [PickupPointAddress]) VALUES (24, N'г. Вологда, ул. Коммунистическая, 1')
INSERT [dbo].[PickupPoint] ([PickupPointID], [PickupPointAddress]) VALUES (25, N'г. Вологда, ул. Спортивная, 46')
INSERT [dbo].[PickupPoint] ([PickupPointID], [PickupPointAddress]) VALUES (26, N'г. Вологда, ул. Гоголя, 41')
INSERT [dbo].[PickupPoint] ([PickupPointID], [PickupPointAddress]) VALUES (27, N'г. Вологда, ул. Северная, 13')
INSERT [dbo].[PickupPoint] ([PickupPointID], [PickupPointAddress]) VALUES (28, N'г. Вологда, ул. Вишневая, 32')
INSERT [dbo].[PickupPoint] ([PickupPointID], [PickupPointAddress]) VALUES (29, N'г. Вологда, ул. Подгорная, 8')
INSERT [dbo].[PickupPoint] ([PickupPointID], [PickupPointAddress]) VALUES (30, N'г. Вологда, ул. Шоссейная, 24')
INSERT [dbo].[PickupPoint] ([PickupPointID], [PickupPointAddress]) VALUES (31, N'г. Вологда, ул. Полевая, 35')
INSERT [dbo].[PickupPoint] ([PickupPointID], [PickupPointAddress]) VALUES (32, N'г. Вологда, ул. Маяковского, 44')
INSERT [dbo].[PickupPoint] ([PickupPointID], [PickupPointAddress]) VALUES (33, N'г. Вологда ул. Клубная, 44')
INSERT [dbo].[PickupPoint] ([PickupPointID], [PickupPointAddress]) VALUES (34, N'г. Вологда, ул. Некрасова, 12')
INSERT [dbo].[PickupPoint] ([PickupPointID], [PickupPointAddress]) VALUES (35, N'г. Вологда, ул. Комсомольская, 17')
INSERT [dbo].[PickupPoint] ([PickupPointID], [PickupPointAddress]) VALUES (36, N'г. Вологда, ул. Мичурина, 26')
SET IDENTITY_INSERT [dbo].[PickupPoint] OFF
GO
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductProvider], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus], [ProductMeasureUnit], [ProductMaxDiscountAmount]) VALUES (N'A782R4', N'Аккумулятор', N'Аккумулятор автомобильный BIG FIGHTER 55р', 3, N'A782R4.jpg', 3, 4500.0000, 2, 2, 24, N'', N'шт.', 30)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductProvider], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus], [ProductMeasureUnit], [ProductMaxDiscountAmount]) VALUES (N'B702T6', N'Домкрат', N'Домкрат ALCA 436000', 6, N'', 12, 2700.0000, 1, 2, 3, N'', N'шт.', 10)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductProvider], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus], [ProductMeasureUnit], [ProductMaxDiscountAmount]) VALUES (N'D374E4', N'Съемник подшипников', N'Съемник AIRLINE AT-GP2-05', 2, N'D374E4.jpeg', 2, 1400.0000, 1, 3, 2, N'', N'шт.', 20)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductProvider], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus], [ProductMeasureUnit], [ProductMaxDiscountAmount]) VALUES (N'D799T6', N'Съемник подшипников', N'Съемник для подшипников JTC 9000', 2, N'', 8, 1800.0000, 1, 2, 6, N'', N'шт.', 25)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductProvider], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus], [ProductMeasureUnit], [ProductMaxDiscountAmount]) VALUES (N'E679R3', N'Автошампунь', N'Автошампунь GRASS 800026 Active Foam Truck', 6, N'', 9, 4000.0000, 1, 4, 14, N'', N'шт.', 15)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductProvider], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus], [ProductMeasureUnit], [ProductMaxDiscountAmount]) VALUES (N'E932T8', N'Полироль', N'Полироль GRASS 125101 Black Brilliance', 6, N'', 9, 2100.0000, 1, 3, 23, N'', N'шт.', 25)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductProvider], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus], [ProductMeasureUnit], [ProductMaxDiscountAmount]) VALUES (N'F026R4', N'Антифриз', N'Антифриз сине-зеленый MOBIL ANTIFREEZE EXTRA', 6, N'', 13, 530.0000, 1, 2, 13, N'', N'шт.', 15)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductProvider], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus], [ProductMeasureUnit], [ProductMaxDiscountAmount]) VALUES (N'F938T5', N'Антифриз', N'Антифриз красный TCL LLC01212', 6, N'', 7, 1200.0000, 1, 4, 34, N'', N'шт.', 15)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductProvider], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus], [ProductMeasureUnit], [ProductMaxDiscountAmount]) VALUES (N'H572T6', N'Парктроник', N'Парктроник AIRLINE APS-8L-02', 3, N'', 2, 2900.0000, 1, 5, 12, N'', N'шт.', 15)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductProvider], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus], [ProductMeasureUnit], [ProductMaxDiscountAmount]) VALUES (N'K702L6', N'Ключ', N'Ключ JONNESWAY W233032 (30 / 32 мм)', 4, N'', 5, 1600.0000, 1, 3, 9, N'', N'шт.', 15)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductProvider], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus], [ProductMeasureUnit], [ProductMaxDiscountAmount]) VALUES (N'K830R4', N'Колпак для колеса', N'Колпак для колеса AIRLINE Супер Астра R16 серебристый 2шт', 3, N'K830R4.jpg', 2, 915.0000, 2, 3, 14, N'', N'уп.', 20)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductProvider], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus], [ProductMeasureUnit], [ProductMaxDiscountAmount]) VALUES (N'K849L6', N'Набор ключей', N'Набор ключей накидных STV 00-00010990 6шт.', 4, N'K849L6.jpeg', 4, 780.0000, 1, 2, 23, N'', N'уп.', 15)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductProvider], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus], [ProductMeasureUnit], [ProductMaxDiscountAmount]) VALUES (N'L802Y5', N'Лопата', N'Лопата саперная AIRLINE AB-S-03', 5, N'', 2, 870.0000, 1, 4, 23, N'', N'шт.', 5)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductProvider], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus], [ProductMeasureUnit], [ProductMaxDiscountAmount]) VALUES (N'M562Y7', N'Мультиметр', N'Мультиметр JTC 1227A автомобильный', 5, N'', 8, 14200.0000, 2, 3, 12, N'', N'шт.', 5)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductProvider], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus], [ProductMeasureUnit], [ProductMaxDiscountAmount]) VALUES (N'O393R4', N'Отвертка', N'Отвертка JONNESWAY D04P2100', 4, N'O393R4.jpeg', 5, 460.0000, 1, 3, 14, N'', N'шт.', 15)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductProvider], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus], [ProductMeasureUnit], [ProductMaxDiscountAmount]) VALUES (N'P023T2', N'Провода прикуривания', N'Провода прикуривания в сумке SMART CABLE 700 4,5м', 3, N'', 10, 3400.0000, 2, 2, 6, N'', N'шт.', 20)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductProvider], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus], [ProductMeasureUnit], [ProductMaxDiscountAmount]) VALUES (N'P307T5', N'Провода прикуривания', N'Провода прикуривания в сумке EXPERT 400А 2,5м', 3, N'', 14, 700.0000, 2, 4, 2, N'', N'шт.', 10)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductProvider], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus], [ProductMeasureUnit], [ProductMaxDiscountAmount]) VALUES (N'P439R4', N'Пассатижи', N'Пассатижи HAMMER Flex 601-050 160 мм (6 дюймов)', 5, N'', 15, 310.0000, 2, 3, 34, N'', N'шт.', 5)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductProvider], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus], [ProductMeasureUnit], [ProductMaxDiscountAmount]) VALUES (N'S021R4', N'Адаптер для щеток', N'Адаптер для щеток стеклоочистителя ALCA Top Lock A/C блистер 2 шт', 3, N'', 12, 200.0000, 2, 2, 13, N'', N'уп.', 3)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductProvider], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus], [ProductMeasureUnit], [ProductMaxDiscountAmount]) VALUES (N'S037R9', N'Щетка', N'Щётка AIRLINE AB-H-03', 5, N'S037R9.jpeg', 2, 740.0000, 1, 2, 26, N'', N'шт.', 25)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductProvider], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus], [ProductMeasureUnit], [ProductMaxDiscountAmount]) VALUES (N'S625T5', N'Щетка', N'щетка стеклоочистителя ALCA Start 16"/40см каркасная', 3, N'', 12, 249.0000, 2, 3, 12, N'', N'шт.', 20)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductProvider], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus], [ProductMeasureUnit], [ProductMaxDiscountAmount]) VALUES (N'S826R4', N'Щетка', N'Щетка стеклоочистителя ALCA Super flat 19"/48см бескаркасная', 3, N'', 12, 530.0000, 2, 4, 28, N'', N'шт.', 2)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductProvider], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus], [ProductMeasureUnit], [ProductMaxDiscountAmount]) VALUES (N'S983R4', N'Щетка', N'Щетка с/о BOSCH ECO 65C 650мм каркасная', 3, N'S983R4.jpg', 6, 500.0000, 2, 4, 8, N'', N'шт.', 15)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductProvider], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus], [ProductMeasureUnit], [ProductMaxDiscountAmount]) VALUES (N'T589T6', N'Термометр', N'Термометр ALCA 577000', 5, N'', 12, 1400.0000, 1, 2, 3, N'', N'шт.', 10)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductProvider], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus], [ProductMeasureUnit], [ProductMaxDiscountAmount]) VALUES (N'V892T6', N'Свеча зажигания', N'Свеча зажигания CHAMPION IGP F7RTC', 3, N'', 11, 130.0000, 2, 3, 21, N'', N'шт.', 5)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductProvider], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus], [ProductMeasureUnit], [ProductMaxDiscountAmount]) VALUES (N'Z326T9', N'Зарядное устройство', N'Устройство зарядное EXPERT ЗУ-300 6/12В 3,8А', 1, N'', 14, 2400.0000, 2, 3, 14, N'', N'шт.', 15)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductProvider], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus], [ProductMeasureUnit], [ProductMaxDiscountAmount]) VALUES (N'Z374R3', N'Зарядное устройство', N'Зарядное устройство AIRLINE ACH-15A-08', 1, N'Z374R3.jpeg', 2, 4600.0000, 1, 2, 14, N'', N'шт.', 25)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductProvider], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus], [ProductMeasureUnit], [ProductMaxDiscountAmount]) VALUES (N'Z469T7', N'Устройство пуско-зарядное', N'Устройство пуско-зарядное AIRLINE 12В 8000мАч 350А', 1, N'Z469T7.jpg', 2, 4000.0000, 2, 2, 4, N'', N'шт.', 25)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductProvider], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus], [ProductMeasureUnit], [ProductMaxDiscountAmount]) VALUES (N'Z472R4', N'Зарядное устройство', N'Зарядное устройство KOLNER KBCН 4', 1, N'Z472R4.jpeg', 1, 1250.0000, 1, 4, 6, N'', N'шт.', 30)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductProvider], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus], [ProductMeasureUnit], [ProductMaxDiscountAmount]) VALUES (N'Z782T5', N'Зажим', N'Зажим AIRLINE SA-400-P', 1, N'', 2, 290.0000, 1, 5, 6, N'', N'уп.', 25)
GO
SET IDENTITY_INSERT [dbo].[ProductCategory] ON 

INSERT [dbo].[ProductCategory] ([CategoryID], [CategoryName]) VALUES (1, N'Зарядные устройства')
INSERT [dbo].[ProductCategory] ([CategoryID], [CategoryName]) VALUES (2, N'Съемники подшипников
')
INSERT [dbo].[ProductCategory] ([CategoryID], [CategoryName]) VALUES (3, N'Автозапчасти
')
INSERT [dbo].[ProductCategory] ([CategoryID], [CategoryName]) VALUES (4, N'Ручные инструменты
')
INSERT [dbo].[ProductCategory] ([CategoryID], [CategoryName]) VALUES (5, N'Аксессуары
')
INSERT [dbo].[ProductCategory] ([CategoryID], [CategoryName]) VALUES (6, N'Автосервис
')
SET IDENTITY_INSERT [dbo].[ProductCategory] OFF
GO
SET IDENTITY_INSERT [dbo].[ProductManufacturer] ON 

INSERT [dbo].[ProductManufacturer] ([ManufacturerID], [ManufacturerName]) VALUES (1, N'KOLNER
')
INSERT [dbo].[ProductManufacturer] ([ManufacturerID], [ManufacturerName]) VALUES (2, N'AIRLINE
')
INSERT [dbo].[ProductManufacturer] ([ManufacturerID], [ManufacturerName]) VALUES (3, N'BIG FIGHTER
')
INSERT [dbo].[ProductManufacturer] ([ManufacturerID], [ManufacturerName]) VALUES (4, N'STV
')
INSERT [dbo].[ProductManufacturer] ([ManufacturerID], [ManufacturerName]) VALUES (5, N'JONNESWAY
')
INSERT [dbo].[ProductManufacturer] ([ManufacturerID], [ManufacturerName]) VALUES (6, N'BOSCH
')
INSERT [dbo].[ProductManufacturer] ([ManufacturerID], [ManufacturerName]) VALUES (7, N'TCL
')
INSERT [dbo].[ProductManufacturer] ([ManufacturerID], [ManufacturerName]) VALUES (8, N'JTC
')
INSERT [dbo].[ProductManufacturer] ([ManufacturerID], [ManufacturerName]) VALUES (9, N'GRASS
')
INSERT [dbo].[ProductManufacturer] ([ManufacturerID], [ManufacturerName]) VALUES (10, N'SMART
')
INSERT [dbo].[ProductManufacturer] ([ManufacturerID], [ManufacturerName]) VALUES (11, N'CHAMPION
')
INSERT [dbo].[ProductManufacturer] ([ManufacturerID], [ManufacturerName]) VALUES (12, N'ALCA
')
INSERT [dbo].[ProductManufacturer] ([ManufacturerID], [ManufacturerName]) VALUES (13, N'MOBIL
')
INSERT [dbo].[ProductManufacturer] ([ManufacturerID], [ManufacturerName]) VALUES (14, N'EXPERT
')
INSERT [dbo].[ProductManufacturer] ([ManufacturerID], [ManufacturerName]) VALUES (15, N'HAMMER
')
SET IDENTITY_INSERT [dbo].[ProductManufacturer] OFF
GO
SET IDENTITY_INSERT [dbo].[ProductProvider] ON 

INSERT [dbo].[ProductProvider] ([ProviderID], [ProviderName]) VALUES (1, N'220-volt
')
INSERT [dbo].[ProductProvider] ([ProviderID], [ProviderName]) VALUES (2, N'Максидом
')
SET IDENTITY_INSERT [dbo].[ProductProvider] OFF
GO
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([RoleID], [RoleName]) VALUES (1, N'Администратор')
INSERT [dbo].[Role] ([RoleID], [RoleName]) VALUES (2, N'Менеджер')
INSERT [dbo].[Role] ([RoleID], [RoleName]) VALUES (3, N'Клиент')
SET IDENTITY_INSERT [dbo].[Role] OFF
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (1, N'Лихачёв ', N'Онисим', N'Гордеевич', N'loginDErfg2018', N'5ovb1N', 3)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (2, N'Рожков ', N'Тихон', N'Владиславович', N'loginDEymi2018', N'nR0+pI', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (3, N'Павлов ', N'Максим', N'Фёдорович', N'loginDEnbi2018', N'Ed*JQP', 3)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (4, N'Шилов ', N'Матвей', N'Альбертович', N'loginDEhvg2018', N'SaHv6w', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (5, N'Шаров ', N'Федосей', N'Юрьевич', N'loginDEmbg2018', N'Fou{d3', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (6, N'Медведева ', N'Пелагея', N'Мартыновна', N'loginDEubq2018', N'{jzW2v', 2)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (7, N'Медведев ', N'Григорий', N'Агафонович', N'loginDEosl2018', N'O3O}we', 2)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (8, N'Соколова ', N'Марфа', N'Всеволодовна', N'loginDErog2018', N'&W4Wtq', 3)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (9, N'Петухова ', N'Василиса', N'Еремеевна', N'loginDEsku2018', N'fUldqr', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (10, N'Беспалова ', N'Галина', N'Дмитрьевна', N'loginDEatu2018', N'}nGbhZ', 2)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (11, N'Андреева ', N'Александра', N'Владиславовна', N'loginDEhks2018', N'XV|+W4', 2)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (12, N'Селезнёв ', N'Федот', N'Валентинович', N'loginDEzbl2018', N'ih4xKJ', 2)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (13, N'Вишняков ', N'Сергей', N'Иванович', N'loginDEoxa2018', N'mL+97r', 3)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (14, N'Зимин ', N'Василий', N'Русланович', N'loginDEssm2018', N'oBrTGr', 3)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (15, N'Фадеева ', N'Регина', N'Онисимовна', N'loginDEzxw2018', N'pX&AsH', 3)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (16, N'Артемьев ', N'Варлам', N'Альбертович', N'loginDEkzo2018', N'n3es*S', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (17, N'Щербаков ', N'Лукий', N'Онисимович', N'loginDEdaq2018', N'dWsvBS', 3)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (18, N'Горбунов ', N'Матвей', N'Сергеевич', N'loginDEnjd2018', N'0&3HHn', 3)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (19, N'Зиновьева ', N'Варвара', N'Антоновна', N'loginDEluw2018', N'S3wj{I', 2)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (20, N'Фролов ', N'Юрий', N'Варламович', N'loginDEole2018', N'p+kvb6', 2)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (21, N'Силин ', N'Вячеслав', N'Валерьевич', N'loginDEfug2018', N'z|6cXV', 3)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (22, N'Герасимова ', N'Феврония', N'Валерьяновна', N'loginDEgfx2018', N'GFSZAB', 2)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (23, N'Пономарёва ', N'Вера', N'Руслановна', N'loginDEtww2018', N'4icZTg', 2)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (24, N'Владимиров ', N'Геласий', N'Пантелеймонович', N'loginDEcbd2018', N'GwG*p6', 2)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (25, N'Корнилов ', N'Иван', N'Игоревич', N'loginDEcay2018', N'ehtG*H', 2)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (26, N'Ермакова ', N'Зинаида', N'Данииловна', N'loginDEhqk2018', N'KBc4A+', 2)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (27, N'Пахомова ', N'Элеонора', N'Григорьевна', N'loginDEkny2018', N'v2+4Ro', 3)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (28, N'Гущина ', N'Вера', N'Ефимовна', N'loginDEmda2018', N'sG+NF0', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (29, N'Полякова ', N'Антонина', N'Андреевна', N'loginDEhhf2018', N'd+GS5y', 3)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (30, N'Зуева ', N'Марина', N'Ильяовна', N'loginDEilc2018', N'eyRufZ', 2)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (31, N'Агафонов ', N'Агафон', N'Максимович', N'loginDEwfv2018', N'ZSUiGT', 2)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (32, N'Архипов ', N'Агафон', N'Игоревич', N'loginDEozn2018', N'nndP3Q', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (33, N'Лапина ', N'Иванна', N'Аристарховна', N'loginDEbtr2018', N'FdZrI3', 3)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (34, N'Маслова ', N'Мария', N'Аристарховна', N'loginDEcuf2018', N'aOdzYf', 3)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (35, N'Русаков ', N'Василий', N'Куприянович', N'loginDEtye2018', N'MEJjQt', 2)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (36, N'Николаева ', N'Евдокия', N'Пётровна', N'loginDEncq2018', N'GgG3m0', 2)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (37, N'Прохоров ', N'Олег', N'Брониславович', N'loginDEtmt2018', N'}FOh*}', 2)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (38, N'Зайцев ', N'Макар', N'Владленович', N'loginDEyqb2018', N'xLmuQq', 2)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (39, N'Жданов ', N'Сергей', N'Гордеевич', N'loginDExld2018', N'a8Vjkx', 3)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (40, N'Нестеров ', N'Авдей', N'Митрофанович', N'loginDEnig2018', N'Cm00D0', 3)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (41, N'Григорьева ', N'Глафира', N'Антоновна', N'loginDEmly2018', N'IZJ7O|', 3)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (42, N'Зыков ', N'Геласий', N'Лаврентьевич', N'loginDElom2018', N'Yg}k84', 3)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (43, N'Александрова ', N'Марфа', N'Протасьевна', N'loginDEvoa2018', N'RdGikC', 3)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (44, N'Мухин ', N'Донат', N'Ростиславович', N'loginDEwmq2018', N'ds4KAb', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (45, N'Костин ', N'Геласий', N'Германнович', N'loginDEdba2018', N'D7xF6u', 3)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (46, N'Лазарев ', N'Протасий', N'Игоревич', N'loginDEnsr2018', N'VZKTog', 2)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (47, N'Пестов ', N'Богдан', N'Германнович', N'loginDEqsc2018', N'UU|FkZ', 1)
SET IDENTITY_INSERT [dbo].[User] OFF
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_OrderStatus] FOREIGN KEY([OrderStatus])
REFERENCES [dbo].[OrderStatus] ([StatusID])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_OrderStatus]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_PickupPoint] FOREIGN KEY([OrderPickupPoint])
REFERENCES [dbo].[PickupPoint] ([PickupPointID])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_PickupPoint]
GO
ALTER TABLE [dbo].[OrderProduct]  WITH CHECK ADD  CONSTRAINT [FK__OrderProd__Order__2D27B809] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Order] ([OrderID])
GO
ALTER TABLE [dbo].[OrderProduct] CHECK CONSTRAINT [FK__OrderProd__Order__2D27B809]
GO
ALTER TABLE [dbo].[OrderProduct]  WITH CHECK ADD  CONSTRAINT [FK__OrderProd__Produ__2E1BDC42] FOREIGN KEY([ProductArticleNumber])
REFERENCES [dbo].[Product] ([ProductArticleNumber])
GO
ALTER TABLE [dbo].[OrderProduct] CHECK CONSTRAINT [FK__OrderProd__Produ__2E1BDC42]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_ProductCategory] FOREIGN KEY([ProductCategory])
REFERENCES [dbo].[ProductCategory] ([CategoryID])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_ProductCategory]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_ProductManufacturer] FOREIGN KEY([ProductManufacturer])
REFERENCES [dbo].[ProductManufacturer] ([ManufacturerID])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_ProductManufacturer]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_ProductProvider] FOREIGN KEY([ProductProvider])
REFERENCES [dbo].[ProductProvider] ([ProviderID])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_ProductProvider]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD FOREIGN KEY([UserRole])
REFERENCES [dbo].[Role] ([RoleID])
GO
USE [master]
GO
ALTER DATABASE [21.106-09-CarService] SET  READ_WRITE 
GO
