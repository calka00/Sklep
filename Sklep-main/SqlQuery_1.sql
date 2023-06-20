USE [master]
GO
/****** Object:  Database [MSSQLLocalDB]    Script Date: 21.06.2023 00:43:12 ******/
CREATE DATABASE [MSSQLLocalDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'MSSQLLocalDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER01\MSSQL\DATA\MSSQLLocalDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'MSSQLLocalDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER01\MSSQL\DATA\MSSQLLocalDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [MSSQLLocalDB] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [MSSQLLocalDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [MSSQLLocalDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [MSSQLLocalDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [MSSQLLocalDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [MSSQLLocalDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [MSSQLLocalDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [MSSQLLocalDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [MSSQLLocalDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [MSSQLLocalDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [MSSQLLocalDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [MSSQLLocalDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [MSSQLLocalDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [MSSQLLocalDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [MSSQLLocalDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [MSSQLLocalDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [MSSQLLocalDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [MSSQLLocalDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [MSSQLLocalDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [MSSQLLocalDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [MSSQLLocalDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [MSSQLLocalDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [MSSQLLocalDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [MSSQLLocalDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [MSSQLLocalDB] SET RECOVERY FULL 
GO
ALTER DATABASE [MSSQLLocalDB] SET  MULTI_USER 
GO
ALTER DATABASE [MSSQLLocalDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [MSSQLLocalDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [MSSQLLocalDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [MSSQLLocalDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [MSSQLLocalDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [MSSQLLocalDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'MSSQLLocalDB', N'ON'
GO
ALTER DATABASE [MSSQLLocalDB] SET QUERY_STORE = ON
GO
ALTER DATABASE [MSSQLLocalDB] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [MSSQLLocalDB]
GO
/****** Object:  User [SuperAdmin]    Script Date: 21.06.2023 00:43:13 ******/
CREATE USER [SuperAdmin] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [Martin]    Script Date: 21.06.2023 00:43:13 ******/
CREATE USER [Martin] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[Cechy]    Script Date: 21.06.2023 00:43:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cechy](
	[Id] [int] NOT NULL,
	[Nazwa] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Cechy] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Kategorie]    Script Date: 21.06.2023 00:43:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Kategorie](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nazwa] [varchar](50) NOT NULL,
	[Obraz] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Koszyk]    Script Date: 21.06.2023 00:43:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Koszyk](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UzytkownikId] [int] NOT NULL,
 CONSTRAINT [PK_Koszyk_1] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Koszyk_Podzespol]    Script Date: 21.06.2023 00:43:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Koszyk_Podzespol](
	[KoszykId] [int] NOT NULL,
	[PodzespolId] [int] NOT NULL,
	[Ilosc] [smallint] NOT NULL,
 CONSTRAINT [PK_Koszyk_Podzespol] PRIMARY KEY CLUSTERED 
(
	[KoszykId] ASC,
	[PodzespolId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Podzespoly]    Script Date: 21.06.2023 00:43:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Podzespoly](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nazwa] [varchar](50) NOT NULL,
	[Cena] [decimal](10, 2) NOT NULL,
	[Opis] [varchar](max) NULL,
	[KategoriaId] [int] NOT NULL,
	[Obrazki] [varchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Podzespoly_Cechy]    Script Date: 21.06.2023 00:43:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Podzespoly_Cechy](
	[CechyId] [int] NOT NULL,
	[PodzespolyId] [int] NOT NULL,
	[Wartosc] [nvarchar](50) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Uzytkownicy]    Script Date: 21.06.2023 00:43:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Uzytkownicy](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nazwa] [varchar](50) NOT NULL,
	[Haslo] [varchar](50) NOT NULL,
	[Imie] [varchar](50) NOT NULL,
	[Nazwisko] [varchar](50) NOT NULL,
	[CzyAdmin] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Cechy] ([Id], [Nazwa]) VALUES (1, N'Częstotliwość taktowania procesora')
INSERT [dbo].[Cechy] ([Id], [Nazwa]) VALUES (2, N'Liczba rdzeni')
INSERT [dbo].[Cechy] ([Id], [Nazwa]) VALUES (3, N'Odblokowany mnożnik')
INSERT [dbo].[Cechy] ([Id], [Nazwa]) VALUES (4, N'Typ gniazda')
INSERT [dbo].[Cechy] ([Id], [Nazwa]) VALUES (5, N'Załączone chłodzenie')
INSERT [dbo].[Cechy] ([Id], [Nazwa]) VALUES (6, N'Pamięć')
INSERT [dbo].[Cechy] ([Id], [Nazwa]) VALUES (7, N'Rodzaj pamięci')
INSERT [dbo].[Cechy] ([Id], [Nazwa]) VALUES (8, N'Taktowanie rdzenia')
INSERT [dbo].[Cechy] ([Id], [Nazwa]) VALUES (9, N'Liczba wentylatorów')
INSERT [dbo].[Cechy] ([Id], [Nazwa]) VALUES (10, N'Typ chłodzenia')
INSERT [dbo].[Cechy] ([Id], [Nazwa]) VALUES (11, N'Rodzaj chłodzenia')
INSERT [dbo].[Cechy] ([Id], [Nazwa]) VALUES (12, N'Materiał radiatora')
INSERT [dbo].[Cechy] ([Id], [Nazwa]) VALUES (13, N'Liczba wentylatorów')
INSERT [dbo].[Cechy] ([Id], [Nazwa]) VALUES (14, N'Rozmiar wentylatora')
INSERT [dbo].[Cechy] ([Id], [Nazwa]) VALUES (15, N'Złącze')
INSERT [dbo].[Cechy] ([Id], [Nazwa]) VALUES (16, N'Napięcie zasilające')
INSERT [dbo].[Cechy] ([Id], [Nazwa]) VALUES (17, N'Gniazdo Procesora')
INSERT [dbo].[Cechy] ([Id], [Nazwa]) VALUES (18, N'Maksymalna wielkość pamięci RAM')
INSERT [dbo].[Cechy] ([Id], [Nazwa]) VALUES (19, N'Architektura pamięci')
INSERT [dbo].[Cechy] ([Id], [Nazwa]) VALUES (20, N'Chipset')
INSERT [dbo].[Cechy] ([Id], [Nazwa]) VALUES (21, N'Wysokość')
INSERT [dbo].[Cechy] ([Id], [Nazwa]) VALUES (22, N'Szerokość')
GO
SET IDENTITY_INSERT [dbo].[Kategorie] ON 

INSERT [dbo].[Kategorie] ([Id], [Nazwa], [Obraz]) VALUES (1, N'Procesory', N'~/Pictures/Procesory/Intel Core i9-13900K.jfif')
INSERT [dbo].[Kategorie] ([Id], [Nazwa], [Obraz]) VALUES (2, N'Karty Graficzne', N'~/pictures/Karta_graficzna.jpg')
INSERT [dbo].[Kategorie] ([Id], [Nazwa], [Obraz]) VALUES (3, N'Chłodzenie komputerowe', N'~/pictures/Chlodzenie.jpg')
INSERT [dbo].[Kategorie] ([Id], [Nazwa], [Obraz]) VALUES (4, N'Płyty główne', N'~/pictures/plyta_glowna.jpg')
INSERT [dbo].[Kategorie] ([Id], [Nazwa], [Obraz]) VALUES (5, N'Pamięci RAM', N'~/pictures/RAM.jpg')
INSERT [dbo].[Kategorie] ([Id], [Nazwa], [Obraz]) VALUES (6, N'Zasilacze komputerowe', N'~/pictures/Zasilacz.jpg')
SET IDENTITY_INSERT [dbo].[Kategorie] OFF
GO
SET IDENTITY_INSERT [dbo].[Koszyk] ON 

INSERT [dbo].[Koszyk] ([Id], [UzytkownikId]) VALUES (1, 1)
INSERT [dbo].[Koszyk] ([Id], [UzytkownikId]) VALUES (2, 2)
SET IDENTITY_INSERT [dbo].[Koszyk] OFF
GO
SET IDENTITY_INSERT [dbo].[Podzespoly] ON 

INSERT [dbo].[Podzespoly] ([Id], [Nazwa], [Cena], [Opis], [KategoriaId], [Obrazki]) VALUES (3, N'Intel Core i9-13900K BX8071513900K', CAST(2350.00 AS Decimal(10, 2)), N'Detale', 1, N'~/Pictures/Procesory/Intel Core i9-13900K.jfif')
INSERT [dbo].[Podzespoly] ([Id], [Nazwa], [Cena], [Opis], [KategoriaId], [Obrazki]) VALUES (4, N'Intel Core i7-12700K', CAST(1100.00 AS Decimal(10, 2)), N'Detale', 1, N'~/Pictures/Procesory/Intel Core i7-12700K.jfif')
INSERT [dbo].[Podzespoly] ([Id], [Nazwa], [Cena], [Opis], [KategoriaId], [Obrazki]) VALUES (10, N'AMD Ryzen 7 5700X 100-100000926WOF', CAST(890.00 AS Decimal(10, 2)), N'Detale', 1, N'~/Pictures/Procesory/AMD Ryzen 7 5700X 100-100000926WOF.jfif')
INSERT [dbo].[Podzespoly] ([Id], [Nazwa], [Cena], [Opis], [KategoriaId], [Obrazki]) VALUES (11, N'Intel Core i5-10400', CAST(600.00 AS Decimal(10, 2)), N'Detale', 1, N'~/Pictures/Procesory/Intel Core i5-10400.jfif')
INSERT [dbo].[Podzespoly] ([Id], [Nazwa], [Cena], [Opis], [KategoriaId], [Obrazki]) VALUES (13, N'AMD ryzen 5 3600', CAST(1200.00 AS Decimal(10, 2)), N'Detale', 1, N'~/Pictures/Procesory/amd ryzen 5 3600.jfif')
INSERT [dbo].[Podzespoly] ([Id], [Nazwa], [Cena], [Opis], [KategoriaId], [Obrazki]) VALUES (14, N'AMD Ryzen 7 3700x', CAST(1550.00 AS Decimal(10, 2)), N'Detale', 1, N'~/Pictures/Procesory/AMD Ryzen 7 3700x.jfif')
INSERT [dbo].[Podzespoly] ([Id], [Nazwa], [Cena], [Opis], [KategoriaId], [Obrazki]) VALUES (15, N'MSI GeForce RTX 4070 VENTUS 3X OC 12GB GDDR6X', CAST(3100.00 AS Decimal(10, 2)), N'Detale', 2, N'~/Pictures/KartyGraficzne/MSI GeForce RTX 4070 VENTUS 3X OC 12GB GDDR6X.jpg')
INSERT [dbo].[Podzespoly] ([Id], [Nazwa], [Cena], [Opis], [KategoriaId], [Obrazki]) VALUES (16, N'Gainward GeForce RTX 4070 Ghost 12GB GDDR6X', CAST(2990.00 AS Decimal(10, 2)), N'Detale', 2, N'~/Pictures/KartyGraficzne/Gainward GeForce RTX 4070 Ghost 12GB GDDR6X.jpg')
INSERT [dbo].[Podzespoly] ([Id], [Nazwa], [Cena], [Opis], [KategoriaId], [Obrazki]) VALUES (17, N'MSI GeForce GTX 1650 D6 VENTUS XS OC 4GB GDDR6', CAST(790.00 AS Decimal(10, 2)), N'Detale', 2, N'~/Pictures/KartyGraficzne/MSI GeForce GTX 1650 D6 VENTUS XS OC 4GB GDDR6.jpg')
INSERT [dbo].[Podzespoly] ([Id], [Nazwa], [Cena], [Opis], [KategoriaId], [Obrazki]) VALUES (18, N'Gigabyte GeForce RTX 3070 GAMING OC LHR 8GB GDDR6', CAST(2500.00 AS Decimal(10, 2)), N'Detale', 2, N'~/Pictures/KartyGraficzne/Gigabyte GeForce RTX 3070 GAMING OC LHR 8GB GDDR6.jpg')
INSERT [dbo].[Podzespoly] ([Id], [Nazwa], [Cena], [Opis], [KategoriaId], [Obrazki]) VALUES (20, N'Zotac GeForce RTX 3060 Twin Edge 12GB GDDR6', CAST(1530.00 AS Decimal(10, 2)), N'Detale', 2, N'~/Pictures/KartyGraficzne/Zotac GeForce RTX 3060 Twin Edge 12GB GDDR6.jpg')
INSERT [dbo].[Podzespoly] ([Id], [Nazwa], [Cena], [Opis], [KategoriaId], [Obrazki]) VALUES (21, N'ASUS GeForce RTX 4070 TUF GAMING OC 12GB GDDR6X', CAST(3750.00 AS Decimal(10, 2)), N'Detale', 2, N'~/Pictures/KartyGraficzne/ASUS GeForce RTX 4070 TUF GAMING OC 12GB GDDR6X.jpg')
INSERT [dbo].[Podzespoly] ([Id], [Nazwa], [Cena], [Opis], [KategoriaId], [Obrazki]) VALUES (22, N'be quiet! Dark Rock 4 135mm', CAST(320.00 AS Decimal(10, 2)), N'Detale', 3, N'~/Pictures/Chlodzenie/be quiet! Dark Rock 4 135mm.jpg')
INSERT [dbo].[Podzespoly] ([Id], [Nazwa], [Cena], [Opis], [KategoriaId], [Obrazki]) VALUES (23, N'Silver Monkey X SNOWY ARGB 240 2x120 mm', CAST(450.00 AS Decimal(10, 2)), N'Detale', 3, N'~/Pictures/Chlodzenie/Silver Monkey X SNOWY ARGB 240 2x120 mm.jpg')
INSERT [dbo].[Podzespoly] ([Id], [Nazwa], [Cena], [Opis], [KategoriaId], [Obrazki]) VALUES (24, N'be quiet! Dark Rock Pro 4 120_135mm', CAST(405.00 AS Decimal(10, 2)), N'Detale', 3, N'~/Pictures/Chlodzenie/be quiet! Dark Rock Pro 4 120_135mm.jpg')
INSERT [dbo].[Podzespoly] ([Id], [Nazwa], [Cena], [Opis], [KategoriaId], [Obrazki]) VALUES (25, N'Cooler Master MasterLiquid ML240L V2 RGB 2x120mm', CAST(309.00 AS Decimal(10, 2)), N'Detale', 3, N'~/Pictures/Chlodzenie/Cooler Master MasterLiquid ML240L V2 RGB 2x120mm.jpg')
INSERT [dbo].[Podzespoly] ([Id], [Nazwa], [Cena], [Opis], [KategoriaId], [Obrazki]) VALUES (26, N'be quiet! Pure Rock 2 Srebrny 120mm', CAST(168.00 AS Decimal(10, 2)), N'Detale', 3, N'~/Pictures/Chlodzenie/be quiet! Pure Rock 2 Srebrny 120mm.jpg')
INSERT [dbo].[Podzespoly] ([Id], [Nazwa], [Cena], [Opis], [KategoriaId], [Obrazki]) VALUES (27, N'be quiet! Silent Loop 2 360mm 3x120mm', CAST(745.00 AS Decimal(10, 2)), N'Detale', 3, N'~/Pictures/Chlodzenie/be quiet! Silent Loop 2 360mm 3x120mm.jpg')
INSERT [dbo].[Podzespoly] ([Id], [Nazwa], [Cena], [Opis], [KategoriaId], [Obrazki]) VALUES (28, N'MSI MAG B760 TOMAHAWK WIFI DDR4', CAST(799.00 AS Decimal(10, 2)), N'Detale', 4, N'~/Pictures/PlytyGlowne/MSI MAG B760 TOMAHAWK WIFI DDR4.jpg')
SET IDENTITY_INSERT [dbo].[Podzespoly] OFF
GO
INSERT [dbo].[Podzespoly_Cechy] ([CechyId], [PodzespolyId], [Wartosc]) VALUES (1, 3, N'3 GHz')
INSERT [dbo].[Podzespoly_Cechy] ([CechyId], [PodzespolyId], [Wartosc]) VALUES (2, 3, N'24')
INSERT [dbo].[Podzespoly_Cechy] ([CechyId], [PodzespolyId], [Wartosc]) VALUES (3, 3, N'Tak')
INSERT [dbo].[Podzespoly_Cechy] ([CechyId], [PodzespolyId], [Wartosc]) VALUES (4, 3, N'Socket 1700')
INSERT [dbo].[Podzespoly_Cechy] ([CechyId], [PodzespolyId], [Wartosc]) VALUES (5, 3, N'Nie')
INSERT [dbo].[Podzespoly_Cechy] ([CechyId], [PodzespolyId], [Wartosc]) VALUES (1, 4, N'3.6 GHz')
INSERT [dbo].[Podzespoly_Cechy] ([CechyId], [PodzespolyId], [Wartosc]) VALUES (2, 4, N'12')
INSERT [dbo].[Podzespoly_Cechy] ([CechyId], [PodzespolyId], [Wartosc]) VALUES (3, 4, N'Tak')
INSERT [dbo].[Podzespoly_Cechy] ([CechyId], [PodzespolyId], [Wartosc]) VALUES (4, 4, N'Socket 1700')
INSERT [dbo].[Podzespoly_Cechy] ([CechyId], [PodzespolyId], [Wartosc]) VALUES (5, 4, N'Nie')
INSERT [dbo].[Podzespoly_Cechy] ([CechyId], [PodzespolyId], [Wartosc]) VALUES (5, 10, N'Nie')
INSERT [dbo].[Podzespoly_Cechy] ([CechyId], [PodzespolyId], [Wartosc]) VALUES (1, 11, N'2.9 GHz')
INSERT [dbo].[Podzespoly_Cechy] ([CechyId], [PodzespolyId], [Wartosc]) VALUES (2, 11, N'6')
INSERT [dbo].[Podzespoly_Cechy] ([CechyId], [PodzespolyId], [Wartosc]) VALUES (3, 11, N'Nie')
INSERT [dbo].[Podzespoly_Cechy] ([CechyId], [PodzespolyId], [Wartosc]) VALUES (4, 11, N'Socket 1200')
INSERT [dbo].[Podzespoly_Cechy] ([CechyId], [PodzespolyId], [Wartosc]) VALUES (5, 11, N'Tak')
INSERT [dbo].[Podzespoly_Cechy] ([CechyId], [PodzespolyId], [Wartosc]) VALUES (1, 13, N'3.6 GHz')
INSERT [dbo].[Podzespoly_Cechy] ([CechyId], [PodzespolyId], [Wartosc]) VALUES (2, 13, N'6')
INSERT [dbo].[Podzespoly_Cechy] ([CechyId], [PodzespolyId], [Wartosc]) VALUES (3, 13, N'Tak')
INSERT [dbo].[Podzespoly_Cechy] ([CechyId], [PodzespolyId], [Wartosc]) VALUES (4, 13, N'Socket AM4')
INSERT [dbo].[Podzespoly_Cechy] ([CechyId], [PodzespolyId], [Wartosc]) VALUES (5, 13, N'Tak')
INSERT [dbo].[Podzespoly_Cechy] ([CechyId], [PodzespolyId], [Wartosc]) VALUES (1, 14, N'3.6 GHz')
INSERT [dbo].[Podzespoly_Cechy] ([CechyId], [PodzespolyId], [Wartosc]) VALUES (2, 14, N'8')
INSERT [dbo].[Podzespoly_Cechy] ([CechyId], [PodzespolyId], [Wartosc]) VALUES (3, 14, N'Tak')
INSERT [dbo].[Podzespoly_Cechy] ([CechyId], [PodzespolyId], [Wartosc]) VALUES (4, 14, N'Socket AM4')
INSERT [dbo].[Podzespoly_Cechy] ([CechyId], [PodzespolyId], [Wartosc]) VALUES (5, 14, N'Tak')
INSERT [dbo].[Podzespoly_Cechy] ([CechyId], [PodzespolyId], [Wartosc]) VALUES (6, 15, N'12 GB')
INSERT [dbo].[Podzespoly_Cechy] ([CechyId], [PodzespolyId], [Wartosc]) VALUES (7, 15, N'GDDR6X')
INSERT [dbo].[Podzespoly_Cechy] ([CechyId], [PodzespolyId], [Wartosc]) VALUES (8, 15, N'2505 MHz')
INSERT [dbo].[Podzespoly_Cechy] ([CechyId], [PodzespolyId], [Wartosc]) VALUES (9, 15, N'3')
INSERT [dbo].[Podzespoly_Cechy] ([CechyId], [PodzespolyId], [Wartosc]) VALUES (10, 15, N'Aktywne')
INSERT [dbo].[Podzespoly_Cechy] ([CechyId], [PodzespolyId], [Wartosc]) VALUES (6, 16, N'12 GB')
INSERT [dbo].[Podzespoly_Cechy] ([CechyId], [PodzespolyId], [Wartosc]) VALUES (7, 16, N'GDDR6X')
INSERT [dbo].[Podzespoly_Cechy] ([CechyId], [PodzespolyId], [Wartosc]) VALUES (8, 16, N'1920 MHz')
INSERT [dbo].[Podzespoly_Cechy] ([CechyId], [PodzespolyId], [Wartosc]) VALUES (9, 16, N'2')
INSERT [dbo].[Podzespoly_Cechy] ([CechyId], [PodzespolyId], [Wartosc]) VALUES (10, 16, N'Aktywne')
INSERT [dbo].[Podzespoly_Cechy] ([CechyId], [PodzespolyId], [Wartosc]) VALUES (6, 17, N'4 GB')
INSERT [dbo].[Podzespoly_Cechy] ([CechyId], [PodzespolyId], [Wartosc]) VALUES (7, 17, N'GDDR6')
INSERT [dbo].[Podzespoly_Cechy] ([CechyId], [PodzespolyId], [Wartosc]) VALUES (8, 17, N'1410 MHz')
INSERT [dbo].[Podzespoly_Cechy] ([CechyId], [PodzespolyId], [Wartosc]) VALUES (9, 17, N'2')
INSERT [dbo].[Podzespoly_Cechy] ([CechyId], [PodzespolyId], [Wartosc]) VALUES (10, 17, N'Aktywne')
INSERT [dbo].[Podzespoly_Cechy] ([CechyId], [PodzespolyId], [Wartosc]) VALUES (6, 18, N'8 GB')
INSERT [dbo].[Podzespoly_Cechy] ([CechyId], [PodzespolyId], [Wartosc]) VALUES (7, 18, N'GDDR6')
INSERT [dbo].[Podzespoly_Cechy] ([CechyId], [PodzespolyId], [Wartosc]) VALUES (8, 18, N'1815 MHz')
INSERT [dbo].[Podzespoly_Cechy] ([CechyId], [PodzespolyId], [Wartosc]) VALUES (9, 18, N'3')
INSERT [dbo].[Podzespoly_Cechy] ([CechyId], [PodzespolyId], [Wartosc]) VALUES (10, 18, N'Aktywne')
INSERT [dbo].[Podzespoly_Cechy] ([CechyId], [PodzespolyId], [Wartosc]) VALUES (6, 20, N'12 GB')
INSERT [dbo].[Podzespoly_Cechy] ([CechyId], [PodzespolyId], [Wartosc]) VALUES (7, 20, N'GDDR6')
INSERT [dbo].[Podzespoly_Cechy] ([CechyId], [PodzespolyId], [Wartosc]) VALUES (8, 20, N'1777 MHz')
INSERT [dbo].[Podzespoly_Cechy] ([CechyId], [PodzespolyId], [Wartosc]) VALUES (9, 20, N'2')
INSERT [dbo].[Podzespoly_Cechy] ([CechyId], [PodzespolyId], [Wartosc]) VALUES (10, 20, N'Aktywne')
INSERT [dbo].[Podzespoly_Cechy] ([CechyId], [PodzespolyId], [Wartosc]) VALUES (6, 21, N'12 GB')
INSERT [dbo].[Podzespoly_Cechy] ([CechyId], [PodzespolyId], [Wartosc]) VALUES (7, 21, N'GDDR6X')
INSERT [dbo].[Podzespoly_Cechy] ([CechyId], [PodzespolyId], [Wartosc]) VALUES (8, 21, N'2550 MHz')
INSERT [dbo].[Podzespoly_Cechy] ([CechyId], [PodzespolyId], [Wartosc]) VALUES (9, 21, N'3')
INSERT [dbo].[Podzespoly_Cechy] ([CechyId], [PodzespolyId], [Wartosc]) VALUES (10, 21, N'Aktywne')
INSERT [dbo].[Podzespoly_Cechy] ([CechyId], [PodzespolyId], [Wartosc]) VALUES (11, 22, N'Aktywne')
INSERT [dbo].[Podzespoly_Cechy] ([CechyId], [PodzespolyId], [Wartosc]) VALUES (12, 22, N'Aluminium + Miedź')
INSERT [dbo].[Podzespoly_Cechy] ([CechyId], [PodzespolyId], [Wartosc]) VALUES (13, 22, N'1')
INSERT [dbo].[Podzespoly_Cechy] ([CechyId], [PodzespolyId], [Wartosc]) VALUES (14, 22, N'135 x 135 x 22 mm')
INSERT [dbo].[Podzespoly_Cechy] ([CechyId], [PodzespolyId], [Wartosc]) VALUES (15, 22, N'4-pin PWM')
INSERT [dbo].[Podzespoly_Cechy] ([CechyId], [PodzespolyId], [Wartosc]) VALUES (16, 22, N'12 V')
INSERT [dbo].[Podzespoly_Cechy] ([CechyId], [PodzespolyId], [Wartosc]) VALUES (11, 23, N'Wodne')
INSERT [dbo].[Podzespoly_Cechy] ([CechyId], [PodzespolyId], [Wartosc]) VALUES (12, 23, N'Aluminium')
INSERT [dbo].[Podzespoly_Cechy] ([CechyId], [PodzespolyId], [Wartosc]) VALUES (13, 23, N'2')
INSERT [dbo].[Podzespoly_Cechy] ([CechyId], [PodzespolyId], [Wartosc]) VALUES (14, 23, N'274 x 120 x 27 mm')
INSERT [dbo].[Podzespoly_Cechy] ([CechyId], [PodzespolyId], [Wartosc]) VALUES (15, 23, N'4-pin PWM')
INSERT [dbo].[Podzespoly_Cechy] ([CechyId], [PodzespolyId], [Wartosc]) VALUES (16, 23, N'12 V')
INSERT [dbo].[Podzespoly_Cechy] ([CechyId], [PodzespolyId], [Wartosc]) VALUES (11, 24, N'Aktywne')
INSERT [dbo].[Podzespoly_Cechy] ([CechyId], [PodzespolyId], [Wartosc]) VALUES (12, 24, N'Aluminium + Miedź')
INSERT [dbo].[Podzespoly_Cechy] ([CechyId], [PodzespolyId], [Wartosc]) VALUES (13, 24, N'2')
INSERT [dbo].[Podzespoly_Cechy] ([CechyId], [PodzespolyId], [Wartosc]) VALUES (14, 24, N'163 x 136 x 120 mm')
INSERT [dbo].[Podzespoly_Cechy] ([CechyId], [PodzespolyId], [Wartosc]) VALUES (15, 24, N'4-pin PWM')
INSERT [dbo].[Podzespoly_Cechy] ([CechyId], [PodzespolyId], [Wartosc]) VALUES (16, 24, N'12 V')
INSERT [dbo].[Podzespoly_Cechy] ([CechyId], [PodzespolyId], [Wartosc]) VALUES (11, 25, N'Wodne')
INSERT [dbo].[Podzespoly_Cechy] ([CechyId], [PodzespolyId], [Wartosc]) VALUES (12, 25, N'Aluminium')
INSERT [dbo].[Podzespoly_Cechy] ([CechyId], [PodzespolyId], [Wartosc]) VALUES (13, 25, N'2')
INSERT [dbo].[Podzespoly_Cechy] ([CechyId], [PodzespolyId], [Wartosc]) VALUES (14, 25, N'277 x 120 x 27 mm')
INSERT [dbo].[Podzespoly_Cechy] ([CechyId], [PodzespolyId], [Wartosc]) VALUES (15, 25, N'4-pin PWM')
INSERT [dbo].[Podzespoly_Cechy] ([CechyId], [PodzespolyId], [Wartosc]) VALUES (16, 25, N'12 V')
INSERT [dbo].[Podzespoly_Cechy] ([CechyId], [PodzespolyId], [Wartosc]) VALUES (11, 26, N'Aktywne')
INSERT [dbo].[Podzespoly_Cechy] ([CechyId], [PodzespolyId], [Wartosc]) VALUES (12, 26, N'Aluminium + Miedź')
INSERT [dbo].[Podzespoly_Cechy] ([CechyId], [PodzespolyId], [Wartosc]) VALUES (13, 26, N'1')
INSERT [dbo].[Podzespoly_Cechy] ([CechyId], [PodzespolyId], [Wartosc]) VALUES (14, 26, N'155 x 121 x 62 mm')
INSERT [dbo].[Podzespoly_Cechy] ([CechyId], [PodzespolyId], [Wartosc]) VALUES (15, 26, N'4-pin PWM')
INSERT [dbo].[Podzespoly_Cechy] ([CechyId], [PodzespolyId], [Wartosc]) VALUES (16, 26, N'12 V')
INSERT [dbo].[Podzespoly_Cechy] ([CechyId], [PodzespolyId], [Wartosc]) VALUES (11, 27, N'Wodne')
INSERT [dbo].[Podzespoly_Cechy] ([CechyId], [PodzespolyId], [Wartosc]) VALUES (12, 27, N'Aluminium + Miedź')
INSERT [dbo].[Podzespoly_Cechy] ([CechyId], [PodzespolyId], [Wartosc]) VALUES (13, 27, N'3')
INSERT [dbo].[Podzespoly_Cechy] ([CechyId], [PodzespolyId], [Wartosc]) VALUES (14, 27, N'394 x 120 x 27 mm')
INSERT [dbo].[Podzespoly_Cechy] ([CechyId], [PodzespolyId], [Wartosc]) VALUES (15, 27, N'4-pin PWM')
INSERT [dbo].[Podzespoly_Cechy] ([CechyId], [PodzespolyId], [Wartosc]) VALUES (16, 27, N'12 V')
INSERT [dbo].[Podzespoly_Cechy] ([CechyId], [PodzespolyId], [Wartosc]) VALUES (17, 28, N'Socket 1700')
INSERT [dbo].[Podzespoly_Cechy] ([CechyId], [PodzespolyId], [Wartosc]) VALUES (18, 28, N'128 GB')
INSERT [dbo].[Podzespoly_Cechy] ([CechyId], [PodzespolyId], [Wartosc]) VALUES (19, 28, N'Dual-channel')
INSERT [dbo].[Podzespoly_Cechy] ([CechyId], [PodzespolyId], [Wartosc]) VALUES (20, 28, N'Intel B760')
INSERT [dbo].[Podzespoly_Cechy] ([CechyId], [PodzespolyId], [Wartosc]) VALUES (21, 28, N'305 mm')
INSERT [dbo].[Podzespoly_Cechy] ([CechyId], [PodzespolyId], [Wartosc]) VALUES (22, 28, N'244 mm')
INSERT [dbo].[Podzespoly_Cechy] ([CechyId], [PodzespolyId], [Wartosc]) VALUES (1, 10, N'3.4 GHz')
INSERT [dbo].[Podzespoly_Cechy] ([CechyId], [PodzespolyId], [Wartosc]) VALUES (2, 10, N'8')
GO
INSERT [dbo].[Podzespoly_Cechy] ([CechyId], [PodzespolyId], [Wartosc]) VALUES (3, 10, N'Tak')
INSERT [dbo].[Podzespoly_Cechy] ([CechyId], [PodzespolyId], [Wartosc]) VALUES (4, 10, N'Socket AM4')
GO
SET IDENTITY_INSERT [dbo].[Uzytkownicy] ON 

INSERT [dbo].[Uzytkownicy] ([Id], [Nazwa], [Haslo], [Imie], [Nazwisko], [CzyAdmin]) VALUES (1, N'admin', N'admin', N'admin', N'admin', 1)
INSERT [dbo].[Uzytkownicy] ([Id], [Nazwa], [Haslo], [Imie], [Nazwisko], [CzyAdmin]) VALUES (2, N'www@wp.pl', N'well', N'well', N'well', 0)
INSERT [dbo].[Uzytkownicy] ([Id], [Nazwa], [Haslo], [Imie], [Nazwisko], [CzyAdmin]) VALUES (3, N'1111@gmail.com', N'Da_12345', N'1111@gmail.com', N'1111@gmail.com', 0)
SET IDENTITY_INSERT [dbo].[Uzytkownicy] OFF
GO
/****** Object:  Index [IX_Koszyk_UzytkownikId]    Script Date: 21.06.2023 00:43:13 ******/
ALTER TABLE [dbo].[Koszyk] ADD  CONSTRAINT [IX_Koszyk_UzytkownikId] UNIQUE NONCLUSTERED 
(
	[UzytkownikId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Podzespoly_Cechy] ADD  DEFAULT ('') FOR [Wartosc]
GO
ALTER TABLE [dbo].[Uzytkownicy] ADD  DEFAULT ('0') FOR [CzyAdmin]
GO
ALTER TABLE [dbo].[Koszyk]  WITH CHECK ADD  CONSTRAINT [FK_Koszyk_Uzytkownicy] FOREIGN KEY([UzytkownikId])
REFERENCES [dbo].[Uzytkownicy] ([Id])
GO
ALTER TABLE [dbo].[Koszyk] CHECK CONSTRAINT [FK_Koszyk_Uzytkownicy]
GO
ALTER TABLE [dbo].[Koszyk_Podzespol]  WITH CHECK ADD  CONSTRAINT [FK_Koszyk_Podzespol_Koszyk] FOREIGN KEY([KoszykId])
REFERENCES [dbo].[Koszyk] ([Id])
GO
ALTER TABLE [dbo].[Koszyk_Podzespol] CHECK CONSTRAINT [FK_Koszyk_Podzespol_Koszyk]
GO
ALTER TABLE [dbo].[Koszyk_Podzespol]  WITH CHECK ADD  CONSTRAINT [FK_Koszyk_Podzespol_Podzespoly] FOREIGN KEY([PodzespolId])
REFERENCES [dbo].[Podzespoly] ([Id])
GO
ALTER TABLE [dbo].[Koszyk_Podzespol] CHECK CONSTRAINT [FK_Koszyk_Podzespol_Podzespoly]
GO
ALTER TABLE [dbo].[Podzespoly]  WITH CHECK ADD  CONSTRAINT [FK_Podzespoly_Kategorie] FOREIGN KEY([KategoriaId])
REFERENCES [dbo].[Kategorie] ([Id])
GO
ALTER TABLE [dbo].[Podzespoly] CHECK CONSTRAINT [FK_Podzespoly_Kategorie]
GO
ALTER TABLE [dbo].[Podzespoly_Cechy]  WITH CHECK ADD  CONSTRAINT [FK_Podzespoly_Cechy_Cechy] FOREIGN KEY([CechyId])
REFERENCES [dbo].[Cechy] ([Id])
GO
ALTER TABLE [dbo].[Podzespoly_Cechy] CHECK CONSTRAINT [FK_Podzespoly_Cechy_Cechy]
GO
ALTER TABLE [dbo].[Podzespoly_Cechy]  WITH CHECK ADD  CONSTRAINT [FK_Podzespoly_Cechy_Podzespoly] FOREIGN KEY([PodzespolyId])
REFERENCES [dbo].[Podzespoly] ([Id])
GO
ALTER TABLE [dbo].[Podzespoly_Cechy] CHECK CONSTRAINT [FK_Podzespoly_Cechy_Podzespoly]
GO
USE [master]
GO
ALTER DATABASE [MSSQLLocalDB] SET  READ_WRITE 
GO
