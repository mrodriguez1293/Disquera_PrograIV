USE [master]
GO
/****** Object:  Database [parcial4]    Script Date: 24-11-2016 16:49:24 ******/
CREATE DATABASE [parcial4]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'parcial4', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\parcial4.mdf' , SIZE = 30720KB , MAXSIZE = UNLIMITED, FILEGROWTH = 10%)
 LOG ON 
( NAME = N'parcial4_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\parcial4_log.ldf' , SIZE = 3072KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [parcial4] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [parcial4].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [parcial4] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [parcial4] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [parcial4] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [parcial4] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [parcial4] SET ARITHABORT OFF 
GO
ALTER DATABASE [parcial4] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [parcial4] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [parcial4] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [parcial4] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [parcial4] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [parcial4] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [parcial4] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [parcial4] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [parcial4] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [parcial4] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [parcial4] SET  DISABLE_BROKER 
GO
ALTER DATABASE [parcial4] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [parcial4] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [parcial4] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [parcial4] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [parcial4] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [parcial4] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [parcial4] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [parcial4] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [parcial4] SET  MULTI_USER 
GO
ALTER DATABASE [parcial4] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [parcial4] SET DB_CHAINING OFF 
GO
ALTER DATABASE [parcial4] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [parcial4] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [parcial4]
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 24-11-2016 16:49:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[__MigrationHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ContextKey] [nvarchar](300) NOT NULL,
	[Model] [varbinary](max) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK_dbo.__MigrationHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC,
	[ContextKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 24-11-2016 16:49:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](128) NOT NULL,
	[Name] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 24-11-2016 16:49:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 24-11-2016 16:49:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](128) NOT NULL,
	[ProviderKey] [nvarchar](128) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC,
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 24-11-2016 16:49:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](128) NOT NULL,
	[RoleId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 24-11-2016 16:49:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](128) NOT NULL,
	[Email] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEndDateUtc] [datetime] NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
	[UserName] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Autor]    Script Date: 24-11-2016 16:49:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Autor](
	[aut_id] [int] IDENTITY(1,1) NOT NULL,
	[aut_nom] [varchar](50) NOT NULL,
	[aut_ape] [varchar](50) NOT NULL,
	[nac_id] [int] NOT NULL,
 CONSTRAINT [PK_Autor] PRIMARY KEY CLUSTERED 
(
	[aut_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Cancion]    Script Date: 24-11-2016 16:49:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Cancion](
	[can_id] [int] IDENTITY(1,1) NOT NULL,
	[can_nom] [varchar](100) NOT NULL,
	[can_dur] [varchar](5) NOT NULL,
	[dis_id] [int] NOT NULL,
 CONSTRAINT [PK_Cancion] PRIMARY KEY CLUSTERED 
(
	[can_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Disco]    Script Date: 24-11-2016 16:49:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Disco](
	[dis_id] [int] IDENTITY(1,1) NOT NULL,
	[dis_alb] [varchar](100) NOT NULL,
	[dis_val] [float] NOT NULL,
	[gen_id] [int] NOT NULL,
	[aut_id] [int] NOT NULL,
 CONSTRAINT [PK_Disco] PRIMARY KEY CLUSTERED 
(
	[dis_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DiscoVenta]    Script Date: 24-11-2016 16:49:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DiscoVenta](
	[dis_id] [int] NOT NULL,
	[ven_id] [int] NOT NULL,
	[dive_can] [int] NOT NULL,
 CONSTRAINT [PK_DiscoVenta] PRIMARY KEY CLUSTERED 
(
	[dis_id] ASC,
	[ven_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Genero]    Script Date: 24-11-2016 16:49:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Genero](
	[gen_id] [int] IDENTITY(1,1) NOT NULL,
	[gen_nom] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Genero] PRIMARY KEY CLUSTERED 
(
	[gen_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Nacionalidad]    Script Date: 24-11-2016 16:49:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Nacionalidad](
	[nac_id] [int] IDENTITY(1,1) NOT NULL,
	[nac_nom] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Nacionalidad] PRIMARY KEY CLUSTERED 
(
	[nac_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 24-11-2016 16:49:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Usuario](
	[usu_rut] [varchar](10) NOT NULL,
	[usu_nom] [varchar](50) NOT NULL,
	[usu_ape] [varchar](50) NOT NULL,
	[asp_id] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_Usuario] PRIMARY KEY CLUSTERED 
(
	[usu_rut] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Venta]    Script Date: 24-11-2016 16:49:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Venta](
	[ven_id] [int] IDENTITY(1,1) NOT NULL,
	[ven_date] [date] NOT NULL,
	[ven_autorizada] [tinyint] NULL,
	[ven_tot] [float] NOT NULL,
	[usu_rut_eje] [varchar](10) NULL,
	[usu_rut_cli] [varchar](10) NOT NULL,
 CONSTRAINT [PK_Venta] PRIMARY KEY CLUSTERED 
(
	[ven_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[__MigrationHistory] ([MigrationId], [ContextKey], [Model], [ProductVersion]) VALUES (N'201611212019512_InitialCreate', N'IdentitySample.Models.ApplicationDbContext', 0x1F8B0800000000000400DD5CDB6EE436127D5F60FF41D0D3EEC269F99219CC1AED044EDBDE3532BE60DA13ECDB802DB1DBC2489422518E8D205F96877C527E618B1275E14D976EB9BB1D0408A645F254B17848168B45FFF9FB1FD3EF9FC3C07AC249EA47E4CC3E9A1CDA16266EE4F96475666774F9CD07FBFBEFFEFEB7E9A5173E5B3F95F54E583D6849D233FB91D2F8D47152F71187289D84BE9B4469B4A413370A1DE445CEF1E1E1BF9DA3230703840D589635FD9411EA8738FF013F671171714C3314DC441E0E52FE1D4AE639AA758B429CC6C8C567F6B587A12D7D99A3300EF0A468605BE7818F4099390E96B685088928A2A0EAE9E714CF691291D53C860F2878788931D45BA220C5BC0BA775F5BEBD393C66BD71EA8625949BA5340A07021E9D70F33872F3B58C6C57E603035EE6C662BDCE8D58DBEF531480016481A7B3206195CFEC9B4AC4791ADF623A291B4E0AC8AB04E07E8992AF9326E281D5BBDD4145A7E3C921FBEFC09A6501CD127C46704613141C58F7D922F0DD1FF1CB43F41593B393A3C5F2E4C3BBF7C83B79FF2D3E79D7EC29F415EA091FE0D37D12C53801DDF0B2EABF6D39623B476E58356BB429AC025C8299615B37E8F923262BFA0873E6F8836D5DF9CFD82BBF70727D263E4C246844930C7EDE6641801601AECA9D5699ECFF2D528FDFBD1F45EA2D7AF257F9D04BF261E22430AF3EE1202F4D1FFDB8985EC2787FE1D5AE922864BF457E15A55FE65196B8AC3391B1CA034A56988ADA4D9D9ABCBD28CDA0C6A77589BAFFD4669AAAF4D656651D5A67269422B63D1B4A7D5F576E6FC69DC7310C5E4E2D669136C269F7AB8904007440890BDBD3B735758EFA52874097FECA2BE16588FC6084A5B087147044967E12E2AA973F44403C4406EB7C8FD2145602EFBF287D6C511DFE3982EA73EC6609A318058EBDBAB4FBC788E0DB2C5C30DE6F4FD66843F3F04B74855C1A259784B5DA18EF63E47E8D327A49BC0B44F167EA9680ECE7831FF60718459D73D7C5697A0564C6DE2C023FBB04BC26F4E478301C5B9D76ED8ACC02E4877A5F445A47BF94556B7F445F43F1490CD5747E499BAA1FA3954FFAA95A5635AB5AD4E85495571BAA2A03EBA729AF695634AFD0A967516B344F2F1FA1F15DBD1C76FF7DBDCD366FD35AD030E31C5648FC1F4C7002CB98778F28C509A947A0CFBAB10B67211F3E26F4D5F7A65CD24F28C8C616B5D66CC81781F167430EBBFFB32157133E3FF91EF34A7A1C80CACA00DFABBEFE6CD53DE724CDB63D1D846E6E5BF876D600D374394FD3088E546C1668425F3C7021EA0F3E9CD51DC5287A234742A06340749F6D79F005FA66CBA4BA231738C0145BE76E111A9CA1D4459E6A46E8903740B17247D52856474444E5FEA5C804A6E3843542EC1094C24CF50955A7854F5C3F4641A795A4963DB730D6F74A865C7281634C98C04E4BF411AE0F8030052A39D2A0745968EA3418D74E4483D76A1AF32E17B61E77252EB1154E76F8CE065E72FFED5588D96EB12D90B3DD247D143006F37641507E56E94B00F9E0B26F04954E4C068272976A2B04152DB603828A267973042D8EA87DC75F3AAFEE1B3DC583F2F6B7F55673ED809B823DF68C9A85EF096D28B4C0894ACF8B052BC4CF547338033DF9F92CE5AEAE4C91FCE60053316453FBBB5A3FD469079149D4065813AD03945F032A40CA841AA05C19CB6BD58E7B110360CBB85B2B2C5FFB25D8060754ECE67568A3A2F9D2542667AFD347D5B38A0D0AC97B1D161A381A42C88B97D8F11E4631C56555C3F4F1858778C38D8EF1C168315087E76A3052D999D1AD5452B3DB4A3A876C884BB6919524F7C960A5B233A35B8973B4DB481AA760805BB09189C42D7CA4C956463AAADDA62A9B3A45A214FF30750C1955D31B14C73E593532ACF8176B5EA457CDBE990F4F3A0A0B0CC74D35B94795B695241A256885A552100D9A5EF9494A2F10450BC4E23C332F54AA69F756C3F25F8A6C6E9FEA2096FB40599BFD5B5CDBC5CB7B61BB55FD110E73059D0C99539347D23514D037B758D21B0A50A209DECFA2200B89D9C732B72EAEF09AED8B2F2AC2D491F4577C28C5608AA72B5ABFD7D8A8F362BC71AABC98F5C7CA0C61B278E983366D6EF24BCD286598AA89620A5DED6CEC4CEECCD0F1929DC5E1C3D589F03AB38B67A83401F8A781188D240705AC51D61F55CC4369628A25FD11A5649326A4543440CB664A89A064B3602D3C8345F535FA4B5093489AE86A697F644D3A49135A53BC06B64667B9AC3FAA26E3A409AC29EE8F5DA79FC8EBE81EEF5FC623CC261B5871D0DD6C073360BCCEA238CE06D8B8CF6F02353E0FC4E237F60A18FFBE9784329EF636215411E2D88C50060CF3FA235C868BCB4FEB0DBE1953B8E11696F8B61B7E33DE30DABE2A3994F39E5CA5925E9DFBA4F3DD949FB5BA9FD52887AFA28A6D956684EDFD25A5389CB00A93F9CFC12CF0315BCCCB0A3788F84B9CD222ABC33E3E3C3A969EE5ECCF1319274DBD40735635BD9311C76C0B095AE40925EE234AD474890D9E91D4A04A24FA9A78F8F9CCFE356F759A0735D8BFF2CF07D675FA99F83F6750F09064D8FA4D4DFF1C27ADBEFDB4B5A78F20FA5BF5FA7F5F8AA607D65D0233E6D43A946CB9CE088B4F2306695334DD409BB51F4CBCDD0925BC46D0A24A1362FDC7070B9F8EF2F0A0D4F21F217AFEE750D5B48F0B3642D43C20180B6F14139A1E08AC83657C1CE0C14F9A3F0E18D659FD63817554333E14F0C97030F99940FF65A86CB9C3AD46732CDAC69294DBB933CD7AA39CCB5DEF4D4A36F646135DCDB81E00B74156F51ACC786309C9A3ED8E9A7CE3D1B07749ED574F32DE97BCE23AE363B7E9C4DBCC206EB91FFA4B250EEF41AA9B267567F7E9C1DBE69A2994BBE73996C39280F78C6C3CA16BF7A9BEDB269B29CCBBE7641B94D0BB675CDBD5FEB963A6F5DE42779E9EAB661A19AE6474B1E0AEF4DB22700E27FC450424283CCAE2D5A43EDFCB24AC268B51605DC52CD49C68260B56268E2257A9D12E76585FF986DFDA595EA75DAC213DB34D365FFF5B65F33AEDB20D498FBB481CD6A61DEA92B93BD6B1B66CA8B794282CF4A4232FBDCB676DBD5F7F4B79C1A31845983D863BE2B793063C8A49C69C3A03D27ED5EB5ED83B1B7F6B11F6EFD45FD510EC2F2F12EC0ABB6655E79A2CA372F396342AAB48119A1B4C91075BEA7942FD25722914B31873FEEC3B8FDBB19B8E05F6AEC95D46E38C429771B8088480177302DAE4E7B9CDA2CED3BB38FF0B26637401D4F4596CFE8EFC90F98157E97DA5890919209877C123BA6C2C298BECAE5E2AA4DB88F404E2E6AB9CA2071CC60180A577648E9EF03ABA01FD3EE215725FEA08A009A47B2044B34F2F7CB44A5098728CBA3DFC040E7BE1F377FF075580685472540000, N'6.1.3-40302')
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'fe4b77bb-e979-4654-8ddb-172b47b967cd', N'Admin')
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'874005f3-b282-4bc2-8206-fedb8b110fa2', N'Cliente')
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'ab8a7ae4-7806-4fe8-ab2f-b8131ea4d7fd', N'Ejecutivo')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'5e4a4624-ab93-4352-966a-7bbe05cf0a3c', N'874005f3-b282-4bc2-8206-fedb8b110fa2')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'f4d9e2a8-5d0e-4c64-86b9-e3d337aef0d6', N'ab8a7ae4-7806-4fe8-ab2f-b8131ea4d7fd')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'83d7699e-a996-4c81-b5df-19ae086505e6', N'fe4b77bb-e979-4654-8ddb-172b47b967cd')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'5e4a4624-ab93-4352-966a-7bbe05cf0a3c', N'cliente@gmail.com', 0, N'ADwfv1sk+PtG+RML2b96yKUItZDFkW5k0L21RRfsLe/iZ0zgalnBTg9kzhqZmbkAvw==', N'0c1927c8-7f21-46d7-bcfd-7eb4d6052ca6', NULL, 0, 0, NULL, 1, 0, N'cliente@gmail.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'83d7699e-a996-4c81-b5df-19ae086505e6', N'admin@disquera.cl', 0, N'ANM1YkYqJss5UDaaXjTAx0ogOi44R1E4CDzzvvbNaZ6sqJzdqPmg0zPn6wpEHDs7Xw==', N'412d1178-f4e3-4a35-b3f3-18d8bf09598d', NULL, 0, 0, NULL, 1, 0, N'admin@disquera.cl')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'f4d9e2a8-5d0e-4c64-86b9-e3d337aef0d6', N'ejecutivo@disquera.cl', 0, N'AEmyq6fAa9B+y8eez1ArfeZPAR2sZqszEA8RoDZp0pHshlp2E4FOiN9U6JoMn5NZEg==', N'85aa0310-9b8c-45eb-a128-3cab2f6d208f', NULL, 0, 0, NULL, 1, 0, N'ejecutivo@disquera.cl')
SET IDENTITY_INSERT [dbo].[Autor] ON 

INSERT [dbo].[Autor] ([aut_id], [aut_nom], [aut_ape], [nac_id]) VALUES (1, N'Beto', N'Cuevas', 1)
SET IDENTITY_INSERT [dbo].[Autor] OFF
SET IDENTITY_INSERT [dbo].[Disco] ON 

INSERT [dbo].[Disco] ([dis_id], [dis_alb], [dis_val], [gen_id], [aut_id]) VALUES (1, N'Adaptación', 19990, 1, 1)
SET IDENTITY_INSERT [dbo].[Disco] OFF
SET IDENTITY_INSERT [dbo].[Genero] ON 

INSERT [dbo].[Genero] ([gen_id], [gen_nom]) VALUES (1, N'Rock')
SET IDENTITY_INSERT [dbo].[Genero] OFF
SET IDENTITY_INSERT [dbo].[Nacionalidad] ON 

INSERT [dbo].[Nacionalidad] ([nac_id], [nac_nom]) VALUES (1, N'Chile')
SET IDENTITY_INSERT [dbo].[Nacionalidad] OFF
SET ANSI_PADDING ON

GO
/****** Object:  Index [RoleNameIndex]    Script Date: 24-11-2016 16:49:25 ******/
CREATE UNIQUE NONCLUSTERED INDEX [RoleNameIndex] ON [dbo].[AspNetRoles]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_UserId]    Script Date: 24-11-2016 16:49:25 ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserClaims]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_UserId]    Script Date: 24-11-2016 16:49:25 ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserLogins]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_RoleId]    Script Date: 24-11-2016 16:49:25 ******/
CREATE NONCLUSTERED INDEX [IX_RoleId] ON [dbo].[AspNetUserRoles]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_UserId]    Script Date: 24-11-2016 16:49:25 ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserRoles]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UserNameIndex]    Script Date: 24-11-2016 16:49:25 ******/
CREATE UNIQUE NONCLUSTERED INDEX [UserNameIndex] ON [dbo].[AspNetUsers]
(
	[UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[Autor]  WITH CHECK ADD  CONSTRAINT [FK_Autor_Nacionalidad] FOREIGN KEY([nac_id])
REFERENCES [dbo].[Nacionalidad] ([nac_id])
GO
ALTER TABLE [dbo].[Autor] CHECK CONSTRAINT [FK_Autor_Nacionalidad]
GO
ALTER TABLE [dbo].[Cancion]  WITH CHECK ADD  CONSTRAINT [FK_Cancion_Disco] FOREIGN KEY([dis_id])
REFERENCES [dbo].[Disco] ([dis_id])
GO
ALTER TABLE [dbo].[Cancion] CHECK CONSTRAINT [FK_Cancion_Disco]
GO
ALTER TABLE [dbo].[Disco]  WITH CHECK ADD  CONSTRAINT [FK_Disco_Autor] FOREIGN KEY([aut_id])
REFERENCES [dbo].[Autor] ([aut_id])
GO
ALTER TABLE [dbo].[Disco] CHECK CONSTRAINT [FK_Disco_Autor]
GO
ALTER TABLE [dbo].[Disco]  WITH CHECK ADD  CONSTRAINT [FK_Disco_Genero] FOREIGN KEY([gen_id])
REFERENCES [dbo].[Genero] ([gen_id])
GO
ALTER TABLE [dbo].[Disco] CHECK CONSTRAINT [FK_Disco_Genero]
GO
ALTER TABLE [dbo].[DiscoVenta]  WITH CHECK ADD  CONSTRAINT [FK_DiscoVenta_Disco] FOREIGN KEY([dis_id])
REFERENCES [dbo].[Disco] ([dis_id])
GO
ALTER TABLE [dbo].[DiscoVenta] CHECK CONSTRAINT [FK_DiscoVenta_Disco]
GO
ALTER TABLE [dbo].[DiscoVenta]  WITH CHECK ADD  CONSTRAINT [FK_DiscoVenta_Venta] FOREIGN KEY([ven_id])
REFERENCES [dbo].[Venta] ([ven_id])
GO
ALTER TABLE [dbo].[DiscoVenta] CHECK CONSTRAINT [FK_DiscoVenta_Venta]
GO
ALTER TABLE [dbo].[Usuario]  WITH CHECK ADD  CONSTRAINT [FK_Usuario_AspNetUsers] FOREIGN KEY([asp_id])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[Usuario] CHECK CONSTRAINT [FK_Usuario_AspNetUsers]
GO
ALTER TABLE [dbo].[Venta]  WITH CHECK ADD  CONSTRAINT [FK_Venta_Usuario] FOREIGN KEY([usu_rut_cli])
REFERENCES [dbo].[Usuario] ([usu_rut])
GO
ALTER TABLE [dbo].[Venta] CHECK CONSTRAINT [FK_Venta_Usuario]
GO
ALTER TABLE [dbo].[Venta]  WITH CHECK ADD  CONSTRAINT [FK_Venta_Usuario1] FOREIGN KEY([usu_rut_eje])
REFERENCES [dbo].[Usuario] ([usu_rut])
GO
ALTER TABLE [dbo].[Venta] CHECK CONSTRAINT [FK_Venta_Usuario1]
GO
USE [master]
GO
ALTER DATABASE [parcial4] SET  READ_WRITE 
GO
