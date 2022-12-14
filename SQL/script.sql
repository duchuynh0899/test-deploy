USE [FCS286]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 7/29/2022 11:18:20 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Admins]    Script Date: 7/29/2022 11:18:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Admins](
	[AdminID] [int] IDENTITY(1,1) NOT NULL,
	[Avatar] [varchar](max) NULL,
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
PRIMARY KEY CLUSTERED 
(
	[AdminID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Buses]    Script Date: 7/29/2022 11:18:20 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Clubs]    Script Date: 7/29/2022 11:18:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clubs](
	[ClubID] [int] IDENTITY(1,1) NOT NULL,
	[Avatar] [varchar](max) NULL,
	[ClubName] [nvarchar](200) NULL,
	[ClubPresident] [nvarchar](100) NULL,
	[Facebook] [text] NULL,
	[Email] [varchar](50) NULL,
	[Description] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[ClubID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Comment]    Script Date: 7/29/2022 11:18:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comment](
	[CommentID] [int] IDENTITY(1,1) NOT NULL,
	[PostID] [int] NULL,
	[Email] [varchar](50) NULL,
	[CommentContent] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[CommentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Country]    Script Date: 7/29/2022 11:18:20 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Department]    Script Date: 7/29/2022 11:18:20 PM ******/
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
PRIMARY KEY CLUSTERED 
(
	[DepId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[District]    Script Date: 7/29/2022 11:18:20 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EventOfClub]    Script Date: 7/29/2022 11:18:20 PM ******/
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
	[Url1] [varchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[EventID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FoodImage]    Script Date: 7/29/2022 11:18:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FoodImage](
	[FoodID] [int] NOT NULL,
	[ImageUrl] [varchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[FoodID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Foods]    Script Date: 7/29/2022 11:18:20 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HostelImage]    Script Date: 7/29/2022 11:18:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HostelImage](
	[HostelID] [int] NOT NULL,
	[Url1] [varchar](max) NULL,
	[Url2] [varchar](max) NULL,
	[Url3] [varchar](max) NULL,
	[Url4] [varchar](max) NULL,
	[Url5] [varchar](max) NULL,
	[Url6] [varchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[HostelID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Hostels]    Script Date: 7/29/2022 11:18:20 PM ******/
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
	[Distance] [int] NULL,
	[Descriptions] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[HostelID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Posts]    Script Date: 7/29/2022 11:18:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Posts](
	[PostID] [int] IDENTITY(1,1) NOT NULL,
	[Email] [varchar](50) NULL,
	[Comment] [nvarchar](max) NULL,
	[StarVoting] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[PostID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Province]    Script Date: 7/29/2022 11:18:20 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ReportComment]    Script Date: 7/29/2022 11:18:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ReportComment](
	[ReportID] [int] IDENTITY(1,1) NOT NULL,
	[CommentID] [int] NULL,
	[Spam] [bit] NULL,
	[Offensive] [bit] NULL,
	[Violent] [bit] NULL,
	[Truthless] [bit] NULL,
	[ReportTime] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[ReportID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ReportPost]    Script Date: 7/29/2022 11:18:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ReportPost](
	[ReportID] [int] IDENTITY(1,1) NOT NULL,
	[PostID] [int] NULL,
	[Spam] [bit] NULL,
	[Offensive] [bit] NULL,
	[Violent] [bit] NULL,
	[Truthless] [bit] NULL,
	[ReportTime] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[ReportID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Restaurants]    Script Date: 7/29/2022 11:18:20 PM ******/
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
PRIMARY KEY CLUSTERED 
(
	[RestaurantID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 7/29/2022 11:18:20 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rooms]    Script Date: 7/29/2022 11:18:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rooms](
	[RoomKind] [int] IDENTITY(1,1) NOT NULL,
	[HostelID] [int] NOT NULL,
	[Area] [float] NULL,
	[RentCost] [money] NULL,
	[Descriptions] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[RoomKind] ASC,
	[HostelID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sellers]    Script Date: 7/29/2022 11:18:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sellers](
	[SellerID] [int] IDENTITY(1,1) NOT NULL,
	[Avatar] [varchar](max) NULL,
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
PRIMARY KEY CLUSTERED 
(
	[SellerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Students]    Script Date: 7/29/2022 11:18:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Students](
	[StudentNo] [int] IDENTITY(1,1) NOT NULL,
	[StudentID] [varchar](10) NULL,
	[Avatar] [varchar](max) NULL,
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
PRIMARY KEY CLUSTERED 
(
	[StudentNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Account] ON 

INSERT [dbo].[Account] ([AccountID], [RoleID], [Username], [Password], [AccountStatus]) VALUES (5, 3, N'anhquang2602@gmail.com', N'quang1234', 1)
INSERT [dbo].[Account] ([AccountID], [RoleID], [Username], [Password], [AccountStatus]) VALUES (3, 2, N'hoantmhe141105@fpt.edu.vn', N'120920', 1)
INSERT [dbo].[Account] ([AccountID], [RoleID], [Username], [Password], [AccountStatus]) VALUES (6, 4, N'jsclub.fpt@gmail.com', N'js12345', NULL)
INSERT [dbo].[Account] ([AccountID], [RoleID], [Username], [Password], [AccountStatus]) VALUES (4, 2, N'longnguyenhuuhoang@gmail.com', N'bacninh0000', 1)
INSERT [dbo].[Account] ([AccountID], [RoleID], [Username], [Password], [AccountStatus]) VALUES (1, 3, N'minkook2909@gmail.com', N'123456', 1)
INSERT [dbo].[Account] ([AccountID], [RoleID], [Username], [Password], [AccountStatus]) VALUES (2, 1, N'nguyenmyhoa120920@gmail.com', N'12345', 0)
SET IDENTITY_INSERT [dbo].[Account] OFF
INSERT [dbo].[Buses] ([BusNumber], [Cost], [BusStop], [Url1], [Url2], [ShortDescriptions]) VALUES (74, 9000.0000, N'Bx Mỹ Đình&&Gần Ngã 4 Phạm Hùng - Đình Thôn (Hướng Đi Khuất Duy Tiến)-Cột Sau&&Nhà Ct5 Kđt Sông Đà Mỹ Đình - Phạm Hùng&&Nhà Hàng Hàn Quốc, Nhà Ct4 Đn Kđt Mỹ Đình - Đường Mễ Trì&&Tường Rào Trạm Y Tế Mễ Trì - Đường Mễ Trì&&Tường Rào Sân Golf Mỹ Đình Pearl - Đại Lộ Thăng Long&&Xóm La, Đại Mỗ - Đại Lộ Thăng Long&&Qua Đối Diện Lối Vào Thpt Đại Mỗ - Đại Lộ Thăng Long&&Trụ Sở Bộ Tư Lệnh Cảnh Sát Biển - Đại Lộ Thăng Long&&Đối Diện Thiên Đường Bảo Sơn - Đại Lộ Thăng Long&&Qua Lối Rẽ Vào Ubnd Xã An Khánh - Đại Lộ Thăng Long&&Chùa Bà - Thôn Yên Lũng, An Khánh - Đại Lộ Thăng Long&&Trước 50m Lối Vào Ubnd Huyện Hoài Đức&&Cầu Vượt Song Phương - Đại Lộ Thăng Long&&Làng Văn Hóa Thôn Quyết Tiến (Trước 200m Cầu Sông Đáy)&&Chùa Sơn Trung, Xã Yên Sơn&&Ngã 3 Chùa Thầy, Gần Cầu Vượt Sài Sơn&&Cầu Vượt Hoàng Xá - Cột Mốc H7/17 Đại Lộ Thăng Long&&Kcn Thạch Thất - Đại Lộ Thăng Long&&Ngã 3 Tỉnh Lộ 419 - Đại Lộ Thăng Long - Kcn Thạch Thất&&Cầu Chui Dân Sinh Số 11 - Đại Lộ Thăng Long&&Cty Sun House, Xã Ngọc Liệp - Đại Lộ Thăng Long&&Trước Nhà Máy Thép Mỹ Thuật Hải Vân - Đại Lộ Thăng Long&&Đường Vào Chùa Kim Long - Đại Lộ Thăng Long&&Thôn Liệp Mai, Xã Ngọc Liệp - Đại Lộ Thăng Long&&Thôn Đồng Kho, Xã Đồng Trúc - Đại Lộ Thăng Long&&Qua Khu Đồng Trúc Resort 10m (Cầu Chui Dân Sinh Số 19), Đại Lộ Thăng Long&&Thôn Đồi Bông, Xã Đồng Trúc - Đại Lộ Thăng Long&&Trạm 110kv Thạch Thất - Đại Lộ Thăng Long&&Đường Vào Kcn Cao Hòa Lạc - Đại Lộ Thăng Long&&Trường Ptth Hòa Lạc&&Tòa Nhà Viettel Hòa Lạc&&Trước 50m Đường Vào Trường Đh Fpt, Hòa Lạc&&Số 231 Thạch Hòa Thạch Thất&&Trung Tâm Dạy Nghề Và Đào Tạo Sát Hạch Lái Xe Hùng Vương&&Qua Cầu Hòa Lạc (Đi Xuân Mai) - Quốc Lộ 21a&&Gần Ngã Tư Lục Quân&&Đối Diện Tập Đoàn Y Dược Bảo Long - Quốc Lộ 21a&&Công Ty Tnhh Punta Vietnam&&Qua Ngã 3 Sơn Tây Đồng Mô&&Ngã Ba Sơn Tây - Võng Xuyên - Quốc Lộ 21a&&Tân Phú Sơn Đông&&Đối Diện Đường Vào Trường Sĩ Quan Phòng Hóa&&Đối Diện Đường Vào Học Viện Phòng Không Không Quân - Công Ty Thịnh Cường&&Qua Ngã Ba Xuân Khanh - Quốc Lộ 21a&&Gần Cây Xăng Quân Đội - Đối Diện Bệnh Viện 105&&118-120a Phố Thanh Vị&&Qua Đối Diện Trường Sỹ Quan Pháo Binh 100m&&Đối Diện Số 163 Phố Thanh Vị&&Đối Diện Số 391 Thanh Mỹ&&Số 58 Thanh Mỹ&&Trước Nhà Máy Z151 - 50m&&Đối Diện Số 101 Xuân Khanh&&Viện Kỹ Thuật Cơ Giới Quân Sự Khu B (Trung Tâm Thực Hành Thí Nghiệm)&&Giữa 270-272 Xuân Khanh&&Trường Đh Công Nghiệp Việt Hung&&Xuân Khanh', N'busimage/xe74_1.jpg', NULL, N'Lộ trình: Mỹ Đình -> Xuân Khanh<br>Thời Gian xe chạy: 04:40 -> 21:00<br>Giá vé: 9.000đ/Vé ')
INSERT [dbo].[Buses] ([BusNumber], [Cost], [BusStop], [Url1], [Url2], [ShortDescriptions]) VALUES (88, 9000.0000, N'Bx Mỹ Đình&&Gần Ngã 4 Phạm Hùng - Đình Thôn (Hướng Đi Khuất Duy Tiến)-Cột Sau&&Nhà Ct5 Kđt Sông Đà Mỹ Đình - Phạm Hùng&&Nhà Hàng Hàn Quốc, Nhà Ct4 Đn Kđt Mỹ Đình - Đường Mễ Trì&&Tường Rào Trạm Y Tế Mễ Trì - Đường Mễ Trì&&Tường Rào Sân Golf Mỹ Đình Pearl - Đại Lộ Thăng Long&&Xóm La, Đại Mỗ - Đại Lộ Thăng Long&&Qua Đối Diện Lối Vào Thpt Đại Mỗ - Đại Lộ Thăng Long&&Trụ Sở Bộ Tư Lệnh Cảnh Sát Biển - Đại Lộ Thăng Long&&Đối Diện Thiên Đường Bảo Sơn - Đại Lộ Thăng Long&&Qua Lối Rẽ Vào Ubnd Xã An Khánh - Đại Lộ Thăng Long&&Đông Y Dược Bảo Long - Đại Lộ Thăng Long&&Chùa Bà - Thôn Yên Lũng, An Khánh - Đại Lộ Thăng Long&&Trước 50m Lối Vào Ubnd Huyện Hoài Đức&&Cầu Vượt Song Phương - Đại Lộ Thăng Long&&Làng Văn Hóa Thôn Quyết Tiến (Trước 200m Cầu Sông Đáy)&&Chùa Sơn Trung, Xã Yên Sơn&&Ngã 3 Chùa Thầy, Gần Cầu Vượt Sài Sơn&&Cầu Vượt Hoàng Xá - Cột Mốc H7/17 Đại Lộ Thăng Long&&Kcn Thạch Thất - Đại Lộ Thăng Long&&Ngã 3 Tỉnh Lộ 419 - Đại Lộ Thăng Long - Kcn Thạch Thất&&Cầu Chui Dân Sinh Số 11 - Đại Lộ Thăng Long&&Cty Sun House, Xã Ngọc Liệp - Đại Lộ Thăng Long&&Trước Nhà Máy Thép Mỹ Thuật Hải Vân - Đại Lộ Thăng Long&&Đường Vào Chùa Kim Long - Đại Lộ Thăng Long&&Thôn Liệp Mai, Xã Ngọc Liệp - Đại Lộ Thăng Long&&Thôn Đồng Kho, Xã Đồng Trúc - Đại Lộ Thăng Long&&Qua Khu Đồng Trúc Resort 10m (Cầu Chui Dân Sinh Số 19), Đại Lộ Thăng Long&&Thôn Đồi Bông, Xã Đồng Trúc - Đại Lộ Thăng Long&&Trạm 110kv Thạch Thất - Đại Lộ Thăng Long&&Đường Vào Kcn Cao Hòa Lạc - Đại Lộ Thăng Long&&Trường Ptth Hòa Lạc&&Tòa Nhà Viettel Hòa Lạc&&Trước 50m Đường Vào Trường Đh Fpt, Hòa Lạc&&Công Ty Tnhh Xây Dựng Sungeun Plant - Thôn 7 Xã Thạch Hòa - Ql21&&Công Ty Cp Dịch Vụ Bảo Vệ Kcn Cao Hòa Lạc&&Ngã Ba Hòa Lạc - Quốc Lộ 21&&Trước Cửa Hàng Điện Máy Tâm Đức - Ql21&&Đối Diện CH Xăng Dầu Phú Cát - Quốc Lộ 21&&Thôn 7 Phú Cát Quốc Oai - Quốc Lộ 21&&Qua 70m Cổng Trung Đoàn Bộ Binh Cơ Giới 102 (Cột Mốc H7/414) - Quốc Lộ 21&&Xóm 2 Hòa Phú, Xã Hòa Thạch - Quốc Oai (Chiều Đi Xuân Mai)&&Trước Công Ty Cp Long Thạch - Ql21&&Trước Cửa Hàng Vật Liệu Xây Dựng Thành Cảnh - Ql21&&Đối Diện Nha Khoa Trường Huyền Xã Hòa Thạch&&Chợ Long Phú - Xã Hòa Thạch - Quốc Lộ 21&&Gần Cầu Cửa Đầm - Quốc Lộ 21&&Xóm 5 Thôn Long Phú Xã Hòa Thạch (Trước Đội Cơ Giới Máy Thi Công)&&Đối Diện Làng Văn Hóa Yên Thái, Xã Đông Sơn, Hòa Binh - Quốc Lộ 21&&Cửa Hàng Xăng Dầu Tv21 - Quốc Lộ 21&&Đường Vào Trường Đh Pccc Cơ Sở 2 Bộ Ca - Quốc Lộ 21&&Đại Học Lâm Nghiệp - Quốc Lộ 21&&35 Tổ 3, Thị Trấn Xuân Mai&&Trường Sỹ Quan Đặc Công (Qua Cửa Hàng Xăng Dầu Số 7 Xuân Mai)&&Cty Xuân Cương (Trước 100m Cầu Xuân Mai) - Đường Hồ Chí Minh&&Trường Trung Cấp Cảnh Sát Vũ Trang - Đường Hồ Chí Minh&&Qua 100m Trường Trung Cấp Nghề Tổng Hợp Hà Nội - Đường Hồ Chí Minh&&Trung Tâm Dịch Vụ Tổng Hợp, Thôn Xuân Trung - Đường Hồ Chí Minh&&Thôn Xuân Sen - Xuân Mai - Đường Hồ Chí Minh&&Ktx Trường Cđ Cộng Đồng Hà Tây - Đường Hồ Chí Minh&&Cổng Trường Cđ Cộng Đồng Hà Tây - Đường Hồ Chí Minh&&Xuân Mai (Trường Cđ Cộng Đồng Hà Tây)', N'busimage/xe88_1.jpg', NULL, N'Lộ trình: Mỹ Đình -> Xuân Mai<br>Thời Gian xe chạy: 05:00 -> 20:00<br>Giá vé: 9.000đ/Vé ')
INSERT [dbo].[Buses] ([BusNumber], [Cost], [BusStop], [Url1], [Url2], [ShortDescriptions]) VALUES (107, 9000.0000, N'211 Kim Mã &&116 A5 Tập thể Giảng Võ – Kim Mã &&31 Nguyễn Chí Thanh &&73 Nguyễn Chí Thanh – Đối diện Khách sạn Bảo Sơn &&89 Nguyễn Chí Thanh – KTX Đại học Luật&&KTX Đại học Giao thông Vận tải – 99 Nguyễn Chí Thanh &&Đại học Lao động & Xã hội – 43 Trần Duy Hưng &&113 Trần Duy Hưng – Bộ KHCN &&Đối diện 220 Trần Duy Hưng (đối diện Big C,&&Cách Ngã 3 Hoàng Minh Giám) &&Tòa nhà Thăng Long Number One – Đại lộ Thăng Long &&Công ty Viễn Thông Viettel (Tòa nhà N1) – Đại lộ Thăng Long &&Qua 100m ngã 3 Đại lộ Thăng Long – Lê Quang Đạo &&Trước ngã 3 Phố Sa Đôi – Đại lộ Thăng Long &&Lối vào THPT Đại Mỗ – Đại lộ Thăng Long &&Qua ngã 3 Làng Miêu Nha – Đại lộ Thăng Long &&Đường vào UBND Phường Tây Mỗ – Đại lộ Thăng Long &&Cổng Thiên Đường Bảo Sơn – Đại lộ Thăng Long &&Trước 50m hầm chui dân sinh số 3 Đại Lộ Thăng Long &&Cầu vượt An Khánh – Đại lộ Thăng Long &&KĐT Nam An Khánh – Đại lộ Thăng Long&&Đê Phương Viên, Song Phương – Đại lộ Thăng Long &&Song Phương, Hoài Đức – Đại lộ Thăng Long &&Xã Vân Côn, Hoài Đức – Đại lộ Thăng Long &&Thôn Quảng Yên, Yên Sơn, Quốc Oai – Đại lộ Thăng Long &&Ngã 3 Chùa Thầy – Quốc Oai – Đại lộ Thăng Long &&Khu đô thị Ngôi nhà mới- Đại lộ Thăng Long &&Thôn Ngô Sài – thị trấn Quốc Oai – Đại lộ Thăng Long &&Thôn Ngọc Than, xã Ngọc Mỹ – Đại lộ Thăng Long &&Thôn Đồng Bụt, xã Ngọc Liệp – Đại lộ Thăng Long &&Trường THCS Ngọc Liệp &&Thôn Liệp Mai, xã Ngọc Liệp – Đại lộ Thăng Long (hướng về trung tâm thành phố) &&Thôn Đồng Kho, xã Đồng Trúc – Đại lộ Thăng Long (hướng về trung tâm thành phố) &&Thôn Khoang Mái, xã Đồng Trúc – Đại lộ Thăng Long &&Cty Cám Trường Thọ – Đại lộ Thăng Long &&Khu CN cao Hòa Lạc – Đại lộ Thăng Long &&Đối diện trường PTTH Hòa Lạc &&Đối Diện Tòa Nhà Viettel Hòa Lạc &&Qua 50m đối diện đường vào trường ĐH FPT, Hòa Lạc &&Quầy thuốc số 15 – Thôn 7 xã Thạch Hòa – QL21 &&Qua 30m đối diện công ty CP dịch vụ bảo vệ KCN Cao Hòa Lạc – QL21 &&Đối diện cửa hàng điện nước Tuấn Bình – thôn 7 xã Thạch Hòa – QL21 &&Đại lý sữa Lan Anh – xã Thạch Hòa &&Công ty CP xây dựng Tiến An – Thôn 6 xã Thạch Hòa &&Trước 30m đường vào thôn Trại Mới xã Tiến Xuân &&Đại lý sữa Ất Thảo – Thôn Nhòn xã Tiến Xuân &&Qua 30m Cty CP An Thinh Group – Thôn Gò Mè xã Yên Bình &&Qua Ngã 4 Yên Bình 70m &&Trước 30 đối diện Xưởng thực hành Trường Cao đẳng công nghiệp kỹ thuật Trần Hưng Đạo &&Qua Cổng A Làng Văn Hóa Du Lịch Các Dân Tộc Việt Nam 30m &&Làng văn hóa các dân tộc Việt Nam – Tuyến 107', N'busimage/xe107_1.png', NULL, N'Lộ trình: Kim Mã -> Làng Văn hóa Du lịch các dân tộc Việt Nam<br>Thời Gian xe chạy: 05:00 -> 20:50<br>Giá vé: 9.000đ/Vé ')
INSERT [dbo].[Buses] ([BusNumber], [Cost], [BusStop], [Url1], [Url2], [ShortDescriptions]) VALUES (117, 9000.0000, N'Hòa Lạc&&Qua Vòng Xuyến Đường Vào Trường Đh Fpt 50m&&Thôn 8 Thạch Hòa Hòa Lạc&&Xưởng Bê Tông, Đối Diện 354 Thạch Hòa Thạch Thất&&Số 231 Thạch Hòa Thạch Thất&&Số 27 Thôn 9 Thạch Hòa&&Của Hàng Sửa Chữa Xe Máy Duẩn An&&Qua Chùa Thái Bình 10m&&Trước Đối Diện Cây Xăng Bình Yên 20m&&Cửa Hàng Sơn Tiến Đạt&&Đối Diện Ubnd Xã Bình Yên&&Nhà Hàng Hoa Võ - Bình Yên - Thạch Thất&&Cửa Hàng Vật Liệu Đá Granit&&Trước Lối Vào Tập Thể Bvđk Thạch Thất&&Ngã 3 Thị Trấn Liên Quan&&Trung Tâm Bồi Dưỡng Chính Trị Thạch Thất&&Qua Cổng Làng Thúy Lai&&Trước Cổng Làng Hương Ngải&&Khu Đồng Cháy Hưng Ngải&&Tây Ninh Xã Canh Nậu (Chiều Đi)&&Đối Diện Làng Nghề Đồ Gỗ Mỹ Nghệ Thạch Thất&&Qua Ngã Tư Hữu Bằng Di Nậu 30m&&Khu Công Nghệ Liên Hiệp Phúc Thọ&&Đối Diện Nghĩa Trang Liệt Sỹ Xã Liên Hiệp&&Cửa Hàng Tạp Hóa Bình Kinh&&Lối Vào Đình Hạ Hiệp&&Đối Diện Xóm Bùi - Hiệp Thuận - Phúc Thọ&&Qua Lối Vào Làng Quế Lâm 30m&&Đối Diện Xóm Hưng Khánh - Thôn Yên Dục&&Qua Đường Vào Thôn Ngoại Xã Tam Thuấn 70m - Quốc Lộ 32&&Đối Diện Viện Nghiên Cứu Ngô Quốc Gia - Đường Dẫn Cầu Phùng&&Đối Diện Trường Thcs Lương Thế Vinh, Thị Trấn Phùng&&Tổ Đình Thụy Ứng - (Thị Trấn Phùng) - Quốc Lộ 32&&37-39 Phan Đình Phùng (Thị Trấn Phùng) - Quốc Lộ 32&&Tòa Án Nhân Dân Huyện Đan Phượng - Quốc Lộ 32&&Đường Vào Chùa Diên Phúc (Cạnh Thạch Thảo Lisa) - Quốc Lộ 32&&Xn May Mỹ Anh (Xã Đức Thượng) - Quốc Lộ 32&&Đối Diện Xn Thuốc Thú Y Trung Ương (Đức Thượng Hoài Đức - Quốc Lộ 32&&Đối Diện Trường Thpt Bình Minh - Quốc Lộ 32&&Đối Diện Công Ty Đông Thành (Thị Trấn Trôi) - Quốc Lộ 32&&Đối Diện Bưu Điện Hoài Đức (Trị Trấn Trôi) - Quốc Lộ 32&&Đối Diện Lối Rẽ Học Viện Kh Quân Sự - Quốc Lộ 32&&CH Xây Dựng Tuấn Loan (Thị Trấn Lai Xá) - Quốc Lộ 32&&Đối Diện Nhà Hàng Thăng Long - Quốc Lộ 32&&Qua Đường Vào Tt Huấn Luyện Thể Thao Quốc Gia I - Quốc Lộ 32&&Hè Giữa Nhà Số 55-57 Phố Nhổn&&Nhổn', N'busimage/xe117_1.jpg', NULL, N'Lộ trình: Hoà Lạc -> Nhổn<br>Thời Gian xe chạy: 05:00 -> 20:00<br>Giá vé: 9.000đ/Vé ')
INSERT [dbo].[Buses] ([BusNumber], [Cost], [BusStop], [Url1], [Url2], [ShortDescriptions]) VALUES (119, 9000.0000, N'Bất Bạt&&Qua Xóm 4, Lò Năm Tư 19m, Đt86&&Qua Xóm 17 Làng Đan Thê 10m, Đt86&&Qua Đối Diện Đường Vào Xã Thuần Mỹ 30m, Ba Vì&&Qua Đối Diện Cửa Hàng Thuốc Thú Y Thanh Hiền 30m, Xóm 4, Thôn 3, Thuần Mỹ&&Trước Đối Diện Cổng Xóm Tân Trại, Thôn 2, Ba Trại, Ba Vì&&Trước Cổng Làng Văn Hóa Thôn 2, Ba Trại, Ba Vì&&Trước Ubnd Xã Ba Trại 40m, Thôn 5, Ba Trại, Ba Vì&&Trước Xóm Đồng Đầm, Thôn 6, Ba Trại, Ba Vì&&Đối Diện Cửa Hàng Sửa Chữa Ô Tô Xe Máy Hồng Sơn, Thôn 6, Tam Uy, Ba Trại, Ba Vì&&Qua Đối Diện Đường Vào Khu Du Lịch Đầm Long 100m (Đối Diện Nhà Hàng Hồng Thái Anh)&&Trước Cửa Hàng Sửa Chữa Xe Máy Quang Vượng, Hoàng Long - Tản Lĩnh&&Trước Ngã 3 Ao Vua 100m&&Trung Tâm Thương Mại Miền Núi Tản Lĩnh&&Qua Cầu Kìm 50m (Shop Thời Trang Hồng Thúy)&&Trước Cửa Hàng Ga Dũng Tính Thôn Hà Tân, Xã Cẩm Lĩnh&&Đối Diện Ubnd Xã Tản Lĩnh (Cửa Hàng Rèm Hương Dung)&&Đối Diện Đại Lý Gà Cấp 1 Trọng Hoa, Đức Thịnh, Tản Lĩnh&&Trước Ngã 3 Vườn Quốc Gia Ba Vì 50 (Chiều Đi Bx Sơn Tây)&&Trước Ngã 3 Cây Xăng Tản Lĩnh 100m&&Trước Đối Diện Trường Thcs Trung Tâm Nghiên Cứu Bò Và Đồng Cỏ Ba Vì 40m, Đt87&&Trước Cưa Hàng Nhựa Tiền Phong Minh Sáu, Thôn Xuân Hòa, Vân Hòa, Đt87&&Trước Đối Diện Đường Vào Khu Du Lịch Khoang Sanh, Suối Tiên 70m, Đt87&&Đối Diện Trường Tiểu Học Yên Bài Khu C, Đt87&&Qua Đối Diện Trường Bắn Ba Vành 40m, Đt87&&Trước Trường Mầm Non Yên Bài A 40m, Đt87&&Quầy Thuốc Yên Bài, Đt87&&Đối Diện Làng Văn Hóa Thôn Quảng Phúc, Đt87&&Trước Cổng Doanh Trại Quân Đội Nhân Dân Việt Nam 10m, Đt87&&Trước 30 Đối Diện Xưởng Thực Hành Trường Cao Đẳng Công Nghiệp Kỹ Thuật Trần Hưng Đạo&&Qua Ngã 4 Yên Bình 70m&&Trước Cổng Trung Tâm Đào Tạo Lái Xe Hùng Vương 50m, Xã Bình Yên, Thạch Thất&&Qua 30m Cty Cp An Thinh Group - Thôn Gò Mè Xã Yên Bình&&Đại Lý Sữa Ất Thảo - Thôn Nhòn Xã Tiến Xuân&&Trước 30m Đường Vào Thôn Trại Mới Xã Tiến Xuân&&Công Ty Cp Xây Dựng Tiến An - Thôn 6 Xã Thạch Hòa&&Đại Lý Sữa Lan Anh - Xã Thạch Hòa&&Đối Diện Cửa Hàng Điện Nước Tuấn Bình - Thôn 7 Xã Thạch Hòa - Ql21&&Qua 30m Đối Diện Công Ty Cp Dịch Vụ Bảo Vệ Kcn Cao Hòa Lạc - Ql21&&Quầy Thuốc Số 15 - Thôn 7 Xã Thạch Hòa - Ql21&&Trước Vòng Xuyến Đường Vào Trường Đh Fpt 70m&&Hòa Lạc', N'busimage/xe119_1.png', NULL, N'Lộ trình: Hòa Lạc -> Bất Bạt<br>Thời Gian xe chạy: 05:00 -> 20:30<br>Giá vé: 9.000đ/Vé ')
SET IDENTITY_INSERT [dbo].[Clubs] ON 

INSERT [dbo].[Clubs] ([ClubID], [Avatar], [ClubName], [ClubPresident], [Facebook], [Email], [Description]) VALUES (4, N'img/club/js_avt.png', N'JS Club - Japanese Software Engineers', N'Lê Thanh Bình', N'https://www.facebook.com/fu.jsclub', N'jsclub.fpt@gmail.com', N'JS Club là câu lạc bộ Kỹ sư phần mềm Nhật Bản, nơi hội tụ của những bạn đam mê tiếng Nhật và lập trình')
SET IDENTITY_INSERT [dbo].[Clubs] OFF
SET IDENTITY_INSERT [dbo].[Country] ON 

INSERT [dbo].[Country] ([CountryID], [CountryName]) VALUES (1, N'Việt Nam')
SET IDENTITY_INSERT [dbo].[Country] OFF
SET IDENTITY_INSERT [dbo].[Department] ON 

INSERT [dbo].[Department] ([DepId], [DepName], [DepNameAbbreviations], [Email], [Phone], [OpenDay], [Url1], [Url2], [Descriptions], [ShortDescription]) VALUES (1, N'PHÒNG DỊCH VỤ SINH VIÊN', N'DVSV', N'dichvusinhvien@fe.edu.vn', N'02473081313', N'Thứ 2 đến thứ 6 hàng tuần', N'departmentimage/dvsv1.jpg', N'departmentimage/dvsv2.jpg', N'- Địa điểm: Phòng 102L – tòa nhà Alpha, Đại học FPT cơ sở Hà Nội<br>
- Phòng Dịch vụ sinh viên là nơi:<br>
+ Hỗ trợ các thủ tục hành chính: Làm thẻ sinh viên, thẻ BHYT, giấy xác nhận sinh viên,...<br>
+ Hỗ trợ, tiếp nhận và xử lý các vấn đề liên quan đến quy định, chính sách, thủ tục học vụ, tài chính, ktx…<br>
+ Hỗ trợ các dịch vụ phụ huynh như :<br>
● Hướng dẫn sử dụng tài khoản truy cập cổng thông tin dành cho phụ huynh<br>
● Giải đáp thắc mắc phụ huynh về tình hình học tập của sinh viên<br>
● Gửi thông báo cho phụ huynh khi sinh viên bảo lưu, thôi học… ', N'Phòng Dịch vụ sinh viên là nơi giúp các bạn sinh viên trong việc :<br>
- Tiếp nhận các yêu cầu sinh viên liên quan đến thủ tục hành chính (Thẻ sinh viên, giấy xác nhận sinh viên, BHYT…), thủ tục học vụ (Đăng ký bảo lưu, học cải thiện, đăng ký học lại…), thu ngân. <br>
- Giải đáp các thắc mắc của sinh viên về các quy định, quy chế, chính sách của nhà trường.')
INSERT [dbo].[Department] ([DepId], [DepName], [DepNameAbbreviations], [Email], [Phone], [OpenDay], [Url1], [Url2], [Descriptions], [ShortDescription]) VALUES (2, N'PHÒNG HỢP TÁC QUỐC TẾ VÀ PHÁT TRIỂN CÁ NHÂN', N'ICPDP', N'pdp.hn@fpt.edu.vn', N'024 6680 5910', N'Thứ 2 đến thứ 6 hàng tuần', N'departmentimage/icpdp1.jpg', N'departmentimage/icpdp2.jpg', N'- Địa điểm: Phòng 102 – tòa nhà Alpha, Đại học FPT cơ sở Hà Nội<br>
- Fanpage chính thức: https://www.facebook.com/icpdp.globalstudy/ <br>
- Phòng Hợp tác Quốc tế và Phát triển Cá nhân (IC-PDP) Đại học FPT Hà Nội<br>
+ Là nơi update thông tin, hình ảnh và câu chuyện về các hoạt động, chương trình, sự kiện và workshop dành cho sinh viên ĐH FPT Hà Nội!<br> 
+ Giúp các bạn sinh viên giải stress sau những giờ học căng thẳng đồng thời phát triển kỹ năng mềm thông qua các hoạt động trải nghiệm lên rừng, xuống biển. Việc tham gia tích cực các hoạt động ngoại khóa cũng là yếu tố để làm đẹp CV, điểm cộng sáng giá trong mỗi kỳ xét duyệt học bổng hay tham gia trao đổi sinh viên tại nước ngoài.', N'Phòng Phát triển cá nhân có chức năng giúp sinh viên giải stress sau những giờ học căng thẳng đồng thời phát triển kỹ năng mềm thông qua các hoạt động trải nghiệm lên rừng, xuống biển. Việc tham gia tích cực các hoạt động ngoại khóa cũng là yếu tố để làm đẹp CV, điểm cộng sáng giá trong mỗi kỳ xét duyệt học bổng hay tham gia trao đổi sinh viên tại nước ngoài.')
INSERT [dbo].[Department] ([DepId], [DepName], [DepNameAbbreviations], [Email], [Phone], [OpenDay], [Url1], [Url2], [Descriptions], [ShortDescription]) VALUES (3, N'PHÒNG CÔNG TÁC SINH VIÊN', N'CTVS', N'sro.hn@fpt.edu.vn', N'024 6680 5915', N'Thứ 2 đến thứ 6 hàng tuần', N'departmentimage/ctsv1.jpg', N'departmentimage/ctsv2.jpg', N'- Địa điểm: Phòng 101-tòa nhà Delta, Đại học FPT cơ sở Hà Nội<br>
- Fanpage chính thức: https://www.facebook.com/CTSV.FU<br>
Phòng Công tác sinh viên là nơi:<br>
+ Tổ chức các sự kiện thường niên<br>
● Lễ Khai giảng, Lễ Tốt nghiệp, Lễ Tôn vinh sinh viên<br>
● The Dialogue: Các hội thảo về kỹ năng học tập, hội thảo về ngành nghề, xu hướng công nghệ,...<br>
● Inspiration show: Chuỗi chương trình truyền cảm hứng.<br>', N'Với chức năng quản lý sinh viên, cung cấp các dịch vụ cho sinh viên trong quá trình học tập tại Trường, đồng thời hỗ trợ cá hoạt động phong trào do Trường hoặc sinh viên tổ chức, Phòng CTSV hỗ trợ các dịch vụ như: Hành chính; Dịch vụ thông tin và hỗ trợ học tập; Thông tin phụ huynh sinh viên; Dịch vụ Y tế…')
INSERT [dbo].[Department] ([DepId], [DepName], [DepNameAbbreviations], [Email], [Phone], [OpenDay], [Url1], [Url2], [Descriptions], [ShortDescription]) VALUES (4, N'PHÒNG QUAN HỆ DOANH NGHIỆP VÀ CỰU SINH VIÊN', N'', N'alumni@fpt.edu.vn<br>
job@fe.edu.vn<br>', N'024 7300 5569', N'Thứ 2 đến thứ 6 hàng tuần', N'departmentimage/alumni.jpg', N'departmentimage/career.jpg', N'- Địa điểm: Phòng 101-tòa nhà Delta, Đại học FPT cơ sở Hà Nội<br>
- Fanpage chính thức: https://www.facebook.com/ALUMNI.FPTU<br>
                      https://www.facebook.com/FPTUcareercenter<br>
                      
- Đây là nơi:<br>
+ Quan hệ doanh nghiệp:<br>
● Tổ chức các sự kiện, hoạt động: Company Tour, Jobs fair, Career Talk,...<br>
● Hỗ trợ sinh viên tìm và kết nối các công ty thực tập và doanh nghiệp cần tuyển dụng<br>

+ Quan hệ Cựu sinh viên:<br>
● Cung cấp các thông tin tuyển dụng cho sinh viên, cựu sinh viên thường xuyên qua các kênh truyền thông online : email, website, Facebook, TOPCV...<br>
● Tổ chức các cuộc gặp mặt cựu sinh viên, tổ chức các sự kiện văn hóa, thể thao hàng kỳ/hàng năm : Giải bóng đá cựu sinh viên mở rộng, Home Coming...', N'
- Quan hệ doanh nghiệp:<br>
● Tổ chức các sự kiện, hoạt động; hỗ trợ sinh viên tìm và kết nối các công ty thực tập và doanh nghiệp cần tuyển dụng<br>

+ Quan hệ Cựu sinh viên:<br>
● Cung cấp các thông tin tuyển dụng cho sinh viên, cựu sinh viên ; tổ chức các cuộc gặp mặt cựu sinh viên, tổ chức các sự kiện văn hóa, thể thao hàng kỳ/hàng năm ')
INSERT [dbo].[Department] ([DepId], [DepName], [DepNameAbbreviations], [Email], [Phone], [OpenDay], [Url1], [Url2], [Descriptions], [ShortDescription]) VALUES (5, N'PHÒNG TƯ VẤN TÂM LÝ ĐH FPT HÀ NỘI - CÓC KỂ', N'', N'tuvansinhvien@fpt.edu.vn', N'091 681 62 97', N'Thứ 2 đến thứ 6 hàng tuần', N'departmentimage/cocke1.jpg', N'departmentimage/cocke2.jpg', N'"You share - We care" <br>
BẢO MẬT - CHẤT LƯỢNG - TÔN TRỌNG<br>
Đặt lịch hỗ trợ, tư vấn trực tiếp 1 - 1 với chuyên viên tâm lý bằng cách: <br>
- Điền biểu mẫu đăng kí: <br>
> Nếu là sinh viên ĐH FPT, vui lòng điền theo link: https://goo.gl/moYEFR<br>
> Nếu không phải là sinh viên ĐH FPT, vui lòng điền theo link: https://bit.ly/2X6qtn0<br>
- Đặt lịch tư vấn qua Mail: tuvansinhvien@fpt.edu.vn<br>
- Đến trực tiếp phòng Cóc Kể - 310R nhà Alpha<br>
- Nhắn tin qua page: https://www.facebook.com/tuvantamlyFPT/<br>
- Gọi điện đến Hotline: 0916816297 hoặc 0376383509<br>
Cóc Kể - Nơi bạn luôn được chào đón, lắng nghe và chia sẻ mọi khó khăn của cuộc sống, đặc biệt các vấn đề liên quan đến cuộc sống học đường, Tâm lý, kỹ năng...', N'Cóc Kể - Nơi các bạn sinh viên luôn được chào đón, lắng nghe và chia sẻ mọi khó khăn của cuộc sống, đặc biệt các vấn đề liên quan đến cuộc sống học đường, Tâm lý, kỹ năng...')
INSERT [dbo].[Department] ([DepId], [DepName], [DepNameAbbreviations], [Email], [Phone], [OpenDay], [Url1], [Url2], [Descriptions], [ShortDescription]) VALUES (6, N'THƯ VIỆN TRƯỜNG ĐẠI HỌC FPT', N'', N'fptu.bookclub@gmail.com', N'024 6680 5912', N'Thứ 2 đến thứ 6 hàng tuần', N'departmentimage/thuvien1.jpg', N'departmentimage/thuvien2.jpg', N'- Địa điểm: Tầng 1 – tòa nhà Delta, Đại học FPT cơ sở Hà Nội<br>
- Fanpage chính thức: https://www.facebook.com/fu.bukclub/<br>
- Thư viện trường đại học FPT Hà Nội cung cấp các dịch vụ mượn/trao đổi sách, giáo trình học cho các bạn sinh viên đại học fpt, cũng là 1 đia điểm yên tĩnh để các bạn sinh viên có thể tập trung cùng nhau học tập', N'Thư viện trường đại học FPT Hà Nội cung cấp các dịch vụ mượn/trao đổi sách, giáo trình học cho các bạn sinh viên đại học fpt, cũng là 1 đia điểm yên tĩnh để các bạn sinh viên có thể tập trung cùng nhau học tập')
SET IDENTITY_INSERT [dbo].[Department] OFF
SET IDENTITY_INSERT [dbo].[District] ON 

INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (1, 4, N'abc')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (2, 4, N'ab')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (3, 4, N'bc')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (4, 4, N'Ngô Quyền')
SET IDENTITY_INSERT [dbo].[District] OFF
SET IDENTITY_INSERT [dbo].[EventOfClub] ON 

INSERT [dbo].[EventOfClub] ([EventID], [ClubID], [EventName], [Time], [Description], [Url1]) VALUES (4, 4, N'𝐇𝐀𝐍𝐀𝐌𝐈𝐙𝐀𝐊𝐄 - 𝐉𝐒 𝐁𝐎𝐘𝐒 𝐃𝐀𝐘️', N'19h ngày 13/06/2022', N'Một năm có 365 ngày và ngày mai hẳn là một ngày đặc biệt giành cho các chàng trai JS. <br/>
Đối với CLB, các anh luôn cống hiến hết mình để xây dựng nên một tập thể JS với nhiều thành tích xuất sắc. Trong lòng các chị em JS, đó không chỉ là những “anh hùng coding” mà còn là những chàng trai rất vui tính, ấm áp và sống tình cảm. Chính vì điều đó, Boys’ Day là cơ hội để các chị em JS có thể gửi lời cảm ơn và bày tỏ tấm lòng yêu quý đối với các anh. <br/>
🌤️ Năm 2022, Boys’ Day for JS-ers được tổ chức với tên gọi 𝐇𝐚𝐧𝐚𝐦𝐢𝐳𝐚𝐤𝐞. Ẩn ý đàng sau chiếc tên xinh đẹp này là gì? 𝐇𝐚𝐧𝐚𝐦𝐢 là ngắm hoa, 𝐬𝐚𝐤𝐞 là rượu. Có thể hiểu nôm na 𝐇𝐚𝐧𝐚𝐦𝐢𝐳𝐚𝐤𝐞 nghĩa là uống rượu dưới tán hoa anh đào trong ngày hội thưởng hoa truyền thống của người Nhật Bản. <br/>
🌸 Hoa anh đào là quốc hoa của xứ sở mặt trời mọc, là một biểu tượng, là một phần quan trọng không thể thiếu của người Nhật. Những người đàn ông của đại gia đình JS cũng vậy, họ đóng một vai trò quyết định tạo nên thành công cho JS ở thời điểm hiện tại. <br/>
🥂 Nam nhân thời xưa coi chén rượu là một thứ thi vị của cuộc sống. Rượu là một thứ “tín vật” gắn bó người với người, là chất keo gắn kết những người bằng hữu. <br/>
 “Tay tiên chuốc chén rượu đào <br/>
 Huynh đệ hữu khí tửu vào lời ra.” <br/>
✨ Ngày Boys Day là ngày dành cho những người con trai, người đàn ông, đặc biệt là nam nhân JS, họ vừa có cách làm việc năng nổ như những giọt rượu cháy bỏng, vừa có phong cách sống nhẹ nhàng như những cánh hoa. 𝐇𝐚𝐧𝐚𝐦𝐢𝐳𝐚𝐤𝐞 sẽ đem đến cho các anh những phút giây thư giãn, vui vẻ, đầy ắp tiếng cười song cũng là một kỉ niệm khó phai trong suốt quá trình gắn bó với JS.', N'img/event/hanamizake.jpg')
SET IDENTITY_INSERT [dbo].[EventOfClub] OFF
SET IDENTITY_INSERT [dbo].[Hostels] ON 

INSERT [dbo].[Hostels] ([HostelID], [HostelName], [SellerID], [TotalRoom], [Status], [Floors], [CountryID], [ProvinceID], [DistrictID], [AddressDetail], [RentCost], [Distance], [Descriptions]) VALUES (2, N'A', 1, 18, 1, 3, 1, 4, 4, N'Cay xang 39', 1500.0000, 3, N'')
INSERT [dbo].[Hostels] ([HostelID], [HostelName], [SellerID], [TotalRoom], [Status], [Floors], [CountryID], [ProvinceID], [DistrictID], [AddressDetail], [RentCost], [Distance], [Descriptions]) VALUES (3, N'B', 2, 18, 0, 3, 1, 4, 4, N'Cay xang 39', 1600000.0000, 3, N'                                                                                                                                                                                                        Tien nghi day du
                                    
                                    
                                    
                                    
                                    
                                    
                                    ')
INSERT [dbo].[Hostels] ([HostelID], [HostelName], [SellerID], [TotalRoom], [Status], [Floors], [CountryID], [ProvinceID], [DistrictID], [AddressDetail], [RentCost], [Distance], [Descriptions]) VALUES (4, N'C', 1, 21, 0, 4, 1, 4, 4, N'Cay xang 50', 2000000.0000, 4, N'                                                                                                                        Co nhieu cay xanh                                                                                                         
                                    
                                    
                                    
                                    
                                    
                                    ')
INSERT [dbo].[Hostels] ([HostelID], [HostelName], [SellerID], [TotalRoom], [Status], [Floors], [CountryID], [ProvinceID], [DistrictID], [AddressDetail], [RentCost], [Distance], [Descriptions]) VALUES (6, N'E', 2, 21, 0, 3, 1, 4, 1, N'41 To Vinh Dien', 1500000.0000, 6, N'                                                                                                                        Tien nghi day du nhu dieu hoa, giuong, tu quan ao.
                                    
                                    
                                    ')
INSERT [dbo].[Hostels] ([HostelID], [HostelName], [SellerID], [TotalRoom], [Status], [Floors], [CountryID], [ProvinceID], [DistrictID], [AddressDetail], [RentCost], [Distance], [Descriptions]) VALUES (7, N'F', 1, 6, 0, 3, 1, 4, 2, N'50 To Vinh Dien', 1500000.0000, 3, N'                                            ok okfffffffffffffffffffffffffffffffffffffffffffffffffff fffffffffffffffffffffff ffffffffffffffffff fffffffffffffffff ffffffffff
                                        ')
SET IDENTITY_INSERT [dbo].[Hostels] OFF
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
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([RoleID], [RoleName]) VALUES (1, N'admin')
INSERT [dbo].[Role] ([RoleID], [RoleName]) VALUES (2, N'student')
INSERT [dbo].[Role] ([RoleID], [RoleName]) VALUES (3, N'seller')
INSERT [dbo].[Role] ([RoleID], [RoleName]) VALUES (4, N'club')
SET IDENTITY_INSERT [dbo].[Role] OFF
SET IDENTITY_INSERT [dbo].[Sellers] ON 

INSERT [dbo].[Sellers] ([SellerID], [Avatar], [FirstName], [LastName], [Age], [Phone], [Email], [CountryID], [ProvinceID], [DistrictID], [AddressDetail], [Gender]) VALUES (1, N'imageSeller/1.jpg', N'Pham', N'Thu Hong', 34, N'098765432', N'minkook2909@gmail.com', 1, 23, 1, N'9-Đường 28-Tổ 22-Phường Trần Lãm', 0)
INSERT [dbo].[Sellers] ([SellerID], [Avatar], [FirstName], [LastName], [Age], [Phone], [Email], [CountryID], [ProvinceID], [DistrictID], [AddressDetail], [Gender]) VALUES (2, N'imageSeller/myhoa.jpg', N'Nguyen', N'My Hoa', 36, N'0978480682', N'hoantmhe141105@fpt.edu.vn', 1, 40, 2, N'39-Nguyễn Văn Cừ', 0)
SET IDENTITY_INSERT [dbo].[Sellers] OFF
SET IDENTITY_INSERT [dbo].[Students] ON 

INSERT [dbo].[Students] ([StudentNo], [StudentID], [Avatar], [FirstName], [LastName], [Age], [Phone], [Unit], [Email], [CountryID], [ProvinceID], [AddressDetail], [DistrictID], [Gender]) VALUES (2, N'HE141105', N'imageStudent/8.jpg', N'Nguyễn ', N'Mỹ Hòa', 22, N'0962656682', N'K14', N'nguyenmyhoa120920@gmail.com', 1, 4, N'39-Nguyễn Văn Cừ', 1, 0)
INSERT [dbo].[Students] ([StudentNo], [StudentID], [Avatar], [FirstName], [LastName], [Age], [Phone], [Unit], [Email], [CountryID], [ProvinceID], [AddressDetail], [DistrictID], [Gender]) VALUES (3, N'He141506', NULL, N'Nguyễn', N'Anh Quang', 22, N'0902203663', N'K15', N'anhquang2602@gmail.com', 1, 19, NULL, 2, 0)
SET IDENTITY_INSERT [dbo].[Students] OFF
SET ANSI_PADDING ON
GO
/****** Object:  Index [uniemail]    Script Date: 7/29/2022 11:18:20 PM ******/
ALTER TABLE [dbo].[Admins] ADD  CONSTRAINT [uniemail] UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [unique_email]    Script Date: 7/29/2022 11:18:20 PM ******/
ALTER TABLE [dbo].[Clubs] ADD  CONSTRAINT [unique_email] UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Departme__A9D1053429563FFF]    Script Date: 7/29/2022 11:18:20 PM ******/
ALTER TABLE [dbo].[Department] ADD UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Hostels__652F8571AE055B2F]    Script Date: 7/29/2022 11:18:20 PM ******/
ALTER TABLE [dbo].[Hostels] ADD UNIQUE NONCLUSTERED 
(
	[HostelName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Restaura__D80B7F403C8AF148]    Script Date: 7/29/2022 11:18:20 PM ******/
ALTER TABLE [dbo].[Restaurants] ADD UNIQUE NONCLUSTERED 
(
	[RestaurantName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [uniqueEmail]    Script Date: 7/29/2022 11:18:20 PM ******/
ALTER TABLE [dbo].[Sellers] ADD  CONSTRAINT [uniqueEmail] UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [unique__email]    Script Date: 7/29/2022 11:18:20 PM ******/
ALTER TABLE [dbo].[Students] ADD  CONSTRAINT [unique__email] UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Students__32C52A7871559061]    Script Date: 7/29/2022 11:18:20 PM ******/
ALTER TABLE [dbo].[Students] ADD UNIQUE NONCLUSTERED 
(
	[StudentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Account]  WITH CHECK ADD FOREIGN KEY([RoleID])
REFERENCES [dbo].[Role] ([RoleID])
GO
ALTER TABLE [dbo].[Admins]  WITH CHECK ADD FOREIGN KEY([CountryID])
REFERENCES [dbo].[Country] ([CountryID])
GO
ALTER TABLE [dbo].[Admins]  WITH CHECK ADD FOREIGN KEY([DistrictID])
REFERENCES [dbo].[District] ([DistrictID])
GO
ALTER TABLE [dbo].[Admins]  WITH CHECK ADD FOREIGN KEY([Email])
REFERENCES [dbo].[Account] ([Username])
GO
ALTER TABLE [dbo].[Admins]  WITH CHECK ADD FOREIGN KEY([ProvinceID])
REFERENCES [dbo].[Province] ([ProvinceID])
GO
ALTER TABLE [dbo].[Clubs]  WITH CHECK ADD FOREIGN KEY([Email])
REFERENCES [dbo].[Account] ([Username])
GO
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD FOREIGN KEY([Email])
REFERENCES [dbo].[Account] ([Username])
GO
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD FOREIGN KEY([PostID])
REFERENCES [dbo].[Posts] ([PostID])
GO
ALTER TABLE [dbo].[District]  WITH CHECK ADD FOREIGN KEY([ProvinceID])
REFERENCES [dbo].[Province] ([ProvinceID])
GO
ALTER TABLE [dbo].[EventOfClub]  WITH CHECK ADD FOREIGN KEY([ClubID])
REFERENCES [dbo].[Clubs] ([ClubID])
GO
ALTER TABLE [dbo].[FoodImage]  WITH CHECK ADD FOREIGN KEY([FoodID])
REFERENCES [dbo].[Foods] ([FoodID])
GO
ALTER TABLE [dbo].[Foods]  WITH CHECK ADD FOREIGN KEY([RestaurantID])
REFERENCES [dbo].[Restaurants] ([RestaurantID])
GO
ALTER TABLE [dbo].[HostelImage]  WITH CHECK ADD FOREIGN KEY([HostelID])
REFERENCES [dbo].[Hostels] ([HostelID])
GO
ALTER TABLE [dbo].[Hostels]  WITH CHECK ADD FOREIGN KEY([CountryID])
REFERENCES [dbo].[Country] ([CountryID])
GO
ALTER TABLE [dbo].[Hostels]  WITH CHECK ADD FOREIGN KEY([DistrictID])
REFERENCES [dbo].[District] ([DistrictID])
GO
ALTER TABLE [dbo].[Hostels]  WITH CHECK ADD FOREIGN KEY([ProvinceID])
REFERENCES [dbo].[Province] ([ProvinceID])
GO
ALTER TABLE [dbo].[Hostels]  WITH CHECK ADD FOREIGN KEY([SellerID])
REFERENCES [dbo].[Sellers] ([SellerID])
GO
ALTER TABLE [dbo].[Posts]  WITH CHECK ADD FOREIGN KEY([Email])
REFERENCES [dbo].[Account] ([Username])
GO
ALTER TABLE [dbo].[Province]  WITH CHECK ADD FOREIGN KEY([CountryID])
REFERENCES [dbo].[Country] ([CountryID])
GO
ALTER TABLE [dbo].[ReportComment]  WITH CHECK ADD FOREIGN KEY([CommentID])
REFERENCES [dbo].[Comment] ([CommentID])
GO
ALTER TABLE [dbo].[ReportPost]  WITH CHECK ADD FOREIGN KEY([PostID])
REFERENCES [dbo].[Posts] ([PostID])
GO
ALTER TABLE [dbo].[Restaurants]  WITH CHECK ADD FOREIGN KEY([CountryID])
REFERENCES [dbo].[Country] ([CountryID])
GO
ALTER TABLE [dbo].[Restaurants]  WITH CHECK ADD FOREIGN KEY([DistrictID])
REFERENCES [dbo].[District] ([DistrictID])
GO
ALTER TABLE [dbo].[Restaurants]  WITH CHECK ADD FOREIGN KEY([ProvinceID])
REFERENCES [dbo].[Province] ([ProvinceID])
GO
ALTER TABLE [dbo].[Restaurants]  WITH CHECK ADD FOREIGN KEY([SellerID])
REFERENCES [dbo].[Sellers] ([SellerID])
GO
ALTER TABLE [dbo].[Rooms]  WITH CHECK ADD FOREIGN KEY([HostelID])
REFERENCES [dbo].[Hostels] ([HostelID])
GO
ALTER TABLE [dbo].[Sellers]  WITH CHECK ADD FOREIGN KEY([CountryID])
REFERENCES [dbo].[Country] ([CountryID])
GO
ALTER TABLE [dbo].[Sellers]  WITH CHECK ADD FOREIGN KEY([DistrictID])
REFERENCES [dbo].[District] ([DistrictID])
GO
ALTER TABLE [dbo].[Sellers]  WITH CHECK ADD FOREIGN KEY([Email])
REFERENCES [dbo].[Account] ([Username])
GO
ALTER TABLE [dbo].[Sellers]  WITH CHECK ADD FOREIGN KEY([ProvinceID])
REFERENCES [dbo].[Province] ([ProvinceID])
GO
ALTER TABLE [dbo].[Students]  WITH CHECK ADD FOREIGN KEY([CountryID])
REFERENCES [dbo].[Country] ([CountryID])
GO
ALTER TABLE [dbo].[Students]  WITH CHECK ADD FOREIGN KEY([DistrictID])
REFERENCES [dbo].[District] ([DistrictID])
GO
ALTER TABLE [dbo].[Students]  WITH CHECK ADD FOREIGN KEY([Email])
REFERENCES [dbo].[Account] ([Username])
GO
ALTER TABLE [dbo].[Students]  WITH CHECK ADD FOREIGN KEY([ProvinceID])
REFERENCES [dbo].[Province] ([ProvinceID])
GO
