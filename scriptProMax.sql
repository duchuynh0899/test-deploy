CREATE DATABASE [FCS]
GO
USE [FCS]
GO

/****** Object:  Table [dbo].[Account]    Script Date: 8/13/2022 10:36:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[AccountID] [int] IDENTITY(1,1) NOT NULL,
	[RoleID] [int] NULL,
	[Username] [varchar](50) NOT NULL,
	[Password] [varchar](32) NULL,
	[AccountStatus] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Admins]    Script Date: 8/13/2022 10:36:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Admins](
	[AdminID] [int] IDENTITY(1,1) NOT NULL,
	[Avatar] [Nvarchar](max) NULL,
	[FirstName] [nvarchar](60) NULL,
	[LastName] [nvarchar](20) NULL,
	[Age] [smallint] NULL,
	[CountryID] [int] NULL,
	[ProvinceID] [int] NULL,
	[DistrictID] [int] NULL,
	[AddressDetail] [nvarchar](200) NULL,
	[Phone] [varchar](10) NULL,
	[Email] [varchar](50) NULL,
	[Gender] [bit] NULL,
	LinkFacebook nvarchar(Max),
PRIMARY KEY CLUSTERED 
(
	[AdminID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Buses]    Script Date: 8/13/2022 10:36:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Buses](
	[BusNumber] [int] NOT NULL,
	[Cost] [money] NULL,
	[BusStop] [nvarchar](max) NULL,
	[Url1] [nvarchar](max) NULL,
	[Url2] [nvarchar](max) NULL,
	[ShortDescriptions] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[BusNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Clubs]    Script Date: 8/13/2022 10:36:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clubs](
	[ClubID] [int] IDENTITY(1,1) NOT NULL,
	[Avatar] [Nvarchar](max) NULL,
	[ClubName] [nvarchar](200) NULL,
	[ClubPresident] [nvarchar](100) NULL,
	[Facebook] [text] NULL,
	[Email] [varchar](50) NULL,
	[Description] [nvarchar](max) NULL,
	[Type] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ClubID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

/****** Object:  Table [dbo].[Country]    Script Date: 8/13/2022 10:36:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Country](
	[CountryID] [int] IDENTITY(1,1) NOT NULL,
	[CountryName] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[CountryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Department]    Script Date: 8/13/2022 10:36:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Department](
	[DepId] [int] IDENTITY(1,1) NOT NULL,
	[DepName] [nvarchar](100) NULL,
	[DepNameAbbreviations] [varchar](10) NULL,
	[Email] [varchar](50) NULL,
	[Phone] [nvarchar](30) NULL,
	[OpenDay] [nvarchar](30) NULL,
	[Url1] [nvarchar](max) NULL,
	[Url2] [nvarchar](max) NULL,
	[Descriptions] [nvarchar](max) NULL,
	[ShortDescription] [nvarchar](max) NULL,
	[Position] [nchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[DepId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[District]    Script Date: 8/13/2022 10:36:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[District](
	[DistrictID] [int] IDENTITY(1,1) NOT NULL,
	[ProvinceID] [int] NULL,
	[DistrictName] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[DistrictID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EventOfClub]    Script Date: 8/13/2022 10:36:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EventOfClub](
	[EventID] [int] IDENTITY(1,1) NOT NULL,
	[ClubID] [int] NULL,
	[EventName] [nvarchar](100) NULL,
	[Time] [nvarchar](50) NULL,
	[Description] [nvarchar](max) NULL,
	[Url1] [Nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[EventID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FoodImage]    Script Date: 8/13/2022 10:36:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FoodImage](
	[FoodID] [int] NOT NULL,
	[ImageUrl] [Nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[FoodID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Foods]    Script Date: 8/13/2022 10:36:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Foods](
	[FoodID] [int] IDENTITY(1,1) NOT NULL,
	[RestaurantID] [int] NULL,
	[FoodName] [nvarchar](100) NULL,
	[Cost] [money] NULL,
	[Descriptions] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[FoodID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HostelImage]    Script Date: 8/13/2022 10:36:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HostelImage](
	[HostelID] [int] NOT NULL,
	[Url1] [Nvarchar](max) NULL,
	[Url2] [Nvarchar](max) NULL,
	[Url3] [Nvarchar](max) NULL,
	[Url4] [Nvarchar](max) NULL,
	[Url5] [Nvarchar](max) NULL,
	[Url6] [Nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[HostelID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Hostels]    Script Date: 8/13/2022 10:36:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Hostels](
	[HostelID] [int] IDENTITY(1,1) NOT NULL,
	[HostelName] [nvarchar](100) NULL,
	[SellerID] [int] NULL,
	[TotalRoom] [int] NULL,
	[Status] [bit] NULL,
	[Floors] [int] NULL,
	[CountryID] [int] NULL,
	[ProvinceID] [int] NULL,
	[DistrictID] [int] NULL,
	[AddressDetail] [nvarchar](200) NULL,
	[RentCost] [money] NULL,
	[Distance] [decimal](2, 1) NULL,
	[Descriptions] [nvarchar](max) NULL,
	[StarVoting] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[HostelID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Province]    Script Date: 8/13/2022 10:36:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Province](
	[ProvinceID] [int] IDENTITY(1,1) NOT NULL,
	[CountryID] [int] NULL,
	[ProvinceName] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[ProvinceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[ReportHostel]    Script Date: 8/13/2022 10:36:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ReportHostel](
	[ReportID] [int] IDENTITY(1,1) NOT NULL,
	[HostelID] [int] NULL,
	[Spam] [bit] NULL,
	[Offensive] [bit] NULL,
	[Violent] [bit] NULL,
	[Truthless] [bit] NULL,
	[ReportTime] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[ReportID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ReportRestaurant]    Script Date: 8/13/2022 10:36:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ReportRestaurant](
	[ReportID] [int] IDENTITY(1,1) NOT NULL,
	[RestaurantID] [int] NULL,
	[Spam] [bit] NULL,
	[Offensive] [bit] NULL,
	[Violent] [bit] NULL,
	[Truthless] [bit] NULL,
	[ReportTime] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[ReportID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Restaurants]    Script Date: 8/13/2022 10:36:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Restaurants](
	[RestaurantID] [int] IDENTITY(1,1) NOT NULL,
	[RestaurantName] [nvarchar](100) NULL,
	[SellerID] [int] NULL,
	[CountryID] [int] NULL,
	[ProvinceID] [int] NULL,
	[DistrictID] [int] NULL,
	[AddressDetail] [nvarchar](200) NULL,
	[Cost] [varchar](30) NULL,
	[Distance] [float] NULL,
	[Descriptions] [nvarchar](max) NULL,
	[RestaurantImage] [nvarchar](max) NULL,
	[StarVoting] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[RestaurantID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 8/13/2022 10:36:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[RoleID] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [nvarchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[Sellers]    Script Date: 8/13/2022 10:36:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sellers](
	[SellerID] [int] IDENTITY(1,1) NOT NULL,
	[Avatar] [Nvarchar](max) NULL,
	[FirstName] [nvarchar](60) NULL,
	[LastName] [nvarchar](20) NULL,
	[Age] [smallint] NULL,
	[Phone] [varchar](10) NULL,
	[Email] [varchar](50) NULL,
	[CountryID] [int] NULL,
	[ProvinceID] [int] NULL,
	[DistrictID] [int] NULL,
	[AddressDetail] [nvarchar](200) NULL,
	[Gender] [bit] NULL,
	LinkFacebook nvarchar(Max),
PRIMARY KEY CLUSTERED 
(
	[SellerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StarVotingHostel]    Script Date: 8/13/2022 10:36:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StarVotingHostel](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[StudentNo] [int] NULL,
	[HostelID] [int] NULL,
	[StarVoting] [int] NULL,
	[Comment] [nvarchar](max) NULL,
	[Date] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StarVotingRestaurant]    Script Date: 8/13/2022 10:36:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StarVotingRestaurant](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[StudentNo] [int] NULL,
	[RestaurantID] [int] NULL,
	[StarVoting] [int] NULL,
	[Comment] [nvarchar](max) NULL,
	[Date] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Students]    Script Date: 8/13/2022 10:36:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Students](
	[StudentNo] [int] IDENTITY(1,1) NOT NULL,
	[StudentID] [varchar](10) NULL,
	[Avatar] [Nvarchar](max) NULL,
	[FirstName] [nvarchar](60) NULL,
	[LastName] [nvarchar](20) NULL,
	[Age] [smallint] NULL,
	[Phone] [varchar](10) NULL,
	[Unit] [varchar](5) NULL,
	[Email] [varchar](50) NULL,
	[CountryID] [int] NULL,
	[ProvinceID] [int] NULL,
	[AddressDetail] [nvarchar](200) NULL,
	[DistrictID] [int] NULL,
	[Gender] [bit] NULL,
	LinkFacebook nvarchar(Max),
PRIMARY KEY CLUSTERED 
(
	[StudentNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TypeOfClub]    Script Date: 8/13/2022 10:36:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TypeOfClub](
	[TypeID] [int] IDENTITY(1,1) NOT NULL,
	[TypeName] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[TypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Account] ON 

INSERT [dbo].[Account] ([AccountID], [RoleID], [Username], [Password], [AccountStatus]) VALUES (11, 4, N'fu.melody.club@gmail.com', N'me12345', 1)
INSERT [dbo].[Account] ([AccountID], [RoleID], [Username], [Password], [AccountStatus]) VALUES (3, 3, N'hoantmhe141105@fpt.edu.vn', N'120920', 1)
INSERT [dbo].[Account] ([AccountID], [RoleID], [Username], [Password], [AccountStatus]) VALUES (5, 3, N'hung123@gmail.com', N'12345', 1)
INSERT [dbo].[Account] ([AccountID], [RoleID], [Username], [Password], [AccountStatus]) VALUES (4, 4, N'jsclub.fpt@gmail.com', N'js12345', 1)
INSERT [dbo].[Account] ([AccountID], [RoleID], [Username], [Password], [AccountStatus]) VALUES (9, 3, N'ktxongba@gmail.com', N'123456', 1)
INSERT [dbo].[Account] ([AccountID], [RoleID], [Username], [Password], [AccountStatus]) VALUES (7, 3, N'liennga@gmail.com', N'12345', 1)
INSERT [dbo].[Account] ([AccountID], [RoleID], [Username], [Password], [AccountStatus]) VALUES (1, 2, N'minkook2909@gmail.com', N'123456', 1)
INSERT [dbo].[Account] ([AccountID], [RoleID], [Username], [Password], [AccountStatus]) VALUES (2, 1, N'nguyenmyhoa120920@gmail.com', N'12345', 1)
INSERT [dbo].[Account] ([AccountID], [RoleID], [Username], [Password], [AccountStatus]) VALUES (12, NULL, N'noshy.fpt@gmail.com', N'noshy123', 1)
INSERT [dbo].[Account] ([AccountID], [RoleID], [Username], [Password], [AccountStatus]) VALUES (8, 3, N'thaidung@gmail.com', N'12345', 1)
INSERT [dbo].[Account] ([AccountID], [RoleID], [Username], [Password], [AccountStatus]) VALUES (10, 3, N'vietanhnguyen@gmail.com', N'12345', 1)
SET IDENTITY_INSERT [dbo].[Account] OFF
GO

INSERT [dbo].[Buses] ([BusNumber], [Cost], [BusStop], [Url1], [Url2], [ShortDescriptions]) VALUES (74, 9000.0000, N'Bx Mỹ Đình&&Gần Ngã 4 Phạm Hùng - Đình Thôn (Hướng Đi Khuất Duy Tiến)-Cột Sau&&Nhà Ct5 Kđt Sông Đà Mỹ Đình - Phạm Hùng&&Nhà Hàng Hàn Quốc, Nhà Ct4 Đn Kđt Mỹ Đình - Đường Mễ Trì&&Tường Rào Trạm Y Tế Mễ Trì - Đường Mễ Trì&&Tường Rào Sân Golf Mỹ Đình Pearl - Đại Lộ Thăng Long&&Xóm La, Đại Mỗ - Đại Lộ Thăng Long&&Qua Đối Diện Lối Vào Thpt Đại Mỗ - Đại Lộ Thăng Long&&Trụ Sở Bộ Tư Lệnh Cảnh Sát Biển - Đại Lộ Thăng Long&&Đối Diện Thiên Đường Bảo Sơn - Đại Lộ Thăng Long&&Qua Lối Rẽ Vào Ubnd Xã An Khánh - Đại Lộ Thăng Long&&Chùa Bà - Thôn Yên Lũng, An Khánh - Đại Lộ Thăng Long&&Trước 50m Lối Vào Ubnd Huyện Hoài Đức&&Cầu Vượt Song Phương - Đại Lộ Thăng Long&&Làng Văn Hóa Thôn Quyết Tiến (Trước 200m Cầu Sông Đáy)&&Chùa Sơn Trung, Xã Yên Sơn&&Ngã 3 Chùa Thầy, Gần Cầu Vượt Sài Sơn&&Cầu Vượt Hoàng Xá - Cột Mốc H7/17 Đại Lộ Thăng Long&&Kcn Thạch Thất - Đại Lộ Thăng Long&&Ngã 3 Tỉnh Lộ 419 - Đại Lộ Thăng Long - Kcn Thạch Thất&&Cầu Chui Dân Sinh Số 11 - Đại Lộ Thăng Long&&Cty Sun House, Xã Ngọc Liệp - Đại Lộ Thăng Long&&Trước Nhà Máy Thép Mỹ Thuật Hải Vân - Đại Lộ Thăng Long&&Đường Vào Chùa Kim Long - Đại Lộ Thăng Long&&Thôn Liệp Mai, Xã Ngọc Liệp - Đại Lộ Thăng Long&&Thôn Đồng Kho, Xã Đồng Trúc - Đại Lộ Thăng Long&&Qua Khu Đồng Trúc Resort 10m (Cầu Chui Dân Sinh Số 19), Đại Lộ Thăng Long&&Thôn Đồi Bông, Xã Đồng Trúc - Đại Lộ Thăng Long&&Trạm 110kv Thạch Thất - Đại Lộ Thăng Long&&Đường Vào Kcn Cao Hòa Lạc - Đại Lộ Thăng Long&&Trường Ptth Hòa Lạc&&Tòa Nhà Viettel Hòa Lạc&&Trước 50m Đường Vào Trường Đh Fpt, Hòa Lạc&&Số 231 Thạch Hòa Thạch Thất&&Trung Tâm Dạy Nghề Và Đào Tạo Sát Hạch Lái Xe Hùng Vương&&Qua Cầu Hòa Lạc (Đi Xuân Mai) - Quốc Lộ 21a&&Gần Ngã Tư Lục Quân&&Đối Diện Tập Đoàn Y Dược Bảo Long - Quốc Lộ 21a&&Công Ty Tnhh Punta Vietnam&&Qua Ngã 3 Sơn Tây Đồng Mô&&Ngã Ba Sơn Tây - Võng Xuyên - Quốc Lộ 21a&&Tân Phú Sơn Đông&&Đối Diện Đường Vào Trường Sĩ Quan Phòng Hóa&&Đối Diện Đường Vào Học Viện Phòng Không Không Quân - Công Ty Thịnh Cường&&Qua Ngã Ba Xuân Khanh - Quốc Lộ 21a&&Gần Cây Xăng Quân Đội - Đối Diện Bệnh Viện 105&&118-120a Phố Thanh Vị&&Qua Đối Diện Trường Sỹ Quan Pháo Binh 100m&&Đối Diện Số 163 Phố Thanh Vị&&Đối Diện Số 391 Thanh Mỹ&&Số 58 Thanh Mỹ&&Trước Nhà Máy Z151 - 50m&&Đối Diện Số 101 Xuân Khanh&&Viện Kỹ Thuật Cơ Giới Quân Sự Khu B (Trung Tâm Thực Hành Thí Nghiệm)&&Giữa 270-272 Xuân Khanh&&Trường Đh Công Nghiệp Việt Hung&&Xuân Khanh', N'busimage/xe74_1.jpg', NULL, N'Lộ trình: Mỹ Đình -> Xuân Khanh<br>Thời Gian xe chạy: 04:40 -> 21:00<br>Giá vé: 9.000đ/Vé ')
INSERT [dbo].[Buses] ([BusNumber], [Cost], [BusStop], [Url1], [Url2], [ShortDescriptions]) VALUES (88, 9000.0000, N'Bx Mỹ Đình&&Gần Ngã 4 Phạm Hùng - Đình Thôn (Hướng Đi Khuất Duy Tiến)-Cột Sau&&Nhà Ct5 Kđt Sông Đà Mỹ Đình - Phạm Hùng&&Nhà Hàng Hàn Quốc, Nhà Ct4 Đn Kđt Mỹ Đình - Đường Mễ Trì&&Tường Rào Trạm Y Tế Mễ Trì - Đường Mễ Trì&&Tường Rào Sân Golf Mỹ Đình Pearl - Đại Lộ Thăng Long&&Xóm La, Đại Mỗ - Đại Lộ Thăng Long&&Qua Đối Diện Lối Vào Thpt Đại Mỗ - Đại Lộ Thăng Long&&Trụ Sở Bộ Tư Lệnh Cảnh Sát Biển - Đại Lộ Thăng Long&&Đối Diện Thiên Đường Bảo Sơn - Đại Lộ Thăng Long&&Qua Lối Rẽ Vào Ubnd Xã An Khánh - Đại Lộ Thăng Long&&Đông Y Dược Bảo Long - Đại Lộ Thăng Long&&Chùa Bà - Thôn Yên Lũng, An Khánh - Đại Lộ Thăng Long&&Trước 50m Lối Vào Ubnd Huyện Hoài Đức&&Cầu Vượt Song Phương - Đại Lộ Thăng Long&&Làng Văn Hóa Thôn Quyết Tiến (Trước 200m Cầu Sông Đáy)&&Chùa Sơn Trung, Xã Yên Sơn&&Ngã 3 Chùa Thầy, Gần Cầu Vượt Sài Sơn&&Cầu Vượt Hoàng Xá - Cột Mốc H7/17 Đại Lộ Thăng Long&&Kcn Thạch Thất - Đại Lộ Thăng Long&&Ngã 3 Tỉnh Lộ 419 - Đại Lộ Thăng Long - Kcn Thạch Thất&&Cầu Chui Dân Sinh Số 11 - Đại Lộ Thăng Long&&Cty Sun House, Xã Ngọc Liệp - Đại Lộ Thăng Long&&Trước Nhà Máy Thép Mỹ Thuật Hải Vân - Đại Lộ Thăng Long&&Đường Vào Chùa Kim Long - Đại Lộ Thăng Long&&Thôn Liệp Mai, Xã Ngọc Liệp - Đại Lộ Thăng Long&&Thôn Đồng Kho, Xã Đồng Trúc - Đại Lộ Thăng Long&&Qua Khu Đồng Trúc Resort 10m (Cầu Chui Dân Sinh Số 19), Đại Lộ Thăng Long&&Thôn Đồi Bông, Xã Đồng Trúc - Đại Lộ Thăng Long&&Trạm 110kv Thạch Thất - Đại Lộ Thăng Long&&Đường Vào Kcn Cao Hòa Lạc - Đại Lộ Thăng Long&&Trường Ptth Hòa Lạc&&Tòa Nhà Viettel Hòa Lạc&&Trước 50m Đường Vào Trường Đh Fpt, Hòa Lạc&&Công Ty Tnhh Xây Dựng Sungeun Plant - Thôn 7 Xã Thạch Hòa - Ql21&&Công Ty Cp Dịch Vụ Bảo Vệ Kcn Cao Hòa Lạc&&Ngã Ba Hòa Lạc - Quốc Lộ 21&&Trước Cửa Hàng Điện Máy Tâm Đức - Ql21&&Đối Diện CH Xăng Dầu Phú Cát - Quốc Lộ 21&&Thôn 7 Phú Cát Quốc Oai - Quốc Lộ 21&&Qua 70m Cổng Trung Đoàn Bộ Binh Cơ Giới 102 (Cột Mốc H7/414) - Quốc Lộ 21&&Xóm 2 Hòa Phú, Xã Hòa Thạch - Quốc Oai (Chiều Đi Xuân Mai)&&Trước Công Ty Cp Long Thạch - Ql21&&Trước Cửa Hàng Vật Liệu Xây Dựng Thành Cảnh - Ql21&&Đối Diện Nha Khoa Trường Huyền Xã Hòa Thạch&&Chợ Long Phú - Xã Hòa Thạch - Quốc Lộ 21&&Gần Cầu Cửa Đầm - Quốc Lộ 21&&Xóm 5 Thôn Long Phú Xã Hòa Thạch (Trước Đội Cơ Giới Máy Thi Công)&&Đối Diện Làng Văn Hóa Yên Thái, Xã Đông Sơn, Hòa Binh - Quốc Lộ 21&&Cửa Hàng Xăng Dầu Tv21 - Quốc Lộ 21&&Đường Vào Trường Đh Pccc Cơ Sở 2 Bộ Ca - Quốc Lộ 21&&Đại Học Lâm Nghiệp - Quốc Lộ 21&&35 Tổ 3, Thị Trấn Xuân Mai&&Trường Sỹ Quan Đặc Công (Qua Cửa Hàng Xăng Dầu Số 7 Xuân Mai)&&Cty Xuân Cương (Trước 100m Cầu Xuân Mai) - Đường Hồ Chí Minh&&Trường Trung Cấp Cảnh Sát Vũ Trang - Đường Hồ Chí Minh&&Qua 100m Trường Trung Cấp Nghề Tổng Hợp Hà Nội - Đường Hồ Chí Minh&&Trung Tâm Dịch Vụ Tổng Hợp, Thôn Xuân Trung - Đường Hồ Chí Minh&&Thôn Xuân Sen - Xuân Mai - Đường Hồ Chí Minh&&Ktx Trường Cđ Cộng Đồng Hà Tây - Đường Hồ Chí Minh&&Cổng Trường Cđ Cộng Đồng Hà Tây - Đường Hồ Chí Minh&&Xuân Mai (Trường Cđ Cộng Đồng Hà Tây)', N'busimage/xe88_1.jpg', NULL, N'Lộ trình: Mỹ Đình -> Xuân Mai<br>Thời Gian xe chạy: 05:00 -> 20:00<br>Giá vé: 9.000đ/Vé ')
INSERT [dbo].[Buses] ([BusNumber], [Cost], [BusStop], [Url1], [Url2], [ShortDescriptions]) VALUES (107, 9000.0000, N'211 Kim Mã &&116 A5 Tập thể Giảng Võ – Kim Mã &&31 Nguyễn Chí Thanh &&73 Nguyễn Chí Thanh – Đối diện Khách sạn Bảo Sơn &&89 Nguyễn Chí Thanh – KTX Đại học Luật&&KTX Đại học Giao thông Vận tải – 99 Nguyễn Chí Thanh &&Đại học Lao động & Xã hội – 43 Trần Duy Hưng &&113 Trần Duy Hưng – Bộ KHCN &&Đối diện 220 Trần Duy Hưng (đối diện Big C,&&Cách Ngã 3 Hoàng Minh Giám) &&Tòa nhà Thăng Long Number One – Đại lộ Thăng Long &&Công ty Viễn Thông Viettel (Tòa nhà N1) – Đại lộ Thăng Long &&Qua 100m ngã 3 Đại lộ Thăng Long – Lê Quang Đạo &&Trước ngã 3 Phố Sa Đôi – Đại lộ Thăng Long &&Lối vào THPT Đại Mỗ – Đại lộ Thăng Long &&Qua ngã 3 Làng Miêu Nha – Đại lộ Thăng Long &&Đường vào UBND Phường Tây Mỗ – Đại lộ Thăng Long &&Cổng Thiên Đường Bảo Sơn – Đại lộ Thăng Long &&Trước 50m hầm chui dân sinh số 3 Đại Lộ Thăng Long &&Cầu vượt An Khánh – Đại lộ Thăng Long &&KĐT Nam An Khánh – Đại lộ Thăng Long&&Đê Phương Viên, Song Phương – Đại lộ Thăng Long &&Song Phương, Hoài Đức – Đại lộ Thăng Long &&Xã Vân Côn, Hoài Đức – Đại lộ Thăng Long &&Thôn Quảng Yên, Yên Sơn, Quốc Oai – Đại lộ Thăng Long &&Ngã 3 Chùa Thầy – Quốc Oai – Đại lộ Thăng Long &&Khu đô thị Ngôi nhà mới- Đại lộ Thăng Long &&Thôn Ngô Sài – thị trấn Quốc Oai – Đại lộ Thăng Long &&Thôn Ngọc Than, xã Ngọc Mỹ – Đại lộ Thăng Long &&Thôn Đồng Bụt, xã Ngọc Liệp – Đại lộ Thăng Long &&Trường THCS Ngọc Liệp &&Thôn Liệp Mai, xã Ngọc Liệp – Đại lộ Thăng Long (hướng về trung tâm thành phố) &&Thôn Đồng Kho, xã Đồng Trúc – Đại lộ Thăng Long (hướng về trung tâm thành phố) &&Thôn Khoang Mái, xã Đồng Trúc – Đại lộ Thăng Long &&Cty Cám Trường Thọ – Đại lộ Thăng Long &&Khu CN cao Hòa Lạc – Đại lộ Thăng Long &&Đối diện trường PTTH Hòa Lạc &&Đối Diện Tòa Nhà Viettel Hòa Lạc &&Qua 50m đối diện đường vào trường ĐH FPT, Hòa Lạc &&Quầy thuốc số 15 – Thôn 7 xã Thạch Hòa – QL21 &&Qua 30m đối diện công ty CP dịch vụ bảo vệ KCN Cao Hòa Lạc – QL21 &&Đối diện cửa hàng điện nước Tuấn Bình – thôn 7 xã Thạch Hòa – QL21 &&Đại lý sữa Lan Anh – xã Thạch Hòa &&Công ty CP xây dựng Tiến An – Thôn 6 xã Thạch Hòa &&Trước 30m đường vào thôn Trại Mới xã Tiến Xuân &&Đại lý sữa Ất Thảo – Thôn Nhòn xã Tiến Xuân &&Qua 30m Cty CP An Thinh Group – Thôn Gò Mè xã Yên Bình &&Qua Ngã 4 Yên Bình 70m &&Trước 30 đối diện Xưởng thực hành Trường Cao đẳng công nghiệp kỹ thuật Trần Hưng Đạo &&Qua Cổng A Làng Văn Hóa Du Lịch Các Dân Tộc Việt Nam 30m &&Làng văn hóa các dân tộc Việt Nam – Tuyến 107', N'busimage/xe107_1.png', NULL, N'Lộ trình: Kim Mã -> Làng Văn hóa Du lịch các dân tộc Việt Nam<br>Thời Gian xe chạy: 05:00 -> 20:50<br>Giá vé: 9.000đ/Vé ')
INSERT [dbo].[Buses] ([BusNumber], [Cost], [BusStop], [Url1], [Url2], [ShortDescriptions]) VALUES (117, 9000.0000, N'Hòa Lạc&&Qua Vòng Xuyến Đường Vào Trường Đh Fpt 50m&&Thôn 8 Thạch Hòa Hòa Lạc&&Xưởng Bê Tông, Đối Diện 354 Thạch Hòa Thạch Thất&&Số 231 Thạch Hòa Thạch Thất&&Số 27 Thôn 9 Thạch Hòa&&Của Hàng Sửa Chữa Xe Máy Duẩn An&&Qua Chùa Thái Bình 10m&&Trước Đối Diện Cây Xăng Bình Yên 20m&&Cửa Hàng Sơn Tiến Đạt&&Đối Diện Ubnd Xã Bình Yên&&Nhà Hàng Hoa Võ - Bình Yên - Thạch Thất&&Cửa Hàng Vật Liệu Đá Granit&&Trước Lối Vào Tập Thể Bvđk Thạch Thất&&Ngã 3 Thị Trấn Liên Quan&&Trung Tâm Bồi Dưỡng Chính Trị Thạch Thất&&Qua Cổng Làng Thúy Lai&&Trước Cổng Làng Hương Ngải&&Khu Đồng Cháy Hưng Ngải&&Tây Ninh Xã Canh Nậu (Chiều Đi)&&Đối Diện Làng Nghề Đồ Gỗ Mỹ Nghệ Thạch Thất&&Qua Ngã Tư Hữu Bằng Di Nậu 30m&&Khu Công Nghệ Liên Hiệp Phúc Thọ&&Đối Diện Nghĩa Trang Liệt Sỹ Xã Liên Hiệp&&Cửa Hàng Tạp Hóa Bình Kinh&&Lối Vào Đình Hạ Hiệp&&Đối Diện Xóm Bùi - Hiệp Thuận - Phúc Thọ&&Qua Lối Vào Làng Quế Lâm 30m&&Đối Diện Xóm Hưng Khánh - Thôn Yên Dục&&Qua Đường Vào Thôn Ngoại Xã Tam Thuấn 70m - Quốc Lộ 32&&Đối Diện Viện Nghiên Cứu Ngô Quốc Gia - Đường Dẫn Cầu Phùng&&Đối Diện Trường Thcs Lương Thế Vinh, Thị Trấn Phùng&&Tổ Đình Thụy Ứng - (Thị Trấn Phùng) - Quốc Lộ 32&&37-39 Phan Đình Phùng (Thị Trấn Phùng) - Quốc Lộ 32&&Tòa Án Nhân Dân Huyện Đan Phượng - Quốc Lộ 32&&Đường Vào Chùa Diên Phúc (Cạnh Thạch Thảo Lisa) - Quốc Lộ 32&&Xn May Mỹ Anh (Xã Đức Thượng) - Quốc Lộ 32&&Đối Diện Xn Thuốc Thú Y Trung Ương (Đức Thượng Hoài Đức - Quốc Lộ 32&&Đối Diện Trường Thpt Bình Minh - Quốc Lộ 32&&Đối Diện Công Ty Đông Thành (Thị Trấn Trôi) - Quốc Lộ 32&&Đối Diện Bưu Điện Hoài Đức (Trị Trấn Trôi) - Quốc Lộ 32&&Đối Diện Lối Rẽ Học Viện Kh Quân Sự - Quốc Lộ 32&&CH Xây Dựng Tuấn Loan (Thị Trấn Lai Xá) - Quốc Lộ 32&&Đối Diện Nhà Hàng Thăng Long - Quốc Lộ 32&&Qua Đường Vào Tt Huấn Luyện Thể Thao Quốc Gia I - Quốc Lộ 32&&Hè Giữa Nhà Số 55-57 Phố Nhổn&&Nhổn', N'busimage/xe117_1.jpg', NULL, N'Lộ trình: Hoà Lạc -> Nhổn<br>Thời Gian xe chạy: 05:00 -> 20:00<br>Giá vé: 9.000đ/Vé ')
INSERT [dbo].[Buses] ([BusNumber], [Cost], [BusStop], [Url1], [Url2], [ShortDescriptions]) VALUES (119, 9000.0000, N'Bất Bạt&&Qua Xóm 4, Lò Năm Tư 19m, Đt86&&Qua Xóm 17 Làng Đan Thê 10m, Đt86&&Qua Đối Diện Đường Vào Xã Thuần Mỹ 30m, Ba Vì&&Qua Đối Diện Cửa Hàng Thuốc Thú Y Thanh Hiền 30m, Xóm 4, Thôn 3, Thuần Mỹ&&Trước Đối Diện Cổng Xóm Tân Trại, Thôn 2, Ba Trại, Ba Vì&&Trước Cổng Làng Văn Hóa Thôn 2, Ba Trại, Ba Vì&&Trước Ubnd Xã Ba Trại 40m, Thôn 5, Ba Trại, Ba Vì&&Trước Xóm Đồng Đầm, Thôn 6, Ba Trại, Ba Vì&&Đối Diện Cửa Hàng Sửa Chữa Ô Tô Xe Máy Hồng Sơn, Thôn 6, Tam Uy, Ba Trại, Ba Vì&&Qua Đối Diện Đường Vào Khu Du Lịch Đầm Long 100m (Đối Diện Nhà Hàng Hồng Thái Anh)&&Trước Cửa Hàng Sửa Chữa Xe Máy Quang Vượng, Hoàng Long - Tản Lĩnh&&Trước Ngã 3 Ao Vua 100m&&Trung Tâm Thương Mại Miền Núi Tản Lĩnh&&Qua Cầu Kìm 50m (Shop Thời Trang Hồng Thúy)&&Trước Cửa Hàng Ga Dũng Tính Thôn Hà Tân, Xã Cẩm Lĩnh&&Đối Diện Ubnd Xã Tản Lĩnh (Cửa Hàng Rèm Hương Dung)&&Đối Diện Đại Lý Gà Cấp 1 Trọng Hoa, Đức Thịnh, Tản Lĩnh&&Trước Ngã 3 Vườn Quốc Gia Ba Vì 50 (Chiều Đi Bx Sơn Tây)&&Trước Ngã 3 Cây Xăng Tản Lĩnh 100m&&Trước Đối Diện Trường Thcs Trung Tâm Nghiên Cứu Bò Và Đồng Cỏ Ba Vì 40m, Đt87&&Trước Cưa Hàng Nhựa Tiền Phong Minh Sáu, Thôn Xuân Hòa, Vân Hòa, Đt87&&Trước Đối Diện Đường Vào Khu Du Lịch Khoang Sanh, Suối Tiên 70m, Đt87&&Đối Diện Trường Tiểu Học Yên Bài Khu C, Đt87&&Qua Đối Diện Trường Bắn Ba Vành 40m, Đt87&&Trước Trường Mầm Non Yên Bài A 40m, Đt87&&Quầy Thuốc Yên Bài, Đt87&&Đối Diện Làng Văn Hóa Thôn Quảng Phúc, Đt87&&Trước Cổng Doanh Trại Quân Đội Nhân Dân Việt Nam 10m, Đt87&&Trước 30 Đối Diện Xưởng Thực Hành Trường Cao Đẳng Công Nghiệp Kỹ Thuật Trần Hưng Đạo&&Qua Ngã 4 Yên Bình 70m&&Trước Cổng Trung Tâm Đào Tạo Lái Xe Hùng Vương 50m, Xã Bình Yên, Thạch Thất&&Qua 30m Cty Cp An Thinh Group - Thôn Gò Mè Xã Yên Bình&&Đại Lý Sữa Ất Thảo - Thôn Nhòn Xã Tiến Xuân&&Trước 30m Đường Vào Thôn Trại Mới Xã Tiến Xuân&&Công Ty Cp Xây Dựng Tiến An - Thôn 6 Xã Thạch Hòa&&Đại Lý Sữa Lan Anh - Xã Thạch Hòa&&Đối Diện Cửa Hàng Điện Nước Tuấn Bình - Thôn 7 Xã Thạch Hòa - Ql21&&Qua 30m Đối Diện Công Ty Cp Dịch Vụ Bảo Vệ Kcn Cao Hòa Lạc - Ql21&&Quầy Thuốc Số 15 - Thôn 7 Xã Thạch Hòa - Ql21&&Trước Vòng Xuyến Đường Vào Trường Đh Fpt 70m&&Hòa Lạc', N'busimage/xe119_1.png', NULL, N'Lộ trình: Hòa Lạc -> Bất Bạt<br>Thời Gian xe chạy: 05:00 -> 20:30<br>Giá vé: 9.000đ/Vé ')

SET IDENTITY_INSERT [dbo].[Clubs] ON 

INSERT [dbo].[Clubs] ([ClubID], [Avatar], [ClubName], [ClubPresident], [Facebook], [Email], [Description], [Type]) VALUES (1, N'avatarImages/jsclub.fptAvatar.jpg', N'JS Club - Japanese Software Engineers', N'Lê Thanh Bình', N'https://www.facebook.com/fu.jsclub', N'jsclub.fpt@gmail.com', N'', 1)
INSERT [dbo].[Clubs] ([ClubID], [Avatar], [ClubName], [ClubPresident], [Facebook], [Email], [Description], [Type]) VALUES (3, NULL, N'FPTU - Melody Club', N'Đào Nhật Nam', N'https://www.facebook.com/fptu.melody.club', N'fu.melody.club@gmail.com', NULL, 4)
INSERT [dbo].[Clubs] ([ClubID], [Avatar], [ClubName], [ClubPresident], [Facebook], [Email], [Description], [Type]) VALUES (4, NULL, N'No Shy Club ', N'Đỗ Kiều Đức An', N'https://www.facebook.com/noshyclub', N'noshy.fpt@gmail.com', NULL, 2)
SET IDENTITY_INSERT [dbo].[Clubs] OFF
GO
SET IDENTITY_INSERT [dbo].[Country] ON 

INSERT [dbo].[Country] ([CountryID], [CountryName]) VALUES (1, N'Việt Nam')
SET IDENTITY_INSERT [dbo].[Country] OFF
GO
SET IDENTITY_INSERT [dbo].[Department] ON 

INSERT [dbo].[Department] ([DepId], [DepName], [DepNameAbbreviations], [Email], [Phone], [OpenDay], [Url1], [Url2], [Descriptions], [ShortDescription], [Position]) VALUES (4, N'PHÒNG DỊCH VỤ SINH VIÊN', N'DVSV', N'dichvusinhvien@fe.edu.vn', N'02473081313', N'Thứ 2 đến thứ 6 hàng tuần', N'departmentimage/dvsv1.jpg', N'departmentimage/dvsv2.jpg', N'- Địa điểm: Phòng 102L – tòa nhà Alpha, Đại học FPT cơ sở Hà Nội
- Phòng Dịch vụ sinh viên là nơi:
+ Hỗ trợ các thủ tục hành chính: Làm thẻ sinh viên, thẻ BHYT, giấy xác nhận sinh viên,...
+ Hỗ trợ, tiếp nhận và xử lý các vấn đề liên quan đến quy định, chính sách, thủ tục học vụ, tài chính, ktx…
+ Hỗ trợ các dịch vụ phụ huynh như :
● Hướng dẫn sử dụng tài khoản truy cập cổng thông tin dành cho phụ huynh
● Giải đáp thắc mắc phụ huynh về tình hình học tập của sinh viên
● Gửi thông báo cho phụ huynh khi sinh viên bảo lưu, thôi học… ', N'Phòng Dịch vụ sinh viên là nơi giúp các bạn sinh viên trong việc :
- Tiếp nhận các yêu cầu sinh viên liên quan đến thủ tục hành chính (Thẻ sinh viên, giấy xác nhận sinh viên, BHYT…), thủ tục học vụ (Đăng ký bảo lưu, học cải thiện, đăng ký học lại…), thu ngân. 
- Giải đáp các thắc mắc của sinh viên về các quy định, quy chế, chính sách của nhà trường.', NULL)
INSERT [dbo].[Department] ([DepId], [DepName], [DepNameAbbreviations], [Email], [Phone], [OpenDay], [Url1], [Url2], [Descriptions], [ShortDescription], [Position]) VALUES (5, N'PHÒNG HỢP TÁC QUỐC TẾ VÀ PHÁT TRIỂN CÁ NHÂN', N'ICPDP', N'pdp.hn@fpt.edu.vn', N'024 6680 5910', N'Thứ 2 đến thứ 6 hàng tuần', N'departmentimage/icpdp1.jpg', N'departmentimage/icpdp2.jpg', N'- Địa điểm: Phòng 102 – tòa nhà Alpha, Đại học FPT cơ sở Hà Nội
- Fanpage chính thức: https://www.facebook.com/icpdp.globalstudy/ 
- Phòng Hợp tác Quốc tế và Phát triển Cá nhân (IC-PDP) Đại học FPT Hà Nội
+ Là nơi update thông tin, hình ảnh và câu chuyện về các hoạt động, chương trình, sự kiện và workshop dành cho sinh viên ĐH FPT Hà Nội!
+ Giúp các bạn sinh viên giải stress sau những giờ học căng thẳng đồng thời phát triển kỹ năng mềm thông qua các hoạt động trải nghiệm lên rừng, xuống biển. Việc tham gia tích cực các hoạt động ngoại khóa cũng là yếu tố để làm đẹp CV, điểm cộng sáng giá trong mỗi kỳ xét duyệt học bổng hay tham gia trao đổi sinh viên tại nước ngoài.', N'Phòng Phát triển cá nhân có chức năng giúp sinh viên giải stress sau những giờ học căng thẳng đồng thời phát triển kỹ năng mềm thông qua các hoạt động trải nghiệm lên rừng, xuống biển. Việc tham gia tích cực các hoạt động ngoại khóa cũng là yếu tố để làm đẹp CV, điểm cộng sáng giá trong mỗi kỳ xét duyệt học bổng hay tham gia trao đổi sinh viên tại nước ngoài.', NULL)
INSERT [dbo].[Department] ([DepId], [DepName], [DepNameAbbreviations], [Email], [Phone], [OpenDay], [Url1], [Url2], [Descriptions], [ShortDescription], [Position]) VALUES (6, N'PHÒNG CÔNG TÁC SINH VIÊN', N'CTVS', N'sro.hn@fpt.edu.vn', N'024 6680 5915', N'Thứ 2 đến thứ 6 hàng tuần', N'departmentimage/ctsv1.jpg', N'departmentimage/ctsv2.jpg', N'- Địa điểm: Phòng 101-tòa nhà Delta, Đại học FPT cơ sở Hà Nội
- Fanpage chính thức: https://www.facebook.com/CTSV.FU
Phòng Công tác sinh viên là nơi:
+ Tổ chức các sự kiện thường niên
● Lễ Khai giảng, Lễ Tốt nghiệp, Lễ Tôn vinh sinh viên
● The Dialogue: Các hội thảo về kỹ năng học tập, hội thảo về ngành nghề, xu hướng công nghệ,...
● Inspiration show: Chuỗi chương trình truyền cảm hứng.', N'Với chức năng quản lý sinh viên, cung cấp các dịch vụ cho sinh viên trong quá trình học tập tại Trường, đồng thời hỗ trợ cá hoạt động phong trào do Trường hoặc sinh viên tổ chức, Phòng CTSV hỗ trợ các dịch vụ như: Hành chính; Dịch vụ thông tin và hỗ trợ học tập; Thông tin phụ huynh sinh viên; Dịch vụ Y tế…', NULL)
INSERT [dbo].[Department] ([DepId], [DepName], [DepNameAbbreviations], [Email], [Phone], [OpenDay], [Url1], [Url2], [Descriptions], [ShortDescription], [Position]) VALUES (7, N'PHÒNG QUAN HỆ DOANH NGHIỆP VÀ CỰU SINH VIÊN', N'', N'alumni@fpt.edu.vn
job@fe.edu.vn', N'024 7300 5569', N'Thứ 2 đến thứ 6 hàng tuần', N'departmentimage/alumni.jpg', N'departmentimage/career.jpg', N'- Địa điểm: Phòng 101-tòa nhà Delta, Đại học FPT cơ sở Hà Nội
- Fanpage chính thức: https://www.facebook.com/ALUMNI.FPTU
                      https://www.facebook.com/FPTUcareercenter
                      
- Đây là nơi:
+ Quan hệ doanh nghiệp:
● Tổ chức các sự kiện, hoạt động: Company Tour, Jobs fair, Career Talk,...
● Hỗ trợ sinh viên tìm và kết nối các công ty thực tập và doanh nghiệp cần tuyển dụng

+ Quan hệ Cựu sinh viên:
● Cung cấp các thông tin tuyển dụng cho sinh viên, cựu sinh viên thường xuyên qua các kênh truyền thông online : email, website, Facebook, TOPCV...
● Tổ chức các cuộc gặp mặt cựu sinh viên, tổ chức các sự kiện văn hóa, thể thao hàng kỳ/hàng năm : Giải bóng đá cựu sinh viên mở rộng, Home Coming...', N'
- Quan hệ doanh nghiệp:
● Tổ chức các sự kiện, hoạt động; hỗ trợ sinh viên tìm và kết nối các công ty thực tập và doanh nghiệp cần tuyển dụng

+ Quan hệ Cựu sinh viên:
● Cung cấp các thông tin tuyển dụng cho sinh viên, cựu sinh viên ; tổ chức các cuộc gặp mặt cựu sinh viên, tổ chức các sự kiện văn hóa, thể thao hàng kỳ/hàng năm ', NULL)
INSERT [dbo].[Department] ([DepId], [DepName], [DepNameAbbreviations], [Email], [Phone], [OpenDay], [Url1], [Url2], [Descriptions], [ShortDescription], [Position]) VALUES (8, N'PHÒNG TƯ VẤN TÂM LÝ ĐH FPT HÀ NỘI - CÓC KỂ', N'', N'tuvansinhvien@fpt.edu.vn', N'091 681 62 97', N'Thứ 2 đến thứ 6 hàng tuần', N'departmentimage/cocke1.jpg', N'departmentimage/cocke2.jpg', N'"You share - We care" 
BẢO MẬT - CHẤT LƯỢNG - TÔN TRỌNG
Đặt lịch hỗ trợ, tư vấn trực tiếp 1 - 1 với chuyên viên tâm lý bằng cách: 
- Điền biểu mẫu đăng kí: 
> Nếu là sinh viên ĐH FPT, vui lòng điền theo link: https://goo.gl/moYEFR
> Nếu không phải là sinh viên ĐH FPT, vui lòng điền theo link: https://bit.ly/2X6qtn0
- Đặt lịch tư vấn qua Mail: tuvansinhvien@fpt.edu.vn
- Đến trực tiếp phòng Cóc Kể - 310R nhà Alpha
- Nhắn tin qua page: https://www.facebook.com/tuvantamlyFPT/
- Gọi điện đến Hotline: 0916816297 hoặc 0376383509
Cóc Kể - Nơi bạn luôn được chào đón, lắng nghe và chia sẻ mọi khó khăn của cuộc sống, đặc biệt các vấn đề liên quan đến cuộc sống học đường, Tâm lý, kỹ năng...', N'Cóc Kể - Nơi các bạn sinh viên luôn được chào đón, lắng nghe và chia sẻ mọi khó khăn của cuộc sống, đặc biệt các vấn đề liên quan đến cuộc sống học đường, Tâm lý, kỹ năng...', NULL)
INSERT [dbo].[Department] ([DepId], [DepName], [DepNameAbbreviations], [Email], [Phone], [OpenDay], [Url1], [Url2], [Descriptions], [ShortDescription], [Position]) VALUES (9, N'THƯ VIỆN TRƯỜNG ĐẠI HỌC FPT', N'', N'fptu.bookclub@gmail.com', N'024 6680 5912', N'Thứ 2 đến thứ 6 hàng tuần', N'departmentimage/thuvien1.jpg', N'departmentimage/thuvien2.jpg', N'- Địa điểm: Tầng 1 – tòa nhà Delta, Đại học FPT cơ sở Hà Nội
- Fanpage chính thức: https://www.facebook.com/fu.bukclub/
- Thư viện trường đại học FPT Hà Nội cung cấp các dịch vụ mượn/trao đổi sách, giáo trình học cho các bạn sinh viên đại học fpt, cũng là 1 đia điểm yên tĩnh để các bạn sinh viên có thể tập trung cùng nhau học tập', N'Thư viện trường đại học FPT Hà Nội cung cấp các dịch vụ mượn/trao đổi sách, giáo trình học cho các bạn sinh viên đại học fpt, cũng là 1 đia điểm yên tĩnh để các bạn sinh viên có thể tập trung cùng nhau học tập', NULL)
SET IDENTITY_INSERT [dbo].[Department] OFF
GO
SET IDENTITY_INSERT [dbo].[District] ON 

INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (1, 4, N'Ngô Quyền')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (2, 19, N'Xí Mần')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (3, 21, N'Quận Ba Đình')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (4, 21, N'Quận Bắc Từ Liêm')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (5, 21, N'Quận Cầu Giấy')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (6, 21, N'Quận Đống Đa')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (7, 21, N'Quận Hà Đông')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (8, 21, N'Quận Hai Bà Trưng')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (9, 21, N'Quận Hoàn Kiếm')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (10, 21, N'Quận Hoàng Mai')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (11, 21, N'Quận Long Biên')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (12, 21, N'Quận Nam Từ Liêm')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (13, 21, N'Quận Tây Hồ')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (14, 21, N'Quận Thanh Xuân')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (15, 21, N'Thị xã Sơn Tây')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (16, 21, N'Huyện Ba Vì')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (17, 21, N'Huyện Chương Mỹ')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (18, 21, N'Huyện Đan Phượng')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (19, 21, N'Huyện Đông Anh')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (20, 21, N'Huyện Gia Lâm')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (21, 21, N'Huyện Hoài Đức')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (22, 21, N'Huyện Mê Linh')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (23, 21, N'Huyện Mỹ Đức')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (24, 21, N'Huyện Phú Xuyên')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (25, 21, N'Huyện Phúc Thọ')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (26, 21, N'Huyện Quốc Oai')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (27, 21, N'Huyện Sóc Sơn')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (28, 21, N'Huyện Thạch Thất')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (29, 21, N'Huyện Thanh Oai')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (30, 21, N'Huyện Thanh Trì')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (31, 21, N'Huyện Thường Tín')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (32, 21, N'Huyện Ứng Hoà')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (33, 1, N'Thành Phố Châu Đốc')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (34, 1, N'Thành Phố Long Xuyên')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (35, 1, N'Thị Xã Tân Châu')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (36, 1, N'Huyện An Phú')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (37, 1, N'Huyện Châu Phú')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (38, 1, N'Huyện Châu Thành')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (39, 1, N'Huyện Chợ Mới')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (40, 1, N'Huyện Phú Tân')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (41, 1, N'Huyện Thoại Sơn')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (42, 1, N'Huyện Tịnh Biên')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (43, 1, N'Huyện Tri Thôn')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (44, 2, N'Thành Phố Bạc Liêu')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (45, 2, N'Huyện Hồng Dân')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (46, 2, N'Huyện Phước Long')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (47, 2, N'Huyện Vĩnh Lợi')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (48, 2, N'Thị Xã Giá Rai')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (49, 2, N'Huyện Đông Hải')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (50, 2, N'Huuyện Hòa Bình')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (51, 3, N'Thành Phố Bắc Kạn')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (52, 3, N'Huyện Ba Bể')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (53, 3, N'Huyện Bạch Thông')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (54, 3, N'Huyện Chợ Đồn')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (55, 3, N'Huyện Chợ Mới')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (56, 3, N'Huyện Na Rì')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (57, 3, N'Huyện Ngân Sơn')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (58, 3, N'Huyện Pác Nặm')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (59, 4, N'Thành Phố Bắc Giang')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (60, 4, N'Huyện Hiệp Hòa')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (61, 4, N'Huyện Lạng Giang')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (62, 4, N'Huyện Lục Nam')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (63, 4, N'Huyện Lục Ngạn')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (64, 4, N'Huyện Sơn Động')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (65, 4, N'Huyện Tân Yên')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (66, 4, N'Huyện Việt Yên')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (67, 4, N'Huyện Yên Dũng')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (68, 4, N'Huyện Yên Thế')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (69, 5, N'Thành Phố Bắc Ninh')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (70, 5, N'Thị Xã Từ Sơn')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (71, 5, N'Huyện Gia Bình')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (72, 5, N'Huyện Lương Tài')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (73, 5, N'Huyện Quế Võ')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (74, 5, N'Huyện Thuận Thành')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (75, 5, N'Huyện Tiên Du')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (76, 5, N'Huyện Yên Phong')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (77, 6, N'Thành Phố Bến Tre')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (78, 6, N'Huyện Ba Tri')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (79, 6, N'Huyện Bình Đại')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (80, 6, N'Huyện Châu Thành')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (81, 6, N'Huyện Chợ Lách')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (82, 6, N'Huyện Giồng Trôm')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (83, 6, N'Huyện Mỏ Cày Bắc')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (84, 6, N'Huyện Mỏ Cày Nam')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (85, 6, N'Huyện Thạnh Phú')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (86, 7, N'Thành Phố Dĩ An')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (87, 7, N'Thành Phố Thủ Dầu Một')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (88, 7, N'Thành Phố Thuận An')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (89, 7, N'Thị Xã Bến Cát')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (90, 7, N'Thị Xã Tân Uyên')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (91, 7, N'Huyện Bắc Tân Uyên')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (92, 7, N'Huyện Bàu Bàng')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (93, 7, N'Huyện Dầu Tiếng')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (94, 7, N'Huyện Phú Giáo')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (95, 8, N'Thành Phố Quy Nhơn')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (96, 8, N'Thị Xã An Nhơn')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (97, 8, N'Thị Xã Hoài Nhơn')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (98, 8, N'Huyện An Lão')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (99, 8, N'Huyện Hoài Ân')
GO
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (100, 8, N'Huyện Phù Cát')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (101, 8, N'Huyện Phù Mỹ')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (102, 8, N'Huyện Tây Sơn')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (103, 8, N'Huyện Tuy Phước')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (104, 8, N'Huyện Vân Canh')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (105, 8, N'Huyện Vĩnh Thạnh')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (106, 9, N'Thành Phố Đồng Xoài')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (107, 9, N'Thị Xã Bình Long')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (108, 9, N'Thị Xã Phước Long')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (109, 9, N'Huyện Bù Đăng')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (110, 9, N'Huyện Bù Bốp')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (111, 9, N'Huyện Bù Gia Mập')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (112, 9, N'Huyện Chơn Thành')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (113, 9, N'Huyện Đồng Phú')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (114, 9, N'Huyện Hớn Quản')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (115, 9, N'Huyện Lộc Ninh')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (116, 9, N'Huyện Phú Riềng')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (117, 10, N'Thành Phố Phan Thiết')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (118, 10, N'Thị Xã La Gi')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (119, 10, N'Huyện Bắc Bình')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (120, 10, N'Huyện Đức Linh')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (121, 10, N'Huyện Hàm Tân')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (122, 10, N'Huyện Hàm Thuận Bắc')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (123, 10, N'Huyện Hàm Thuận Nam')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (124, 10, N'Huyện Phú Quý')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (125, 10, N'Huyện Tánh Linh')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (126, 10, N'Huyện Tuy Phong')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (127, 11, N'Thành Phố Cà Mau')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (128, 11, N'Huyện Cái Nước')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (129, 11, N'Huyện Đầm Dơi')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (130, 11, N'Huyện Năm Căn')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (131, 11, N'Huyện Ngọc Hiển')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (132, 11, N'Huyện Phú Tân')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (133, 11, N'Huyện Thới Bình')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (134, 11, N'Huyện Trần Văn Thới')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (135, 11, N'Huyện U Minh')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (136, 12, N'')
SET IDENTITY_INSERT [dbo].[District] OFF
GO
SET IDENTITY_INSERT [dbo].[EventOfClub] ON 

INSERT [dbo].[EventOfClub] ([EventID], [ClubID], [EventName], [Time], [Description], [Url1]) VALUES (2, 1, N'𝐇𝐀𝐍𝐀𝐌𝐈𝐙𝐀𝐊𝐄 - 𝐉𝐒 𝐁𝐎𝐘𝐒 𝐃𝐀𝐘️', N'19h ngày 13/06/2022', N'Một năm có 365 ngày và ngày mai hẳn là một ngày đặc biệt giành cho các chàng trai JS. <br/>
Đối với CLB, các anh luôn cống hiến hết mình để xây dựng nên một tập thể JS với nhiều thành tích xuất sắc. Trong lòng các chị em JS, đó không chỉ là những “anh hùng coding” mà còn là những chàng trai rất vui tính, ấm áp và sống tình cảm. Chính vì điều đó, Boys’ Day là cơ hội để các chị em JS có thể gửi lời cảm ơn và bày tỏ tấm lòng yêu quý đối với các anh. <br/>
🌤️ Năm 2022, Boys’ Day for JS-ers được tổ chức với tên gọi 𝐇𝐚𝐧𝐚𝐦𝐢𝐳𝐚𝐤𝐞. Ẩn ý đàng sau chiếc tên xinh đẹp này là gì? 𝐇𝐚𝐧𝐚𝐦𝐢 là ngắm hoa, 𝐬𝐚𝐤𝐞 là rượu. Có thể hiểu nôm na 𝐇𝐚𝐧𝐚𝐦𝐢𝐳𝐚𝐤𝐞 nghĩa là uống rượu dưới tán hoa anh đào trong ngày hội thưởng hoa truyền thống của người Nhật Bản. <br/>
🌸 Hoa anh đào là quốc hoa của xứ sở mặt trời mọc, là một biểu tượng, là một phần quan trọng không thể thiếu của người Nhật. Những người đàn ông của đại gia đình JS cũng vậy, họ đóng một vai trò quyết định tạo nên thành công cho JS ở thời điểm hiện tại. <br/>
🥂 Nam nhân thời xưa coi chén rượu là một thứ thi vị của cuộc sống. Rượu là một thứ “tín vật” gắn bó người với người, là chất keo gắn kết những người bằng hữu. <br/>
 “Tay tiên chuốc chén rượu đào <br/>
 Huynh đệ hữu khí tửu vào lời ra.” <br/>
✨ Ngày Boys Day là ngày dành cho những người con trai, người đàn ông, đặc biệt là nam nhân JS, họ vừa có cách làm việc năng nổ như những giọt rượu cháy bỏng, vừa có phong cách sống nhẹ nhàng như những cánh hoa. 𝐇𝐚𝐧𝐚𝐦𝐢𝐳𝐚𝐤𝐞 sẽ đem đến cho các anh những phút giây thư giãn, vui vẻ, đầy ắp tiếng cười song cũng là một kỉ niệm khó phai trong suốt quá trình gắn bó với JS.', N'img/event/hanamizake.jpg')
INSERT [dbo].[EventOfClub] ([EventID], [ClubID], [EventName], [Time], [Description], [Url1]) VALUES (3, 1, N'💣 𝐂𝐎𝐃𝐄𝐅𝐄𝐒𝐓 𝟐𝟎𝟐𝟐 💣 
', N'29/7/2022-22/8/2022', N'🎮 Thông qua cuộc thi 𝐂𝐨𝐝𝐢𝐧𝐠 𝐏𝐫𝐨𝐣𝐞𝐜𝐭 𝟐𝟎𝟐𝟏, nhà điều hành game JS Club đã thiết kế lại toàn bộ server game trên bản đồ hệ thống. Trong nhóm game thực tế ảo, có một trò chơi sinh tồn vô cùng căng thẳng đã được tạo ra.  
🧟 𝐂𝐨𝐝𝐞𝐟𝐞𝐬𝐭 𝟐𝟎𝟐𝟐 là một trò chơi thực tế ảo nơi chứa đầy những xác sống có khả năng ăn thịt người và lây nhiễm. Để trở thành người chiến thắng trong mỗi trận đấu, các bạn sẽ phải code con bot có thể đặt bom tiêu diệt đối thủ của mình, tiêu diệt zombie, giải cứu những người bệnh và phải sống sót đến cuối cùng. 
💼  Để thử nghiệm sự thành công của game, nhà điều hành JS quyết định chọn học sinh của một trường cấp 3 ở Nhật - những người thông minh, lanh lẹ và đặc biệt có đam mê, hứng thú với thể loại trò chơi này nhất - làm đối tượng thử nghiệm. Liệu các Bravie quả cảm có thể hoàn thành được nhiệm vụ của mình? Ai sẽ là người viết được tên mình trên vùng đất đầy những nguy hiểm ấy? 
💥 Một sân chơi trí tuệ với hình thức thi đấu mới lạ, mang đến cực kì nhiều trải nghiệm thú vị cho người tham gia đang chờ đợi bạn ở phía trước. Hãy nhớ theo dõi các thông tin chi tiết về 𝐂𝐨𝐝𝐞𝐟𝐞𝐬𝐭 𝟐𝟎𝟐𝟐 trên fanpage của JS Club nhé! ', NULL)
SET IDENTITY_INSERT [dbo].[EventOfClub] OFF
GO
INSERT [dbo].[FoodImage] ([FoodID], [ImageUrl]) VALUES (1, N'hoa.jpg')
INSERT [dbo].[FoodImage] ([FoodID], [ImageUrl]) VALUES (2, N'nemnuong.jpg')
INSERT [dbo].[FoodImage] ([FoodID], [ImageUrl]) VALUES (3, N'666.jpg')
INSERT [dbo].[FoodImage] ([FoodID], [ImageUrl]) VALUES (10, N'L?u gà')
INSERT [dbo].[FoodImage] ([FoodID], [ImageUrl]) VALUES (11, N'ngochien.jpg')
GO
SET IDENTITY_INSERT [dbo].[Foods] ON 

INSERT [dbo].[Foods] ([FoodID], [RestaurantID], [FoodName], [Cost], [Descriptions]) VALUES (1, 2, N'Bún Chả', 30.0000, N'Bún chả Hà Thành thơm ngon')
INSERT [dbo].[Foods] ([FoodID], [RestaurantID], [FoodName], [Cost], [Descriptions]) VALUES (2, 2, N'Nem Nướng', 35.0000, N'Nem nướng nóng hổi')
INSERT [dbo].[Foods] ([FoodID], [RestaurantID], [FoodName], [Cost], [Descriptions]) VALUES (3, 3, N'Cơm Tấm Sườn Nướng', 35.0000, N'Cơm ngon như mẹ nấu')
INSERT [dbo].[Foods] ([FoodID], [RestaurantID], [FoodName], [Cost], [Descriptions]) VALUES (4, 2, N'Bún Đậu', 35.0000, NULL)
INSERT [dbo].[Foods] ([FoodID], [RestaurantID], [FoodName], [Cost], [Descriptions]) VALUES (5, 2, N'Bún Đậu', 35.0000, NULL)
INSERT [dbo].[Foods] ([FoodID], [RestaurantID], [FoodName], [Cost], [Descriptions]) VALUES (6, 2, N'Xiên Bẩn Các Loại', 5.0000, N'Món ăn đường phố')
INSERT [dbo].[Foods] ([FoodID], [RestaurantID], [FoodName], [Cost], [Descriptions]) VALUES (7, 2, N'Trà chanh', 10.0000, N'Trà chanh con cá')
INSERT [dbo].[Foods] ([FoodID], [RestaurantID], [FoodName], [Cost], [Descriptions]) VALUES (8, 2, N'Trà chanh', 10.0000, N'Trà chanh con cá')
INSERT [dbo].[Foods] ([FoodID], [RestaurantID], [FoodName], [Cost], [Descriptions]) VALUES (9, 2, N'Trà Đào', 10.0000, N'Trà đào có thạch')
INSERT [dbo].[Foods] ([FoodID], [RestaurantID], [FoodName], [Cost], [Descriptions]) VALUES (10, 3, N'Lẩu Gà', 450.0000, N'Lẩu gà , miễn phí rau')
INSERT [dbo].[Foods] ([FoodID], [RestaurantID], [FoodName], [Cost], [Descriptions]) VALUES (11, 13, N'Ngô Chiên', 25.0000, N'')
SET IDENTITY_INSERT [dbo].[Foods] OFF
GO

INSERT [dbo].[Hostels] ([HostelName], [SellerID], [TotalRoom], [Status], [Floors], [CountryID], [ProvinceID], [DistrictID], [AddressDetail], [RentCost], [Distance], [Descriptions], [StarVoting]) VALUES (N'Tuấn Cường 2', 2, 80, 1, 5, 1, 4, 1, N'Thạch Hòa-Thạch Thất', 2500000.0000, CAST(2.0 AS Decimal(2, 1)), N'', NULL)
INSERT [dbo].[Hostels] ([HostelName], [SellerID], [TotalRoom], [Status], [Floors], [CountryID], [ProvinceID], [DistrictID], [AddressDetail], [RentCost], [Distance], [Descriptions], [StarVoting]) VALUES (N'Liên Nga', 2, 50, 1, 4, 1, 19, 2, N'Hà Giang', 2500000.0000, CAST(3.0 AS Decimal(2, 1)), N'aaaaa', NULL)
INSERT [dbo].[Hostels] ([HostelName], [SellerID], [TotalRoom], [Status], [Floors], [CountryID], [ProvinceID], [DistrictID], [AddressDetail], [RentCost], [Distance], [Descriptions], [StarVoting]) VALUES (N'Thành Nam 1', 4, 50, 1, 5, 1, 21, 28, N'Thôn 7 xã Thạch Hòa', 1800000.0000, CAST(1.5 AS Decimal(2, 1)), N'Hệ thống nhà trọ Thành Nam 1,2 Chào mừng các bạn sinh viên!!!
Hãy đến với chúng tôi để bạn đc phục vụ và được sống trong căn nhà thỏa mái nhất, hợp lý nhất.', NULL)
INSERT [dbo].[Hostels] ([HostelName], [SellerID], [TotalRoom], [Status], [Floors], [CountryID], [ProvinceID], [DistrictID], [AddressDetail], [RentCost], [Distance], [Descriptions], [StarVoting]) VALUES (N'Thành Nam 2', 4, 50, 1, 5, 1, 21, 28, N'Thôn 8 Xã Thạch Hòa', 1800000.0000, CAST(2.0 AS Decimal(2, 1)), N'Hệ thống nhà trọ Thành Nam 1,2 Chào mừng các bạn sinh viên!!!
Hãy đến với chúng tôi để bạn đc phục vụ và được sống trong căn nhà thỏa mái nhất, hợp lý nhất.', NULL)
INSERT [dbo].[Hostels] ([HostelName], [SellerID], [TotalRoom], [Status], [Floors], [CountryID], [ProvinceID], [DistrictID], [AddressDetail], [RentCost], [Distance], [Descriptions], [StarVoting]) VALUES (N'Thái Dũng', 7, 14, 1, 3, 1, 21, 28, N'ngay sau Bưu điện Hòa Lạc cách Ngã Tư đèn đỏ 100m', 1400000.0000, CAST(1.5 AS Decimal(2, 1)), N'📣 Nhà trọ sinh viên Thái Dũng tiêu chuẩn 5 ⭐ cách trường Đ.h FPT 1.5km có lối đi tắt đến trường 5 phút thôi nha .
🏘️ Vị trí khu nhà ngay sau Bưu điện Hòa Lạc cách Ngã Tư đèn đỏ 100m. Với các tiện ích vô cùng to lớn: Chỉ cần đi bộ là ra được bến xe bus 🚌 150m, ra chợ 150m, gần ngân hàng, bưu điện, đồn công an,  Nằm sát trung tâm khu ẩm thực ăn uống thị trấn Hòa Lạc. An ninh cực tốt', NULL)
INSERT [dbo].[Hostels] ([HostelName], [SellerID], [TotalRoom], [Status], [Floors], [CountryID], [ProvinceID], [DistrictID], [AddressDetail], [RentCost], [Distance], [Descriptions], [StarVoting]) VALUES (N'KTX Ông Bà', 11, 50, 1, 5, 1, 21, 28, N'Cụm 4, thôn 8, mặt đường lộ Cu Ba, xã Thạch Hoà', 2000000.0000, CAST(1.5 AS Decimal(2, 1)), N'🙌 Bạn đang tìm một không gian sống tiện lợi, an ninh đảm bảo, “hàng xóm" trẻ trung, văn minh thân thiện để gửi gắm “tuổi thanh xuân" của mình?
✌️ Bạn cần một chỗ ở ngay gần trường học để thuận lợi cho việc đi học, có thể chạy ngay đến trường kể cả khi "trót" ngủ nướng 1 tẹo?
👉👉Cách trường #Đại_học_FPT 1,5 km, chỉ mất #3_phút đi 🛵, Ký túc xá “Nhà Ông Bà" ra đời với đầy đủ những tiện ích phù hợp với lựa chọn của các bạn sinh viên thế hệ mới:
🏣 Chung cư mini cảnh quan rộng đẹp, #tiện_nghi, #quy_củ.
🛏 Nội thất đầy đủ chỉ cần xách vali đến ở ngay. 
🛌 Phòng riêng rộng rãi thoáng mát, 20m2-25m2. 
🛀 Có khu vực bếp và wc khép kín
👮 Trang bị hệ thống an ninh hiện đại, bảo vệ 24/24   
💒 Có thang máy, máy bán hàng tự động 
📡 Wifi tốc độ cao, lướt web từ phòng ở ra hành lang, từ sân chơi đến sân thượng. 
️🤾⛹️🏋️ Có phòng tiếp khách riêng biệt, phòng sinh hoạt chung, khu vực để xe, khu vực giặt đồ, sân phơi… 
🏊🛵 Chợ Thạch Hòa, hệ thống cửa hàng tiện ích, siêu thị, ngân hàng, trạm xăng, bến xe bus, sân chơi thể thao… nằm trong bán kính 1km 
🕵️ Điện nước công khai, theo giá nhà nước', NULL)
INSERT [dbo].[Hostels] ([HostelName], [SellerID], [TotalRoom], [Status], [Floors], [CountryID], [ProvinceID], [DistrictID], [AddressDetail], [RentCost], [Distance], [Descriptions], [StarVoting]) VALUES (N'Xanh Lá - Hường Anh', 12, 24, 1, 3, 1, 21, 28, N'Hòa Lạc', 1500000.0000, CAST(1.5 AS Decimal(2, 1)), N'1. Diện tích phòng: >= 20m2
Đầy đủ: Điều hòa, Nóng lạnh, Wifi 100mb/ tầng
2. Khoảng cách đến trường: 1,5km
3. Hệ thống an ninh:
Camera 24/24; Khoá vân tay.
4. Giá phòng: 1,5-1,7tr/ tháng
 Giá điện: 2,5k, wifi miễn phí
5. Số lượng phòng: 24
6. Không ở cùng nhà chủ
7. Màu sơn thân thiện, cá tính ', NULL)
SET IDENTITY_INSERT [dbo].[Hostels] OFF
GO
SET IDENTITY_INSERT [dbo].[Province] ON 

INSERT [dbo].[Province] ([ProvinceID], [CountryID], [ProvinceName]) VALUES (1, 1, N'An Giang')
INSERT [dbo].[Province] ([ProvinceID], [CountryID], [ProvinceName]) VALUES (2, 1, N'Bạc Liêu')
INSERT [dbo].[Province] ([ProvinceID], [CountryID], [ProvinceName]) VALUES (3, 1, N'Bắc Cạn')
INSERT [dbo].[Province] ([ProvinceID], [CountryID], [ProvinceName]) VALUES (4, 1, N'Bắc Giang')
INSERT [dbo].[Province] ([ProvinceID], [CountryID], [ProvinceName]) VALUES (5, 1, N'Bắc Ninh')
INSERT [dbo].[Province] ([ProvinceID], [CountryID], [ProvinceName]) VALUES (6, 1, N'Bến Tre')
INSERT [dbo].[Province] ([ProvinceID], [CountryID], [ProvinceName]) VALUES (7, 1, N'Bình Dương')
INSERT [dbo].[Province] ([ProvinceID], [CountryID], [ProvinceName]) VALUES (8, 1, N'Bình Định')
INSERT [dbo].[Province] ([ProvinceID], [CountryID], [ProvinceName]) VALUES (9, 1, N'Bình Phước')
INSERT [dbo].[Province] ([ProvinceID], [CountryID], [ProvinceName]) VALUES (10, 1, N'Bình Thuận')
INSERT [dbo].[Province] ([ProvinceID], [CountryID], [ProvinceName]) VALUES (11, 1, N'Cà Mau')
INSERT [dbo].[Province] ([ProvinceID], [CountryID], [ProvinceName]) VALUES (12, 1, N'Cao Bằng')
INSERT [dbo].[Province] ([ProvinceID], [CountryID], [ProvinceName]) VALUES (13, 1, N'Cần Thơ')
INSERT [dbo].[Province] ([ProvinceID], [CountryID], [ProvinceName]) VALUES (14, 1, N'Đà Nẵng')
INSERT [dbo].[Province] ([ProvinceID], [CountryID], [ProvinceName]) VALUES (15, 1, N'DakLak')
INSERT [dbo].[Province] ([ProvinceID], [CountryID], [ProvinceName]) VALUES (16, 1, N'Đồng Nai')
INSERT [dbo].[Province] ([ProvinceID], [CountryID], [ProvinceName]) VALUES (17, 1, N'Đồng Tháp')
INSERT [dbo].[Province] ([ProvinceID], [CountryID], [ProvinceName]) VALUES (18, 1, N'Gia Lai')
INSERT [dbo].[Province] ([ProvinceID], [CountryID], [ProvinceName]) VALUES (19, 1, N'Hà Giang')
INSERT [dbo].[Province] ([ProvinceID], [CountryID], [ProvinceName]) VALUES (20, 1, N'Hà Nam')
INSERT [dbo].[Province] ([ProvinceID], [CountryID], [ProvinceName]) VALUES (21, 1, N'Hà Nội')
INSERT [dbo].[Province] ([ProvinceID], [CountryID], [ProvinceName]) VALUES (22, 1, N'Hà Tĩnh')
INSERT [dbo].[Province] ([ProvinceID], [CountryID], [ProvinceName]) VALUES (23, 1, N'Hải Dương')
INSERT [dbo].[Province] ([ProvinceID], [CountryID], [ProvinceName]) VALUES (24, 1, N'Hải Phòng')
INSERT [dbo].[Province] ([ProvinceID], [CountryID], [ProvinceName]) VALUES (25, 1, N'Hòa Bình')
INSERT [dbo].[Province] ([ProvinceID], [CountryID], [ProvinceName]) VALUES (26, 1, N'Hồ Chí Minh')
INSERT [dbo].[Province] ([ProvinceID], [CountryID], [ProvinceName]) VALUES (27, 1, N'Hưng Yên')
INSERT [dbo].[Province] ([ProvinceID], [CountryID], [ProvinceName]) VALUES (28, 1, N'Khánh Hòa')
INSERT [dbo].[Province] ([ProvinceID], [CountryID], [ProvinceName]) VALUES (29, 1, N'Kiên Giang')
INSERT [dbo].[Province] ([ProvinceID], [CountryID], [ProvinceName]) VALUES (30, 1, N'Kon Tum')
INSERT [dbo].[Province] ([ProvinceID], [CountryID], [ProvinceName]) VALUES (31, 1, N'Lai Châu')
INSERT [dbo].[Province] ([ProvinceID], [CountryID], [ProvinceName]) VALUES (32, 1, N'Lạng Sơn')
INSERT [dbo].[Province] ([ProvinceID], [CountryID], [ProvinceName]) VALUES (33, 1, N'Lào Cai')
INSERT [dbo].[Province] ([ProvinceID], [CountryID], [ProvinceName]) VALUES (34, 1, N'Lâm Đồng')
INSERT [dbo].[Province] ([ProvinceID], [CountryID], [ProvinceName]) VALUES (35, 1, N'Long An')
INSERT [dbo].[Province] ([ProvinceID], [CountryID], [ProvinceName]) VALUES (36, 1, N'Nam Định')
INSERT [dbo].[Province] ([ProvinceID], [CountryID], [ProvinceName]) VALUES (37, 1, N'Nghệ An')
INSERT [dbo].[Province] ([ProvinceID], [CountryID], [ProvinceName]) VALUES (38, 1, N'Ninh Bình')
INSERT [dbo].[Province] ([ProvinceID], [CountryID], [ProvinceName]) VALUES (39, 1, N'Bình Thuận')
INSERT [dbo].[Province] ([ProvinceID], [CountryID], [ProvinceName]) VALUES (40, 1, N'Phú Thọ')
INSERT [dbo].[Province] ([ProvinceID], [CountryID], [ProvinceName]) VALUES (41, 1, N'Phú Yên')
INSERT [dbo].[Province] ([ProvinceID], [CountryID], [ProvinceName]) VALUES (42, 1, N'Quảng Bình')
INSERT [dbo].[Province] ([ProvinceID], [CountryID], [ProvinceName]) VALUES (43, 1, N'Quảng Nam')
INSERT [dbo].[Province] ([ProvinceID], [CountryID], [ProvinceName]) VALUES (44, 1, N'Quảng Ngãi')
INSERT [dbo].[Province] ([ProvinceID], [CountryID], [ProvinceName]) VALUES (45, 1, N'Quảng Ninh')
INSERT [dbo].[Province] ([ProvinceID], [CountryID], [ProvinceName]) VALUES (46, 1, N'Sóc Trăng')
INSERT [dbo].[Province] ([ProvinceID], [CountryID], [ProvinceName]) VALUES (47, 1, N'Sơn La')
INSERT [dbo].[Province] ([ProvinceID], [CountryID], [ProvinceName]) VALUES (48, 1, N'Tây Ninh')
INSERT [dbo].[Province] ([ProvinceID], [CountryID], [ProvinceName]) VALUES (49, 1, N'Thái Bình')
INSERT [dbo].[Province] ([ProvinceID], [CountryID], [ProvinceName]) VALUES (50, 1, N'Thái Nguyên')
INSERT [dbo].[Province] ([ProvinceID], [CountryID], [ProvinceName]) VALUES (51, 1, N'Thanh Hóa')
INSERT [dbo].[Province] ([ProvinceID], [CountryID], [ProvinceName]) VALUES (52, 1, N'Thừa Thiên Huế')
INSERT [dbo].[Province] ([ProvinceID], [CountryID], [ProvinceName]) VALUES (53, 1, N'Tiền Giang')
INSERT [dbo].[Province] ([ProvinceID], [CountryID], [ProvinceName]) VALUES (54, 1, N'Trà Vinh')
INSERT [dbo].[Province] ([ProvinceID], [CountryID], [ProvinceName]) VALUES (55, 1, N'Tuyên Quang')
INSERT [dbo].[Province] ([ProvinceID], [CountryID], [ProvinceName]) VALUES (56, 1, N'Vĩnh Long')
INSERT [dbo].[Province] ([ProvinceID], [CountryID], [ProvinceName]) VALUES (57, 1, N'Vĩnh Phúc')
INSERT [dbo].[Province] ([ProvinceID], [CountryID], [ProvinceName]) VALUES (58, 1, N'Yên Bái')
SET IDENTITY_INSERT [dbo].[Province] OFF
GO
SET IDENTITY_INSERT [dbo].[ReportRestaurant] ON 

INSERT [dbo].[ReportRestaurant] ([ReportID], [RestaurantID], [Spam], [Offensive], [Violent], [Truthless], [ReportTime]) VALUES (1, 2, 1, 0, 0, 0, NULL)
INSERT [dbo].[ReportRestaurant] ([ReportID], [RestaurantID], [Spam], [Offensive], [Violent], [Truthless], [ReportTime]) VALUES (2, 13, 1, 1, 1, 1, NULL)
INSERT [dbo].[ReportRestaurant] ([ReportID], [RestaurantID], [Spam], [Offensive], [Violent], [Truthless], [ReportTime]) VALUES (3, 2, 0, 1, 1, 0, NULL)
INSERT [dbo].[ReportRestaurant] ([ReportID], [RestaurantID], [Spam], [Offensive], [Violent], [Truthless], [ReportTime]) VALUES (4, 2, 0, 1, 1, 0, NULL)
INSERT [dbo].[ReportRestaurant] ([ReportID], [RestaurantID], [Spam], [Offensive], [Violent], [Truthless], [ReportTime]) VALUES (5, 6, 1, 0, 0, 1, NULL)
INSERT [dbo].[ReportRestaurant] ([ReportID], [RestaurantID], [Spam], [Offensive], [Violent], [Truthless], [ReportTime]) VALUES (6, 2, 1, 0, 0, 0, NULL)
INSERT [dbo].[ReportRestaurant] ([ReportID], [RestaurantID], [Spam], [Offensive], [Violent], [Truthless], [ReportTime]) VALUES (7, 2, 1, 0, 0, 1, NULL)
INSERT [dbo].[ReportRestaurant] ([ReportID], [RestaurantID], [Spam], [Offensive], [Violent], [Truthless], [ReportTime]) VALUES (8, 6, 0, 0, 1, 0, NULL)
INSERT [dbo].[ReportRestaurant] ([ReportID], [RestaurantID], [Spam], [Offensive], [Violent], [Truthless], [ReportTime]) VALUES (9, 9, 1, 1, 0, 0, NULL)
INSERT [dbo].[ReportRestaurant] ([ReportID], [RestaurantID], [Spam], [Offensive], [Violent], [Truthless], [ReportTime]) VALUES (10, 9, 1, 1, 0, 0, NULL)
INSERT [dbo].[ReportRestaurant] ([ReportID], [RestaurantID], [Spam], [Offensive], [Violent], [Truthless], [ReportTime]) VALUES (11, 15, 0, 0, 1, 0, NULL)
INSERT [dbo].[ReportRestaurant] ([ReportID], [RestaurantID], [Spam], [Offensive], [Violent], [Truthless], [ReportTime]) VALUES (12, 14, 0, 0, 1, 0, NULL)
SET IDENTITY_INSERT [dbo].[ReportRestaurant] OFF
GO
SET IDENTITY_INSERT [dbo].[Restaurants] ON
GO
INSERT [dbo].[Restaurants] ([RestaurantID], [RestaurantName], [SellerID], [CountryID], [ProvinceID], [DistrictID], [AddressDetail], [Cost], [Distance], [Descriptions], [RestaurantImage]) VALUES (2, N'Xiên Bẩn Food And Drink', 2, 1, 4, 1, N'39-Nguyễn Văn Cừ', N'30.000-50.000', 4, N'', NULL)
INSERT [dbo].[Restaurants] ([RestaurantID], [RestaurantName], [SellerID], [CountryID], [ProvinceID], [DistrictID], [AddressDetail], [Cost], [Distance], [Descriptions], [RestaurantImage]) VALUES (3, N'Nhà hàng 666', 2, 1, 19, 2, N'Xí Mần - Hà Giang', N'35.000-55.000', 3, N'', NULL)
INSERT [dbo].[Restaurants] ([RestaurantID], [RestaurantName], [SellerID], [CountryID], [ProvinceID], [DistrictID], [AddressDetail], [Cost], [Distance], [Descriptions], [RestaurantImage]) VALUES (6, N'Nem Nướng Hùng Anh', 2, 1, 19, 2, N'Hà Giang', N'35.000-40.000', 2, N'', NULL)
INSERT [dbo].[Restaurants] ([RestaurantID], [RestaurantName], [SellerID], [CountryID], [ProvinceID], [DistrictID], [AddressDetail], [Cost], [Distance], [Descriptions], [RestaurantImage]) VALUES (7, N'Com Phuong Nguyen', 2, 1, 4, 1, N'17-Lê Lợi', N'35.000-50.000', 5, N'Cơm ngon', N's? huy.jpg')
INSERT [dbo].[Restaurants] ([RestaurantID], [RestaurantName], [SellerID], [CountryID], [ProvinceID], [DistrictID], [AddressDetail], [Cost], [Distance], [Descriptions], [RestaurantImage]) VALUES (8, N'Cơm Quỳnh Linh', 2, 1, 19, 2, N'Hà Giang', N'35.000-50.000', 3, N'Cơm , Bún , Phở', NULL)
INSERT [dbo].[Restaurants] ([RestaurantID], [RestaurantName], [SellerID], [CountryID], [ProvinceID], [DistrictID], [AddressDetail], [Cost], [Distance], [Descriptions], [RestaurantImage]) VALUES (9, N'Cơm Nguyễn Việt', 2, 1, 4, 1, N'29-Nguyễn Thị Lưu', N'35.000-40.000', 1, N'', NULL)
INSERT [dbo].[Restaurants] ([RestaurantID], [RestaurantName], [SellerID], [CountryID], [ProvinceID], [DistrictID], [AddressDetail], [Cost], [Distance], [Descriptions], [RestaurantImage]) VALUES (10, N'Cơm Nam Lê', 2, 1, 4, 1, N'142-Nguyễn Văn Cừ', N'50.000-70.000', 3, N'', NULL)
INSERT [dbo].[Restaurants] ([RestaurantID], [RestaurantName], [SellerID], [CountryID], [ProvinceID], [DistrictID], [AddressDetail], [Cost], [Distance], [Descriptions], [RestaurantImage]) VALUES (13, N'Phố Nướng', 2, 1, 19, 2, N'Hà Giang', N'200.000-500.000', 5, N'Lẩu , Nướng', NULL)
INSERT [dbo].[Restaurants] ([RestaurantID], [RestaurantName], [SellerID], [CountryID], [ProvinceID], [DistrictID], [AddressDetail], [Cost], [Distance], [Descriptions], [RestaurantImage]) VALUES (14, N'Bún Cá Cay Hải Phòng', 2, 1, 19, 2, N'142-Nguyễn Văn Cừ', N'35.000-40.000', 3, N'Quán mới mở . mang lại hương vị Hải Phòng', N'1.jpg')
INSERT [dbo].[Restaurants] ([RestaurantID], [RestaurantName], [SellerID], [CountryID], [ProvinceID], [DistrictID], [AddressDetail], [Cost], [Distance], [Descriptions], [RestaurantImage]) VALUES (15, N'abc', 2, 1, 21, 28, N'Thôn 8 -Thạch Hòa', N'35.000-40.000', 3, N'', NULL)
SET IDENTITY_INSERT [dbo].[Restaurants] OFF
GO
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([RoleID], [RoleName]) VALUES (1, N'admin')
INSERT [dbo].[Role] ([RoleID], [RoleName]) VALUES (2, N'student')
INSERT [dbo].[Role] ([RoleID], [RoleName]) VALUES (3, N'seller')
INSERT [dbo].[Role] ([RoleID], [RoleName]) VALUES (4, N'club')
SET IDENTITY_INSERT [dbo].[Role] OFF
GO
SET IDENTITY_INSERT [dbo].[Sellers] ON 

INSERT [dbo].[Sellers] ([SellerID], [Avatar], [FirstName], [LastName], [Age], [Phone], [Email], [CountryID], [ProvinceID], [DistrictID], [AddressDetail], [Gender]) VALUES (2, N'imageSeller/1.jpg', N'Pham', N'Thu Hong', 34, N'098765432', N'minkook2909@gmail.com', 1, 23, 1, N'9-Đường 28-Tổ 22- Phường Trần Lãm', 0)
INSERT [dbo].[Sellers] ([SellerID], [Avatar], [FirstName], [LastName], [Age], [Phone], [Email], [CountryID], [ProvinceID], [DistrictID], [AddressDetail], [Gender]) VALUES (3, N'imageSeller/myhoa.JPG', N'Nguyen', N'My Hoa', 36, N'0978480682', N'hoantmhe141105@fpt.edu.vn', 1, 40, 2, N'39-Nguyễn Văn Cừ', 0)
INSERT [dbo].[Sellers] ([SellerID], [Avatar], [FirstName], [LastName], [Age], [Phone], [Email], [CountryID], [ProvinceID], [DistrictID], [AddressDetail], [Gender]) VALUES (4, NULL, N'', N'Hùng', 42, N'0984618686', N'hung123@gmail.com', 1, 21, 28, N'Thôn 7 xã Thạch Hòa', 1)
INSERT [dbo].[Sellers] ([SellerID], [Avatar], [FirstName], [LastName], [Age], [Phone], [Email], [CountryID], [ProvinceID], [DistrictID], [AddressDetail], [Gender]) VALUES (5, NULL, N'Liên ', N'Nga', 35, N'', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Sellers] ([SellerID], [Avatar], [FirstName], [LastName], [Age], [Phone], [Email], [CountryID], [ProvinceID], [DistrictID], [AddressDetail], [Gender]) VALUES (7, NULL, N'Thái', N'Dũng', 28, N'0982298681', N'thaidung@gmail.com', 1, 21, 28, N'Gần chợ Hòa Lạc', 1)
INSERT [dbo].[Sellers] ([SellerID], [Avatar], [FirstName], [LastName], [Age], [Phone], [Email], [CountryID], [ProvinceID], [DistrictID], [AddressDetail], [Gender]) VALUES (11, NULL, N'Hang', N'Vuong', NULL, N'0989639985', N'ktxongba@gmail.com', 1, 21, 28, N'Cụm 4, thôn 8, mặt đường lộ Cu Ba, xã Thạch Hoà', 0)
INSERT [dbo].[Sellers] ([SellerID], [Avatar], [FirstName], [LastName], [Age], [Phone], [Email], [CountryID], [ProvinceID], [DistrictID], [AddressDetail], [Gender]) VALUES (12, NULL, N'Nguyễn ', N'Việt Anh', NULL, N'0988970790', N'vietanhnguyen@gmail.com', 1, 21, 28, N'Hòa Lạc', 1)
SET IDENTITY_INSERT [dbo].[Sellers] OFF
GO
SET IDENTITY_INSERT [dbo].[Students] ON 

INSERT [dbo].[Students] ([StudentNo], [StudentID], [Avatar], [FirstName], [LastName], [Age], [Phone], [Unit], [Email], [CountryID], [ProvinceID], [AddressDetail], [DistrictID], [Gender]) VALUES (1, N'HE141105', N'imageStudent/8.jpg', N'Nguyễn ', N'Mỹ Hòa', 22, N'0962656682', N'K14', N'nguyenmyhoa120920@gmail.com', 1, 4, N'39-Nguyễn Văn Cừ', 1, 0)
SET IDENTITY_INSERT [dbo].[Students] OFF
GO
SET IDENTITY_INSERT [dbo].[TypeOfClub] ON 

INSERT [dbo].[TypeOfClub] ([TypeID], [TypeName]) VALUES (1, N'Học Thuật')
INSERT [dbo].[TypeOfClub] ([TypeID], [TypeName]) VALUES (2, N'Kỹ Năng Sống')
INSERT [dbo].[TypeOfClub] ([TypeID], [TypeName]) VALUES (3, N'Võ Thuật')
INSERT [dbo].[TypeOfClub] ([TypeID], [TypeName]) VALUES (4, N'Nghệ Thuật')
SET IDENTITY_INSERT [dbo].[TypeOfClub] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [uniemail]    Script Date: 8/13/2022 10:36:11 PM ******/
ALTER TABLE [dbo].[Admins] ADD  CONSTRAINT [uniemail] UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [unique_email]    Script Date: 8/13/2022 10:36:11 PM ******/
ALTER TABLE [dbo].[Clubs] ADD  CONSTRAINT [unique_email] UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Departme__A9D105349395DCD2]    Script Date: 8/13/2022 10:36:11 PM ******/
ALTER TABLE [dbo].[Department] ADD UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Departme__A9D10534A8793F3C]    Script Date: 8/13/2022 10:36:11 PM ******/
ALTER TABLE [dbo].[Department] ADD UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Hostels__652F8571A540C031]    Script Date: 8/13/2022 10:36:11 PM ******/
ALTER TABLE [dbo].[Hostels] ADD UNIQUE NONCLUSTERED 
(
	[HostelName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Hostels__652F8571E805A373]    Script Date: 8/13/2022 10:36:11 PM ******/
ALTER TABLE [dbo].[Hostels] ADD UNIQUE NONCLUSTERED 
(
	[HostelName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Restaura__D80B7F40AE49EDE8]    Script Date: 8/13/2022 10:36:11 PM ******/
ALTER TABLE [dbo].[Restaurants] ADD UNIQUE NONCLUSTERED 
(
	[RestaurantName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Restaura__D80B7F40B9015841]    Script Date: 8/13/2022 10:36:11 PM ******/
ALTER TABLE [dbo].[Restaurants] ADD UNIQUE NONCLUSTERED 
(
	[RestaurantName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [uniqueEmail]    Script Date: 8/13/2022 10:36:11 PM ******/
ALTER TABLE [dbo].[Sellers] ADD  CONSTRAINT [uniqueEmail] UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [UQ__StarVoti__A4B32E97F8FF0341]    Script Date: 8/13/2022 10:36:11 PM ******/
ALTER TABLE [dbo].[StarVotingHostel] ADD UNIQUE NONCLUSTERED 
(
	[StudentNo] ASC,
	[HostelID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [UQ__StarVoti__7AB094E0034AC780]    Script Date: 8/13/2022 10:36:11 PM ******/
ALTER TABLE [dbo].[StarVotingRestaurant] ADD UNIQUE NONCLUSTERED 
(
	[StudentNo] ASC,
	[RestaurantID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [unique__email]    Script Date: 8/13/2022 10:36:11 PM ******/
ALTER TABLE [dbo].[Students] ADD  CONSTRAINT [unique__email] UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Students__32C52A78904A79D6]    Script Date: 8/13/2022 10:36:11 PM ******/
ALTER TABLE [dbo].[Students] ADD UNIQUE NONCLUSTERED 
(
	[StudentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Students__32C52A78C9123658]    Script Date: 8/13/2022 10:36:11 PM ******/
ALTER TABLE [dbo].[Students] ADD UNIQUE NONCLUSTERED 
(
	[StudentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Account]  WITH CHECK ADD FOREIGN KEY([RoleID])
REFERENCES [dbo].[Role] ([RoleID])
GO
ALTER TABLE [dbo].[Account]  WITH CHECK ADD FOREIGN KEY([RoleID])
REFERENCES [dbo].[Role] ([RoleID])
GO
ALTER TABLE [dbo].[Admins]  WITH CHECK ADD FOREIGN KEY([CountryID])
REFERENCES [dbo].[Country] ([CountryID])
GO
ALTER TABLE [dbo].[Admins]  WITH CHECK ADD FOREIGN KEY([CountryID])
REFERENCES [dbo].[Country] ([CountryID])
GO
ALTER TABLE [dbo].[Admins]  WITH CHECK ADD FOREIGN KEY([DistrictID])
REFERENCES [dbo].[District] ([DistrictID])
GO
ALTER TABLE [dbo].[Admins]  WITH CHECK ADD FOREIGN KEY([DistrictID])
REFERENCES [dbo].[District] ([DistrictID])
GO
ALTER TABLE [dbo].[Admins]  WITH CHECK ADD FOREIGN KEY([Email])
REFERENCES [dbo].[Account] ([Username])
GO
ALTER TABLE [dbo].[Admins]  WITH CHECK ADD FOREIGN KEY([Email])
REFERENCES [dbo].[Account] ([Username])
GO
ALTER TABLE [dbo].[Admins]  WITH CHECK ADD FOREIGN KEY([ProvinceID])
REFERENCES [dbo].[Province] ([ProvinceID])
GO
ALTER TABLE [dbo].[Admins]  WITH CHECK ADD FOREIGN KEY([ProvinceID])
REFERENCES [dbo].[Province] ([ProvinceID])
GO
ALTER TABLE [dbo].[Clubs]  WITH CHECK ADD FOREIGN KEY([Email])
REFERENCES [dbo].[Account] ([Username])
GO
ALTER TABLE [dbo].[Clubs]  WITH CHECK ADD FOREIGN KEY([Email])
REFERENCES [dbo].[Account] ([Username])
GO
ALTER TABLE [dbo].[District]  WITH CHECK ADD FOREIGN KEY([ProvinceID])
REFERENCES [dbo].[Province] ([ProvinceID])
GO
ALTER TABLE [dbo].[District]  WITH CHECK ADD FOREIGN KEY([ProvinceID])
REFERENCES [dbo].[Province] ([ProvinceID])
GO
ALTER TABLE [dbo].[EventOfClub]  WITH CHECK ADD FOREIGN KEY([ClubID])
REFERENCES [dbo].[Clubs] ([ClubID])
GO
ALTER TABLE [dbo].[EventOfClub]  WITH CHECK ADD FOREIGN KEY([ClubID])
REFERENCES [dbo].[Clubs] ([ClubID])
GO
ALTER TABLE [dbo].[FoodImage]  WITH CHECK ADD FOREIGN KEY([FoodID])
REFERENCES [dbo].[Foods] ([FoodID])
GO
ALTER TABLE [dbo].[FoodImage]  WITH CHECK ADD FOREIGN KEY([FoodID])
REFERENCES [dbo].[Foods] ([FoodID])
GO
ALTER TABLE [dbo].[Foods]  WITH CHECK ADD FOREIGN KEY([RestaurantID])
REFERENCES [dbo].[Restaurants] ([RestaurantID])
GO
ALTER TABLE [dbo].[Foods]  WITH CHECK ADD FOREIGN KEY([RestaurantID])
REFERENCES [dbo].[Restaurants] ([RestaurantID])
GO
ALTER TABLE [dbo].[HostelImage]  WITH CHECK ADD FOREIGN KEY([HostelID])
REFERENCES [dbo].[Hostels] ([HostelID])
GO
ALTER TABLE [dbo].[HostelImage]  WITH CHECK ADD FOREIGN KEY([HostelID])
REFERENCES [dbo].[Hostels] ([HostelID])
GO
ALTER TABLE [dbo].[Hostels]  WITH CHECK ADD FOREIGN KEY([CountryID])
REFERENCES [dbo].[Country] ([CountryID])
GO
ALTER TABLE [dbo].[Hostels]  WITH CHECK ADD FOREIGN KEY([CountryID])
REFERENCES [dbo].[Country] ([CountryID])
GO
ALTER TABLE [dbo].[Hostels]  WITH CHECK ADD FOREIGN KEY([DistrictID])
REFERENCES [dbo].[District] ([DistrictID])
GO
ALTER TABLE [dbo].[Hostels]  WITH CHECK ADD FOREIGN KEY([DistrictID])
REFERENCES [dbo].[District] ([DistrictID])
GO
ALTER TABLE [dbo].[Hostels]  WITH CHECK ADD FOREIGN KEY([ProvinceID])
REFERENCES [dbo].[Province] ([ProvinceID])
GO
ALTER TABLE [dbo].[Hostels]  WITH CHECK ADD FOREIGN KEY([ProvinceID])
REFERENCES [dbo].[Province] ([ProvinceID])
GO
ALTER TABLE [dbo].[Hostels]  WITH CHECK ADD FOREIGN KEY([SellerID])
REFERENCES [dbo].[Sellers] ([SellerID])
GO
ALTER TABLE [dbo].[Hostels]  WITH CHECK ADD FOREIGN KEY([SellerID])
REFERENCES [dbo].[Sellers] ([SellerID])
GO
ALTER TABLE [dbo].[Province]  WITH CHECK ADD FOREIGN KEY([CountryID])
REFERENCES [dbo].[Country] ([CountryID])
GO
ALTER TABLE [dbo].[Province]  WITH CHECK ADD FOREIGN KEY([CountryID])
REFERENCES [dbo].[Country] ([CountryID])
GO
ALTER TABLE [dbo].[ReportHostel]  WITH CHECK ADD FOREIGN KEY([HostelID])
REFERENCES [dbo].[Hostels] ([HostelID])
GO
ALTER TABLE [dbo].[ReportHostel]  WITH CHECK ADD FOREIGN KEY([HostelID])
REFERENCES [dbo].[Hostels] ([HostelID])
GO
ALTER TABLE [dbo].[ReportRestaurant]  WITH CHECK ADD FOREIGN KEY([RestaurantID])
REFERENCES [dbo].[Restaurants] ([RestaurantID])
GO
ALTER TABLE [dbo].[ReportRestaurant]  WITH CHECK ADD FOREIGN KEY([RestaurantID])
REFERENCES [dbo].[Restaurants] ([RestaurantID])
GO
ALTER TABLE [dbo].[Restaurants]  WITH CHECK ADD FOREIGN KEY([CountryID])
REFERENCES [dbo].[Country] ([CountryID])
GO
ALTER TABLE [dbo].[Restaurants]  WITH CHECK ADD FOREIGN KEY([CountryID])
REFERENCES [dbo].[Country] ([CountryID])
GO
ALTER TABLE [dbo].[Restaurants]  WITH CHECK ADD FOREIGN KEY([DistrictID])
REFERENCES [dbo].[District] ([DistrictID])
GO
ALTER TABLE [dbo].[Restaurants]  WITH CHECK ADD FOREIGN KEY([DistrictID])
REFERENCES [dbo].[District] ([DistrictID])
GO
ALTER TABLE [dbo].[Restaurants]  WITH CHECK ADD FOREIGN KEY([ProvinceID])
REFERENCES [dbo].[Province] ([ProvinceID])
GO
ALTER TABLE [dbo].[Restaurants]  WITH CHECK ADD FOREIGN KEY([ProvinceID])
REFERENCES [dbo].[Province] ([ProvinceID])
GO
ALTER TABLE [dbo].[Restaurants]  WITH CHECK ADD FOREIGN KEY([SellerID])
REFERENCES [dbo].[Sellers] ([SellerID])
GO
ALTER TABLE [dbo].[Restaurants]  WITH CHECK ADD FOREIGN KEY([SellerID])
REFERENCES [dbo].[Sellers] ([SellerID])
GO
ALTER TABLE [dbo].[Sellers]  WITH CHECK ADD FOREIGN KEY([CountryID])
REFERENCES [dbo].[Country] ([CountryID])
GO
ALTER TABLE [dbo].[Sellers]  WITH CHECK ADD FOREIGN KEY([CountryID])
REFERENCES [dbo].[Country] ([CountryID])
GO
ALTER TABLE [dbo].[Sellers]  WITH CHECK ADD FOREIGN KEY([DistrictID])
REFERENCES [dbo].[District] ([DistrictID])
GO
ALTER TABLE [dbo].[Sellers]  WITH CHECK ADD FOREIGN KEY([DistrictID])
REFERENCES [dbo].[District] ([DistrictID])
GO
ALTER TABLE [dbo].[Sellers]  WITH CHECK ADD FOREIGN KEY([Email])
REFERENCES [dbo].[Account] ([Username])
GO
ALTER TABLE [dbo].[Sellers]  WITH CHECK ADD FOREIGN KEY([Email])
REFERENCES [dbo].[Account] ([Username])
GO
ALTER TABLE [dbo].[Sellers]  WITH CHECK ADD FOREIGN KEY([ProvinceID])
REFERENCES [dbo].[Province] ([ProvinceID])
GO
ALTER TABLE [dbo].[Sellers]  WITH CHECK ADD FOREIGN KEY([ProvinceID])
REFERENCES [dbo].[Province] ([ProvinceID])
GO
ALTER TABLE [dbo].[StarVotingHostel]  WITH CHECK ADD FOREIGN KEY([HostelID])
REFERENCES [dbo].[Hostels] ([HostelID])
GO
ALTER TABLE [dbo].[StarVotingHostel]  WITH CHECK ADD FOREIGN KEY([StudentNo])
REFERENCES [dbo].[Students] ([StudentNo])
GO
ALTER TABLE [dbo].[StarVotingRestaurant]  WITH CHECK ADD FOREIGN KEY([RestaurantID])
REFERENCES [dbo].[Restaurants] ([RestaurantID])
GO
ALTER TABLE [dbo].[StarVotingRestaurant]  WITH CHECK ADD FOREIGN KEY([StudentNo])
REFERENCES [dbo].[Students] ([StudentNo])
GO
ALTER TABLE [dbo].[Students]  WITH CHECK ADD FOREIGN KEY([CountryID])
REFERENCES [dbo].[Country] ([CountryID])
GO
ALTER TABLE [dbo].[Students]  WITH CHECK ADD FOREIGN KEY([CountryID])
REFERENCES [dbo].[Country] ([CountryID])
GO
ALTER TABLE [dbo].[Students]  WITH CHECK ADD FOREIGN KEY([DistrictID])
REFERENCES [dbo].[District] ([DistrictID])
GO
ALTER TABLE [dbo].[Students]  WITH CHECK ADD FOREIGN KEY([DistrictID])
REFERENCES [dbo].[District] ([DistrictID])
GO
ALTER TABLE [dbo].[Students]  WITH CHECK ADD FOREIGN KEY([Email])
REFERENCES [dbo].[Account] ([Username])
GO
ALTER TABLE [dbo].[Students]  WITH CHECK ADD FOREIGN KEY([Email])
REFERENCES [dbo].[Account] ([Username])
GO
ALTER TABLE [dbo].[Students]  WITH CHECK ADD FOREIGN KEY([ProvinceID])
REFERENCES [dbo].[Province] ([ProvinceID])
GO
ALTER TABLE [dbo].[Students]  WITH CHECK ADD FOREIGN KEY([ProvinceID])
REFERENCES [dbo].[Province] ([ProvinceID])
GO
