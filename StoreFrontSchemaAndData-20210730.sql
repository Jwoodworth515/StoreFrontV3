/*    ==Scripting Parameters==

    Source Server Version : SQL Server 2016 (13.0.5026)
    Source Database Engine Edition : Microsoft SQL Server Express Edition
    Source Database Engine Type : Standalone SQL Server

    Target Server Version : SQL Server 2017
    Target Database Engine Edition : Microsoft SQL Server Standard Edition
    Target Database Engine Type : Standalone SQL Server
*/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserDetails]') AND type in (N'U'))
ALTER TABLE [dbo].[UserDetails] DROP CONSTRAINT IF EXISTS [FK_UserDetails_AspNetUsers]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Guitars]') AND type in (N'U'))
ALTER TABLE [dbo].[Guitars] DROP CONSTRAINT IF EXISTS [FK_Guitars_GuitarInventory]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Guitars]') AND type in (N'U'))
ALTER TABLE [dbo].[Guitars] DROP CONSTRAINT IF EXISTS [FK_Guitars_Guitar Category]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Guitars]') AND type in (N'U'))
ALTER TABLE [dbo].[Guitars] DROP CONSTRAINT IF EXISTS [FK_Guitars_Department]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Guitars]') AND type in (N'U'))
ALTER TABLE [dbo].[Guitars] DROP CONSTRAINT IF EXISTS [FK_Guitars_Brand]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Employees]') AND type in (N'U'))
ALTER TABLE [dbo].[Employees] DROP CONSTRAINT IF EXISTS [FK_Employees_Department]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]') AND type in (N'U'))
ALTER TABLE [dbo].[AspNetUserRoles] DROP CONSTRAINT IF EXISTS [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]') AND type in (N'U'))
ALTER TABLE [dbo].[AspNetUserRoles] DROP CONSTRAINT IF EXISTS [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserLogins]') AND type in (N'U'))
ALTER TABLE [dbo].[AspNetUserLogins] DROP CONSTRAINT IF EXISTS [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserClaims]') AND type in (N'U'))
ALTER TABLE [dbo].[AspNetUserClaims] DROP CONSTRAINT IF EXISTS [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]
GO
/****** Object:  Table [dbo].[UserDetails]    Script Date: 7/30/2021 2:51:33 PM ******/
DROP TABLE IF EXISTS [dbo].[UserDetails]
GO
/****** Object:  Table [dbo].[Guitars]    Script Date: 7/30/2021 2:51:33 PM ******/
DROP TABLE IF EXISTS [dbo].[Guitars]
GO
/****** Object:  Table [dbo].[GuitarInventory]    Script Date: 7/30/2021 2:51:33 PM ******/
DROP TABLE IF EXISTS [dbo].[GuitarInventory]
GO
/****** Object:  Table [dbo].[Guitar Category]    Script Date: 7/30/2021 2:51:33 PM ******/
DROP TABLE IF EXISTS [dbo].[Guitar Category]
GO
/****** Object:  Table [dbo].[Employees]    Script Date: 7/30/2021 2:51:33 PM ******/
DROP TABLE IF EXISTS [dbo].[Employees]
GO
/****** Object:  Table [dbo].[Department]    Script Date: 7/30/2021 2:51:33 PM ******/
DROP TABLE IF EXISTS [dbo].[Department]
GO
/****** Object:  Table [dbo].[Brand]    Script Date: 7/30/2021 2:51:33 PM ******/
DROP TABLE IF EXISTS [dbo].[Brand]
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 7/30/2021 2:51:33 PM ******/
DROP TABLE IF EXISTS [dbo].[AspNetUsers]
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 7/30/2021 2:51:33 PM ******/
DROP TABLE IF EXISTS [dbo].[AspNetUserRoles]
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 7/30/2021 2:51:33 PM ******/
DROP TABLE IF EXISTS [dbo].[AspNetUserLogins]
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 7/30/2021 2:51:33 PM ******/
DROP TABLE IF EXISTS [dbo].[AspNetUserClaims]
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 7/30/2021 2:51:33 PM ******/
DROP TABLE IF EXISTS [dbo].[AspNetRoles]
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 7/30/2021 2:51:33 PM ******/
DROP TABLE IF EXISTS [dbo].[__MigrationHistory]
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 7/30/2021 2:51:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[__MigrationHistory]') AND type in (N'U'))
BEGIN
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
END
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 7/30/2021 2:51:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetRoles]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](128) NOT NULL,
	[Name] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 7/30/2021 2:51:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserClaims]') AND type in (N'U'))
BEGIN
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
END
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 7/30/2021 2:51:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserLogins]') AND type in (N'U'))
BEGIN
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
END
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 7/30/2021 2:51:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](128) NOT NULL,
	[RoleId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 7/30/2021 2:51:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUsers]') AND type in (N'U'))
BEGIN
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
END
GO
/****** Object:  Table [dbo].[Brand]    Script Date: 7/30/2021 2:51:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Brand]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Brand](
	[BrandID] [int] IDENTITY(1,1) NOT NULL,
	[BrandName] [char](20) NOT NULL,
	[City] [char](20) NOT NULL,
	[State] [char](2) NULL,
	[Country] [char](30) NOT NULL,
 CONSTRAINT [PK_Brand] PRIMARY KEY CLUSTERED 
(
	[BrandID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Department]    Script Date: 7/30/2021 2:51:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Department]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Department](
	[DeptID] [int] IDENTITY(1,1) NOT NULL,
	[DeptName] [nchar](10) NOT NULL,
 CONSTRAINT [PK_Department] PRIMARY KEY CLUSTERED 
(
	[DeptID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Employees]    Script Date: 7/30/2021 2:51:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Employees]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Employees](
	[EmpID] [int] IDENTITY(1,1) NOT NULL,
	[FName] [nchar](20) NOT NULL,
	[LName] [nchar](20) NOT NULL,
	[DeptID] [int] NOT NULL,
	[DirectReport] [varchar](20) NULL,
	[HireDate] [date] NULL,
	[Salary] [decimal](18, 0) NULL,
 CONSTRAINT [PK_Employees] PRIMARY KEY CLUSTERED 
(
	[EmpID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Guitar Category]    Script Date: 7/30/2021 2:51:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Guitar Category]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Guitar Category](
	[GuitarCategoryID] [int] IDENTITY(1,1) NOT NULL,
	[GuitarCategory] [nvarchar](20) NULL,
 CONSTRAINT [PK_Guitar Category] PRIMARY KEY CLUSTERED 
(
	[GuitarCategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[GuitarInventory]    Script Date: 7/30/2021 2:51:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GuitarInventory]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[GuitarInventory](
	[GuitarInventoryID] [int] IDENTITY(1,1) NOT NULL,
	[GuitarInventoryName] [char](20) NOT NULL,
 CONSTRAINT [PK_GuitarInventory] PRIMARY KEY CLUSTERED 
(
	[GuitarInventoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Guitars]    Script Date: 7/30/2021 2:51:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Guitars]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Guitars](
	[GuitarID] [int] IDENTITY(1,1) NOT NULL,
	[GuitarModel] [varchar](50) NOT NULL,
	[GuitarDescription] [nvarchar](max) NULL,
	[GuitarImage] [varchar](100) NULL,
	[Price] [money] NULL,
	[UnitsInStock] [int] NULL,
	[UnitsOnOrder] [int] NULL,
	[UnitsSold] [int] NULL,
	[ProductionDate] [date] NOT NULL,
	[BrandID] [int] NULL,
	[GuitarInventoryID] [int] NOT NULL,
	[GuitarCategory] [int] NOT NULL,
	[DeptID] [int] NOT NULL,
 CONSTRAINT [PK_Guitars] PRIMARY KEY CLUSTERED 
(
	[GuitarID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[UserDetails]    Script Date: 7/30/2021 2:51:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserDetails]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[UserDetails](
	[UserID] [nvarchar](128) NOT NULL,
	[FirstName] [varchar](50) NOT NULL,
	[LastName] [varchar](75) NOT NULL,
 CONSTRAINT [PK_UserDetails] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
INSERT [dbo].[__MigrationHistory] ([MigrationId], [ContextKey], [Model], [ProductVersion]) VALUES (N'202107101633333_InitialCreate', N'StoreFrontV3.UI.MVC.Models.ApplicationDbContext', 0x1F8B0800000000000400DD5CDB6EE336107D2FD07F10F4D416592B97EE621BD82D52276983E68675B2E8DB82966847588952252A9BA0E897F5A19FD45FE850A26EBCE8622BB6531428D6E2F0CC7038430E87C3FCFBF73FE39F9E7CCF78C451EC0664621E8CF64D03133B705CB29C98095DBC796FFEF4E3D75F8DCF1CFFC9F898D31D313AE849E289F94069786C59B1FD807D148F7CD78E823858D0911DF8167202EB707FFF07EBE0C0C200610296618C3F2484BA3E4E7FC0CF69406C1CD20479578183BD987F8796598A6A5C231FC721B2F1C49CD120C2E75140E8C7A3D1FDC5E8EAE37494F5328D13CF4520D10C7B0BD3408404145190F7F83EC6330A5D96B3103E20EFEE39C440B7405E8CF9388E4BF2AE43DA3F6443B2CA8E39949DC434F07B021E1C711D5962F795346D163A042D9E81B6E9331B75AAC98979E1E0F4D387C00305880C8FA75EC48827E655C1E2240EAF311DE51D4719E47904705F82E8F3A88AB86774EEB757D8D4E1689FFDB7674C138F26119E109CD008797BC66D32F75CFB37FC7C177CC6647274305F1CBD7FFB0E3947EFBEC7476FAB2385B1025DED037CBA8D821047201B5E14E3370DABDECF123B16DD2A7D32AD802D817B98C6157ABAC464491FC0710EDF9BC6B9FB849DFC0B37AE7BE2823741271A25F0F33AF13C34F770D16E35F264FF6FE07AF8F6DD205CAFD1A3BB4CA75EE00F8E13815F7DC05EDA1A3FB861E65EB5F9FEC4C9C02B7DF6BB6E5F59EBA7599044361B4CA025B943D112D3BA7463AB34DE4E26CDA08637EB1C75F74D9B492A9BB792940D68154FC8596CDA1B72795F966F678B3B094398BCD4B498469A0C4EBF698D04943D43415B9AD24157532230C4FFF3CA78E623D71B6069ECC005A293851BF9B818E5CF01182222BD65BE45710C2B83F32B8A1F1A44877F0E20FA0CDB4904063BA3C80F5F9CDBED4340F075E2CF991F6C8ED7605373F72538473678DE1961BDD6C6BB0CECCF4142CF88738A28BEA7760EC87EDEB97E778041C439B16D1CC7E760CCD89906107CE78017841E1DF686630BD5B64393A9875C5F1D9B084BEAA79CB48C4FD414528CA22153C5294DA25E064B9774133527D58B9A51B48ACAC9FA8ACAC0BA49CA29F582A604AD72665483457EE90C0D1FFAA5B0BB1FFBADB779EBD6828A1AD3D8E4174C7004CB98738B28C5112967A0CBBAB18D60219D3EC6F4C5F7A694D347E42543B35AC91BD24560786F486177DF1B5231E1F3A3EBB0A8A4C381282706F84EF4EAB356BBCF09926DDA1D6AC3DC34F3CDAC013A773989E3C076532F50A4C27822A32E3FC470467B56231B8D9819818181A1BB6CCB832F30365334AA1B728A3D4CB1716267A9C2298A6DE4C86A8401393D04CB775485606586A42EDC77124FB0741CB14E881D8262F0549750D92D5C62BB21F25AB524F4ECB885B1B1173CC496531C62C218B66AA20B737542840950F01126A54D4363AB6271CD86A8895A7573DE16C296F32EE5293662932DB1B3C62E79FCF62286D9ACB10D1867B34ABA08A04DEE6DC340F959A5AB018807975D3350E1C4A431501E526DC440EB1ADB8281D655F2EA0C343BA2769D7FE1BCBA6BE6593F286F7E5B6F54D7166CB3A68F1D33CD2CF6843E147AE04836CFD3396BC44F5471380339F9F92CE6A1AE68220C7C86693D6553C6BBCA38D46A06118DA809B034B416507E2D2801490ED543B83C97D7281D8F227AC0E679B74658BEF60BB0151B90B1ABD7A31542FD25AA689C9D4E1FC5C80A6B908CBCD361A182A3300871F1AA0FBC835274795959315D62E13ED17065607C321A14D412B96A94940F66702DE5A6D9AE255540D627245B4B4B42F8A4D1523E98C1B5C46DB45D498AA0A04758B0968AEA5BF840CE96673A8ADDA6681B5B59F514FF30B6346556E32B14862E5956CAAEF8176396D55C4DDFCCFA1721F9198665C78A5AA442DA82130D22B4C4422BB00649CFDD28A6A788A23962799EA9E34B64CABD55B3FCE72CABDBA73C89F93E9053B37FF39B55FD657E6DCF9583128E750E23F55964932229EC40DDDD60E570C8439122833F0DBCC427FA404BDF3BBBC7ABF6CFBEC808634B905F0AA424AD49E16E7D0A3A4D90EC1C034F5611CFAC3E617A089DDAF368B4AA785D84AA47C9135655145D126B6B13A80B6C569A343176EC3F67AD082FE367BC60A50AC03FF5C4A8D43C486095B6EEA8F5B2942A66BDA53BA2507B5285149A7A4859AD30A909596D58094FA3513545770E724D49155D6EED8EACA82EA9422B9A57C056C82CB675475514A0548115CDDDB1CB6A147131DDE19D4C7BA2597B2BCB0EBFEBED651A8C97591987D90A2B77FC55A0CAE79E58FC165F02E3DF77D2AAB427C0B5AD2ACB7DAC67551A0CFD4A54BB25AF2F448D57FB7ACCDAD5776DB16FBAFAD7E3F5B3DD17B510E920289214DC8B03A170F01BF34358FB231CE95496919846AE46B0ABE798627FC40846B33FBCA9E762B6ACE7045788B80B1CD3ACDCC33CDC3F3814DEEFECCE5B1A2B8E1D4F7188D53DA8A9CFD9062AB7C8238AEC0714C975146BBC372941A514F50571F0D3C4FC33ED759C663BD8BFD2CF7BC6457C4FDC3F1268B88B126CFC25D7850E537FDF7CF8DAD1D712DDB57AF1FBA7ACEB9E711381C71C1BFB822E5799E1FA1B8A5ED2645DD79066E59715AFD7A16ACF1494A88243ACFE2A61EED2415E24E4527EE3A3A76FFB8AA67C75B016A2E265C1507883A850F77260152CEDAB01077ED2F4D540BFC1AA5F11AC229AF605814BFA8389EF07BA2F4379CF2D6E358AB3D12696A454CFADF5D76B15636E7B6F92CAB4D77274B914BB07DC1AE5D62B58C62BAB541E6C775414220F86BD4DD37EF1EAE35D29382E4B41B65B67BCC9D2E286EBA2FF5545F10ED4C0296A7AB65F37BC695BD3E57377BCF8B25F75F08E191BAFF4DA7E0DF0A68D4D97E6DD7163EB55E9BB63B6B6ADFD73CB96D6790BDD7ADDAE5C82A4B99751E582DBEA72B3C4399CF0E7011841165166CF29D585604D45AC2D0C4B123D537D059AC858721C89AF44D1CCB6DF58F986DF38584ED3CC5653B7D9C49BAFFF8DBC394D336F4D35E4362A8A95F588AA2AEF9675ACA938EA355510D746D252B0DE16B3365EB2BFA682E1419452F31ECD1DF1EBA90F1E442543BA4E8F7A60F9BA17F6CECA5F6684FD3B76972504FB3B8D04DBB55DB3A0B9208B20DFBC05897212214373852972604B3D89A8BB4036856696634EDF83A7793B76D331C7CE05B9496898501832F6E75E2DE1C5828026FE69D1735DE6F14D98FE699321860062BA2C377F437E4E5CCF29E43E57E48434102CBAE0195D369794657697CF05D275403A0271F51541D11DF6430FC0E21B32438F7815D9C0FC2EF112D9CF65065007D23E1175B58F4F5DB48C901F738CB23FFC041B76FCA71FFF03E263F77BA0540000, N'6.1.3-40302')
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'30517e2a-1fca-40a9-b233-c36dbeb286ae', N'Admin')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'fa372da0-130f-4bef-af3c-63583f101ba4', N'30517e2a-1fca-40a9-b233-c36dbeb286ae')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'09da6306-fadc-474b-acef-c7cdae935980', N'user1234@example.com', 0, N'AEcowtjgkIZrCdCdhci9yy4rnKJ4VCZDRrXT6SsCoCO89UbjcJhhR+hDpi3//KkS7A==', N'0af55ae5-1656-4716-9466-0f4573e1785e', NULL, 0, 0, NULL, 1, 0, N'user1234@example.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'fa372da0-130f-4bef-af3c-63583f101ba4', N'admin@example.com', 0, N'ADJhnPqnGX+ZsT/hTpBSvn9FJUQKL2B8lDZexjoXv7bHgcXOOuCV33/oAmM3SZoPhQ==', N'7bb0aa84-3595-428d-8c68-f4c88dad871a', NULL, 0, 0, NULL, 0, 0, N'admin@example.com')
SET IDENTITY_INSERT [dbo].[Brand] ON 

INSERT [dbo].[Brand] ([BrandID], [BrandName], [City], [State], [Country]) VALUES (1, N'PRS                 ', N'Stevensville        ', N'Ma', N'USA                           ')
INSERT [dbo].[Brand] ([BrandID], [BrandName], [City], [State], [Country]) VALUES (2, N'Gibson              ', N'Nashville           ', N'Te', N'USA                           ')
INSERT [dbo].[Brand] ([BrandID], [BrandName], [City], [State], [Country]) VALUES (3, N'Fender              ', N'Corona              ', N'Ca', N'USA                           ')
INSERT [dbo].[Brand] ([BrandID], [BrandName], [City], [State], [Country]) VALUES (4, N'ESP                 ', N'Tokyo               ', NULL, N'Japan                         ')
INSERT [dbo].[Brand] ([BrandID], [BrandName], [City], [State], [Country]) VALUES (6, N'Taylor              ', N'El Cajon            ', N'Ca', N'USA                           ')
SET IDENTITY_INSERT [dbo].[Brand] OFF
SET IDENTITY_INSERT [dbo].[Department] ON 

INSERT [dbo].[Department] ([DeptID], [DeptName]) VALUES (1, N'Owner     ')
INSERT [dbo].[Department] ([DeptID], [DeptName]) VALUES (2, N'Manager   ')
INSERT [dbo].[Department] ([DeptID], [DeptName]) VALUES (3, N'Sales     ')
INSERT [dbo].[Department] ([DeptID], [DeptName]) VALUES (4, N'Inventory ')
INSERT [dbo].[Department] ([DeptID], [DeptName]) VALUES (5, N'Luthier   ')
SET IDENTITY_INSERT [dbo].[Department] OFF
SET IDENTITY_INSERT [dbo].[Employees] ON 

INSERT [dbo].[Employees] ([EmpID], [FName], [LName], [DeptID], [DirectReport], [HireDate], [Salary]) VALUES (1, N'Jeremy              ', N'Baker               ', 1, NULL, NULL, NULL)
INSERT [dbo].[Employees] ([EmpID], [FName], [LName], [DeptID], [DirectReport], [HireDate], [Salary]) VALUES (2, N'Tommie              ', N'Daniels             ', 2, N'1', CAST(N'2015-08-14' AS Date), NULL)
INSERT [dbo].[Employees] ([EmpID], [FName], [LName], [DeptID], [DirectReport], [HireDate], [Salary]) VALUES (3, N'Travis              ', N'Miller              ', 3, N'2', CAST(N'2016-10-02' AS Date), NULL)
INSERT [dbo].[Employees] ([EmpID], [FName], [LName], [DeptID], [DirectReport], [HireDate], [Salary]) VALUES (4, N'Taylor              ', N'Morrison            ', 3, N'2', CAST(N'2017-03-15' AS Date), NULL)
INSERT [dbo].[Employees] ([EmpID], [FName], [LName], [DeptID], [DirectReport], [HireDate], [Salary]) VALUES (5, N'Jessie              ', N'Winters             ', 3, N'2', CAST(N'2018-04-10' AS Date), NULL)
INSERT [dbo].[Employees] ([EmpID], [FName], [LName], [DeptID], [DirectReport], [HireDate], [Salary]) VALUES (6, N'Ruby                ', N'Ruiz                ', 4, N'2', CAST(N'2016-10-05' AS Date), NULL)
INSERT [dbo].[Employees] ([EmpID], [FName], [LName], [DeptID], [DirectReport], [HireDate], [Salary]) VALUES (7, N'Jackson             ', N'Davis               ', 5, N'1', CAST(N'2015-08-15' AS Date), NULL)
SET IDENTITY_INSERT [dbo].[Employees] OFF
SET IDENTITY_INSERT [dbo].[Guitar Category] ON 

INSERT [dbo].[Guitar Category] ([GuitarCategoryID], [GuitarCategory]) VALUES (1, N'Electric')
INSERT [dbo].[Guitar Category] ([GuitarCategoryID], [GuitarCategory]) VALUES (2, N'Acoustic')
INSERT [dbo].[Guitar Category] ([GuitarCategoryID], [GuitarCategory]) VALUES (3, N'Professional')
INSERT [dbo].[Guitar Category] ([GuitarCategoryID], [GuitarCategory]) VALUES (4, N'Studio')
SET IDENTITY_INSERT [dbo].[Guitar Category] OFF
SET IDENTITY_INSERT [dbo].[GuitarInventory] ON 

INSERT [dbo].[GuitarInventory] ([GuitarInventoryID], [GuitarInventoryName]) VALUES (1, N'In Stock            ')
INSERT [dbo].[GuitarInventory] ([GuitarInventoryID], [GuitarInventoryName]) VALUES (2, N'Out of Stock        ')
INSERT [dbo].[GuitarInventory] ([GuitarInventoryID], [GuitarInventoryName]) VALUES (3, N'On Backorder        ')
INSERT [dbo].[GuitarInventory] ([GuitarInventoryID], [GuitarInventoryName]) VALUES (4, N'Discontinued        ')
SET IDENTITY_INSERT [dbo].[GuitarInventory] OFF
SET IDENTITY_INSERT [dbo].[Guitars] ON 

INSERT [dbo].[Guitars] ([GuitarID], [GuitarModel], [GuitarDescription], [GuitarImage], [Price], [UnitsInStock], [UnitsOnOrder], [UnitsSold], [ProductionDate], [BrandID], [GuitarInventoryID], [GuitarCategory], [DeptID]) VALUES (1, N'Private Stock', N'This Custom 24 is unlike any you''ll ever see. It features high-quality mahogany for the body and neck, a smooth-as-glass rosewood fingerboard, and an artist-grade flame maple for the top and back that demands the attention of everyone in its presence. A pair of 85/15 TCI-tuned humbuckers brings out only the best tone from these woods, producing a potent cocktail of pure, vintage sound with noticeable sustain and sparkle. When you play your first few licks, you''ll be delighted by the Pattern Regular neck and fingerboard''s velvety playability. And let''s not forgot PRS''s classic Birds inlays across the frets and headstock, constructed from beautiful azurite and outlined in abalone. Whether you''ll be admiring its outstanding wood grain and finish or playing the daylights out of it, the PRS Private Stock #9253 is ready to make its new owner''s dreams come true.', N'PRSPSFull.jpg', 10810.0000, 5, 1, 56, CAST(N'2015-07-08' AS Date), 1, 1, 4, 4)
INSERT [dbo].[Guitars] ([GuitarID], [GuitarModel], [GuitarDescription], [GuitarImage], [Price], [UnitsInStock], [UnitsOnOrder], [UnitsSold], [ProductionDate], [BrandID], [GuitarInventoryID], [GuitarCategory], [DeptID]) VALUES (3, N'S2 Custom 24', N'The PRS S2 Custom 24 solidbody electric guitar''s comfortable asymmetric bevel-cut double-cutaway body is built from maple-topped mahogany, so it''s loaded with warmth, resonance, and copious amounts of bite and sustain. Instill your playing with incredible vintage sweetness, clarity, and extended tonal range, courtesy of the PRS S2 Custom 24''s upgraded 85/15 "S" humbuckers. This guitar''s Pattern Regular neck features an extended 24-fret rosewood fingerboard that makes high-register soloing easy. Perform everything from subtle, expressive nuances to full dive-bombs with this guitar''s vibrato bridge/tailpiece. Complete with iconic bird fingerboard inlays, the PRS S2 Custom 24 is a great-sounding, great-playing solidbody electric guitar.', N'PRSCE24Full.jpg', 1624.0000, 15, 3, 398, CAST(N'2019-06-12' AS Date), 1, 2, 3, 4)
INSERT [dbo].[Guitars] ([GuitarID], [GuitarModel], [GuitarDescription], [GuitarImage], [Price], [UnitsInStock], [UnitsOnOrder], [UnitsSold], [ProductionDate], [BrandID], [GuitarInventoryID], [GuitarCategory], [DeptID]) VALUES (4, N'Les Paul', N'If you have ever wanted to add a classic Les Paul to your guitar collection without breaking the bank, the Gibson Les Paul Tribute is here. This homage to the guitar that changed rock forever stays true to the original with a few modern updates. Once it’s in your hands, you will feel, hear, and see all the reasons this seminal axe has won over so many millions of players the world over since it was first released.

The Gibson Les Paul Tribute features a weight-relieved mahogany body with a maple top for stellar resonance and lightweight feel. A beautiful satin nitrocellulose finish lets the tonewoods breathe and glow with their natural color. A smooth maple neck with rosewood fingerboard offers that classic Les Paul feel and response, and a pair of 490 humbucking pickups delivers vintage-style tone.', N'GibsonLPFull.jpg', 2499.0000, 32, 5, 935, CAST(N'2019-05-18' AS Date), 2, 2, 4, 4)
INSERT [dbo].[Guitars] ([GuitarID], [GuitarModel], [GuitarDescription], [GuitarImage], [Price], [UnitsInStock], [UnitsOnOrder], [UnitsSold], [ProductionDate], [BrandID], [GuitarInventoryID], [GuitarCategory], [DeptID]) VALUES (5, N'SG', N'Immortalized by Santana at Woodstock and smashed onstage by Townshend, the Gibson SG Standard is a rock icon. Gibson’s Nashville-made SG Standard is the real deal, arming you with a pair of toneful humbuckers, a rounded-profile neck, and a silky Plek’d rosewood fretboard with action that’s almost nonexistent. The Gibson SG Standard''s lightweight mahogany body delivers great sustain and no pain, even if you play all night. And the nitro finish looks and feels luscious while enhancing the tone of this legendary solidbody electric guitar. Own your piece of rock history: the Gibson SG Standard.', N'GibsonSGFull.jpg', 1499.0000, 18, 2, 581, CAST(N'2016-12-14' AS Date), 2, 1, 1, 4)
INSERT [dbo].[Guitars] ([GuitarID], [GuitarModel], [GuitarDescription], [GuitarImage], [Price], [UnitsInStock], [UnitsOnOrder], [UnitsSold], [ProductionDate], [BrandID], [GuitarInventoryID], [GuitarCategory], [DeptID]) VALUES (6, N'Explorer', N'The modern Gibson Explorer embodies all the trail-blazing style of the 1958 original, from its eye-catching angular body and hockey stick headstock to its red-hot rock appeal. The Gibson Explorer’s resonant mahogany body and comfortable rosewood-topped SlimTaper mahogany neck offer a memorable playing experience night after night. Under the hood of the Gibson Explorer, twin Burstbucker pickups deliver a tight low end, complex midrange, and sweet highs to cater to rock and well beyond. Meanwhile, Grover Mini Rotomatic tuners give this guitar rock-solid intonation for the stage and studio. Spice up your guitar collection with the modern Gibson Explorer!', N'GibsonExplorerFull.jpg', 1999.0000, 3, 1, 716, CAST(N'2018-02-25' AS Date), 2, 1, 1, 4)
INSERT [dbo].[Guitars] ([GuitarID], [GuitarModel], [GuitarDescription], [GuitarImage], [Price], [UnitsInStock], [UnitsOnOrder], [UnitsSold], [ProductionDate], [BrandID], [GuitarInventoryID], [GuitarCategory], [DeptID]) VALUES (7, N'Stratocaster', N'Fender''s Vintera ''60s Stratocaster is a faithful reproduction of golden-age Fender Stratocasters. This guitar packs the best qualities from the decade into one affordable model. You''ll be pleased with the great feel of the vintage-style tremolo bridge that''s equally suited to surf as it is to blues and rock. The 3-ply pickguard comes loaded with Tim Shaw–designed ''60s pickups and a 5-way blade switch. Modeled after the pickups of the 1960s, Tim Shaw''s ''60s pickups have just enough spank to be dangerous. The neck''s "C" carve feels great in your hands, and the vintage-style frets play extremely smoothly. We know you''ll love the Fender Vintera ''60s Stratocaster as much as we do at Sweetwater.', N'FenderStratFull.jpg', 1499.0000, 150, 22, 1467, CAST(N'2015-09-12' AS Date), 3, 3, 1, 4)
INSERT [dbo].[Guitars] ([GuitarID], [GuitarModel], [GuitarDescription], [GuitarImage], [Price], [UnitsInStock], [UnitsOnOrder], [UnitsSold], [ProductionDate], [BrandID], [GuitarInventoryID], [GuitarCategory], [DeptID]) VALUES (8, N'Telecaster', N'Some folks think Teles are only good for country-style twanging, but the Fender Player Series Telecaster HH says otherwise. This dual humbucker-equipped axe delivers muscular, throaty sounds by the truckload. That being said, it can also achieve mellower tones if you ask nicely. A Modern C-shaped neck and 22-fret, 9.5"-radius fingerboard give you a decidedly contemporary feel with fast action and comfortable playability. You also get a synthetic bone nut, 6-saddle string-through bridge, and Fender standard sealed tuners. If you''ve got aggressive tendencies, you''ll love the Player Series Telecaster HH — it''s a Tele with a mean streak.', N'FenderTeleFull.jpg', 2699.0000, 120, 16, 1108, CAST(N'2018-07-10' AS Date), 3, 1, 1, 4)
INSERT [dbo].[Guitars] ([GuitarID], [GuitarModel], [GuitarDescription], [GuitarImage], [Price], [UnitsInStock], [UnitsOnOrder], [UnitsSold], [ProductionDate], [BrandID], [GuitarInventoryID], [GuitarCategory], [DeptID]) VALUES (9, N'EC-1000', N'With the ESP LTD Eclipse EC-1000 EMG solidbody electric guitar plugged into your amplifier, you''re primed for pure rock fury. You get eternal sustain from the Eclipse''s set-neck design, which keeps it resonating longer than bolt-on designs. You''ve got powerful, articulate tone on demand thanks to EMG humbucking pickups. From chiming cleans to growling high-gain tones, this guitar covers a lot of tonal territory. Find out why some of the most aggressive guitarists choose ESP - get your LTD Eclipse EC-1000 EMG from Sweetwater today.', N'ESPEC1000Full.jpg', 999.0000, 67, 8, 90, CAST(N'2015-03-10' AS Date), 4, 3, 3, 4)
INSERT [dbo].[Guitars] ([GuitarID], [GuitarModel], [GuitarDescription], [GuitarImage], [Price], [UnitsInStock], [UnitsOnOrder], [UnitsSold], [ProductionDate], [BrandID], [GuitarInventoryID], [GuitarCategory], [DeptID]) VALUES (16, N'614ce', N'Combining premium aesthetics and ergonomics with tone-enhancing details, Builder’s Edition instruments represent the pinnacle of Taylor craftsmanship. The Builder’s Edition 614ce Grand Auditorium acoustic-electric guitar features revolutionary V-Class bracing, which boosts volume evenly across the tonal spectrum, increases sustain, and improves the natural intonation of the instrument by creating a more synergistic response from the soundboard. This fosters a more harmonious relationship between the notes you play, helping chords ring out in cohesive splendor.

This guitar boasts spectacular tonewoods: figured bigleaf maple for its sides and gorgeously bookmatched back, torrefied Sitka spruce for the top, and West African ebony for the fingerboard. This combination results in a sound that’s ultra-responsive to your touch, enhancing maple’s natural transparent brightness with warmth, richness, and dimension.', N'Taylor614cdFull.jpg', 1599.0000, 3, 2, 1320, CAST(N'2019-09-18' AS Date), 6, 1, 2, 4)
INSERT [dbo].[Guitars] ([GuitarID], [GuitarModel], [GuitarDescription], [GuitarImage], [Price], [UnitsInStock], [UnitsOnOrder], [UnitsSold], [ProductionDate], [BrandID], [GuitarInventoryID], [GuitarCategory], [DeptID]) VALUES (17, N'K24ce', N'Taylor has produced some of the world’s most well-respected acoustic guitars since their founding in 1974. The K24ce is a member of Taylor’s Builder’s Edition collection of acoustics that are handcrafted to enhance your playing experience. Equipped with a completely beveled body, contoured armrest, and contoured cutaway, this guitar plays like a dream. At Sweetwater, we especially like the Silent Satin finish that eliminates noise from your strumming arm and noise from your palm on the neck. It sounds great, too. The K24ce’s koa body creates bright tones that shimmer throughout the room. All in all, the K24ce is a playable, comfortable guitar that looks as good as it sounds.', N'TaylorK24ceFull.jpg', 5499.0000, 1, 0, 411, CAST(N'2019-11-21' AS Date), 6, 4, 4, 4)
INSERT [dbo].[Guitars] ([GuitarID], [GuitarModel], [GuitarDescription], [GuitarImage], [Price], [UnitsInStock], [UnitsOnOrder], [UnitsSold], [ProductionDate], [BrandID], [GuitarInventoryID], [GuitarCategory], [DeptID]) VALUES (20, N'PRS SE A60E', N'The Angelus SE A60E represents classic PRS quality in an affordable acoustic-electric that is designed for effortless live performance. Featuring a solid Sitka spruce top and ziricote back and sides with a smooth cutaway, the A60E produces wonderful acoustic tone that is steeped in crisp top end with just the right amount of low-end coloring for a well-rounded, full tone. And when you are ready to plug in, the onboard Fishman GT1 electronics produce wonderful amplified acoustic tone. ', N'PRSSEA60EFull.jpg', 1099.0000, 10, 1, 35, CAST(N'2010-06-16' AS Date), 1, 1, 2, 4)
INSERT [dbo].[Guitars] ([GuitarID], [GuitarModel], [GuitarDescription], [GuitarImage], [Price], [UnitsInStock], [UnitsOnOrder], [UnitsSold], [ProductionDate], [BrandID], [GuitarInventoryID], [GuitarCategory], [DeptID]) VALUES (21, N'Flying V', N'The Gibson Flying V is a stylish nod to the radical design of the 1958 original. This V delivers scorching rock tones and near-endless sustain, and the comfortable contour of its resonant mahogany body makes you want to play all night long. Wrapping your hand around the Gibson Flying V’s rosewood SlimTaper neck invites breakneck fretboard pyrotechnics. Your riffs and leads will be infused with classic tight low end, complex midrange, and sweet highs, courtesy of a pair of Burstbucker pickups. Whether you’re looking to add a little attitude to your collection or simply want a high-class heavy metal axe, you’ll love Gibson’s Flying V.', N'GibsonFlyingVFull.jpg', 1699.0000, 4, 0, 15, CAST(N'2013-03-27' AS Date), 2, 1, 1, 4)
INSERT [dbo].[Guitars] ([GuitarID], [GuitarModel], [GuitarDescription], [GuitarImage], [Price], [UnitsInStock], [UnitsOnOrder], [UnitsSold], [ProductionDate], [BrandID], [GuitarInventoryID], [GuitarCategory], [DeptID]) VALUES (23, N'Viper E-ii', N'The E-II Viper from ESP represents the premium edition of their popular asymmetrical double-cut Viper electric guitar. Designed and hand-crafted by master luthiers in Japan, the E-II features a set-through mahogany neck on a beautifully resonant mahogany body for a warm sound and plenty of sustain. A pair of EMG 57/66 humbuckers deliver classic hot, humbucking tone and push-pull controls let you coil-split for vintage single-coil sounds when you''re in the mood. A smooth ebony fingerboard with extra jumbo frets are instantly playable and responsive — great for fast leads and big power chords. Rounding out the features is a Gotoh Tune-o-matic bridge, a favorite among guitarists here at Sweetwater for its stellar sustain.', N'ESPViperFull.jpg', 1999.0000, 0, 4, 66, CAST(N'2016-04-04' AS Date), 4, 3, 1, 4)
INSERT [dbo].[Guitars] ([GuitarID], [GuitarModel], [GuitarDescription], [GuitarImage], [Price], [UnitsInStock], [UnitsOnOrder], [UnitsSold], [ProductionDate], [BrandID], [GuitarInventoryID], [GuitarCategory], [DeptID]) VALUES (29, N'T3 Semi-Hollow Body', N'The Taylor T3 semi-hollowbody electric guitar combines the incredible thinline body design of Taylor''s T5 with a great-sounding complement of pickups and ultra-stable hardware. One strum of the T3 and you''ll know this isn''t your typical semi-hollow; plug it in and you''ll be blown away by the tone - as well as the flexible tonal options. This stoptail version features a quilted maple top, joined to a hollow sapele body with a wood block running down the middle. The sapele neck is very comfortable, and two humbucking pickups with selectors and coil taps give you plenty of sound configurations while you''re playing the T3.', N'TaylorT3SemiFull.jpg', 2299.0000, 14, 0, 11, CAST(N'2014-05-20' AS Date), 6, 1, 1, 4)
INSERT [dbo].[Guitars] ([GuitarID], [GuitarModel], [GuitarDescription], [GuitarImage], [Price], [UnitsInStock], [UnitsOnOrder], [UnitsSold], [ProductionDate], [BrandID], [GuitarInventoryID], [GuitarCategory], [DeptID]) VALUES (30, N'PRS SE Hollow Body', N'For many years, if you wanted a PRS hollowbody with a piezo system, you had to save up enough money for an American made PRS. But now, you can get a PRS Hollowbody II with a piezo system in the more affordable SE line. This workhorse of an electric guitar produces an array of tones that can cover any genre. This eye-popping instrument features a figured maple top and back with mahogany sides — a tonewood cocktail that delivers extraordinary clarity and warm resonance. The SE Hollowbody II Piezo also features a very comfortable Wide Fat mahogany set neck and a premium ebony fingerboard emblazoned with iconic PRS bird inlays. Two toneful 58/15 S humbucking pickups and a piezo round out the design. If you''ve been looking for a PRS SE guitar that can cover significant tonal ground, the Hollowbody II Piezo is the one for you.', N'PRSSEHollowFull.jpg', 1549.0000, 25, 4, 38, CAST(N'2018-08-28' AS Date), 1, 1, 1, 4)
INSERT [dbo].[Guitars] ([GuitarID], [GuitarModel], [GuitarDescription], [GuitarImage], [Price], [UnitsInStock], [UnitsOnOrder], [UnitsSold], [ProductionDate], [BrandID], [GuitarInventoryID], [GuitarCategory], [DeptID]) VALUES (31, N'Jazz Master', N'The Fender Player Series Jazzmaster reimagines the classic offset guitar for modern players. While the offset alder body and floating vibrato tailpiece remain true to the original, the Player Series Jazzmaster boasts a pair of humbucking pickups with impressive touch sensitivity and clarity. Whether you''re playing clean or with a ton of fuzz, you''ve got a huge range of tone to explore just between the 3-way pickup selector and volume and tone knobs. All this at a price for working musicians makes the Fender Player Series Jazzmaster a value-packed guitar you shouldn''t miss.', N'FenderJazzFull.jpg', 799.0000, 18, 2, 48, CAST(N'2020-09-12' AS Date), 3, 1, 1, 4)
INSERT [dbo].[Guitars] ([GuitarID], [GuitarModel], [GuitarDescription], [GuitarImage], [Price], [UnitsInStock], [UnitsOnOrder], [UnitsSold], [ProductionDate], [BrandID], [GuitarInventoryID], [GuitarCategory], [DeptID]) VALUES (32, N'E-11', N'Be careful with the ESP E-II EX NT Electric Guitar — its sharp looks can cut! An absolute monster of a metal machine tailor-made for the modern player, the E-II EX NT boasts first-class appointments from top to bottom. Its classic tonewood recipe of a mahogany body and neck capped with a silky ebony fingerboard offers up a well-balanced sound with stability built for the rigors of the road. When it comes to a pair of 81/60 EMG humbuckers, these pickups are capable of screaming leads and low-tuned chugs when pushed to the limit. The speed demon in you will love the E-II EX NT''s Thin "U"-shaped neck, your gateway to effortless soloing and 6-string sweeps across all 22 frets. Plus, Gotoh locking tuners and a matching bridge and tailpiece ensure sustain and intonation stability. Pick up the E-II EX NT for a reliable go-to guitar destined to deliver at peak performance for countless years — just make sure your schedule is free for the next few days!', N'ESPE11Full.jpg', 1899.0000, 7, 1, 12, CAST(N'2019-08-01' AS Date), 4, 1, 1, 4)
INSERT [dbo].[Guitars] ([GuitarID], [GuitarModel], [GuitarDescription], [GuitarImage], [Price], [UnitsInStock], [UnitsOnOrder], [UnitsSold], [ProductionDate], [BrandID], [GuitarInventoryID], [GuitarCategory], [DeptID]) VALUES (33, N'American Dream', N'With the American Dream series of US-built acoustic guitars, Bob Taylor and Andy Powers have opened a new chapter in Taylor value and performance. Never before has it been this affordable to own an American-made Taylor guitar with class-leading features. The Grand Pacific AD17e Blacktop slope-shoulder dreadnought is built from solid Taylor tonewoods (spruce, ovangkol, and mahogany), each with minor cosmetic imperfections to honor the mature sound and workhorse aesthetic these early guitars are known for. Taylor’s V-Class bracing gives the AD17e Blacktop impressive sustain and a clean, pure tone that stands up to even the scrutiny of the studio. All in all, the American Dream Taylor AD17e Blacktop is a professional instrument that comes in at a price that will ensure you’re not afraid to take it on the road. Onboard Taylor ES2 electronics — a hallmark of all top-tier Taylors — make the AD17e Blacktop a fantastic option for plug-and-play gigging and recording.', N'TaylorAmericanDreamFull.jpg', 1699.0000, 17, 4, 6, CAST(N'2016-07-05' AS Date), 6, 4, 2, 4)
INSERT [dbo].[Guitars] ([GuitarID], [GuitarModel], [GuitarDescription], [GuitarImage], [Price], [UnitsInStock], [UnitsOnOrder], [UnitsSold], [ProductionDate], [BrandID], [GuitarInventoryID], [GuitarCategory], [DeptID]) VALUES (35, N'Hollow Body 10 Top II', N'The PRS Hollowbody II Piezo 10-Top electric guitar looks, sounds, and plays like a dream. This instrument features one of the most flexible tone-shaping systems you''ll find in the Sweetwater Guitar Gallery. Select the Hollowbody II''s TCI-tuned 58/15 humbuckers for a purely electric sound, or blend in the woody quality of the onboard LR Baggs/PRS piezo pickup system for great acoustic tones. Combining these two diverse pickup systems gives you an absolutely phenomenal sonic range. And that''s only part of what''s so special about the PRS Hollowbody II Piezo 10-Top.', N'PRSHollow2Full.jpg', 6400.0000, 1, 0, 0, CAST(N'2021-06-01' AS Date), 1, 1, 4, 4)
INSERT [dbo].[Guitars] ([GuitarID], [GuitarModel], [GuitarDescription], [GuitarImage], [Price], [UnitsInStock], [UnitsOnOrder], [UnitsSold], [ProductionDate], [BrandID], [GuitarInventoryID], [GuitarCategory], [DeptID]) VALUES (36, N'LTD Eclipse', N'Grab the ESP LTD Eclipse EC-256 solidbody electric guitar for a huge value in a rock-ready instrument. You''ll find the fast playability, flexible tone, and quality construction of the Eclipse EC-256 far surpasses most guitars in this price range. You''ll get rich, snappy tone from the mahogany body. And the set-neck design gives you sustain for days. A pair of ESP humbucking pickups onboard the ESP LTD Eclipse EC-256 solidbody electric guitar gives you a great foundation for a wide variety of styles, plus the extra versatility of push-pull coil tapping.', N'ESPLTDEclipseFull.jpg', 499.0000, 58, 22, 150, CAST(N'2018-07-12' AS Date), 4, 3, 1, 4)
INSERT [dbo].[Guitars] ([GuitarID], [GuitarModel], [GuitarDescription], [GuitarImage], [Price], [UnitsInStock], [UnitsOnOrder], [UnitsSold], [ProductionDate], [BrandID], [GuitarInventoryID], [GuitarCategory], [DeptID]) VALUES (39, N'814 ce', N'Combining elegant aesthetics with sophisticated playability and tone-enhancing details, the 800 Series is Taylor’s incredibly popular class of premium rosewood guitars. The 814ce acoustic-electric plays very comfortably, thanks to its Grand Auditorium body, graceful Venetian cutaway, and ergonomically radiused rosewood armrest. Featuring beautiful premium solid tonewoods — a Sitka spruce top, Indian rosewood back and sides, a tropical mahogany neck, and a West African ebony fingerboard — the 814ce is the perfect studio and stage workhorse: brilliant in solo and sparse musical settings, and holding its own when tracked in thick arrangements. You’ll love the clear, balanced tone — a sound forged by Taylor’s revolutionary V-Class bracing and amplified flawlessly by the onboard Expression System 2 electronics. As your eyes drink in this instrument’s understated elegance, your hands savor its flawless playability, and your ears revel in its rich, organic tone, you’ll treasure your Taylor 814ce. It’s a feast for the senses.', N'TaylorPRS824ceFull.jpg', 3699.0000, 2, 3, 5, CAST(N'2019-04-11' AS Date), 6, 4, 2, 4)
SET IDENTITY_INSERT [dbo].[Guitars] OFF
INSERT [dbo].[UserDetails] ([UserID], [FirstName], [LastName]) VALUES (N'09da6306-fadc-474b-acef-c7cdae935980', N'Bob', N'Rock')
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserClaims]'))
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserClaims]'))
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserLogins]'))
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserLogins]'))
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]'))
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]'))
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]'))
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]'))
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Employees_Department]') AND parent_object_id = OBJECT_ID(N'[dbo].[Employees]'))
ALTER TABLE [dbo].[Employees]  WITH CHECK ADD  CONSTRAINT [FK_Employees_Department] FOREIGN KEY([DeptID])
REFERENCES [dbo].[Department] ([DeptID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Employees_Department]') AND parent_object_id = OBJECT_ID(N'[dbo].[Employees]'))
ALTER TABLE [dbo].[Employees] CHECK CONSTRAINT [FK_Employees_Department]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Guitars_Brand]') AND parent_object_id = OBJECT_ID(N'[dbo].[Guitars]'))
ALTER TABLE [dbo].[Guitars]  WITH CHECK ADD  CONSTRAINT [FK_Guitars_Brand] FOREIGN KEY([BrandID])
REFERENCES [dbo].[Brand] ([BrandID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Guitars_Brand]') AND parent_object_id = OBJECT_ID(N'[dbo].[Guitars]'))
ALTER TABLE [dbo].[Guitars] CHECK CONSTRAINT [FK_Guitars_Brand]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Guitars_Department]') AND parent_object_id = OBJECT_ID(N'[dbo].[Guitars]'))
ALTER TABLE [dbo].[Guitars]  WITH CHECK ADD  CONSTRAINT [FK_Guitars_Department] FOREIGN KEY([DeptID])
REFERENCES [dbo].[Department] ([DeptID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Guitars_Department]') AND parent_object_id = OBJECT_ID(N'[dbo].[Guitars]'))
ALTER TABLE [dbo].[Guitars] CHECK CONSTRAINT [FK_Guitars_Department]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Guitars_Guitar Category]') AND parent_object_id = OBJECT_ID(N'[dbo].[Guitars]'))
ALTER TABLE [dbo].[Guitars]  WITH CHECK ADD  CONSTRAINT [FK_Guitars_Guitar Category] FOREIGN KEY([GuitarCategory])
REFERENCES [dbo].[Guitar Category] ([GuitarCategoryID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Guitars_Guitar Category]') AND parent_object_id = OBJECT_ID(N'[dbo].[Guitars]'))
ALTER TABLE [dbo].[Guitars] CHECK CONSTRAINT [FK_Guitars_Guitar Category]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Guitars_GuitarInventory]') AND parent_object_id = OBJECT_ID(N'[dbo].[Guitars]'))
ALTER TABLE [dbo].[Guitars]  WITH CHECK ADD  CONSTRAINT [FK_Guitars_GuitarInventory] FOREIGN KEY([GuitarInventoryID])
REFERENCES [dbo].[GuitarInventory] ([GuitarInventoryID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Guitars_GuitarInventory]') AND parent_object_id = OBJECT_ID(N'[dbo].[Guitars]'))
ALTER TABLE [dbo].[Guitars] CHECK CONSTRAINT [FK_Guitars_GuitarInventory]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_UserDetails_AspNetUsers]') AND parent_object_id = OBJECT_ID(N'[dbo].[UserDetails]'))
ALTER TABLE [dbo].[UserDetails]  WITH CHECK ADD  CONSTRAINT [FK_UserDetails_AspNetUsers] FOREIGN KEY([UserID])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_UserDetails_AspNetUsers]') AND parent_object_id = OBJECT_ID(N'[dbo].[UserDetails]'))
ALTER TABLE [dbo].[UserDetails] CHECK CONSTRAINT [FK_UserDetails_AspNetUsers]
GO
