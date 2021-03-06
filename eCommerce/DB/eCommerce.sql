USE [eCommerce]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 7/19/2020 11:49:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CartItems]    Script Date: 7/19/2020 11:49:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CartItems](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CartId] [int] NOT NULL,
	[ProductId] [int] NOT NULL,
	[Quantities] [int] NOT NULL,
	[Price] [int] NOT NULL,
	[ShippingCost] [int] NOT NULL,
	[CreatedAt] [datetime2](7) NULL,
	[UpdateddAt] [datetime2](7) NULL,
	[DeletedAt] [datetime2](7) NULL,
 CONSTRAINT [PK_CartItems] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Carts]    Script Date: 7/19/2020 11:49:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Carts](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NULL,
	[CouponId] [int] NULL,
	[Total] [int] NOT NULL,
	[Fullname] [nvarchar](max) NULL,
	[Phone] [nvarchar](max) NULL,
	[Address] [nvarchar](max) NULL,
	[Status] [int] NOT NULL,
	[CreatedAt] [datetime2](7) NULL,
	[UpdateddAt] [datetime2](7) NULL,
	[DeletedAt] [datetime2](7) NULL,
 CONSTRAINT [PK_Carts] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Comments]    Script Date: 7/19/2020 11:49:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comments](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[ProductId] [int] NOT NULL,
	[Rating] [int] NOT NULL,
	[Image] [nvarchar](max) NULL,
	[Content] [nvarchar](max) NULL,
	[CreatedAt] [datetime2](7) NULL,
	[DeletedAt] [datetime2](7) NULL,
	[UpdatedAt] [datetime2](7) NULL,
 CONSTRAINT [PK_Comments] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Coupons]    Script Date: 7/19/2020 11:49:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Coupons](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Code] [nvarchar](max) NULL,
	[Value] [int] NOT NULL,
	[Status] [bit] NOT NULL,
	[CreatedAt] [datetime2](7) NULL,
	[DeletedAt] [datetime2](7) NULL,
	[UpdatedAt] [datetime2](7) NULL,
 CONSTRAINT [PK_Coupons] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 7/19/2020 11:49:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[Description] [nvarchar](max) NULL,
	[Price] [int] NOT NULL,
	[ShippingCost] [int] NOT NULL,
	[Image] [nvarchar](max) NULL,
	[CreatedAt] [datetime2](7) NULL,
	[DeletedAt] [datetime2](7) NULL,
	[UpdatedAt] [datetime2](7) NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 7/19/2020 11:49:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Email] [nvarchar](max) NULL,
	[Password] [nvarchar](max) NULL,
	[Fullname] [nvarchar](max) NULL,
	[Phone] [nvarchar](max) NULL,
	[Address] [nvarchar](max) NULL,
	[CreatedAt] [datetime2](7) NULL,
	[DeletedAt] [datetime2](7) NULL,
	[UpdatedAt] [datetime2](7) NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20200711004935_CreateUser', N'3.1.5')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20200711034209_CreateCoupon', N'3.1.5')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20200712013507_CreateCart', N'3.1.5')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20200712020147_CreateProduct', N'3.1.5')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20200712021726_CreateCartItem', N'3.1.5')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20200712022243_CreateComment', N'3.1.5')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20200719152305_UpdateTablesFields', N'3.1.5')
GO
SET IDENTITY_INSERT [dbo].[CartItems] ON 

INSERT [dbo].[CartItems] ([Id], [CartId], [ProductId], [Quantities], [Price], [ShippingCost], [CreatedAt], [UpdateddAt], [DeletedAt]) VALUES (2, 2, 1, 10, 100, 10, CAST(N'2020-07-14T22:26:59.0130068' AS DateTime2), CAST(N'2020-07-14T22:26:59.0133188' AS DateTime2), NULL)
INSERT [dbo].[CartItems] ([Id], [CartId], [ProductId], [Quantities], [Price], [ShippingCost], [CreatedAt], [UpdateddAt], [DeletedAt]) VALUES (3, 2, 2, 10, 200, 20, CAST(N'2020-07-14T22:26:59.5986500' AS DateTime2), CAST(N'2020-07-14T22:26:59.5986797' AS DateTime2), NULL)
INSERT [dbo].[CartItems] ([Id], [CartId], [ProductId], [Quantities], [Price], [ShippingCost], [CreatedAt], [UpdateddAt], [DeletedAt]) VALUES (4, 3, 1, 10, 100, 10, CAST(N'2020-07-14T22:31:24.4993477' AS DateTime2), CAST(N'2020-07-14T22:31:24.4993546' AS DateTime2), NULL)
INSERT [dbo].[CartItems] ([Id], [CartId], [ProductId], [Quantities], [Price], [ShippingCost], [CreatedAt], [UpdateddAt], [DeletedAt]) VALUES (5, 4, 1, 10, 100, 10, CAST(N'2020-07-15T00:03:55.5729761' AS DateTime2), CAST(N'2020-07-15T00:03:55.5730908' AS DateTime2), NULL)
INSERT [dbo].[CartItems] ([Id], [CartId], [ProductId], [Quantities], [Price], [ShippingCost], [CreatedAt], [UpdateddAt], [DeletedAt]) VALUES (6, 5, 1, 10, 100, 10, CAST(N'2020-07-15T00:05:15.2621088' AS DateTime2), CAST(N'2020-07-15T00:05:15.2621421' AS DateTime2), NULL)
INSERT [dbo].[CartItems] ([Id], [CartId], [ProductId], [Quantities], [Price], [ShippingCost], [CreatedAt], [UpdateddAt], [DeletedAt]) VALUES (7, 6, 1, 10, 100, 10, CAST(N'2020-07-19T21:46:04.3416207' AS DateTime2), CAST(N'2020-07-19T21:46:04.3418109' AS DateTime2), NULL)
INSERT [dbo].[CartItems] ([Id], [CartId], [ProductId], [Quantities], [Price], [ShippingCost], [CreatedAt], [UpdateddAt], [DeletedAt]) VALUES (8, 7, 1, 1, 100, 10, CAST(N'2020-07-19T21:50:59.9861866' AS DateTime2), CAST(N'2020-07-19T21:50:59.9863499' AS DateTime2), NULL)
INSERT [dbo].[CartItems] ([Id], [CartId], [ProductId], [Quantities], [Price], [ShippingCost], [CreatedAt], [UpdateddAt], [DeletedAt]) VALUES (9, 8, 1, 10, 100, 10, CAST(N'2020-07-19T21:51:42.9524008' AS DateTime2), CAST(N'2020-07-19T21:51:42.9524292' AS DateTime2), NULL)
INSERT [dbo].[CartItems] ([Id], [CartId], [ProductId], [Quantities], [Price], [ShippingCost], [CreatedAt], [UpdateddAt], [DeletedAt]) VALUES (10, 9, 1, 1, 100, 10, CAST(N'2020-07-19T22:52:31.8276245' AS DateTime2), CAST(N'2020-07-19T22:52:31.8277490' AS DateTime2), NULL)
INSERT [dbo].[CartItems] ([Id], [CartId], [ProductId], [Quantities], [Price], [ShippingCost], [CreatedAt], [UpdateddAt], [DeletedAt]) VALUES (11, 10, 1, 10, 100, 10, CAST(N'2020-07-19T22:52:32.3672044' AS DateTime2), CAST(N'2020-07-19T22:52:32.3672114' AS DateTime2), NULL)
INSERT [dbo].[CartItems] ([Id], [CartId], [ProductId], [Quantities], [Price], [ShippingCost], [CreatedAt], [UpdateddAt], [DeletedAt]) VALUES (12, 11, 1, 10, 100, 10, CAST(N'2020-07-19T22:52:36.5861751' AS DateTime2), CAST(N'2020-07-19T22:52:36.5861823' AS DateTime2), NULL)
INSERT [dbo].[CartItems] ([Id], [CartId], [ProductId], [Quantities], [Price], [ShippingCost], [CreatedAt], [UpdateddAt], [DeletedAt]) VALUES (13, 12, 1, 1, 100, 10, CAST(N'2020-07-19T22:59:00.0514101' AS DateTime2), CAST(N'2020-07-19T22:59:00.0515312' AS DateTime2), NULL)
INSERT [dbo].[CartItems] ([Id], [CartId], [ProductId], [Quantities], [Price], [ShippingCost], [CreatedAt], [UpdateddAt], [DeletedAt]) VALUES (14, 13, 1, 10, 100, 10, CAST(N'2020-07-19T22:59:00.5922453' AS DateTime2), CAST(N'2020-07-19T22:59:00.5922515' AS DateTime2), NULL)
INSERT [dbo].[CartItems] ([Id], [CartId], [ProductId], [Quantities], [Price], [ShippingCost], [CreatedAt], [UpdateddAt], [DeletedAt]) VALUES (15, 14, 1, 10, 100, 10, CAST(N'2020-07-19T22:59:04.7168625' AS DateTime2), CAST(N'2020-07-19T22:59:04.7168695' AS DateTime2), NULL)
INSERT [dbo].[CartItems] ([Id], [CartId], [ProductId], [Quantities], [Price], [ShippingCost], [CreatedAt], [UpdateddAt], [DeletedAt]) VALUES (16, 15, 1, 1, 100, 10, CAST(N'2020-07-19T23:02:55.3033931' AS DateTime2), CAST(N'2020-07-19T23:02:55.3035667' AS DateTime2), NULL)
INSERT [dbo].[CartItems] ([Id], [CartId], [ProductId], [Quantities], [Price], [ShippingCost], [CreatedAt], [UpdateddAt], [DeletedAt]) VALUES (17, 16, 1, 10, 100, 10, CAST(N'2020-07-19T23:02:55.8590815' AS DateTime2), CAST(N'2020-07-19T23:02:55.8590885' AS DateTime2), NULL)
INSERT [dbo].[CartItems] ([Id], [CartId], [ProductId], [Quantities], [Price], [ShippingCost], [CreatedAt], [UpdateddAt], [DeletedAt]) VALUES (18, 17, 1, 10, 100, 10, CAST(N'2020-07-19T23:02:59.4321785' AS DateTime2), CAST(N'2020-07-19T23:02:59.4321862' AS DateTime2), NULL)
INSERT [dbo].[CartItems] ([Id], [CartId], [ProductId], [Quantities], [Price], [ShippingCost], [CreatedAt], [UpdateddAt], [DeletedAt]) VALUES (19, 18, 1, 1, 100, 10, CAST(N'2020-07-19T23:46:29.0601274' AS DateTime2), CAST(N'2020-07-19T23:46:29.0602485' AS DateTime2), NULL)
INSERT [dbo].[CartItems] ([Id], [CartId], [ProductId], [Quantities], [Price], [ShippingCost], [CreatedAt], [UpdateddAt], [DeletedAt]) VALUES (20, 19, 1, 10, 100, 10, CAST(N'2020-07-19T23:46:29.5082536' AS DateTime2), CAST(N'2020-07-19T23:46:29.5082602' AS DateTime2), NULL)
INSERT [dbo].[CartItems] ([Id], [CartId], [ProductId], [Quantities], [Price], [ShippingCost], [CreatedAt], [UpdateddAt], [DeletedAt]) VALUES (21, 20, 1, 10, 100, 10, CAST(N'2020-07-19T23:46:33.2125741' AS DateTime2), CAST(N'2020-07-19T23:46:33.2126206' AS DateTime2), NULL)
SET IDENTITY_INSERT [dbo].[CartItems] OFF
GO
SET IDENTITY_INSERT [dbo].[Carts] ON 

INSERT [dbo].[Carts] ([Id], [UserId], [CouponId], [Total], [Fullname], [Phone], [Address], [Status], [CreatedAt], [UpdateddAt], [DeletedAt]) VALUES (1, NULL, NULL, 0, N'Anonymous User', N'123456', N'123 King St', 0, CAST(N'2020-07-14T22:24:58.2626839' AS DateTime2), CAST(N'2020-07-14T22:24:58.2631501' AS DateTime2), NULL)
INSERT [dbo].[Carts] ([Id], [UserId], [CouponId], [Total], [Fullname], [Phone], [Address], [Status], [CreatedAt], [UpdateddAt], [DeletedAt]) VALUES (2, NULL, NULL, 3030, N'Anonymous User', N'123456', N'123 King St', 0, CAST(N'2020-07-14T22:26:58.0793839' AS DateTime2), CAST(N'2020-07-14T22:26:58.0795579' AS DateTime2), NULL)
INSERT [dbo].[Carts] ([Id], [UserId], [CouponId], [Total], [Fullname], [Phone], [Address], [Status], [CreatedAt], [UpdateddAt], [DeletedAt]) VALUES (3, 2, NULL, 1010, N'Kitchener Waterloo', N'(226) 123-4567', N'123 King St', 0, CAST(N'2020-07-14T22:31:24.4594601' AS DateTime2), CAST(N'2020-07-14T22:31:24.4595045' AS DateTime2), NULL)
INSERT [dbo].[Carts] ([Id], [UserId], [CouponId], [Total], [Fullname], [Phone], [Address], [Status], [CreatedAt], [UpdateddAt], [DeletedAt]) VALUES (4, NULL, NULL, 1010, N'Anonymous User', N'123456', N'123 King St', 0, CAST(N'2020-07-15T00:03:55.1942762' AS DateTime2), CAST(N'2020-07-15T00:03:55.1947253' AS DateTime2), NULL)
INSERT [dbo].[Carts] ([Id], [UserId], [CouponId], [Total], [Fullname], [Phone], [Address], [Status], [CreatedAt], [UpdateddAt], [DeletedAt]) VALUES (5, NULL, 2, 1000, N'Anonymous User 123', N'123456', N'123 King St', 0, CAST(N'2020-07-15T00:05:15.2197191' AS DateTime2), CAST(N'2020-07-15T00:05:15.2197617' AS DateTime2), NULL)
INSERT [dbo].[Carts] ([Id], [UserId], [CouponId], [Total], [Fullname], [Phone], [Address], [Status], [CreatedAt], [UpdateddAt], [DeletedAt]) VALUES (6, 2, NULL, 1010, N'Kitchener Waterloo', N'(226) 123-4567', N'123 King St', 0, CAST(N'2020-07-19T21:46:03.9713601' AS DateTime2), CAST(N'2020-07-19T21:46:03.9715708' AS DateTime2), NULL)
INSERT [dbo].[Carts] ([Id], [UserId], [CouponId], [Total], [Fullname], [Phone], [Address], [Status], [CreatedAt], [UpdateddAt], [DeletedAt]) VALUES (7, NULL, NULL, 110, N'Anonymous User', N'123456', N'123 King St', 0, CAST(N'2020-07-19T21:50:59.4491131' AS DateTime2), CAST(N'2020-07-19T21:50:59.4493555' AS DateTime2), NULL)
INSERT [dbo].[Carts] ([Id], [UserId], [CouponId], [Total], [Fullname], [Phone], [Address], [Status], [CreatedAt], [UpdateddAt], [DeletedAt]) VALUES (8, NULL, 2, 1000, N'Anonymous User', N'123456', N'123 King St', 0, CAST(N'2020-07-19T21:51:42.8920775' AS DateTime2), CAST(N'2020-07-19T21:51:42.8921192' AS DateTime2), NULL)
INSERT [dbo].[Carts] ([Id], [UserId], [CouponId], [Total], [Fullname], [Phone], [Address], [Status], [CreatedAt], [UpdateddAt], [DeletedAt]) VALUES (9, 2, NULL, 110, N'Anonymous User', N'123456', N'123 King St', 0, CAST(N'2020-07-19T22:52:31.4669965' AS DateTime2), CAST(N'2020-07-19T22:52:31.4671667' AS DateTime2), NULL)
INSERT [dbo].[Carts] ([Id], [UserId], [CouponId], [Total], [Fullname], [Phone], [Address], [Status], [CreatedAt], [UpdateddAt], [DeletedAt]) VALUES (10, 2, 2, 1000, N'Anonymous User', N'123456', N'123 King St', 0, CAST(N'2020-07-19T22:52:32.3107526' AS DateTime2), CAST(N'2020-07-19T22:52:32.3107586' AS DateTime2), NULL)
INSERT [dbo].[Carts] ([Id], [UserId], [CouponId], [Total], [Fullname], [Phone], [Address], [Status], [CreatedAt], [UpdateddAt], [DeletedAt]) VALUES (11, NULL, NULL, 1010, N'Kitchener Waterloo', N'(226) 123-4567', N'123 King St', 0, CAST(N'2020-07-19T22:52:36.5765498' AS DateTime2), CAST(N'2020-07-19T22:52:36.5765927' AS DateTime2), NULL)
INSERT [dbo].[Carts] ([Id], [UserId], [CouponId], [Total], [Fullname], [Phone], [Address], [Status], [CreatedAt], [UpdateddAt], [DeletedAt]) VALUES (12, 2, NULL, 110, N'Anonymous User', N'123456', N'123 King St', 0, CAST(N'2020-07-19T22:58:59.8532564' AS DateTime2), CAST(N'2020-07-19T22:58:59.8533988' AS DateTime2), NULL)
INSERT [dbo].[Carts] ([Id], [UserId], [CouponId], [Total], [Fullname], [Phone], [Address], [Status], [CreatedAt], [UpdateddAt], [DeletedAt]) VALUES (13, 2, 2, 1000, N'Anonymous User', N'123456', N'123 King St', 0, CAST(N'2020-07-19T22:59:00.5188518' AS DateTime2), CAST(N'2020-07-19T22:59:00.5188591' AS DateTime2), NULL)
INSERT [dbo].[Carts] ([Id], [UserId], [CouponId], [Total], [Fullname], [Phone], [Address], [Status], [CreatedAt], [UpdateddAt], [DeletedAt]) VALUES (14, 2, NULL, 1010, N'Kitchener Waterloo', N'(226) 123-4567', N'123 King St', 0, CAST(N'2020-07-19T22:59:04.6902792' AS DateTime2), CAST(N'2020-07-19T22:59:04.6903315' AS DateTime2), NULL)
INSERT [dbo].[Carts] ([Id], [UserId], [CouponId], [Total], [Fullname], [Phone], [Address], [Status], [CreatedAt], [UpdateddAt], [DeletedAt]) VALUES (15, NULL, NULL, 110, N'Anonymous User', N'123456', N'123 King St', 0, CAST(N'2020-07-19T23:02:54.8927003' AS DateTime2), CAST(N'2020-07-19T23:02:54.8929215' AS DateTime2), NULL)
INSERT [dbo].[Carts] ([Id], [UserId], [CouponId], [Total], [Fullname], [Phone], [Address], [Status], [CreatedAt], [UpdateddAt], [DeletedAt]) VALUES (16, NULL, 2, 1000, N'Anonymous User', N'123456', N'123 King St', 0, CAST(N'2020-07-19T23:02:55.7975710' AS DateTime2), CAST(N'2020-07-19T23:02:55.7975773' AS DateTime2), NULL)
INSERT [dbo].[Carts] ([Id], [UserId], [CouponId], [Total], [Fullname], [Phone], [Address], [Status], [CreatedAt], [UpdateddAt], [DeletedAt]) VALUES (17, 2, NULL, 1010, N'Kitchener Waterloo', N'(226) 123-4567', N'123 King St', 3, CAST(N'2020-07-19T23:02:59.4196905' AS DateTime2), CAST(N'2020-07-19T23:02:59.4197355' AS DateTime2), NULL)
INSERT [dbo].[Carts] ([Id], [UserId], [CouponId], [Total], [Fullname], [Phone], [Address], [Status], [CreatedAt], [UpdateddAt], [DeletedAt]) VALUES (18, NULL, NULL, 110, N'Anonymous User', N'123456', N'123 King St', 0, CAST(N'2020-07-19T23:46:28.6585531' AS DateTime2), CAST(N'2020-07-19T23:46:28.6587764' AS DateTime2), NULL)
INSERT [dbo].[Carts] ([Id], [UserId], [CouponId], [Total], [Fullname], [Phone], [Address], [Status], [CreatedAt], [UpdateddAt], [DeletedAt]) VALUES (19, NULL, 2, 1000, N'Anonymous User', N'123456', N'123 King St', 0, CAST(N'2020-07-19T23:46:29.4636033' AS DateTime2), CAST(N'2020-07-19T23:46:29.4636098' AS DateTime2), NULL)
INSERT [dbo].[Carts] ([Id], [UserId], [CouponId], [Total], [Fullname], [Phone], [Address], [Status], [CreatedAt], [UpdateddAt], [DeletedAt]) VALUES (20, 2, NULL, 1010, N'Kitchener Waterloo', N'(226) 123-4567', N'123 King St', 0, CAST(N'2020-07-19T23:46:33.1787161' AS DateTime2), CAST(N'2020-07-19T23:46:33.1787624' AS DateTime2), NULL)
SET IDENTITY_INSERT [dbo].[Carts] OFF
GO
SET IDENTITY_INSERT [dbo].[Comments] ON 

INSERT [dbo].[Comments] ([Id], [UserId], [ProductId], [Rating], [Image], [Content], [CreatedAt], [DeletedAt], [UpdatedAt]) VALUES (1, 2, 2, 4, NULL, N'sick sandals', CAST(N'2020-07-19T20:54:36.4582131' AS DateTime2), NULL, CAST(N'2020-07-19T20:54:36.4583874' AS DateTime2))
INSERT [dbo].[Comments] ([Id], [UserId], [ProductId], [Rating], [Image], [Content], [CreatedAt], [DeletedAt], [UpdatedAt]) VALUES (2, 2, 1, 4, NULL, N'sick sandals', CAST(N'2020-07-19T21:33:45.7461359' AS DateTime2), NULL, CAST(N'2020-07-19T21:33:45.7463718' AS DateTime2))
INSERT [dbo].[Comments] ([Id], [UserId], [ProductId], [Rating], [Image], [Content], [CreatedAt], [DeletedAt], [UpdatedAt]) VALUES (3, 2, 1, 4, NULL, N'sick sandals', CAST(N'2020-07-19T21:37:10.6830927' AS DateTime2), NULL, CAST(N'2020-07-19T21:37:10.6831817' AS DateTime2))
INSERT [dbo].[Comments] ([Id], [UserId], [ProductId], [Rating], [Image], [Content], [CreatedAt], [DeletedAt], [UpdatedAt]) VALUES (4, 2, 1, 4, NULL, N'sick sandals', CAST(N'2020-07-19T21:37:39.7510838' AS DateTime2), NULL, CAST(N'2020-07-19T21:37:39.7511131' AS DateTime2))
INSERT [dbo].[Comments] ([Id], [UserId], [ProductId], [Rating], [Image], [Content], [CreatedAt], [DeletedAt], [UpdatedAt]) VALUES (5, 2, 1, 4, NULL, N'sick sandals', CAST(N'2020-07-19T21:37:50.9124399' AS DateTime2), NULL, CAST(N'2020-07-19T21:37:50.9124892' AS DateTime2))
INSERT [dbo].[Comments] ([Id], [UserId], [ProductId], [Rating], [Image], [Content], [CreatedAt], [DeletedAt], [UpdatedAt]) VALUES (6, 2, 1, 4, NULL, N'sick sandals', CAST(N'2020-07-19T21:38:04.4467380' AS DateTime2), NULL, CAST(N'2020-07-19T21:38:04.4467662' AS DateTime2))
INSERT [dbo].[Comments] ([Id], [UserId], [ProductId], [Rating], [Image], [Content], [CreatedAt], [DeletedAt], [UpdatedAt]) VALUES (7, 2, 1, 4, NULL, N'sick sandals', CAST(N'2020-07-19T21:46:04.9791685' AS DateTime2), NULL, CAST(N'2020-07-19T21:46:04.9794772' AS DateTime2))
INSERT [dbo].[Comments] ([Id], [UserId], [ProductId], [Rating], [Image], [Content], [CreatedAt], [DeletedAt], [UpdatedAt]) VALUES (8, 2, 1, 4, NULL, N'sick sandals', CAST(N'2020-07-19T22:52:37.1795196' AS DateTime2), NULL, CAST(N'2020-07-19T22:52:37.1797130' AS DateTime2))
INSERT [dbo].[Comments] ([Id], [UserId], [ProductId], [Rating], [Image], [Content], [CreatedAt], [DeletedAt], [UpdatedAt]) VALUES (9, 2, 1, 4, NULL, N'sick sandals', CAST(N'2020-07-19T22:59:05.3617111' AS DateTime2), NULL, CAST(N'2020-07-19T22:59:05.3618902' AS DateTime2))
INSERT [dbo].[Comments] ([Id], [UserId], [ProductId], [Rating], [Image], [Content], [CreatedAt], [DeletedAt], [UpdatedAt]) VALUES (10, 2, 1, 4, NULL, N'sick sandals', CAST(N'2020-07-19T23:02:59.9088372' AS DateTime2), NULL, CAST(N'2020-07-19T23:02:59.9091964' AS DateTime2))
INSERT [dbo].[Comments] ([Id], [UserId], [ProductId], [Rating], [Image], [Content], [CreatedAt], [DeletedAt], [UpdatedAt]) VALUES (11, 2, 1, 4, NULL, N'sick sandals', CAST(N'2020-07-19T23:46:33.8136456' AS DateTime2), NULL, CAST(N'2020-07-19T23:46:33.8138827' AS DateTime2))
SET IDENTITY_INSERT [dbo].[Comments] OFF
GO
SET IDENTITY_INSERT [dbo].[Coupons] ON 

INSERT [dbo].[Coupons] ([Id], [Code], [Value], [Status], [CreatedAt], [DeletedAt], [UpdatedAt]) VALUES (2, N'X10', 10, 1, CAST(N'2020-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL)
SET IDENTITY_INSERT [dbo].[Coupons] OFF
GO
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [ShippingCost], [Image], [CreatedAt], [DeletedAt], [UpdatedAt]) VALUES (1, N'Product 1', N'Product 1', 100, 10, NULL, CAST(N'2020-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [ShippingCost], [Image], [CreatedAt], [DeletedAt], [UpdatedAt]) VALUES (2, N'Product 2', N'Product 2', 200, 20, NULL, CAST(N'2020-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [ShippingCost], [Image], [CreatedAt], [DeletedAt], [UpdatedAt]) VALUES (3, N'Product 3', N'Product 3', 300, 30, NULL, CAST(N'2020-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL)
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([Id], [Email], [Password], [Fullname], [Phone], [Address], [CreatedAt], [DeletedAt], [UpdatedAt]) VALUES (2, N'a@gmail.com', N'AAAAAQAAJxAAAAAQvaRvnrC1pm1aC5NS+RNUXN+vaVuno4sQHhx8bxQUfR1NL3SxJbmMRgwr0XZY9ZF2', N'Nguyen Van A', N'123-456-789', N'King A1B 2C3', CAST(N'2020-01-01T00:00:00.0000000' AS DateTime2), CAST(N'2020-01-01T00:00:00.0000000' AS DateTime2), CAST(N'2020-07-19T23:46:31.6328483' AS DateTime2))
INSERT [dbo].[Users] ([Id], [Email], [Password], [Fullname], [Phone], [Address], [CreatedAt], [DeletedAt], [UpdatedAt]) VALUES (3, N'b@gmail.com', N'AAAAAQAAJxAAAAAQGrYq7sXccmybxmWx+UYhq6/b2VS6uvPYJcstnC82BVusG9g+NiQXZd0AlSME/On6', N'Nguyen A', N'226 123 456', N'123 King St', CAST(N'2020-01-01T00:00:00.0000000' AS DateTime2), CAST(N'2020-01-01T00:00:00.0000000' AS DateTime2), NULL)
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
ALTER TABLE [dbo].[Carts] ADD  DEFAULT ((0)) FOR [Total]
GO
ALTER TABLE [dbo].[Carts] ADD  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[Products] ADD  DEFAULT ((0)) FOR [Price]
GO
ALTER TABLE [dbo].[Products] ADD  DEFAULT ((0)) FOR [ShippingCost]
GO
ALTER TABLE [dbo].[CartItems]  WITH CHECK ADD  CONSTRAINT [FK_CartItems_Carts_CartId] FOREIGN KEY([CartId])
REFERENCES [dbo].[Carts] ([Id])
GO
ALTER TABLE [dbo].[CartItems] CHECK CONSTRAINT [FK_CartItems_Carts_CartId]
GO
ALTER TABLE [dbo].[CartItems]  WITH CHECK ADD  CONSTRAINT [FK_CartItems_Products_ProductId] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([Id])
GO
ALTER TABLE [dbo].[CartItems] CHECK CONSTRAINT [FK_CartItems_Products_ProductId]
GO
ALTER TABLE [dbo].[Carts]  WITH CHECK ADD  CONSTRAINT [FK_Carts_Coupons_CouponId] FOREIGN KEY([CouponId])
REFERENCES [dbo].[Coupons] ([Id])
GO
ALTER TABLE [dbo].[Carts] CHECK CONSTRAINT [FK_Carts_Coupons_CouponId]
GO
ALTER TABLE [dbo].[Carts]  WITH CHECK ADD  CONSTRAINT [FK_Carts_Users_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Carts] CHECK CONSTRAINT [FK_Carts_Users_UserId]
GO
ALTER TABLE [dbo].[Comments]  WITH CHECK ADD  CONSTRAINT [FK_Comments_Products_ProductId] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([Id])
GO
ALTER TABLE [dbo].[Comments] CHECK CONSTRAINT [FK_Comments_Products_ProductId]
GO
ALTER TABLE [dbo].[Comments]  WITH CHECK ADD  CONSTRAINT [FK_Comments_Users_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Comments] CHECK CONSTRAINT [FK_Comments_Users_UserId]
GO
