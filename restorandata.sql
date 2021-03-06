USE [master]
GO
/****** Object:  Database [PubRestoran]    Script Date: 6/15/2018 7:52:46 PM ******/
CREATE DATABASE [PubRestoran]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'PubRestoran', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\PubRestoran.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'PubRestoran_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\PubRestoran_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [PubRestoran] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PubRestoran].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PubRestoran] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PubRestoran] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PubRestoran] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PubRestoran] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PubRestoran] SET ARITHABORT OFF 
GO
ALTER DATABASE [PubRestoran] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [PubRestoran] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PubRestoran] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PubRestoran] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PubRestoran] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PubRestoran] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PubRestoran] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PubRestoran] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PubRestoran] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PubRestoran] SET  DISABLE_BROKER 
GO
ALTER DATABASE [PubRestoran] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PubRestoran] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PubRestoran] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PubRestoran] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PubRestoran] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PubRestoran] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [PubRestoran] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PubRestoran] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [PubRestoran] SET  MULTI_USER 
GO
ALTER DATABASE [PubRestoran] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [PubRestoran] SET DB_CHAINING OFF 
GO
ALTER DATABASE [PubRestoran] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [PubRestoran] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [PubRestoran] SET DELAYED_DURABILITY = DISABLED 
GO
USE [PubRestoran]
GO
/****** Object:  Table [dbo].[AboutUs]    Script Date: 6/15/2018 7:52:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AboutUs](
	[about_id] [int] IDENTITY(1,1) NOT NULL,
	[about_header] [nvarchar](500) NULL,
	[about_text] [nvarchar](max) NULL,
 CONSTRAINT [PK_AboutUs] PRIMARY KEY CLUSTERED 
(
	[about_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Address]    Script Date: 6/15/2018 7:52:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Address](
	[address_id] [int] IDENTITY(1,1) NOT NULL,
	[address_map] [nvarchar](300) NULL,
	[address_phone] [nvarchar](300) NULL,
	[address_time] [nvarchar](30) NULL,
	[address_facebook] [nvarchar](max) NULL,
	[address_instagram] [nvarchar](max) NULL,
	[address_twit] [nvarchar](max) NULL,
 CONSTRAINT [PK_Address] PRIMARY KEY CLUSTERED 
(
	[address_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Blog]    Script Date: 6/15/2018 7:52:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Blog](
	[blog_id] [int] IDENTITY(1,1) NOT NULL,
	[blog_text] [nvarchar](500) NULL,
	[blog_context] [nvarchar](500) NULL,
 CONSTRAINT [PK_Blog] PRIMARY KEY CLUSTERED 
(
	[blog_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Booking]    Script Date: 6/15/2018 7:52:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Booking](
	[booking_id] [int] IDENTITY(1,1) NOT NULL,
	[booking_date] [datetime] NULL,
	[booking_party_size] [int] NULL,
	[booking_ex_requirements] [nvarchar](max) NULL,
	[booking_user_name] [nvarchar](500) NULL,
	[booking_user_phone] [nvarchar](500) NULL,
	[booking_user_email] [nvarchar](500) NULL,
 CONSTRAINT [PK_Booking] PRIMARY KEY CLUSTERED 
(
	[booking_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 6/15/2018 7:52:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[category_id] [int] IDENTITY(1,1) NOT NULL,
	[category_name] [nvarchar](500) NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[category_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Contact]    Script Date: 6/15/2018 7:52:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contact](
	[contact_id] [int] IDENTITY(1,1) NOT NULL,
	[contact_user_name] [nvarchar](200) NULL,
	[contact__user_email] [nvarchar](400) NULL,
	[contact_user_phone] [nvarchar](60) NULL,
	[contact_text] [nvarchar](max) NULL,
 CONSTRAINT [PK_Contact] PRIMARY KEY CLUSTERED 
(
	[contact_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Gallery]    Script Date: 6/15/2018 7:52:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Gallery](
	[gallery_id] [int] IDENTITY(1,1) NOT NULL,
	[gallery_img] [nvarchar](max) NULL,
 CONSTRAINT [PK_Gallery] PRIMARY KEY CLUSTERED 
(
	[gallery_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Menu_Type]    Script Date: 6/15/2018 7:52:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Menu_Type](
	[menu_type_id] [int] IDENTITY(1,1) NOT NULL,
	[menu_type_name] [nvarchar](200) NULL,
	[menu_type_date] [nvarchar](100) NULL,
 CONSTRAINT [PK_Menu_Type] PRIMARY KEY CLUSTERED 
(
	[menu_type_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Offer]    Script Date: 6/15/2018 7:52:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Offer](
	[offer_id] [int] IDENTITY(1,1) NOT NULL,
	[offer_img] [nvarchar](500) NULL,
	[offer_header] [nvarchar](300) NULL,
	[offer_text] [nvarchar](max) NULL,
	[offer_date] [date] NULL,
	[offer_insides] [nvarchar](max) NULL,
	[offer_about_insides] [nvarchar](max) NULL,
 CONSTRAINT [PK_Offer] PRIMARY KEY CLUSTERED 
(
	[offer_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Olke]    Script Date: 6/15/2018 7:52:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Olke](
	[olke_id] [int] IDENTITY(1,1) NOT NULL,
	[olke_ad] [nvarchar](500) NULL,
 CONSTRAINT [PK_Olke] PRIMARY KEY CLUSTERED 
(
	[olke_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Post]    Script Date: 6/15/2018 7:52:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Post](
	[post_id] [int] IDENTITY(1,1) NOT NULL,
	[post_date] [date] NULL,
	[post_insides] [nvarchar](max) NULL,
	[post_header] [nvarchar](300) NULL,
	[post_text] [nvarchar](max) NULL,
	[post_img] [nvarchar](500) NULL,
	[post_about_inside] [nvarchar](max) NULL,
 CONSTRAINT [PK_Post] PRIMARY KEY CLUSTERED 
(
	[post_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Service]    Script Date: 6/15/2018 7:52:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Service](
	[service_id] [int] IDENTITY(1,1) NOT NULL,
	[service_icon] [nvarchar](100) NULL,
	[service_header] [nvarchar](500) NULL,
	[service_text] [nvarchar](max) NULL,
 CONSTRAINT [PK_Service] PRIMARY KEY CLUSTERED 
(
	[service_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Slider]    Script Date: 6/15/2018 7:52:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Slider](
	[slide_id] [int] IDENTITY(1,1) NOT NULL,
	[slide_header] [nvarchar](200) NULL,
	[slide_text] [nvarchar](max) NULL,
	[slide_back_img] [nvarchar](max) NULL,
 CONSTRAINT [PK_Slider] PRIMARY KEY CLUSTERED 
(
	[slide_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Special]    Script Date: 6/15/2018 7:52:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Special](
	[special_id] [int] IDENTITY(1,1) NOT NULL,
	[special_percent] [nvarchar](20) NULL,
	[special_header] [nvarchar](300) NULL,
	[special_text] [nvarchar](max) NULL,
	[special_back_img] [nvarchar](max) NULL,
 CONSTRAINT [PK_Special] PRIMARY KEY CLUSTERED 
(
	[special_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Yemey]    Script Date: 6/15/2018 7:52:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Yemey](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[category_id] [int] NULL,
	[olke_id] [int] NULL,
	[price] [nvarchar](600) NULL,
	[yemek_adi] [nvarchar](max) NULL,
 CONSTRAINT [PK_Yemey] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[AboutUs] ON 

INSERT [dbo].[AboutUs] ([about_id], [about_header], [about_text]) VALUES (1, N'Haqqımızda', N'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Consectetur adipisicing elit. Quo velit eos impedit asperiores tenetur ut repudiandae quaerat sit.Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quo velit eos impedit asperiores tenetur ut repudiandae quaerat sit.')
SET IDENTITY_INSERT [dbo].[AboutUs] OFF
SET IDENTITY_INSERT [dbo].[Address] ON 

INSERT [dbo].[Address] ([address_id], [address_map], [address_phone], [address_time], [address_facebook], [address_instagram], [address_twit]) VALUES (1, N'Bakı ş.Suraxanı ray. Yeni Günəşli qəsəbəsi', N'+994 50 641 96 93', N'24/7', N'https://www.facebook.com/turan.huseynov.95', N'https://www.instagram.com/_huseynoff____', N'link')
SET IDENTITY_INSERT [dbo].[Address] OFF
SET IDENTITY_INSERT [dbo].[Booking] ON 

INSERT [dbo].[Booking] ([booking_id], [booking_date], [booking_party_size], [booking_ex_requirements], [booking_user_name], [booking_user_phone], [booking_user_email]) VALUES (12, CAST(N'2018-03-04T00:00:00.000' AS DateTime), 3, N'Sam yemegi olacaq', N'Turan', N'6419693', N'turan@mail.ru')
INSERT [dbo].[Booking] ([booking_id], [booking_date], [booking_party_size], [booking_ex_requirements], [booking_user_name], [booking_user_phone], [booking_user_email]) VALUES (13, CAST(N'2018-03-04T02:00:00.000' AS DateTime), 7, N'hecbirsey', N'Mursel', N'5434343', N'mursel@mail.ru')
INSERT [dbo].[Booking] ([booking_id], [booking_date], [booking_party_size], [booking_ex_requirements], [booking_user_name], [booking_user_phone], [booking_user_email]) VALUES (14, CAST(N'2018-12-12T18:00:00.000' AS DateTime), 5, N'hecbirsey', N'Vefadar Huseynov', N'6656462', N'vefadar@mail.ru')
SET IDENTITY_INSERT [dbo].[Booking] OFF
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([category_id], [category_name]) VALUES (1, N'Saladlar')
INSERT [dbo].[Category] ([category_id], [category_name]) VALUES (2, N'Qelyanaltilar')
INSERT [dbo].[Category] ([category_id], [category_name]) VALUES (3, N'Seher  yemekleri')
INSERT [dbo].[Category] ([category_id], [category_name]) VALUES (4, N'İsti içkilər')
INSERT [dbo].[Category] ([category_id], [category_name]) VALUES (5, N'Soyuq içkilər')
SET IDENTITY_INSERT [dbo].[Category] OFF
SET IDENTITY_INSERT [dbo].[Gallery] ON 

INSERT [dbo].[Gallery] ([gallery_id], [gallery_img]) VALUES (1, N'pexels-photo-121627.jpeg')
INSERT [dbo].[Gallery] ([gallery_id], [gallery_img]) VALUES (2, N'pexels-photo-167685.jpeg')
INSERT [dbo].[Gallery] ([gallery_id], [gallery_img]) VALUES (3, N'pexels-photo-907142.jpeg')
INSERT [dbo].[Gallery] ([gallery_id], [gallery_img]) VALUES (4, N'pexels-photo-121627.jpeg')
INSERT [dbo].[Gallery] ([gallery_id], [gallery_img]) VALUES (5, N'pexels-photo-907142.jpeg')
INSERT [dbo].[Gallery] ([gallery_id], [gallery_img]) VALUES (6, N'food-pot-kitchen-cooking.jpg')
INSERT [dbo].[Gallery] ([gallery_id], [gallery_img]) VALUES (7, N'pexels-photo-167685.jpeg')
SET IDENTITY_INSERT [dbo].[Gallery] OFF
SET IDENTITY_INSERT [dbo].[Menu_Type] ON 

INSERT [dbo].[Menu_Type] ([menu_type_id], [menu_type_name], [menu_type_date]) VALUES (1, N'Lunch', N'01:00 pm- 05:00 pm')
INSERT [dbo].[Menu_Type] ([menu_type_id], [menu_type_name], [menu_type_date]) VALUES (2, N'Breakfast', N'07:00 am- 11:00 am')
INSERT [dbo].[Menu_Type] ([menu_type_id], [menu_type_name], [menu_type_date]) VALUES (3, N'Evening', N'06:00 pm -  11:00 pm')
SET IDENTITY_INSERT [dbo].[Menu_Type] OFF
SET IDENTITY_INSERT [dbo].[Offer] ON 

INSERT [dbo].[Offer] ([offer_id], [offer_img], [offer_header], [offer_text], [offer_date], [offer_insides], [offer_about_insides]) VALUES (3, N'pexels-photo-907142.jpeg', N'header', N'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Et officia nobis velit porro ut animi minima consectetur officiis obcaecati, modi nisi culpa facilis asperiores, magnam adipisci iste, perferendis eos rem', CAST(N'2016-05-06' AS Date), N'icinde', N'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Et officia nobis velit porro ut animi minima consectetur officiis obcaecati, modi nisi culpa facilis asperiores, magnam adipisci iste, perferendis eos remLorem ipsum dolor sit amet, consectetur adipisicing elit. Et officia nobis velit porro ut animi minima consectetur officiis obcaecati, modi nisi culpa facilis asperiores, magnam adipisci iste, perferendis eos remLorem ipsum dolor sit amet, consectetur adipisicing elit. Et officia nobis velit porro ut animi minima consectetur officiis obcaecati, modi nisi culpa facilis asperiores, magnam adipisci iste, perferendis eos rem')
INSERT [dbo].[Offer] ([offer_id], [offer_img], [offer_header], [offer_text], [offer_date], [offer_insides], [offer_about_insides]) VALUES (4, N'pexels-photo-167685.jpeg', N'header', N'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Et officia nobis velit porro ut animi minima consectetur officiis obcaecati, modi nisi culpa facilis asperiores, magnam adipisci iste, perferendis eos rem', CAST(N'2016-05-06' AS Date), N'icindeki', N'bla bla bla bla lorem ipsum flat jss salad porte ds')
SET IDENTITY_INSERT [dbo].[Offer] OFF
SET IDENTITY_INSERT [dbo].[Olke] ON 

INSERT [dbo].[Olke] ([olke_id], [olke_ad]) VALUES (1, N'Azerbaycan')
INSERT [dbo].[Olke] ([olke_id], [olke_ad]) VALUES (2, N'Fransiz')
INSERT [dbo].[Olke] ([olke_id], [olke_ad]) VALUES (3, N'Yapon')
SET IDENTITY_INSERT [dbo].[Olke] OFF
SET IDENTITY_INSERT [dbo].[Service] ON 

INSERT [dbo].[Service] ([service_id], [service_icon], [service_header], [service_text]) VALUES (1, N'fa fa-cutlery', N'Meal eat string lorem', N'Lorem ipsum da bele birsey var iken .Lorem ipsum da bele birsey var iken .Lorem ipsum da bele birsey var iken .Lorem ipsum da bele birsey var iken .Lorem ipsum da bele birsey var iken .')
INSERT [dbo].[Service] ([service_id], [service_icon], [service_header], [service_text]) VALUES (2, N'fa fa-birthday-cake', N'Cakes eat string lorem', N'Lorem ipsum da bele birsey var iken .Lorem ipsum da bele birsey var iken .Lorem ipsum da bele birsey var iken .Lorem ipsum da bele birsey var iken .Lorem ipsum da bele birsey var iken .')
INSERT [dbo].[Service] ([service_id], [service_icon], [service_header], [service_text]) VALUES (3, N'fa fa-coffee', N'Coffe drink string lorem', N'Lorem ipsum da bele birsey var iken .Lorem ipsum da bele birsey var iken .Lorem ipsum da bele birsey var iken .Lorem ipsum da bele birsey var iken .Lorem ipsum da bele birsey var iken .')
SET IDENTITY_INSERT [dbo].[Service] OFF
SET IDENTITY_INSERT [dbo].[Slider] ON 

INSERT [dbo].[Slider] ([slide_id], [slide_header], [slide_text], [slide_back_img]) VALUES (1, N'header', N'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quo velit eos impedit asperiores tenetur ut repudiandae quaerat sit.', N'pexels-photo-121627.jpeg')
INSERT [dbo].[Slider] ([slide_id], [slide_header], [slide_text], [slide_back_img]) VALUES (2, N'header', N'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quo velit eos impedit asperiores tenetur ut repudiandae quaerat sit.', N'pexels-photo-907142.jpeg')
INSERT [dbo].[Slider] ([slide_id], [slide_header], [slide_text], [slide_back_img]) VALUES (3, N'header', N'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quo velit eos impedit asperiores tenetur ut repudiandae quaerat sit.', N'pexels-photo-167685.jpeg')
SET IDENTITY_INSERT [dbo].[Slider] OFF
SET IDENTITY_INSERT [dbo].[Special] ON 

INSERT [dbo].[Special] ([special_id], [special_percent], [special_header], [special_text], [special_back_img]) VALUES (2, N'35', N'Bugunun xususi endirimi', N'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Et officia nobis velit porro ut animi minima consectetur officiis obcaecati, modi nisi culpa facilis asperiores, magnam adipisci iste, perferendis eos rem', N'pexels-photo-121627.jpeg')
SET IDENTITY_INSERT [dbo].[Special] OFF
SET IDENTITY_INSERT [dbo].[Yemey] ON 

INSERT [dbo].[Yemey] ([id], [category_id], [olke_id], [price], [yemek_adi]) VALUES (7, 1, 1, N'22 Azn', N'aze_salad')
INSERT [dbo].[Yemey] ([id], [category_id], [olke_id], [price], [yemek_adi]) VALUES (8, 2, 1, N'51 Azn', N'aze_qelyan')
INSERT [dbo].[Yemey] ([id], [category_id], [olke_id], [price], [yemek_adi]) VALUES (9, 3, 1, N'22 Azn', N'azes_seher')
INSERT [dbo].[Yemey] ([id], [category_id], [olke_id], [price], [yemek_adi]) VALUES (10, 1, 2, N'20', N'fransiz')
INSERT [dbo].[Yemey] ([id], [category_id], [olke_id], [price], [yemek_adi]) VALUES (11, 2, 2, N'22 Azn', N'fransiz_qelyan')
INSERT [dbo].[Yemey] ([id], [category_id], [olke_id], [price], [yemek_adi]) VALUES (12, 3, 2, N'22 Azn', N'fransiz_break')
INSERT [dbo].[Yemey] ([id], [category_id], [olke_id], [price], [yemek_adi]) VALUES (13, 4, 1, N'22 Azn', N'cay')
INSERT [dbo].[Yemey] ([id], [category_id], [olke_id], [price], [yemek_adi]) VALUES (14, 5, 1, N'20', N'soyuqtea')
SET IDENTITY_INSERT [dbo].[Yemey] OFF
ALTER TABLE [dbo].[Yemey]  WITH CHECK ADD  CONSTRAINT [FK_Yemey_Category] FOREIGN KEY([category_id])
REFERENCES [dbo].[Category] ([category_id])
GO
ALTER TABLE [dbo].[Yemey] CHECK CONSTRAINT [FK_Yemey_Category]
GO
ALTER TABLE [dbo].[Yemey]  WITH CHECK ADD  CONSTRAINT [FK_Yemey_Olke] FOREIGN KEY([olke_id])
REFERENCES [dbo].[Olke] ([olke_id])
GO
ALTER TABLE [dbo].[Yemey] CHECK CONSTRAINT [FK_Yemey_Olke]
GO
USE [master]
GO
ALTER DATABASE [PubRestoran] SET  READ_WRITE 
GO
