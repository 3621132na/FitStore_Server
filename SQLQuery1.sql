USE [master]
GO
/****** Object:  Database [FitStoreDB]    Script Date: 4/20/2024 8:08:53 AM ******/
CREATE DATABASE [FitStoreDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'FitStoreDB', FILENAME = N'D:\Apps\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\FitStoreDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'FitStoreDB_log', FILENAME = N'D:\Apps\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\FitStoreDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [FitStoreDB] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [FitStoreDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [FitStoreDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [FitStoreDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [FitStoreDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [FitStoreDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [FitStoreDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [FitStoreDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [FitStoreDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [FitStoreDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [FitStoreDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [FitStoreDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [FitStoreDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [FitStoreDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [FitStoreDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [FitStoreDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [FitStoreDB] SET  ENABLE_BROKER 
GO
ALTER DATABASE [FitStoreDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [FitStoreDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [FitStoreDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [FitStoreDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [FitStoreDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [FitStoreDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [FitStoreDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [FitStoreDB] SET RECOVERY FULL 
GO
ALTER DATABASE [FitStoreDB] SET  MULTI_USER 
GO
ALTER DATABASE [FitStoreDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [FitStoreDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [FitStoreDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [FitStoreDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [FitStoreDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [FitStoreDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'FitStoreDB', N'ON'
GO
ALTER DATABASE [FitStoreDB] SET QUERY_STORE = ON
GO
ALTER DATABASE [FitStoreDB] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [FitStoreDB]
GO
/****** Object:  User [user]    Script Date: 4/20/2024 8:08:53 AM ******/
CREATE USER [user] FOR LOGIN [user] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [jul2nd]    Script Date: 4/20/2024 8:08:53 AM ******/
CREATE USER [jul2nd] FOR LOGIN [jul2nd] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [admin]    Script Date: 4/20/2024 8:08:53 AM ******/
CREATE USER [admin] FOR LOGIN [admin] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [user]
GO
ALTER ROLE [db_accessadmin] ADD MEMBER [user]
GO
ALTER ROLE [db_securityadmin] ADD MEMBER [user]
GO
ALTER ROLE [db_ddladmin] ADD MEMBER [user]
GO
ALTER ROLE [db_backupoperator] ADD MEMBER [user]
GO
ALTER ROLE [db_datareader] ADD MEMBER [user]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [user]
GO
ALTER ROLE [db_denydatareader] ADD MEMBER [user]
GO
ALTER ROLE [db_denydatawriter] ADD MEMBER [user]
GO
ALTER ROLE [db_owner] ADD MEMBER [jul2nd]
GO
ALTER ROLE [db_accessadmin] ADD MEMBER [jul2nd]
GO
ALTER ROLE [db_securityadmin] ADD MEMBER [jul2nd]
GO
ALTER ROLE [db_ddladmin] ADD MEMBER [jul2nd]
GO
ALTER ROLE [db_backupoperator] ADD MEMBER [jul2nd]
GO
ALTER ROLE [db_datareader] ADD MEMBER [jul2nd]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [jul2nd]
GO
ALTER ROLE [db_denydatareader] ADD MEMBER [jul2nd]
GO
ALTER ROLE [db_denydatawriter] ADD MEMBER [jul2nd]
GO
ALTER ROLE [db_owner] ADD MEMBER [admin]
GO
ALTER ROLE [db_accessadmin] ADD MEMBER [admin]
GO
ALTER ROLE [db_securityadmin] ADD MEMBER [admin]
GO
ALTER ROLE [db_ddladmin] ADD MEMBER [admin]
GO
ALTER ROLE [db_backupoperator] ADD MEMBER [admin]
GO
ALTER ROLE [db_datareader] ADD MEMBER [admin]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [admin]
GO
ALTER ROLE [db_denydatareader] ADD MEMBER [admin]
GO
ALTER ROLE [db_denydatawriter] ADD MEMBER [admin]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 4/20/2024 8:08:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[username] [varchar](50) NOT NULL,
	[password] [varchar](100) NULL,
	[phone] [varchar](50) NULL,
	[image] [varchar](100) NULL,
	[name] [nvarchar](50) NULL,
	[email] [varchar](50) NULL,
 CONSTRAINT [PK_Account] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Brand]    Script Date: 4/20/2024 8:08:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Brand](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](100) NULL,
	[image] [varchar](50) NULL,
	[info] [nvarchar](max) NULL,
 CONSTRAINT [PK_Brand] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cart]    Script Date: 4/20/2024 8:08:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cart](
	[product_id] [int] NOT NULL,
	[account_id] [int] NOT NULL,
	[number] [int] NULL,
 CONSTRAINT [PK_Cart] PRIMARY KEY CLUSTERED 
(
	[product_id] ASC,
	[account_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 4/20/2024 8:08:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NULL,
	[info] [nvarchar](50) NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Comment]    Script Date: 4/20/2024 8:08:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comment](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[post_id] [int] NULL,
	[account_id] [int] NULL,
	[contents] [text] NULL,
	[date] [date] NULL,
 CONSTRAINT [PK_Comment] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FK_Account_Role]    Script Date: 4/20/2024 8:08:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FK_Account_Role](
	[account_id] [int] NOT NULL,
	[role_id] [int] NOT NULL,
 CONSTRAINT [PK_FK_Account_Role] PRIMARY KEY CLUSTERED 
(
	[account_id] ASC,
	[role_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FK_Product_Use]    Script Date: 4/20/2024 8:08:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FK_Product_Use](
	[product_id] [int] NOT NULL,
	[use_id] [int] NOT NULL,
 CONSTRAINT [PK_FK_Product_Use] PRIMARY KEY CLUSTERED 
(
	[product_id] ASC,
	[use_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Item]    Script Date: 4/20/2024 8:08:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Item](
	[order_id] [int] NOT NULL,
	[product_id] [int] NOT NULL,
	[quantity] [int] NULL,
	[rating] [int] NULL,
	[cost] [int] NULL,
 CONSTRAINT [PK_Item] PRIMARY KEY CLUSTERED 
(
	[order_id] ASC,
	[product_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 4/20/2024 8:08:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[date] [date] NULL,
	[account_id] [int] NULL,
	[total] [nchar](10) NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Post]    Script Date: 4/20/2024 8:08:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Post](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[intro] [text] NULL,
	[author_id] [int] NULL,
	[title] [varchar](100) NULL,
	[date] [date] NULL,
	[background] [varchar](100) NULL,
 CONSTRAINT [PK_Post] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Post_Content]    Script Date: 4/20/2024 8:08:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Post_Content](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[subheading] [varchar](50) NULL,
	[contents] [text] NULL,
	[image] [char](50) NULL,
	[imageNote] [varchar](50) NULL,
	[post_id] [int] NULL,
 CONSTRAINT [PK_Post_Content] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 4/20/2024 8:08:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](max) NULL,
	[category_id] [int] NULL,
	[brand_id] [int] NULL,
	[image] [char](100) NULL,
	[price] [int] NULL,
	[info] [nvarchar](max) NULL,
	[solds] [int] NULL,
	[stock] [int] NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 4/20/2024 8:08:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Use]    Script Date: 4/20/2024 8:08:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Use](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NULL,
 CONSTRAINT [PK_Use] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Watch]    Script Date: 4/20/2024 8:08:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Watch](
	[account_id] [int] NOT NULL,
	[product_id] [int] NOT NULL,
	[times] [int] NULL,
 CONSTRAINT [PK_Watch] PRIMARY KEY CLUSTERED 
(
	[account_id] ASC,
	[product_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Account] ON 
GO
INSERT [dbo].[Account] ([id], [username], [password], [phone], [image], [name], [email]) VALUES (1, N'manngu123', N'3fbeb1290bea301647ec63639be650b8d997c6edd5939ac9fa67e27ac9e3d06c', N'0123456789', N'http://localhost/resource/accounts/1/1.jpg', N'Mẫn ngu', N'manngu@gmail.com')
GO
INSERT [dbo].[Account] ([id], [username], [password], [phone], [image], [name], [email]) VALUES (2, N'manhdeptrai123', N'7e0310743f8d4e4aa8c105ec1a7e267e75ee65c513c7174328cd33c5a535261c', N'0123456789', N'http://localhost/resource/accounts/2/2.jpg', N'Mạnh Đẹp Trai', N'manhdeptrai@gmail.com')
GO
INSERT [dbo].[Account] ([id], [username], [password], [phone], [image], [name], [email]) VALUES (3, N'3621132na', N'ba3e13618b614c8e39b7c39a072a780729588181d8b6872bb48c9730274b2e02', N'0559221106', N'http://localhost/resource/accounts/3/3.jpg', N'Phạm Ngọc Mạnh', N'3621132na@gmail.com')
GO
SET IDENTITY_INSERT [dbo].[Account] OFF
GO
SET IDENTITY_INSERT [dbo].[Brand] ON 
GO
INSERT [dbo].[Brand] ([id], [name], [image], [info]) VALUES (1, N'Rule1', N'http://localhost/resource/brands/1/1.jpg', N'Với sự thành công về mặt chất lượng và giá cả của các dòng thực phẩm bổ sung của hãng Rule One Protein - Rule1 R1 Protein 5Lbs đã là sản phẩm bán chạy nhất và thường hay hết hàng nhất toàn hệ thống cửa hàng Gymstore Việt Nam
')
GO
INSERT [dbo].[Brand] ([id], [name], [image], [info]) VALUES (2, N'PVL - Pure Vital Labs', N'http://localhost/resource/brands/2/2.jpg', N'Pure Vital Labs (PVL) là thương hiệu thực phẩm bổ sung thuộc sở hữu của công ty Fit Food. Các sản phẩm của PVL là 100% hoàn toàn tự nhiên, không có hương vị nhân tạo, màu sắc hoặc chất tạo ngọt. Toàn bộ dây chuyền của hãng PVL được chứng nhận Informed Choice Certified')
GO
INSERT [dbo].[Brand] ([id], [name], [image], [info]) VALUES (3, N'Mutant', N'http://localhost/resource/brands/3/3.jpg', N'Mutant là một trong những thương hiệu thực phẩm bổ sung tại Canada, cũng là thương hiệu được nhiều người yêu thích tại Việt Nam nói chung và Gymstore nói riêng.')
GO
INSERT [dbo].[Brand] ([id], [name], [image], [info]) VALUES (4, N'Now Foods', N'http://localhost/resource/brands/4/4.jpg', N'NOW Foods từ một cửa hàng cung cấp thực phẩm chức năng tốt cho sức khỏe, đã trở thành công ty hàng đầu trong ngành cung cấp các loại thực phẩm bổ sung, tinh dầu, thực phẩm chức năng chất lượng cao có nguồn gốc tự nhiên 100%')
GO
INSERT [dbo].[Brand] ([id], [name], [image], [info]) VALUES (5, N'JYM NUTRITION', N'http://localhost/resource/brands/5/5.jpg', N'Thương hiệu JYM được phát triển bởi Tiến sĩ Jim Stoppani với các thành phần chất lượng cao nhất với liều lượng đầy đủ, hiệu quả và hoàn toàn minh bạch, không có sự pha trộn độc quyền, không có công thức viết tắt.')
GO
INSERT [dbo].[Brand] ([id], [name], [image], [info]) VALUES (6, N'Orgain', N'http://localhost/resource/brands/6/6.jpg', N'Tại Orgain, chúng tôi khẳng định rằng dinh dưỡng sạch, tốt có sức mạnh thay đổi cuộc sống. Chúng tôi tin rằng thực phẩm hữu cơ lành mạnh có thể có hương vị tuyệt vời và ăn ngon hơn không có nghĩa là ăn chán. Hơn hết, chúng ta biết rằng các thành phần làm từ thực phẩm thực sự tạo ra sự khác biệt thực sự.

Với khởi đầu khiêm tốn trong một chiếc máy xay sinh tố tại nhà, Orgain được tạo ra bởi Tiến sĩ Andrew Abraham, một chuyên gia y học tích hợp, người sống sót sau ung thư và nhà hóa học bếp tự xưng.

Trong suốt quá trình điều trị ung thư, Andrew nhận thấy nhu cầu về một loại thức uống dinh dưỡng được làm từ các nguyên liệu hoàn toàn tự nhiên, có nguồn gốc từ thực phẩm và tự mình coi nó là người đầu tiên làm ra nó. Từ những chiếc máy xay sinh tố, Andrew đã tìm thấy một hợp đồng mới về cuộc sống và niềm đam mê với khoa học dinh dưỡng. Xuất thân từ một gia đình bác sĩ, ông bước vào lĩnh vực y tế và trở thành bác sĩ Abraham.

Nhiều năm sau, anh ấy sẽ thực hiện mục đích của mình là giúp càng nhiều người càng tốt bằng cách rời bỏ hành nghề y tế của mình để bắt đầu Orgain. Giờ đây, mục đích, niềm đam mê và các tiêu chuẩn cao không ngừng của anh ấy đối với sản phẩm của chúng tôi hướng dẫn mọi thứ chúng tôi làm ngày nay.')
GO
INSERT [dbo].[Brand] ([id], [name], [image], [info]) VALUES (7, N'Blackmores', N'http://localhost/resource/brands/7/7.jpg', N'Thương hiệu BLACKMORES là một trong những thương hiệu nổi tiếng cam kết luôn nghiên cứu và phát triển hơn 250 các loại Vitamin, khoáng chất, thảo mộc, dinh dưỡng bổ sung.')
GO
INSERT [dbo].[Brand] ([id], [name], [image], [info]) VALUES (8, N'RSP NUTRITION', N'http://localhost/resource/brands/8/8.jpg', N'Năm 2008, cựu vận động viên trường đại học, Victor Davanzo đã nhận ra rằng thế giới thể dục và dinh dưỡng đang phát triển. Bạn bè và gia đình đã mua nhiều thực phẩm bổ sung tự nhiên để nhằm cải thiện hiệu suất tập luyện không chỉ cho các vận động viên mà kể cả đối với những người bình thường muốn sở hữu một thân hình cân đối. Từ đó các chuyên gia dinh dưỡng của RSP đã mang sản phẩm của mình lên một tầm cao mới

 

Sản phẩm được thiết kế hoàn toàn với nguồn dinh dưỡng sạch và đảm bảo cho những người năng động, bận rộn và đặc biệt cho những người đam mê thể dục. RSP Nutrition đã tìm cách truyền cảm hứng cho những cá nhân tích cực trở thành bản thân tốt nhất của họ mà không phải hy sinh phần còn lại của cuộc đời họ. Chúng tôi thực hiện điều này bằng cách tạo ra các sản phẩm thuận tiện, hiệu quả, dễ hiểu và chỉ sử dụng các thành phần sạch, đã được chứng minh.
 

Tại RSP Nutrition, các sản phẩm của RSP giúp nâng cao hiệu suất tập luyện mà không yêu cầu bạn hy sinh cuộc sống mà bạn đã làm việc rất chăm chỉ để kiếm được. RSP sống để truyền cảm hứng cho khách hàng bằng cách đòi hỏi những điều tốt nhất của sản phẩm của RSP mang tới cho bạn. Để bạn có thể tự tin giới thiệu sản phẩm của RSP Nutrition tới tất cả mọi người.')
GO
INSERT [dbo].[Brand] ([id], [name], [image], [info]) VALUES (9, N'Spring Valley', N'http://localhost/resource/brands/9/9.jpg', N'Spring Valley là thương hiệu cửa hàng được bán độc quyền tại Walmart. Các loại vitamin của Spring Valley có giá cả phải chăng và được bán rộng rãi.')
GO
INSERT [dbo].[Brand] ([id], [name], [image], [info]) VALUES (10, N'REDCON1', N'http://localhost/resource/brands/10/10.jpg', N'REDCON1 là công ty bổ sung thể thao phát triển nhanh nhất trong lịch sử. Một công ty dựa trên sứ mệnh được thành lập dựa trên một nguyên tắc đơn giản - tạo ra các chất bổ sung chất lượng cao nhất cho người tập luyện thể dục thể thao.')
GO
INSERT [dbo].[Brand] ([id], [name], [image], [info]) VALUES (11, N'MyProtein', N'http://localhost/resource/brands/11/11.jpg', N'MyProtein là thương hiệu dinh dưỡng thể thao dẫn đầu tại Anh, mang lại dòng sản phẩm chất lượng bao gồm bột protein, các loại vitamin và khoáng chất, thực phẩm giàu protein, các dòng thực phẩm ăn nhẹ đảm bảo sức khỏe, và trang phục thể thao chất lượng cao giá tốt.')
GO
INSERT [dbo].[Brand] ([id], [name], [image], [info]) VALUES (12, N'Ostrovit', N'http://localhost/resource/brands/12/12.jpg', N'Ostrovit là một trong những thương hiệu thực phẩm bổ sung lâu năm tại Ba Lan, chuyên cung cấp các sản phẩm bổ sung dinh dưỡng cho sức khỏe.')
GO
INSERT [dbo].[Brand] ([id], [name], [image], [info]) VALUES (13, N'Quaker', N'http://localhost/resource/brands/13/13.jpg', N'Nếu bạn đang tìm đến 1 nguồn thực phẩm, đủ trọn vẹn những yếu tố liên quan đến sức khỏe, giữ dáng, giảm cân, cung cấp năng lượng thì yến mạch chính là sự lựa chọn gần gũi và đơn giản nhất mà bạn có thể tìm thấy. Nếu như đã nhắc đến Yến mạch chắc chắn chúng ta không thể không nhắc tới thương hiệu số 1 thế giới trong việc sản xuất yến mạch mang tên: QUAKER')
GO
INSERT [dbo].[Brand] ([id], [name], [image], [info]) VALUES (14, N'Bronson Vitamin', N'http://localhost/resource/brands/14/14.jpg', N'Bronson Vitamin cung cấp nhiều loại thực phẩm bổ sung, vitamin và khoáng chất cần thiết cho 1 sức khỏe toàn diện. Thương hiệu đáng tin cậy này cung cấp nhiều lựa chọn lành mạnh về các biện pháp tự nhiên, thảo mộc và các sản phẩm làm đẹp sạch.')
GO
INSERT [dbo].[Brand] ([id], [name], [image], [info]) VALUES (15, N'Labrada', N'http://localhost/resource/brands/15/15.jpg', N'Labrada Nutrition cung cấp dòng thực phẩm bổ sung hỗ trợ tập luyện hiệu quả, trong đó sản phẩm chủ đạo là sản phẩm thay thế bữa ăn bổ sung dinh dưỡng toàn diện LeanBody.')
GO
INSERT [dbo].[Brand] ([id], [name], [image], [info]) VALUES (16, N'Muscletech', N'http://localhost/resource/brands/16/16.jpg', N'Muslcetech truyền cảm hứng cho những người đam mê tập luyện thể dục thể thao và các vận động viên với những nguồn thực phẩm bổ sung chất lượng cao, uy tín trên toàn thị trường.')
GO
INSERT [dbo].[Brand] ([id], [name], [image], [info]) VALUES (17, N'BPI Sports', N'http://localhost/resource/brands/17/17.jpg', N'BPI Sports cam kết cung cấp các sản phẩm có hương vị tốt nhất và chất lượng cao nhất hiện có để giúp người tiêu dùng đạt được hiệu suất tập luyện tối đa.')
GO
INSERT [dbo].[Brand] ([id], [name], [image], [info]) VALUES (18, N'Optimum Nutrition', N'http://localhost/resource/brands/18/18.jpg', N'Sản phẩm của Optimum Nutrition được phân phối rộng rãi trên hơn 100 quốc giá trên thế giới. Tại Việt Nam, Gymstore tự hào là nhà phân phối các sản phẩm của Optimum Nutrition 100% chính hãng. ')
GO
SET IDENTITY_INSERT [dbo].[Brand] OFF
GO
SET IDENTITY_INSERT [dbo].[Category] ON 
GO
INSERT [dbo].[Category] ([id], [name], [info]) VALUES (2, N'CLA', N'CLA')
GO
INSERT [dbo].[Category] ([id], [name], [info]) VALUES (3, N'Creatine', N'Creatine')
GO
INSERT [dbo].[Category] ([id], [name], [info]) VALUES (4, N'EAA', N'EAA')
GO
INSERT [dbo].[Category] ([id], [name], [info]) VALUES (5, N'Glutamine', N'Glutamine')
GO
INSERT [dbo].[Category] ([id], [name], [info]) VALUES (6, N'Pre-Workout', N'Pre-Workout')
GO
INSERT [dbo].[Category] ([id], [name], [info]) VALUES (7, N'Whey Protein', N'Whey Protein')
GO
INSERT [dbo].[Category] ([id], [name], [info]) VALUES (8, N'BCAA', N'BCAA')
GO
INSERT [dbo].[Category] ([id], [name], [info]) VALUES (9, N'Casein Protein', N'Casein Protein')
GO
INSERT [dbo].[Category] ([id], [name], [info]) VALUES (10, N'Collagen', N'Collagen')
GO
INSERT [dbo].[Category] ([id], [name], [info]) VALUES (11, N'Sữa Tăng Cân Nhanh', N'Sữa Tăng Cân Nhanh')
GO
INSERT [dbo].[Category] ([id], [name], [info]) VALUES (12, N'Vitamin Tổng Hợp', N'Vitamin Tổng Hợp')
GO
INSERT [dbo].[Category] ([id], [name], [info]) VALUES (13, N'ZMA', N'ZMA')
GO
INSERT [dbo].[Category] ([id], [name], [info]) VALUES (14, N'Testosterone Booster', N'Testosterone Booster')
GO
INSERT [dbo].[Category] ([id], [name], [info]) VALUES (15, N'MCT Oil', N'MCT Oil')
GO
INSERT [dbo].[Category] ([id], [name], [info]) VALUES (16, N'Biotin', N'Biotin')
GO
INSERT [dbo].[Category] ([id], [name], [info]) VALUES (17, N'Astaxanthin', N'Astaxanthin')
GO
INSERT [dbo].[Category] ([id], [name], [info]) VALUES (18, N'Bảo vệ gan', N'Bảo vệ gan')
GO
INSERT [dbo].[Category] ([id], [name], [info]) VALUES (19, N'Beta Glucan', N'Beta Glucan')
GO
INSERT [dbo].[Category] ([id], [name], [info]) VALUES (20, N'Fish Oil', N'Fish Oil')
GO
INSERT [dbo].[Category] ([id], [name], [info]) VALUES (22, N'Protein Bar', N'Protein Bar')
GO
INSERT [dbo].[Category] ([id], [name], [info]) VALUES (23, N'Vegan Protein', N'Vegan Protein')
GO
INSERT [dbo].[Category] ([id], [name], [info]) VALUES (24, N'Glucosamine', N'Glucosamine')
GO
INSERT [dbo].[Category] ([id], [name], [info]) VALUES (25, N'Iron ( Sắt )', N'Iron ( Sắt )')
GO
INSERT [dbo].[Category] ([id], [name], [info]) VALUES (26, N'Green Tea Extract', N'Green Tea Extract')
GO
INSERT [dbo].[Category] ([id], [name], [info]) VALUES (27, N'Stim Free Fat Burner', N'Stim Free Fat Burner')
GO
INSERT [dbo].[Category] ([id], [name], [info]) VALUES (28, N'Probiotic', N'Probiotic')
GO
INSERT [dbo].[Category] ([id], [name], [info]) VALUES (29, N'Carb Source', N'Carb Source')
GO
INSERT [dbo].[Category] ([id], [name], [info]) VALUES (30, N'Diet Food', N'Diet Food')
GO
INSERT [dbo].[Category] ([id], [name], [info]) VALUES (31, N'Protein thực vật', N'Protein thực vật')
GO
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
INSERT [dbo].[FK_Account_Role] ([account_id], [role_id]) VALUES (1, 3)
GO
INSERT [dbo].[FK_Account_Role] ([account_id], [role_id]) VALUES (2, 1)
GO
INSERT [dbo].[FK_Account_Role] ([account_id], [role_id]) VALUES (2, 2)
GO
INSERT [dbo].[FK_Account_Role] ([account_id], [role_id]) VALUES (2, 3)
GO
INSERT [dbo].[FK_Account_Role] ([account_id], [role_id]) VALUES (3, 3)
GO
INSERT [dbo].[Item] ([order_id], [product_id], [quantity], [rating], [cost]) VALUES (1, 2, 1, 5, 450000)
GO
INSERT [dbo].[Item] ([order_id], [product_id], [quantity], [rating], [cost]) VALUES (2, 3, 1, 5, 650000)
GO
INSERT [dbo].[Item] ([order_id], [product_id], [quantity], [rating], [cost]) VALUES (2, 5, 1, 5, 750000)
GO
INSERT [dbo].[Item] ([order_id], [product_id], [quantity], [rating], [cost]) VALUES (2, 7, 1, 5, 550000)
GO
INSERT [dbo].[Item] ([order_id], [product_id], [quantity], [rating], [cost]) VALUES (2, 8, 1, 5, 1150000)
GO
INSERT [dbo].[Item] ([order_id], [product_id], [quantity], [rating], [cost]) VALUES (3, 3, 1, 5, 650000)
GO
INSERT [dbo].[Item] ([order_id], [product_id], [quantity], [rating], [cost]) VALUES (4, 2, 1, 5, 450000)
GO
SET IDENTITY_INSERT [dbo].[Order] ON 
GO
INSERT [dbo].[Order] ([id], [date], [account_id], [total]) VALUES (1, CAST(N'2024-04-17' AS Date), 2, N'450000    ')
GO
INSERT [dbo].[Order] ([id], [date], [account_id], [total]) VALUES (2, CAST(N'2024-04-17' AS Date), 2, N'3100000   ')
GO
INSERT [dbo].[Order] ([id], [date], [account_id], [total]) VALUES (3, CAST(N'2024-04-17' AS Date), 2, N'650000    ')
GO
INSERT [dbo].[Order] ([id], [date], [account_id], [total]) VALUES (4, CAST(N'2024-04-18' AS Date), 1, N'450000    ')
GO
SET IDENTITY_INSERT [dbo].[Order] OFF
GO
SET IDENTITY_INSERT [dbo].[Post] ON 
GO
INSERT [dbo].[Post] ([id], [intro], [author_id], [title], [date], [background]) VALUES (1, N'dasadsa', 2, N'dasadsa', CAST(N'2024-04-17' AS Date), N'http://localhost/resource/posts/1/1.jpg')
GO
SET IDENTITY_INSERT [dbo].[Post] OFF
GO
SET IDENTITY_INSERT [dbo].[Post_Content] ON 
GO
INSERT [dbo].[Post_Content] ([id], [subheading], [contents], [image], [imageNote], [post_id]) VALUES (1, N'dsadasdasd', N'dsadsadsa', N'http://localhost/resource/contents/1/1.jpg        ', N'dâs', 1)
GO
SET IDENTITY_INSERT [dbo].[Post_Content] OFF
GO
SET IDENTITY_INSERT [dbo].[Product] ON 
GO
INSERT [dbo].[Product] ([id], [name], [category_id], [brand_id], [image], [price], [info], [solds], [stock]) VALUES (2, N'PVL 100% Pure Creatine Unflavour, 300 gram (60 Servings)', 3, 2, N'http://localhost/resource/products/2/2.jpg                                                          ', 450000, N'- Gia tăng sức bền tập luyện: Cho phép cơ thể bạn tập luyện trong 1 thời gian dài với cường độ cao và cung cấp một nguồn năng lượng bền bỉ để có thể duy trì, đây là yếu tố quan trọng trong việc phát triển cơ bắp dài hạn. 

 

- Cải thiện tín hiệu tế bào: Gia tăng tín hiệu tế bào giúp bạn tập trung hơn và gia tăng sự kết nối cơ bắp và não bộ giúp bạn vận động hiệu quả hơn, từ đó phát triển cơ bắp tốt hơn. 

 

- Gia tăng Hormone đồng hóa: Nghiên cứu đã chỉ ra, khi cơ thể gia tăng hormone sẽ giúp cơ bắp phát triển tốt hơn, chẳng hạn như gia tăng IGF-1 (Insulin).

 

- Bù nước, bù khoáng: Nâng cao hàm lượng nước trong tế bào cơ, gây ra hiệu ứng tích tụ tế bào có thể đóng một vai trò trong sự phát triển cơ.

 

- Giảm thiểu việc dị hóa cơ bắp: Có thể tăng khối lượng cơ bắp bằng việc giảm tỉ lệ phân hủy cơ. 

 

- Giảm mức myostatin: Mức myostatin protein tăng cao có thể làm chậm hoặc ức chế hoàn toàn sự phát triển sợi cơ mới. Bổ sung creatine có thể làm giảm các mức độ này, tăng khả năng tăng trưởng của cơ bắp.', NULL, 100)
GO
INSERT [dbo].[Product] ([id], [name], [category_id], [brand_id], [image], [price], [info], [solds], [stock]) VALUES (3, N'PVL Isolated CLA 1250mg, 180 Softgels', 2, 2, N'http://localhost/resource/products/3/3.jpg                                                          ', 650000, N'Mỗi viên PVL CLA cung cấp 1250mg CLA, được chiết xuất từ dầu hoa rum (Safflower Oil) với hai dạng chính: • CLA cis-9, trans-11 • CLA trans-10, cis-12 Đây là hai dạng CLA được coi là có hiệu quả cao nhất trong việc kích thích trao đổi chất, giúp cơ thể chuyển hóa mỡ thừa thành năng lượng tốt hơn. Nói qua một chút về Safflower Oil, hay còn gọi là dầu hoa rum. Dầu hoa rum được lấy từ hạt của cây rum, rất giàu chất béo không bão hòa và có thành phần tương tự như dầu thực vật. CLA được chiết xuất từ dầu hoa rum có nguồn gốc 100% thực vật và được nghiên cứu chứng minh có tác dụng hỗ trợ giảm mỡ hiệu quả. Thực chất CLA là một loại axit béo omega-6 không bão hòa đa. Nói cách khác, CLA là chất béo chuyển hóa - nhưng là một loại chất béo chuyển hóa tự nhiên có trong nhiều loại thực phẩm lành mạnh như thịt bò và sữa. Khác với các chất béo chuyển hóa công nghiệp gây nhiều tác hại với cơ thể, CLA hỗ trợ sức khỏe tổng thể và có tác dụng giảm cân. • Tác dụng giảm mỡ của CLA: CLA có tác dụng giảm tích tụ chất béo trong cơ thể và hỗ trợ sự phát triển của khối lượng cơ nạc. Bổ sung CLA cũng có tác dụng tăng trao đổi chất và hơn nữa là việc tăng khối lượng cơ nạc đồng nghĩa với việc cơ thể sẽ tiêu thụ nhiều calo hơn, ngay khi ở trạng thái nghỉ ngơi. • CLA là một chất chống oxy hóa rất mạnh, có hoạt tính chống oxy hóa gấp khoảng 100 lần so với vitamin E, nhờ đó axit béo này giúp ức chế sự hình thành của các gốc tự do và làm chậm quá trình lão hóa của cơ thể. • CLA cải thiện quá trình khoáng hóa xương và có khả năng duy trì mức độ glucose ổn định trong máu, nhờ đó cũng hỗ trợ giảm cân tốt hơn.	', NULL, 100)
GO
INSERT [dbo].[Product] ([id], [name], [category_id], [brand_id], [image], [price], [info], [solds], [stock]) VALUES (4, N'PVL Creatine X8 | Unflavour, 240 gams (30 Servings)', 3, 2, N'http://localhost/resource/products/4/4.jpg                                                          ', 650000, N'• Vào ngày không tập: Hòa tan 1 serving (1/2 muỗng) với 100-150ml nước lọc nguội hoặc nước trái cây (không có tính axit), lắc cho tan hoàn toàn và uống ngay, sử dụng sau khi thức dậy.

 

• Vào ngày tập: Sử dụng 2 servings mỗi ngày,

 

Sử dụng 1 serving uống sau khi tập: Sau khi tập để tối ưu hóa khả năng của Creatine trong việc phục hồi và phát triển cơ bắp. Khách hàng nên sử dụng 1 Serving PVL CREATINE X8 + 1 Serving Whey Protein + 1 nguồn Carb nhanh ví dụ như chuối để giúp tái tổng hợp lại Glycogen, đồng thời tăng kích thích tổng hợp Protein trong cơ bắp giúp phục hồi và phát triển toàn diện. ', NULL, 100)
GO
INSERT [dbo].[Product] ([id], [name], [category_id], [brand_id], [image], [price], [info], [solds], [stock]) VALUES (5, N'PVL EAA+BCAA Complete, 30 Servings (330 gram)', 4, 2, N'http://localhost/resource/products/5/5.jpg                                                          ', 750000, N'- Pha 1-2 muỗng PVL BCAA EAA với 500ml nước mát để sử dụng

 

+ Thời gian quan trọng nhất sẽ là những khoảng thời gian trước tập, trong tập và sau tập. Đây là khoảng thời gian cơ thể cần một lượng lớn các chất hấp thụ để chuyển hóa các chất dinh dưỡng cũng như phục hồi cơ bắp của bạn tốt nhất.

 

+ Bạn cũng có thể pha 1 muỗng để dùng hàng ngày như nước giải khát hoặc đi kèm với bữa ăn để tổng hợp các chất trong bữa ăn tốt hơn.', NULL, 100)
GO
INSERT [dbo].[Product] ([id], [name], [category_id], [brand_id], [image], [price], [info], [solds], [stock]) VALUES (6, N'PVL EAA+BCAA Complete, 90 Servings (1107 gram)', 4, 2, N'http://localhost/resource/products/6/6.jpg                                                          ', 1450000, N'- Pha 1-2 muỗng PVL EAA+BCAA COMPLETE pha với 500ml cùng với nước mát để sử dụng

 

+ Thời gian quan trọng nhất sẽ là những khoảng thời gian trước tập, trong tập và sau tập. Đây là khoảng thời gian cơ thể cần một lượng lớn các chất hấp thụ để chuyển hóa các chất dinh dưỡng cũng như phục hồi cơ bắp của bạn tốt nhất.

 

+ Bạn cũng có thể pha 1 muỗng để dùng hàng ngày như nước giải khát hoặc đi kèm với bữa ăn để tổng hợp các chất trong bữa ăn tốt hơn.', NULL, 100)
GO
INSERT [dbo].[Product] ([id], [name], [category_id], [brand_id], [image], [price], [info], [solds], [stock]) VALUES (7, N'PVL 100% Pure Glutamine 400 gram, 80 Servings', 5, 2, N'http://localhost/resource/products/7/7.jpg                                                          ', 550000, N'Đối với người lớn, có thể dùng 5-9 gram L-Glutamine mỗi ngày sau khi tập luyện. Pha 1 muỗng với 150 mL nước lạnh. Bạn có thể điều chỉnh lượng nước tùy theo khẩu vị của bản thân.

 

Ngoài ra, PVL Glutamine có phiên bản Unflavoured - không vị, bạn có thể mix chung với thức uống yêu thích hoặc Whey Protein hay BCAA để tăng thêm hương vị cho sản phẩm. 

 

Lưu ý khi sử dụng PVL Glutamine:
 

Chế độ ăn uống bình thường cung cấp từ 3-6G Glutamine. Tùy thuộc vào nhu cầu của cơ thể, bạn cần tham khảo thêm ý kiến của chuyên gia để không bổ sung quá nhiều Glutamine hơn mức cần thiết. Luôn sử dụng theo đúng hướng dẫn sử dụng của nhà sản xuất để tránh gây ra tác dụng phụ.', NULL, 100)
GO
INSERT [dbo].[Product] ([id], [name], [category_id], [brand_id], [image], [price], [info], [solds], [stock]) VALUES (8, N'PVL Domin8 Pre-workout Superfuel, 520 Gams (40 Servings)', 6, 2, N'http://localhost/resource/products/8/8.jpg                                                          ', 1150000, N'Người lớn từ 18 tuổi trở lên: Đảm bảo uống đủ nước trước, trong và sau khi tập thể dục. Pha ½ muỗng với 1-2 cốc nước ngay trước khi uống, 45–90 phút trước khi tập luyện. 

 

Lưu ý: 

 

Chỉ dành cho người lớn khỏe mạnh. Không sử dụng nếu bạn bị dị ứng với bất kỳ hợp chất nào của sản phẩm. Không vượt quá liều khuyến cáo hàng ngày. Không vượt quá liều 400 mg caffeine mỗi ngày từ tất cả các nguồn.', NULL, 100)
GO
INSERT [dbo].[Product] ([id], [name], [category_id], [brand_id], [image], [price], [info], [solds], [stock]) VALUES (9, N'PVL ISO Gold - Premium Whey Protein With Probiotic, 5 Lbs (2.27kg)', 7, 2, N'http://localhost/resource/products/9/9.jpg                                                          ', 1950000, N'Bạn nên sử dụng vào 2 thời điểm chính trong ngày để mang lại hiệu quả cao nhất: buổi sáng sau khi ngủ dậy và ngay sau khi tập.

 

Mỗi lần sử dụng pha 1 muỗng ISO GOLD với 200-300ml nước lọc hoặc sữa tươi không đường. Lắc đều và sử dụng ngay, không nên để lâu.', NULL, 100)
GO
INSERT [dbo].[Product] ([id], [name], [category_id], [brand_id], [image], [price], [info], [solds], [stock]) VALUES (10, N'PVL Whey Gold - 100% Whey Protein Shake Mix, 6Lbs (72 Servings)', 7, 2, N'http://localhost/resource/products/10/10.jpg                                                        ', 1640000, N'PVL WHEY GOLD nâng mức tiêu chuẩn Protein Blend lên tâng cao mới. Công thức tiên tiến của PVL sạch hơn và hấp thụ nhanh hơn các nguồn protein kém chất lượng. Rất đơn giản, để giúp bạn có thể đạt được mục tiêu của mình sớm hơn!

 

PVL WHEY GOLD sản xuất Protein với các loại whey protein đã qua xử lý lạnh, được vi lọc từ các nguồn sữa loại A được cho ăn cỏ và không chứa hormone. 

 

Đi cùng với công nghệ đặc biệt, PVL WHEY GOLD bổ sung các enzyme để cải thiện tiêu hóa cũng như hấp thụ Whey Protein tốt hơn. Đi cùng với 2 hương vị đặc trưng và ngon nhất của hãng đó chính là: Vanilla Soft Serve Supreme và Triple Chocolate Brownie Overload mang lại cho bạn một trải nghiệm hương vị đỉnh hơn bao giờ hết. ', NULL, 100)
GO
INSERT [dbo].[Product] ([id], [name], [category_id], [brand_id], [image], [price], [info], [solds], [stock]) VALUES (11, N'PVL ISO Gold - Premium Whey Protein With Probiotic, 2 Lbs (908 gram)', 7, 2, N'http://localhost/resource/products/11/11.jpg                                                        ', 990000, N'◾️ Whey Protein Isolate & Whey Protein Hydrolysate: Được kiểm chứng 100% nguồn Whey Protein lấy từ bò ăn cỏ. Những con vật này được nuôi trên đồng cỏ hữu cơ và ăn chế độ ăn tự nhiên, dựa trên thực vật - không phải chế độ ăn ngô hoặc đậu nành lấp đầy máng của các trang trại thông thường.

 

=> Do đó, Whey Protein được nuôi bằng cỏ có hàm lượng các hợp chất hoạt tính sinh học, tăng cường miễn dịch cao hơn so với những dòng Whey khác trên thị trường.

 

◾️ 27G Protein: Đóng vai trò trong việc cung cấp một lượng đạm chất lượng gíp phục hồi và phát triển cơ bắp một cách tối đa.

 

◾️ Đi kèm trong đó không thể thiếu đó là những nguồn EAA và BCAA chất lượng có ở trong 2 nguồn Protein chính.

 

◾️ 17G EAA: Giúp tổng hợp lượng Protein dung nạp trong mỗi Serving hỗ trợ phát triển cơ bắp.

 

◾️ 6G BCAA: Hỗ trợ gia tăng sức bền cơ bắp và chống dị hóa cơ sau khi tập luyện.

 

◾️ Sucralose: là chất làm ngọt nhân tạo, sản phẩm phổ biến nhất được làm từ nó được gọi là Splenda. Sucralose được làm từ đường nhưng không chứa calo và ngọt hơn nhiều. Các nghiên cứu đã chỉ ra Sucralose không có bất kỳ ảnh hưởng lớn nào đến trọng lượng cơ thể.', NULL, 100)
GO
INSERT [dbo].[Product] ([id], [name], [category_id], [brand_id], [image], [price], [info], [solds], [stock]) VALUES (12, N'Rule1 R1 BCAAs, 30 Servings', 8, 1, N'http://localhost/resource/products/12/12.jpg                                                        ', 350000, N'BCAA là dưỡng chất rất cần thiết với cơ thể trong việc phục hồi cơ bắp. Hợp chất này không thể được tổng hợp trong cơ thể chúng ta mà phải được lấy từ thực phẩm giàu protein và chất bổ sung. Rule 1 BCAA cung cấp cả ba axit amin quan trọng này theo tỷ lệ 2: 1: 1 của Leucine so với Isoleucine và Valine đi kèm với những tác dụng nổi bật như:

 

✓ Phát triển cơ bắp: Nhờ bổ sung hàm lượng leucine hỗ trợ tăng khả năng tổng hợp Protein,  thúc đẩy phát triển cơ bắp. 

 

✓ Tăng cường hiệu suất tập: Bổ sung BCAA giúp tái tạo ATP, cung cấp năng lượng cho cơ bắp, giúp cơ bắp hoạt động được lâu hơn và bền bỉ hơn.', NULL, 100)
GO
INSERT [dbo].[Product] ([id], [name], [category_id], [brand_id], [image], [price], [info], [solds], [stock]) VALUES (13, N'Rule1 R1 Casein, 4.0 Lbs (55 Servings)', 9, 1, N'http://localhost/resource/products/13/13.jpg                                                        ', 1550000, N'Rule 1 Casein là sản phẩm của hãng Rule One Protein - thương hiệu Thực phẩm bổ sung đình đám tại Mỹ với những sản phẩm chất lượng như Rule 1 R1 Whey Protein, Rule 1 Whey Blend,...

 

Rule One Protein được thành lập vào năm 2014 bởi gia đình nhà Costello, những người đã có công sáng lập và điều hành hãng Optimum Nutrition (ON) danh tiếng với thương hiệu Whey Gold Standard huyền thoại trên toàn thế giới một thời. 

 

Sau khi bán thương hiệu ON cho hãng Glanbia, anh em nhà Costello đã sáng lập nên thương hiệu mới, nối tiếp ưu điểm của công nghệ cũ và áp dụng cải tiến dây chuyền để tạo nên thương hiệu RULE 1.', NULL, 100)
GO
INSERT [dbo].[Product] ([id], [name], [category_id], [brand_id], [image], [price], [info], [solds], [stock]) VALUES (14, N'Rule1 R1 Casein, 2.09 Lbs (28 Servings)', 9, 1, N'http://localhost/resource/products/14/14.jpg                                                        ', 800000, N'• 25G protein giải phóng chậm

• Nguồn Casein Micellar cao cấp

• Chuỗi Axit Amin giúp nuôi cơ 7 tiếng liên tục

• Sản phẩm giàu chất EAA giúp tổng hợp Protein tốt hơn

• Được pha trộn và đóng gói cẩn thận trong một cơ sở GMP ở Hoa Kỳ

• Hàm lượng Glutamine lên tới gần 5g giúp tăng hàm lượng Hoocmon tăng trưởng bằng cách ngăn chặn sự dị hóa cơ, giúp duy trì khối và Hydrate tế bào', NULL, 100)
GO
INSERT [dbo].[Product] ([id], [name], [category_id], [brand_id], [image], [price], [info], [solds], [stock]) VALUES (15, N'R1 Rule 1 Collagen Peptides, 28 Serving', 10, 1, N'http://localhost/resource/products/15/15.jpg                                                        ', 590000, N'Sau khi đã quá thành công với dòng sản phẩm Whey Protein Rule 1, hãng Rule One Proteins đã tiếp tục nghiên cứu để cho ra một cái tên khác hứa hẹn nhiều thành công, đó là bột uống collagen thủy phân Rule 1 Collagen.

 

Rule 1 Collagen có thành phần là 100% collagen thủy phân cao cấp được chiết xuất từ da bò, hay còn gọi là Bovine Collagen. Đây là nguồn collagen được đánh giá là an toàn và có khả năng dung nạp tốt, cũng như giá thành hợp lý. 

 

Cụ thể, Bovine Collagen trong Rule 1 Collagen là Grass-Fed & Pasture-Raised, tức là nguồn collagen được chiết xuất từ da của bò được nuôi thả tự nhiên và hoàn toàn không ăn thức ăn công nghiệp, vì thế có thể sẽ không bị ảnh hưởng bởi hóa chất hay một số chất tăng trọng. Đồng thời, bò nuôi thả cũng được đánh giá là có sức khỏe tốt hơn với khi bị nuôi nhốt. 

 

Ngoài ra, hãng Rule One Proteins cũng cam kết Rule 1 Collagen là sản phẩm 7 KHÔNG:

 

• KHÔNG Fillers (Chất độn)
• KHÔNg Đường
• KHÔNG Gluten
• KHÔNG chứa Sữa
• KHÔNG Chất kích thích (Stimulants)
• KHÔNG Chất làm ngọt nhân tạo
• KHÔNG Chất cấm

 

Nói qua một chút về thương hiệu Rule One Proteins, đây là thương hiệu Thực phẩm bổ sung đình đám tại Mỹ với những sản phẩm chất lượng và gây tiếng vang như Rule 1 R1 Whey Protein, Rule 1 Whey Blend,...', NULL, 100)
GO
INSERT [dbo].[Product] ([id], [name], [category_id], [brand_id], [image], [price], [info], [solds], [stock]) VALUES (16, N'Rule 1 Creatine Monohydrate, 150 gam (30 servings)', 3, 1, N'http://localhost/resource/products/16/16.jpg                                                        ', 290000, N'✓ Cung cấp năng lượng ATP giúp cải thiện hiệu suất tập luyện cường độ cao 

✓ Kích thích quá trình sinh học tăng kích thước và phát triển cơ bắp

✓ Cải thiện hiệu suất tập luyện ở nhiều bộ môn tập luyện khác nhau

✓ Tăng tốc độ phát triển cơ bắp 

✓ Hỗ trợ giảm cân giảm mỡ

✓ Tăng cường sự tập trung của não bộ trong tập luyện 

✓ Giảm mệt mỏi, cung câp năng lượng hiệu quả

✓ An toàn hiệu quả, sử dụng được với nhiều đối tượng', NULL, 100)
GO
INSERT [dbo].[Product] ([id], [name], [category_id], [brand_id], [image], [price], [info], [solds], [stock]) VALUES (17, N'Rule1 Charged Creatine, 30 Servings (240 Gams)', 3, 1, N'http://localhost/resource/products/17/17.jpg                                                        ', 490000, N'✓ Cung cấp năng lượng ATP giúp cải thiện hiệu suất tập luyện cường độ cao 

✓ Kích thích quá trình sinh học giúp tăng kích thước và phát triển cơ bắp

✓ Cải thiện hiệu suất tập luyện ở nhiều bộ môn tập luyện khác nhau

✓ Tăng tốc độ phát triển cơ bắp 

✓ Cung cấp chất điện giải giúp duy trì độ ổn định của cơ bắp 

✓ Tăng cường sự tập trung của não bộ trong tập luyện 

✓ Giảm mệt mỏi, cung cấp năng lượng giúp tăng mức dopamine 

✓ An toàn hiệu quả, sử dụng được với nhiều đối tượng', NULL, 100)
GO
INSERT [dbo].[Product] ([id], [name], [category_id], [brand_id], [image], [price], [info], [solds], [stock]) VALUES (18, N'Rule1 EAA Essential Amino 9 - 30 Servings', 4, 1, N'http://localhost/resource/products/18/18.jpg                                                        ', 550000, N'R1 Essential Amino 9 đem đến những lợi ích tuyệt vời cho việc tập luyện và phát triển cơ bắp. Cụ thể:

 

- Tăng tổng hợp protein: EAAs sử dụng trước khi tập luyện đã được chứng minh là cải thiện cả phản ứng tập thể dục đồng hóa (xây dựng cơ bắp) và tăng tổng hợp protein nuôi cơ bắp.

 

- Hỗ trợ phục hồi cơ bắp: Tăng tổng hợp protein cơ bắp có thể tạo ra sự cân bằng protein tích cực và dẫn đến trạng thái xây dựng cơ bắp (đồng hóa) cho phép bạn phục hồi tốt hơn sau khi tập luyện.

 

- Giảm đau nhức, tăng hiệu suất tập luyện: BCAA được sử dụng phổ biến với tác dụng ngăn ngừa mệt mỏi và tăng hiệu suất tập luyện. Bổ sung EAA, trong đó bao gồm cả BCAA giúp giảm đau nhức cơ bắp và gia tăng hiệu quả của việc tập luyện.

 

- Bổ sung điện giải, tăng sức bền: Trong quá trình tập luyện cơ thể bị mất nước và các khoáng chất. EAA Rule 1 bù điện giải nhanh chóng giúp tăng thể lực và sức bền để tập luyện hiệu quả hơn. 

 

- Phòng ngừa dị hóa, mất cơ: Dị hóa cơ bắp, hay mất cơ bắp, là quá trình suy giảm khối lượng cơ bắp xảy ra khi sự phân hủy protein vượt quá sự tổng hợp protein trong cơ. Nguyên nhân có thể do stress, tập luyện căng thẳng, không bổ sung đủ protein,... Bổ sung EAA có thể ngăn chặn quá trình này bằng cách duy trì nồng độ axit amin trong máu, giúp phục hồi cơ tối đa.', NULL, 100)
GO
INSERT [dbo].[Product] ([id], [name], [category_id], [brand_id], [image], [price], [info], [solds], [stock]) VALUES (19, N'Rule 1 Essential Amino 9 EAA+Energy, 30 Servings (345g)', 4, 1, N'http://localhost/resource/products/19/19.jpg                                                        ', 550000, N'✓ Tăng tốc độ phục hồi cơ bắp, tái tạo lại các sợi cơ mới
✓ Kích thích quá trình tổng hợp protein cơ bắp
✓ Tăng sức bền, hiệu suất tập luyện lên tối đa
✓ Giữ cho tinh thần tỉnh táo, minh mẫn, tập trung
✓ Bổ sung điện giải, bù nước, bù khoáng, ngăn ngừa chuột rút
✓ Gia tăng mức năng lượng cho cơ thể ', NULL, 100)
GO
INSERT [dbo].[Product] ([id], [name], [category_id], [brand_id], [image], [price], [info], [solds], [stock]) VALUES (20, N'Rule 1 Glutamine 100% Micronized', 5, 1, N'http://localhost/resource/products/20/20.jpg                                                        ', 450000, N'Chưa tới 6000 đồng/serving, Rule 1 Glutamine đem lại hàng loạt những lợi ích ấn tượng hỗ trợ tập luyện hiệu quả như: 

 

✓ Bổ sung lượng glutamine đã cạn kiệt trong cơ thể khi tập luyện.

✓ Hỗ trợ phát triển cơ bắp và tích tụ tế bào cơ.

✓ Bổ sung Rule 1 Glutamine giúp tăng tốc độ phục hồi sau khi tập luyện căng thẳng.

✓ Tăng cường hệ thống miễn dịch.

✓ Có thể thúc đẩy sức khỏe đường ruột.', NULL, 100)
GO
INSERT [dbo].[Product] ([id], [name], [category_id], [brand_id], [image], [price], [info], [solds], [stock]) VALUES (21, N'Sữa tăng cân Rule1 R1 LBS Gainer, 12 Lbs (20 Servings)', 11, 1, N'http://localhost/resource/products/21/21.jpg                                                        ', 1190000, N'▪️ Mass Rule 1 cung cấp 1030 calo trong một lần dùng, lượng calo vừa phải để tăng cân mà không gây tích mỡ. 

 

▪️ 40G protein tổng hợp từ Whey protein Concentrate, Whey Protein Isolate và Hydrolyzed, đem lại cho cơ thể nguồn đạm chất lượng cao, giúp xây dựng cơ bắp hiệu quả.

 

▪️ 200G hỗn hợp tinh bột phức tạp chất lượng cao dễ hấp thu, mang lại nguồn năng lượng nhanh cho cơ thể.

 

▪️ 2G Creatine Monohydrate giúp tổng hợp đạm tốt hơn và gia tăng sức mạnh cơ bắp.

 

▪️ 1G MCT - một loại chất béo tốt chiết xuất từ dầu dừa, hỗ trợ quá trình chuyển hóa thức ăn và hấp thụ dinh dưỡng tốt hơn.

 

▪️ 500mg L-glutamine đẩy nhanh quá trình phục hồi cơ bắp sau tập.', NULL, 100)
GO
INSERT [dbo].[Product] ([id], [name], [category_id], [brand_id], [image], [price], [info], [solds], [stock]) VALUES (22, N'Sữa tăng cân Rule1 R1 LBS Gainer, 6 Lbs (10 Servings)', 11, 1, N'http://localhost/resource/products/22/22.jpg                                                        ', 750000, N'- Sáng sau khi ngủ dậy : Bởi vì buổi sáng là thời điểm thích hợp nhất để hấp thụ năng lượng, cơ thể rất cần protein sau một đêm đã tiêu thụ hết.

 

- Trước tập 60-90 phút : Việc bổ sung protein trước nửa tiếng, carb (tinh bột)  trước 1 giờ chuẩn bị tập luyện đã được các chuyên gia thể hình nghiên cứu kỹ lưỡng, khi đó cơ thể đã nạp đủ năng lượng cần thiết để bước vào buổi tập.

 

- Ngay sau tập : Sau buổi tập lúc này cơ bắp cần được phục hồi nên cần bổ sung một lượng lớn carb và protein hấp thụ nhanh để cơ thể hấp thụ nuôi dưỡng cơ bắp.

 

- Trước khi ngủ : Quá trình ngủ cũng chính là lúc cơ thể cần được nuôi dưỡng, cung cấp dinh dưỡng phát triển.

 

Smothies trái cây: Thêm một ít trái cây mà bạn thích kèm với đá viên vào máy xay cùng với hỗn hợp như trên...và tận hưởng!

 

Supper Calories Shake: Cho vào máy xay 2 muỗng R1 LBS, 500-600ml sữa nguyên kem, 2 muỗng kem dừa, xay... và tận hưởng! ', NULL, 100)
GO
INSERT [dbo].[Product] ([id], [name], [category_id], [brand_id], [image], [price], [info], [solds], [stock]) VALUES (23, N'Rule 1 Protein 10 Lbs (4,576 kg)', 7, 1, N'http://localhost/resource/products/23/23.jpg                                                        ', 2990000, N'•  Công thức siêu tinh khiết với tỷ lệ protein vượt ngưỡng 83% trong mỗi serving.

 

•  2 thành phần chính: Whey Isolate + Whey Hydrolyzed là 2 dạng protein hấp thu nhanh và có giá trị dinh dưỡng cao nhất, giúp phát triển cơ bắp tốt hơn.

 

•  6G BCAA, hàm lượng tốt nhất hiện nay trong mỗi muỗng Whey Protein, hỗ trợ phục hồi cơ bắp tối đa.

 

•  Bổ sung thêm Glutamine giúp phục hồi và giảm thiểu việc đau nhức cơ bắp, tái tạo những sợi cơ bị tổn thương. 

 

•  Hoàn toàn không chứa Whey Concentrate.

 

•  Không đường. Không chất béo. Không gluten

 

•  Size to hơn, tiết kiệm hơn, sử dụng được lâu hơn', NULL, 100)
GO
INSERT [dbo].[Product] ([id], [name], [category_id], [brand_id], [image], [price], [info], [solds], [stock]) VALUES (24, N'Rule 1 Protein 5 Lbs (2,288 kg)', 7, 1, N'http://localhost/resource/products/24/24.jpg                                                        ', 1590000, N'✓ Cung cấp nguồn protein tinh khiết, hấp thụ nhanh và có giá trị sinh học cao.

 

✓ Hỗ trợ xây dựng cơ bắp hiệu quả,

 

✓ Thúc đẩy phục hồi nhanh hơn sau tập

 

✓ Tạo cảm giác no lâu, giảm thèm ăn.

 

✓ Hỗ trợ tăng cơ giảm mỡ.', NULL, 100)
GO
INSERT [dbo].[Product] ([id], [name], [category_id], [brand_id], [image], [price], [info], [solds], [stock]) VALUES (25, N'Rule 1 Whey Blend 5 Lbs (2.3Kg) - 70 Servings', 7, 1, N'http://localhost/resource/products/25/25.jpg                                                        ', 1250000, N'Hỗn hợp 3 loại whey của Rule 1 Blend cung cấp sự kết hợp hoàn hảo của chất lượng dinh dưỡng, hương vị tuyệt vời và giá cả hợp lý. Mỗi muỗng chứa 24 gram protein kết hợp từ 3 nguồn: Whey Protein Concentrate, Whey Protein Isolate và Whey Protein Hydrolysate bổ sung kèm EAA, BCAA và Glutamine tự nhiên.

 

Rule 1 Blend là dòng Whey Protein với giá tiết kiệm từ hãng Rule One Proteins. Hãng thực phẩm thể hình này đã quá quen thuộc với người tiêu dùng nhờ dòng Whey Protein Rule 1 siêu nổi tiếng. Nay Rule One đã cho ra đời dòng Rule 1 Whey Blend với công thức vượt trội và nhiều ưu điểm như: 

 

✓ 100% Whey Protein: Whey Protein Concentrate, Whey Protein Isolate và Whey Protein Hydrolyzed

✓ Không Spiking - chất tạo hàm lượng Protein giả tạo

✓ Không chất cấm

✓ Không Gluten

✓ Không Creamer

✓ Rule 1 Blend ít chất béo', NULL, 100)
GO
INSERT [dbo].[Product] ([id], [name], [category_id], [brand_id], [image], [price], [info], [solds], [stock]) VALUES (26, N'Rule1 Whey Blend 10Lbs - 140 Servings', 7, 1, N'http://localhost/resource/products/26/26.jpg                                                        ', 2500000, N'Hỗn hợp 3 loại whey của Rule 1 R1 Whey Blend 10lbs cung cấp sự kết hợp hoàn hảo của  100% Whey Protein từ 3 nguồn: Whey Protein Concentrate cô đặc, Whey Protein Isolate tinh khiết và Whey Protein Hydrolysate siêu hấp thu, 24 gram protein trên mỗi muỗng và được bổ sung EAA, BCAA và Glutamine tự nhiên.

 

Rule 1 Blend là dòng Whey Protein với giá tiết kiệm từ hãng Rule One Proteins. Hãng thực phẩm thể hình này đã quá quen thuộc với người tiêu dùng nhờ dòng Whey Protein Rule 1 siêu nổi tiếng. Nay Rule One đã cho ra đời dòng Rule 1 Whey Blend 10lbs với size to hơn nhưng chất lượng không đổi: 

 

✓ 100% Whey Protein: Whey Protein Concentrate, Whey Protein Isolate và Whey Protein Hydrolyzed

✓ Không Spiking - chất tạo hàm lượng Protein giả tạo

✓ Không chất phụ gia', NULL, 100)
GO
INSERT [dbo].[Product] ([id], [name], [category_id], [brand_id], [image], [price], [info], [solds], [stock]) VALUES (27, N'Rule 1 R1 Whey Blend 2 Lbs, 28 Servings', 7, 1, N'http://localhost/resource/products/27/27.jpg                                                        ', 700000, N'KHI NÀO LÀ THỜI GIAN TỐT NHẤT ĐỂ SỬ DỤNG R1 WHEY BLEND? R1 Whey Blend là một protein hoạt động nhanh và hoạt động tốt vào buổi sáng khi thức dậy và trước hoặc ngay sau khi tập luyện để giúp cung cấp hiệu quả các axit amin quan trọng mà cơ bắp của bạn cần.

 

TÔI NÊN SỬ DỤNG BAO NHIÊU MUỖNG R1 BLEND? Nó thực sự phụ thuộc vào các yếu tố như cân nặng, chế độ ăn uống của bạn bao gồm những gì, tổng số calo bạn tiêu thụ và mức độ hoạt động của bạn. Một nguyên tắc chung trong thế giới thể hình là nhắm tới 1 gram protein cho mỗi pound trọng lượng cơ thể/mỗi ngày. Nói cách khác, một vận động viên 200 lb nên nhắm mục tiêu 200 g tổng protein từ tất cả các nguồn thực phẩm bao gồm bột protein và các chất bổ sung khác.', NULL, 100)
GO
INSERT [dbo].[Product] ([id], [name], [category_id], [brand_id], [image], [price], [info], [solds], [stock]) VALUES (33, N'Rule 1 R1 Protein 2 Lbs, 30 Servings', 7, 1, N'http://localhost/resource/products/33/33.jpg                                                        ', 890000, N'Rule 1 R1 Protein 2.52lbs nhỏ gọn tiện lợi những vẫn đi kèm chất lượng cao và vị siêu ngon. Với thương hiệu được thành lập từ năm 2014 với chuỗi sản phẩm được sản xuất bởi dây chuyên CFM công nghệ cao cho ra những sản phẩm tinh khiết và có giá trị sinh học cao nhất. 

 

Rule One Protein hiện đang là hãng thực phẩm bổ sung biết chiều lòng khách hàng nhất từ trước tới nay. 

 

Nhằm đem lại nhiều lựa chọn hơn cho khách hàng, Rule 1 Protein cho ra mắt chuỗi sản phẩm Rule 1 Protein với nhiều kích thước khác nhau như: 10lbs, 5lbs, 2.5Lbs, 1lbs và gói sample dùng thử.', NULL, 100)
GO
INSERT [dbo].[Product] ([id], [name], [category_id], [brand_id], [image], [price], [info], [solds], [stock]) VALUES (34, N'Rule 1 R1 Protein 1.06 Lbs, 16 Servings', 7, 1, N'http://localhost/resource/products/34/34.jpg                                                        ', 470000, N'
Rule 1 là một thương hiệu mới thành lập từ năm 2014 các sản phẩm 100% ứng dụng những công nghệ sản xuất tiên tiến, hiện đại tạo nên sản phẩm tăng cơ bắp hàng đầu thị trường hiện nay.

 

Rule 1 Protein 1lbs là một trong những sản phẩm chất lượng của hãng, cung cấp 100% protein từ whey isolate & thủy phân có khả năng hấp thu nhanh vượt trội sau buổi tập Rule 1 Protein ít hoặc không có chất béo, cholesterol, carbohydrate hoặc đường, hương vị tự nhiên.

 

Rule 1 Protein 1lbs không còn chứa chất béo, tinh bột, cholesterol hoặc các tạp chất khác, luôn được người tập gym, tập thể hình đánh giá cao bởi bảng thành phần chất lượng mới tới hiệu quả phát triển cơ bắp vượt trội.', NULL, 100)
GO
INSERT [dbo].[Product] ([id], [name], [category_id], [brand_id], [image], [price], [info], [solds], [stock]) VALUES (35, N'Gói dùng 1 lần - Sample Rule 1 Protein 1 Serving', 7, 1, N'http://localhost/resource/products/35/35.jpg                                                        ', 150000, N'Khá rõ ràng những gì bạn đưa vào tập luyện của bạn là nhiều. Nhưng những gì bạn đưa vào cơ thể của bạn trước, trong và sau khi tập luyện thậm chí còn có thể nhiều hơn, chất lượng hơn với cùng một số tiền.

Đầu vào tốt hơn dẫn đến đầu ra tốt hơn. Đó là những gì nói về công thức Whey Hydrolysates, BCAAs nhiều hơn (hơn 6 gram - một trong những lượng cao nhất hiện có), L Glutamine và mọi thứ khác nữa.', NULL, 100)
GO
INSERT [dbo].[Product] ([id], [name], [category_id], [brand_id], [image], [price], [info], [solds], [stock]) VALUES (36, N'Gói dùng 1 lần - R1 Rule 1 Whey Blend', 7, 1, N'http://localhost/resource/products/36/36.jpg                                                        ', 25000, N'Gói dùng 1 lần', NULL, 100)
GO
INSERT [dbo].[Product] ([id], [name], [category_id], [brand_id], [image], [price], [info], [solds], [stock]) VALUES (37, N'Mutant BCAA 9.7, 30 Servings (348g)', 8, 3, N'http://localhost/resource/products/37/37.jpg                                                        ', 700000, N'Mutant BCAA cung cấp hàm lượng cao 3 axit amin leucine - isoleucine - valine. Chúng có tác dụng rất quan trọng trong việc phục hồi và phát triển cơ bắp, hỗ trợ gia tăng sức bền, đồng thời giảm mệt mỏi, chuột rút khi tập luyện cường độ cao.', NULL, 100)
GO
INSERT [dbo].[Product] ([id], [name], [category_id], [brand_id], [image], [price], [info], [solds], [stock]) VALUES (38, N'Mutant BCAA 9.7 - 90 Servings (1044g)', 8, 3, N'http://localhost/resource/products/38/38.jpg                                                        ', 1400000, N'Mutant BCAA cung cấp hàm lượng cao 3 axit amin leucine - isoleucine - valine. Chúng có tác dụng rất quan trọng trong việc phục hồi và phát triển cơ bắp, hỗ trợ gia tăng sức bền, đồng thời giảm mệt mỏi, chuột rút khi tập luyện cường độ cao.', NULL, 100)
GO
INSERT [dbo].[Product] ([id], [name], [category_id], [brand_id], [image], [price], [info], [solds], [stock]) VALUES (39, N'Mutant Creakong Creatine, 249 Gams (30 Servings)', 3, 3, N'http://localhost/resource/products/39/39.jpg                                                        ', 600000, N'Thực phẩm bổ sung MUTANT CREAKONG hay còn gọi là CREATINE. Creatine giúp cung cấp năng lượng cho cơ bắp, được sản xuất tự nhiên trong cơ thể và cũng được tìm thấy trong 1 số loại thực phẩm tươi màu đỏ: thịt bò tươi, cá hồi.', NULL, 100)
GO
INSERT [dbo].[Product] ([id], [name], [category_id], [brand_id], [image], [price], [info], [solds], [stock]) VALUES (40, N'MUTANT GEAAR Essential Amino Acids, 30 Servings (378 gram)', 4, 3, N'http://localhost/resource/products/40/40.jpg                                                        ', 700000, N'Geaar là sản phẩm bổ sung nguồn amino acid thiết yếu dồi dào cho sự phát triển của cơ bắp. Đồng thời hỗ trợ phục hồi cơ bắp, chống dị hóa và kích thích khả năng tổng hợp protein giúp xây dựng cơ bắp hiệu quả hơn.', NULL, 100)
GO
INSERT [dbo].[Product] ([id], [name], [category_id], [brand_id], [image], [price], [info], [solds], [stock]) VALUES (41, N'Mutant Glutamine 300g, 60 Servings', 5, 3, N'http://localhost/resource/products/41/41.jpg                                                        ', 480000, N'Mutant Glutamine là Thực phẩm bổ sung 100% L-Glutamine có tác dụng hỗ trợ phục hồi cơ bắp, tránh mất cơ, dị hóa cơ hiệu quả. Glutamine được biết đến là thành phần chính tham gia vào quá trình chuyển hóa protein, giúp xây dựng cơ bắp tối ưu.', NULL, 100)
GO
INSERT [dbo].[Product] ([id], [name], [category_id], [brand_id], [image], [price], [info], [solds], [stock]) VALUES (42, N'Mutant MCT OIL 946ml, 64 Servings', 15, 3, N'http://localhost/resource/products/42/42.jpg                                                        ', 800000, N'MUTANT MCT OIL chứa nguồn chất béo có tên là Medium Chain Tryglyucerides (MCT) là nguồn cung cấp chất béo tốt cho cơ thể, đồng thời dễ dàng hấp thu và chuyển hóa chất béo thành năng lượng cho hoạt động thể chất trong ngày của bạn. ', NULL, 100)
GO
INSERT [dbo].[Product] ([id], [name], [category_id], [brand_id], [image], [price], [info], [solds], [stock]) VALUES (44, N'MUTANT Caffeine, 240 Tablets', 6, 3, N'http://localhost/resource/products/44/44.jpg                                                        ', 320000, N'Mutant Caffeine là sản phẩm bổ sung hàm lượng caffeine chất lượng cao, được chiết xuất dưới dạng viên, vô cùng tiện lợi khi sử dụng. Sản phẩm có tác dụng hỗ trợ tăng cường sự tỉnh táo, tập trung, gia tăng hiệu suất tập luyện hiệu quả', NULL, 100)
GO
INSERT [dbo].[Product] ([id], [name], [category_id], [brand_id], [image], [price], [info], [solds], [stock]) VALUES (45, N'Mutant Pre-workout Madness, 30 Servings', 6, 3, N'http://localhost/resource/products/45/45.jpg                                                        ', 650000, N'Nếu bạn cảm thấy thiếu năng lượng trước buổi tập hay mệt mỏi và uể oải sau những giờ làm việc vất vả, thì Mutant Madness sẽ giúp bạn đập tan mọi sử uể oải để chinh phục những mức tạ mới. Cùng tìm hiểu về Mutant Madness ở ngay bên dưới đây.', NULL, 100)
GO
INSERT [dbo].[Product] ([id], [name], [category_id], [brand_id], [image], [price], [info], [solds], [stock]) VALUES (46, N'Mutant Mass 15 Lbs (6.8 kg)', 11, 3, N'http://localhost/resource/products/46/46.jpg                                                        ', 1850000, N'Đã đến lúc bạn dứt điểm tăng cân một lần và mãi mãi với Mutant Mass - công thức tăng cân siêu vươt trội đến từ CANADA. Vậy điều gì làm nên sự đặc biệt của Mutant Mass? Hãy cùng tìm hiểu ngay dưới đây. ', NULL, 100)
GO
INSERT [dbo].[Product] ([id], [name], [category_id], [brand_id], [image], [price], [info], [solds], [stock]) VALUES (47, N'Mutant Mass XXXTreme 2500, 22 Lbs (10 Kg)', 11, 3, N'http://localhost/resource/products/47/47.jpg                                                        ', 2490000, N'HIỆU QUẢ NHẤT - TIẾT KIỆM NHẤT - SỬ DỤNG NHẤT LÂU - UỐNG NGON NHẤT. Đó chính là Mutant Mass XXXtreme 2500, sản phẩm sữa tăng cân nổi tiếng đến từ Canada.', NULL, 100)
GO
INSERT [dbo].[Product] ([id], [name], [category_id], [brand_id], [image], [price], [info], [solds], [stock]) VALUES (48, N'Mutant Mass 5 Lbs(2,27 Kg)', 11, 3, N'http://localhost/resource/products/48/48.jpg                                                        ', 900000, N'Đã đến lúc bạn dứt điểm tăng cân một lần và mãi mãi với Mutant Mass - công thức tăng cân siêu vươt trội đến từ CANADA. Vậy điều gì làm nên sự đặc biệt của Mutant Mass? Hãy cùng tìm hiểu ngay dưới đây. ', NULL, 100)
GO
INSERT [dbo].[Product] ([id], [name], [category_id], [brand_id], [image], [price], [info], [solds], [stock]) VALUES (49, N'Mutant Test 90 Capsules', 14, 3, N'http://localhost/resource/products/49/49.jpg                                                        ', 700000, N'Mutant Test là sản phẩm hỗ trợ tăng Testos terone tự nhiên. Testos terone không chỉ có tác dụng trong sức khỏe sinh sản mà còn giúp tăng cường sức khỏe nam giới nói chung. Cụ thể hơn là việc thúc đẩy sự phát triển cơ bắp, chống loãng xương, tim mạch, tiểu đường...', NULL, 100)
GO
INSERT [dbo].[Product] ([id], [name], [category_id], [brand_id], [image], [price], [info], [solds], [stock]) VALUES (50, N'MUTANT Multi Vitamin, 60 Tablets', 12, 3, N'http://localhost/resource/products/50/50.jpg                                                        ', 500000, N'Mutant Multi là giải pháp Vitamin tổng hợp, cung cấp nhiều loại Vitamin và khoáng chất thiết yếu với cơ thể như Vitamin A, Vitamin B, Canxi, Kẽm,... Mutant Multi được thiết kế với các thành phần có nguồn gốc tự nhiên và dễ hấp thu, mang lại hiệu quả nhanh.', NULL, 100)
GO
INSERT [dbo].[Product] ([id], [name], [category_id], [brand_id], [image], [price], [info], [solds], [stock]) VALUES (51, N'Mutant ISO Surge 5 Lbs (76 Servings)', 7, 3, N'http://localhost/resource/products/51/51.jpg                                                        ', 1850000, N'Whey Protein Isolate & Hydrolysate
25G Protein phát triển cơ bắp 
16.3G EAAs tổng hợp Protein 
5.5G BCAA tăng sức bền tập luyện 
4,6g Glutamine phục hồi cơ bắp 
Bổ sung enzyme hỗ trợ tiêu hóa
Phù hợp với người không dung nạp lactose', NULL, 100)
GO
INSERT [dbo].[Product] ([id], [name], [category_id], [brand_id], [image], [price], [info], [solds], [stock]) VALUES (52, N'Mutant ISO Surge, 1.6 Lbs (23 Servings)', 7, 3, N'http://localhost/resource/products/52/52.jpg                                                        ', 950000, N'Whey Protein Isolate & Hydrolysate
25G Protein phát triển cơ bắp 
16.3G EAAs tổng hợp Protein 
5.5G BCAA tăng sức bền tập luyện 
4,6g Glutamine phục hồi cơ bắp 
Bổ sung enzyme hỗ trợ tiêu hóa
Phù hợp với người không dung nạp lactose', NULL, 100)
GO
INSERT [dbo].[Product] ([id], [name], [category_id], [brand_id], [image], [price], [info], [solds], [stock]) VALUES (53, N'Mutant ZM8+, 90 Capsules', 13, 3, N'http://localhost/resource/products/53/53.jpg                                                        ', 490000, N'Mutant ZM8+ là viên uống tăng cường Testosterone tự nhiên hiệu quả, với các thành phần như Kẽm, Magiê, Vitamin B6, B12,... Mutant ZM8+ hỗ trợ cải thiện các vấn đề về sức khỏe nam giới, mất ngủ, suy giảm cơ bắp ở phái nam.', NULL, 100)
GO
INSERT [dbo].[Product] ([id], [name], [category_id], [brand_id], [image], [price], [info], [solds], [stock]) VALUES (54, N'JYM Supplement Science Omega Jym, 120 Softgels', 20, 5, N'http://localhost/resource/products/54/54.jpg                                                        ', 750, N'Omega JYM là sản phẩm dầu cá cao cấp của hãng JYM Nutrition, chứa hàm lượng rất cao ba axit béo Omega 3 là axit docosahexaenoic (DHA), axit eicosapentaenoic (EPA) và axit docosapentaenoic (DPA).
Chất béo omega-3 có thể giúp tăng cường sức khỏe não bộ, tim mạch, thị lực, giảm viêm và nhiều lợi ích khác với sức khỏe tổng thể.', NULL, 100)
GO
INSERT [dbo].[Product] ([id], [name], [category_id], [brand_id], [image], [price], [info], [solds], [stock]) VALUES (55, N'Pre-workout Pre JYM, 20 Servings', 6, 5, N'http://localhost/resource/products/55/55.jpg                                                        ', 1000000, N'Pre JYM là công thức Pre-workout mạnh mẽ, với các thành phần được lựa chọn kỹ lưỡng và kiểm nghiệm gắt gao, hỗ trợ bạn tập lâu hơn, sung sức hơn. Sản phẩm chắc chắn sẽ là trợ thủ đắc lực của bất cứ ai trên hành trình xây dựng cơ bắp.', NULL, 100)
GO
INSERT [dbo].[Product] ([id], [name], [category_id], [brand_id], [image], [price], [info], [solds], [stock]) VALUES (56, N'Pre-workout Pre JYM, 30 Servings', 6, 5, N'http://localhost/resource/products/56/56.jpg                                                        ', 1400000, N'Được thiết kế bởi nhà khoa học, bác sĩ dinh dưỡng, chuyên gia tập luyện - Tiến sĩ Jim Stoppani, Pre JYM mang đến "cú hích mạnh mẽ" để các gymer đạt được hiệu suất cao nhất trong quá trình tập luyện.', NULL, 100)
GO
INSERT [dbo].[Product] ([id], [name], [category_id], [brand_id], [image], [price], [info], [solds], [stock]) VALUES (57, N'Jym Alpha - Supplement For Testosterone Support, 180 v-capsules', 14, 5, N'http://localhost/resource/products/57/57.jpg                                                        ', 900000, N'JYM Alpha, hay còn gọi là Alpha JYM, là sản phẩm hỗ trợ tăng cường hormone và sức mạnh cho nam giới. Công thức của JYM Alpha được nghiên cứu kỹ lưỡng để cho ra các thành phần với hoạt tính sinh học cao nhất và khả năng hấp thu tối đa.', NULL, 100)
GO
INSERT [dbo].[Product] ([id], [name], [category_id], [brand_id], [image], [price], [info], [solds], [stock]) VALUES (58, N'JYM Supplement Science Vita JYM, 60 Tablets', 12, 5, N'http://localhost/resource/products/58/58.jpg                                                        ', 650000, N'Vita JYM là dòng Vitamin tổng hợp được bào chế để cung cấp các vi chất dinh dưỡng mà các vận động viên hoặc người tập luyện cường độ cao cần để hỗ trợ hiệu suất, tăng cường khối lượng cơ bắp và sức khỏe tổng thể.
 

Vita JYM khác với nhiều loại vitamin tổng hợp được sản xuất với các thành phần chưa đủ liều lượng hoặc thậm chí có thể bao gồm các thành phần cản trở sự hấp thu dinh dưỡng. Sản phẩm là công thức được nghiên cứu kỹ lưỡng giúp bạn tối đa hóa sự hấp thụ các vitamin và khoáng chất quan trọng với cơ thể.', NULL, 100)
GO
INSERT [dbo].[Product] ([id], [name], [category_id], [brand_id], [image], [price], [info], [solds], [stock]) VALUES (59, N'Orgain Collagen Peptides 1Lb (454 gram)', 10, 6, N'http://localhost/resource/products/59/59.jpg                                                        ', 900000, N'Orgain Collagen Peptides là một loại thực phẩm cung cấp hàm lượng Collagen chất lượng cao được ví như nguồn Protein dồi dào nhất trong cơ thể của bạn. 

 

Đặc biệt hơn trong Orgain Collagen Peptides chứa dạng Collagen thủy phân giúp gia tăng khả năng hấp thụ khi đi vào cơ thể giúp cải thiện làn da, móng và tóc đồng thời tăng cường sức khỏe đường ruột, giảm đau nhức xương khớp và phát triển cơ bắp hiệu quả. ', NULL, 100)
GO
INSERT [dbo].[Product] ([id], [name], [category_id], [brand_id], [image], [price], [info], [solds], [stock]) VALUES (60, N'Orgain Protein Snack Bar, 40g/bar (12 Bars)', 22, 6, N'http://localhost/resource/products/60/60.jpg                                                        ', 600000, N'Orgain Protein Snack Bar là thanh Protein Bar chứa nguồn Protein thực vật tốt và sạch nhất hiện nay, phù hợp với rất nhiều đối tượng từ người lớn, trẻ em hoặc bất kỳ ai đang tìm kiếm một bữa ăn thay thế, một món ăn nhẹ cứu đói trong những lúc bận rộn nhất.', NULL, 100)
GO
INSERT [dbo].[Product] ([id], [name], [category_id], [brand_id], [image], [price], [info], [solds], [stock]) VALUES (61, N'Orgain Organic Protein & Superfoods, 2.02Lbs (918 Gram)', 23, 7, N'http://localhost/resource/products/61/61.jpg                                                        ', 1050000, N'Orgain Organic Protein & Superfoods là một sản phẩm vô cùng đặc biệt, khi chứa hàm lượng Protein thực vật siêu chất lượng, không chỉ từ những loại hạt mà còn tổng hợp Protein từ rất nhiều các loại hoa quả, trái cây mang lại rất nhiều lợi ích khác nhau chỉ trong 1 sản phẩm.', NULL, 100)
GO
INSERT [dbo].[Product] ([id], [name], [category_id], [brand_id], [image], [price], [info], [solds], [stock]) VALUES (62, N'Orgain Organic Protein, 920 Gam (20 Servings)', 23, 6, N'http://localhost/resource/products/62/62.jpg                                                        ', 690000, N'một loại Protein hữu cơ đến từ hãng Orgain, một sản phẩm 100% thuần chay được xếp hạng gần năm sao trên trang web của họ. Trên thực tế, đây là sản phẩm bán chạy nhất trong số các sản phẩm của Orgain và được khách hàng tại Mỹ và các nước Châu Âu đánh giá rất cao về cả chất lượng cũng như mùi vị của sản phẩm. Orgain Organic Protein luôn là sự lựa chọn cao cấp cho những người ăn chay, thuần chay hoặc đơn giản là những người muốn bảo vệ sức khỏe của mình và bổ sung một nguồn dinh dưỡng chất lượng cao, thuần khiết và an toàn cho sức khỏe nhất.', NULL, 100)
GO
INSERT [dbo].[Product] ([id], [name], [category_id], [brand_id], [image], [price], [info], [solds], [stock]) VALUES (63, N'Blackmores Glucosamine Sulfate 1500, 180 Tablets', 24, 7, N'http://localhost/resource/products/63/63.jpg                                                        ', 690000, N'Blackmores Glucosamine Sulfate được sử dụng để giảm triệu chứng thoái hoá khớp gối từ nhẹ đến trung bình. Hiện nay, trên thị trường glucosamine thường được kết hợp với các thành phần khác nhau như: chondroitin, các vitamin, và các dược liệu để tăng tính hiệu quả của sản phẩm.', NULL, 100)
GO
INSERT [dbo].[Product] ([id], [name], [category_id], [brand_id], [image], [price], [info], [solds], [stock]) VALUES (64, N'Blackmores Pregnancy Iron - Viên sắt cho bà bầu, 30 Servings', 25, 7, N'http://localhost/resource/products/64/64.jpg                                                        ', 200000, N'Blackmores Pregnancy Iron - Viên sắt cho bà bầu, 30 Servings', NULL, 100)
GO
INSERT [dbo].[Product] ([id], [name], [category_id], [brand_id], [image], [price], [info], [solds], [stock]) VALUES (65, N'Blackmores Multivitamin For Women', 12, 7, N'http://localhost/resource/products/65/65.jpg                                                        ', 550000, N'Blackmores Multivitamin Women cung cấp các loại Vitamin và khoáng chất thiết yếu với cơ thể, chúng rất cần thiết cho một cơ thể khỏe mạnh. Thông thường, chúng ta thường bổ sung vitamin bằng cách ăn uống với một chế độ dinh dưỡng hợp lý. Tuy nhiên, trong quá trình chế biến thức ăn nhiều loại vitamin sẽ bị mất đi. Vì thế mà các chị em thường chọn dùng thêm các sản phẩm vitamin tổng hợp cho phụ nữ để lấp đầy những khoảng trống vitamin bị thiếu hụt đó.', NULL, 100)
GO
INSERT [dbo].[Product] ([id], [name], [category_id], [brand_id], [image], [price], [info], [solds], [stock]) VALUES (66, N'Blackmores Multivitamins For Men', 12, 7, N'http://localhost/resource/products/66/66.jpg                                                        ', 350000, N'Viên uống Vitamin tổng hợp Blackmores Multivitamin For Men là sản phẩm cung cấp các loại Vitamin và khoáng chất thiết yếu, giúp tăng cường sức khỏe toàn diện và cải thiện thể chất cho phái mạnh.', NULL, 100)
GO
INSERT [dbo].[Product] ([id], [name], [category_id], [brand_id], [image], [price], [info], [solds], [stock]) VALUES (67, N'RSP Green Tea Extract, 100 Capsules', 26, 8, N'http://localhost/resource/products/67/67.jpg                                                        ', 350000, N'RSP Green Tea Extract chứa thành phần chiết xuất trà xanh, ngoài tác dụng giảm cân, đốt mỡ vượt trội còn có tác dụng như một chất chống oxy hóa, giúp bảo vệ cơ thể và tế bào khỏi tác động có hại của gốc tự do.

 ', NULL, 100)
GO
INSERT [dbo].[Product] ([id], [name], [category_id], [brand_id], [image], [price], [info], [solds], [stock]) VALUES (68, N'RSP Nutrition QuadraLean Non-Stim, 150 Capsules', 27, 8, N'http://localhost/resource/products/68/68.jpg                                                        ', 600000, N'Quadralean Non-stim là sản phẩm Fat Burner hoàn toàn không có chất kích thích nhưng vẫn đảm bảo được hiệu quả đốt mỡ tối ưu. Sản phẩm là sự kết hợp của CLA,  Acetyl L-Carnitine, Chiết xuất trà xanh và Paradoxine®, 100% nguồn gốc tự nhiên.', NULL, 100)
GO
INSERT [dbo].[Product] ([id], [name], [category_id], [brand_id], [image], [price], [info], [solds], [stock]) VALUES (69, N'RSP TrueGain Premium Mass Gainer, 12 Lbs (5.4 Kg)', 11, 8, N'http://localhost/resource/products/69/69.jpg                                                        ', 1350000, N'Nếu bạn muốn tìm 1 loại sữa tăng cân an toàn thì đừng tìm đâu xa, RSP True Gain chính là sản phẩm bạn cần tìm. RSP True Gain chứa đựng tất cả những dưỡng chất cần thiết cho việc tăng cân nhanh, đồng thời bổ sung nhiên liệu nhanh chóng cho cơ thể của bạn sau khi tập luyện.', NULL, 100)
GO
INSERT [dbo].[Product] ([id], [name], [category_id], [brand_id], [image], [price], [info], [solds], [stock]) VALUES (70, N'RSP Nutrition BioVite Multi-Vitamin', 12, 8, N'http://localhost/resource/products/70/70.jpg                                                        ', 700000, N'RSP Biovite là dòng Vitamin tổng hợp của hãng RSP Nutrition, có chiết xuất hoàn toàn tự tự nhiên với các thành phần có hoạt tính sinh học cao. Sản phẩm có tác dụng tăng cường sức khỏe tổng thể cho cả nam và nữ giới.', NULL, 100)
GO
INSERT [dbo].[Product] ([id], [name], [category_id], [brand_id], [image], [price], [info], [solds], [stock]) VALUES (71, N'Spring Valley Adult Probiotic + Prebiotic, 60 Veg Gummies', 28, 9, N'http://localhost/resource/products/71/71.jpg                                                        ', 490000, N'Spring Valley Probiotic là sản phẩm bổ sung probiotic, một loại lợi khuẩn tốt cho sức khỏe hệ tiêu hóa. Ngoài tác dụng hỗ trợ hệ tiêu hóa khỏe mạnh, sản phẩm còn có dạng kẹo dẻo với vị rất dễ ăn, dễ sử dụng.', NULL, 100)
GO
INSERT [dbo].[Product] ([id], [name], [category_id], [brand_id], [image], [price], [info], [solds], [stock]) VALUES (72, N'Spring Valley Omega-3 Fish Oil 1000 mg (645 EPA/310 DHA)', 20, 9, N'http://localhost/resource/products/72/72.jpg                                                        ', 450000, N'Spring Valley Omega-3 là sản phẩm dầu cá với hàm lượng EPA/DHA cao và tinh khiết, có tác dụng nâng cao sức khỏe toàn diện cũng như hỗ trợ tăng cường hiệu suất tập luyện hiệu quả hơn. ', NULL, 100)
GO
INSERT [dbo].[Product] ([id], [name], [category_id], [brand_id], [image], [price], [info], [solds], [stock]) VALUES (73, N'Spring Valley Extra Strength Ashwagandha 1300 mg, 60 Veg Capsules', 12, 9, N'http://localhost/resource/products/73/73.jpg                                                        ', 450000, N'Spring Valley Ashwagandha, hay còn gọi là Sâm Ấn Độ, là sản phẩm rất được ưa chuộng và đã là chủ đề của nhiều nghiên cứu khoa học nhằm chứng minh hiệu quả của loại thảo mộc này với sức khỏe.', NULL, 100)
GO
INSERT [dbo].[Product] ([id], [name], [category_id], [brand_id], [image], [price], [info], [solds], [stock]) VALUES (74, N'Redcon1 Grunt EAA, 30 Servings', 4, 10, N'http://localhost/resource/products/74/74.jpg                                                        ', 700000, N'Grunt EAA là nguồn bổ sung amino acid thiết yếu mà cơ thể không thể tự tổng hợp được, hỗ trợ phục hồi cơ bắp, gia tăng hiệu suất tập luyện, giúp bạn có một buổi tập hiệu quả hơn.', NULL, 100)
GO
INSERT [dbo].[Product] ([id], [name], [category_id], [brand_id], [image], [price], [info], [solds], [stock]) VALUES (75, N'Redcon1 Pre-workout Total War, 30 Servings', 6, 10, N'http://localhost/resource/products/75/75.jpg                                                        ', 790000, N'Total War Pre-workout là một loại thức uống trước tập, luôn là lựa chọn không thể thiếu đối với người tập luyện nghiêm túc với mục tiêu của mình. Pre-workout mang lại những lợi ích cực kỳ to lớn, đặc biệt là nguồn năng lượng bùng nổ giúp bạn phá vỡ mọi giới hạn trong phòng tập.', NULL, 100)
GO
INSERT [dbo].[Product] ([id], [name], [category_id], [brand_id], [image], [price], [info], [solds], [stock]) VALUES (76, N'REDCON1 MRE Bar - Meal Replacement Protein Bar (20g Protein/Bar)', 22, 10, N'http://localhost/resource/products/76/76.jpg                                                        ', 750000, N'MRE Bar là sản phẩm bữa ăn thay thế thông minh (Meal Replacement), cung cấp đầy đủ dưỡng chất từ Protein, Carb đến Fat cho cơ bắp, hỗ trợ thay thế bữa ăn phụ và tăng mức năng lượng của cơ thể.', NULL, 100)
GO
INSERT [dbo].[Product] ([id], [name], [category_id], [brand_id], [image], [price], [info], [solds], [stock]) VALUES (77, N'REDCON1 ISOTOPE - 100% Whey Isolate Protein, 5Lbs (69 Servings)', 7, 10, N'http://localhost/resource/products/77/77.jpg                                                        ', 1690000, N'ISOTOPE là dòng Whey Protein cao cấp, siêu hấp thu được tin dùng bởi các vận động viên chuyên nghiệp. Với bảng thành phần cực khủng, ISOTOPE hứa hẹn sẽ là trợ thủ đắc lực trong việc phát triển cơ bắp.', NULL, 100)
GO
INSERT [dbo].[Product] ([id], [name], [category_id], [brand_id], [image], [price], [info], [solds], [stock]) VALUES (78, N'MyProtein BCAA, 1000 g (200 servings)', 8, 11, N'http://localhost/resource/products/78/78.jpg                                                        ', 950000, N'MyProtein BCAA là sản phẩm bổ sung axit amin chuỗi nhánh của thương hiệu MyProtein - hãng Thực Phẩm Bổ Sung nổi tiếng xứ sở sương mù với các sản phẩm chất lượng cao nhưng giá thành vô cùng hợp lý.', NULL, 100)
GO
INSERT [dbo].[Product] ([id], [name], [category_id], [brand_id], [image], [price], [info], [solds], [stock]) VALUES (79, N'MyProtein iBCAA 2:1:1, 1000g (200 servings)', 8, 11, N'http://localhost/resource/products/79/79.jpg                                                        ', 1000000, N'MyProtein iBCAA là sản phẩm bổ sung axit amin chuỗi nhánh giúp phục hồi và tăng hiệu suất tập luyện của hãng MyProtein - thương hiệu Thực Phẩm Bổ Sung giá rẻ đến từ Anh Quốc.

 ', NULL, 100)
GO
INSERT [dbo].[Product] ([id], [name], [category_id], [brand_id], [image], [price], [info], [solds], [stock]) VALUES (80, N'MyProtein iBCAA 2:1:1, 500g (100 servings)', 8, 11, N'http://localhost/resource/products/80/80.jpg                                                        ', 650000, N'iBCAA cung cấp nguồn amino acid thiết yếu hàm lượng cao, với tỷ lệ “vàng” 2:1:2 Leucine: Isoleucine: Valine hỗ trợ phục hồi cơ bắp và xây dựng cơ bắp hiệu quả hơn. Đồng thời giúp tăng hiệu suất, hỗ trợ bạn có một buổi tập tốt hơn.', NULL, 100)
GO
INSERT [dbo].[Product] ([id], [name], [category_id], [brand_id], [image], [price], [info], [solds], [stock]) VALUES (81, N'MyProtein BCAA, 500g (100 servings)', 8, 11, N'http://localhost/resource/products/81/81.jpg                                                        ', 650000, N'Myprotein BCAA là giải pháp bổ sung nguồn axit amin chuỗi nhánh thiết yếu với sự phát triển cơ bắp, hỗ trợ phục hồi, ngăn chặn tình trạng dị hóa, kích thích tổng hợp protein cơ bắp hiệu quả nhất.', NULL, 100)
GO
INSERT [dbo].[Product] ([id], [name], [category_id], [brand_id], [image], [price], [info], [solds], [stock]) VALUES (82, N'Myprotein 100% Maltodextrin Carbs', 29, 11, N'http://localhost/resource/products/82/82.jpg                                                        ', 150000, N'Myprotein Maltodextrin cung cấp nguồn tinh bột dồi dào, đóng vai trò như một nguồn năng lượng nhanh chóng cho cơ bắp và cơ thể nói chung. Maltodextrin Carbs tiêu hóa và giải phóng rất nhanh, lý tưởng để sử dụng trước và sau khi tập.', NULL, 100)
GO
INSERT [dbo].[Product] ([id], [name], [category_id], [brand_id], [image], [price], [info], [solds], [stock]) VALUES (83, N'MyProtein Micellar Casein, 2,5 Kg (82 Servings)', 9, 11, N'http://localhost/resource/products/83/83.jpg                                                        ', 1650000, N' 

Casein là nguồn protein qua quá trình lọc từ sữa sẽ tạo nên 80% là Casein và 20% còn lại là Whey Protein. Trái ngược hoàn toàn với Whey Protein hấp thu nhanh, Casein Protein là nguồn protein trải dài với khả năng duy trì nồng amino acid lâu, thời gian hấp thu lên tới 8 tiếng. Bằng cách này, cơ thể chúng ta được cung cấp Protein trong hàng giờ liền giúp cơ thể không bị đói, hạn chế việc mất cơ.', NULL, 100)
GO
INSERT [dbo].[Product] ([id], [name], [category_id], [brand_id], [image], [price], [info], [solds], [stock]) VALUES (84, N'MyProtein Micellar Casein, 1 Kg (32 Servings)', 9, 11, N'http://localhost/resource/products/84/84.jpg                                                        ', 850000, N'Myprotein Casein là sữa tăng cơ ban đêm được ưa chuộng bởi khả năng nuôi cơ bắp lên đến 8 tiếng, chống dị hóa hiệu quả. Sản phẩm có thành phần là Micellar Casein hấp thu chậm, cung cấp một dòng chảy amino axit liên tục cho cơ bắp.', NULL, 100)
GO
INSERT [dbo].[Product] ([id], [name], [category_id], [brand_id], [image], [price], [info], [solds], [stock]) VALUES (85, N'MyProtein Creatine Monohydrate, 1000g', 3, 11, N'http://localhost/resource/products/85/85.jpg                                                        ', 990, N' 

MyProtein Creatine Monohydrate là sản phẩm tăng sức mạnh, sức bền cơ bắp của hãng MyProtein - thương hiệu Thực Phẩm Bổ Sung hàng đầu Anh Quốc với các sản phẩm đình đám như: sữa tăng cơ Impact Whey Protein, Impact Whey Isolate,...', NULL, 100)
GO
INSERT [dbo].[Product] ([id], [name], [category_id], [brand_id], [image], [price], [info], [solds], [stock]) VALUES (86, N'My Protein Creatine Monohydrate, 500g', 3, 11, N'http://localhost/resource/products/86/86.jpg                                                        ', 550000, N'Myprotein Creatine là sản phẩm cung cấp 100% Creatine Monohydrate với khả năng hấp thu nhanh, hỗ trợ tăng cường mức năng lượng cho cơ thể, giúp xây dựng và tăng khối lượng cơ bắp hiệu quả.', NULL, 100)
GO
INSERT [dbo].[Product] ([id], [name], [category_id], [brand_id], [image], [price], [info], [solds], [stock]) VALUES (87, N'MyProtein Creatine Monohydrate, 250g', 3, 11, N'http://localhost/resource/products/87/87.jpg                                                        ', 450000, N'Creatine là một hợp chất tự nhiên được tìm thấy chủ yếu trong các tế bào cơ bắp. Ngoài ra nó cũng là một chất bổ sung được rất nhiều các vận động viên, người tập gym ưa chuộng. Lý do là bởi Creatine có thể nhanh chóng thúc đẩy mức năng lượng và sức mạnh, sức bền của cơ bắp, nên rất thích hợp để sử dụng trước các bài tập nhanh mạnh, có cường độ cao như đẩy tạ, chạy nước rút.', NULL, 100)
GO
INSERT [dbo].[Product] ([id], [name], [category_id], [brand_id], [image], [price], [info], [solds], [stock]) VALUES (88, N'Yến Mạch Uống Liền - Myprotein Instant Oats', 30, 11, N'http://localhost/resource/products/88/88.jpg                                                        ', 250000, N'Myprotein Instant Oats là loại bột yến mạch uống liền chứa nguồn tinh bột với chỉ số Glycemic thấp, đây là tinh bột được giải phóng chậm hơn so với tinh bột với chỉ số Glycemic cao. Yến mạch của Myprotein được lấy nguồn từ loại yến mạch Scotland cao cấp và được xay mịn thành bột để cung cấp nguồn tinh bột với chỉ số Glycemic thấp giúp cơ thể dễ dàng hấp thụ và tiện lợi để kết hợp với các loại đồ uống khác.', NULL, 100)
GO
INSERT [dbo].[Product] ([id], [name], [category_id], [brand_id], [image], [price], [info], [solds], [stock]) VALUES (89, N'Myprotein Protein Brownie Box - 23G Protein, 12 Packs', 22, 11, N'http://localhost/resource/products/89/89.jpg                                                        ', 750000, N'Myprotein Brownie là dòng Protein Bar mô phỏng lại bánh Brownie nhưng với phiên bản ít calo hơn, phù hợp để làm bữa ăn nhẹ lành mạnh. Với hình thức nhỏ gọn, Myprotein Brownie có thể mang đi bất cứ đâu, là “cứu tinh” mỗi khi bạn cần bổ sung protein.', NULL, 100)
GO
INSERT [dbo].[Product] ([id], [name], [category_id], [brand_id], [image], [price], [info], [solds], [stock]) VALUES (90, N'Myprotein Layered Protein Bar - 20G Protein, 12x60 gram', 22, 11, N'http://localhost/resource/products/90/90.jpg                                                        ', 750000, N'Myprotein Layered Protein Bar là sản phẩm bổ sung protein dạng bánh cực kỳ tiện lợi, thuận tiện để mang theo và sử dụng mọi lúc mọi nơi. Một chiếc bánh nhỏ gọn chỉ nặng 60g vẫn có thể cung cấp cho bạn hơn 20g protein chất lượng cao, giúp hỗ trợ xây dựng cơ bắp hiệu quả.', NULL, 100)
GO
INSERT [dbo].[Product] ([id], [name], [category_id], [brand_id], [image], [price], [info], [solds], [stock]) VALUES (91, N'Myprotein Xtra Cookie - 38G Protein, 12x75 gram', 22, 11, N'http://localhost/resource/products/91/91.jpg                                                        ', 750000, N'Myprotein Xtra Cookie là bữa ăn nhẹ cao cấp mà bất kỳ vận động viên hay người tập gym nào cũng nên thử một lần. Sở hữu hàm lượng protein cao vượt trội so với hầu hết bánh Protein Bar khác trên thị trường, Myprotein Xtra Cookie chắc chắn sẽ khiến bạn cảm thấy sản phẩm này đáng tiền tới từng miếng!', NULL, 100)
GO
INSERT [dbo].[Product] ([id], [name], [category_id], [brand_id], [image], [price], [info], [solds], [stock]) VALUES (92, N'Myprotein Lean Cookie - 25G Protein, 12x50 gram', 22, 11, N'http://localhost/resource/products/92/92.jpg                                                        ', 650000, N'Myprotein Lean Cookie là sản phẩm bổ sung protein dạng bánh ăn liền, có thể dùng như một bữa ăn phụ tiện lợi hoặc thay thế cho các loại thức ăn thông thường (thịt bò, ức gà, trứng,…) khi bạn không có thời gian nấu nướng nhưng vẫn muốn cơ bắp được nạp đủ protein.', NULL, 100)
GO
INSERT [dbo].[Product] ([id], [name], [category_id], [brand_id], [image], [price], [info], [solds], [stock]) VALUES (93, N'Myprotein Oat Bakes - 19G Protein, 12x75 gram', 22, 11, N'http://localhost/resource/products/93/93.jpg                                                        ', 700000, N'Myprotein Oat Bakes là sản phẩm bổ sung protein dạng bánh. Mặc dù kích thước chỉ nằm gọn trong lòng bàn tay nhưng hàm lượng dinh dưỡng của Oat Bakes tương đương với cả một bữa ăn phụ cho người tập gym với tận 19g protein và 34g carb (chủ yếu là carb chậm từ yến mạch).', NULL, 100)
GO
INSERT [dbo].[Product] ([id], [name], [category_id], [brand_id], [image], [price], [info], [solds], [stock]) VALUES (94, N'Myprotein Vegan Protein Blend, 1 KG (30 Servings)', 31, 11, N'http://localhost/resource/products/94/94.jpg                                                        ', 890000, N'Được đặt vào phân khúc giá rẻ trong tất cả các dòng Protein thực vật nhưng Vegan Protein Blend của hãng MyProtein vẫn sở hữu đủ chất dinh dưỡng thiết yếu để phát triển cơ bắp tối đa, đi kèm với mức giá siêu hợp lý.

 

Vegan Protein Blend có thành phần 100% protein thực vật (từ đậu hà lan và đậu răng ngựa), bổ sung nguồn protein chất lượng và lành tính để duy trì và phát triển cơ bắp. Đồng thời sản phẩm còn có hương vị tự nhiên và rất dễ sử dụng', NULL, 100)
GO
INSERT [dbo].[Product] ([id], [name], [category_id], [brand_id], [image], [price], [info], [solds], [stock]) VALUES (95, N'Myprotein Vegan Protein Blend, 2.5 KG (83 Servings)', 23, 11, N'http://localhost/resource/products/95/95.jpg                                                        ', 1600000, N'Được đặt vào phân khúc giá rẻ trong tất cả các dòng Protein thực vật nhưng Vegan Protein Blend của hãng MyProtein vẫn sở hữu đủ chất dinh dưỡng thiết yếu để phát triển cơ bắp tối đa, đi kèm với mức giá siêu hợp lý.

 

Vegan Protein Blend có thành phần 100% protein thực vật (từ đậu hà lan và đậu răng ngựa), bổ sung nguồn protein chất lượng và lành tính để duy trì và phát triển cơ bắp. Đồng thời sản phẩm còn có hương vị tự nhiên và rất dễ sử dụng.', NULL, 100)
GO
INSERT [dbo].[Product] ([id], [name], [category_id], [brand_id], [image], [price], [info], [solds], [stock]) VALUES (96, N'MyProtein Impact Whey Protein, 2.5 Kg (100 Servings)', 7, 11, N'http://localhost/resource/products/96/96.jpg                                                        ', 1750000, N'Impact Whey Protein chứa 100% Whey Protein Concentrate với 21g Protein mỗi Serving, tỉ lệ Protein trong mỗi Serving lên tới 84%. Đúng chuẩn hàng Myprotein chất lượng cao, giá tốt. ', NULL, 100)
GO
INSERT [dbo].[Product] ([id], [name], [category_id], [brand_id], [image], [price], [info], [solds], [stock]) VALUES (97, N'MyProtein Impact Whey Protein, 1 Kg (40 Servings)', 7, 11, N'http://localhost/resource/products/97/97.jpg                                                        ', 890000, N'Impact Whey Protein chứa 100% Whey Protein Concentrate với 21g Protein mỗi Serving, tỉ lệ Protein trong mỗi Serving lên tới 84%. Đúng chuẩn hàng Myprotein chất lượng cao, giá tốt. ', NULL, 100)
GO
INSERT [dbo].[Product] ([id], [name], [category_id], [brand_id], [image], [price], [info], [solds], [stock]) VALUES (98, N'MyProtein Impact Whey Protein 5 Kg, (200 Servings)', 7, 11, N'http://localhost/resource/products/98/98.jpg                                                        ', 3290000, N'Impact Whey Protein chứa 100% Whey Protein Concentrate với 21g Protein mỗi Serving, tỉ lệ Protein trong mỗi Serving lên tới 84%. Đúng chuẩn hàng Myprotein chất lượng cao, giá tốt. ', NULL, 100)
GO
INSERT [dbo].[Product] ([id], [name], [category_id], [brand_id], [image], [price], [info], [solds], [stock]) VALUES (99, N'MyProtein Impact Whey Isolate, 5 Kg (200 servings)', 7, 11, N'http://localhost/resource/products/99/99.jpg                                                        ', 2800000, N'Thương hiệu Myprotein đến từ Anh Quốc cực kỳ nổi tiếng trên toàn thế giới, đây là hãng sản xuất thực phẩm bổ sung cho người tập gym với giá thành tương đối rẻ. Đặc biệt đối với IMPACT WHEY ISOLATE là loại WHEY PROTEIN 100% Isolate nhưng vẫn giữ được mức giá cạnh tranh nhất trong phân khúc Whey Protein cao cấp. ', NULL, 100)
GO
INSERT [dbo].[Product] ([id], [name], [category_id], [brand_id], [image], [price], [info], [solds], [stock]) VALUES (100, N'MyProtein Impact Whey Isolate, 2.5 Kg (100 servings)', 7, 11, N'http://localhost/resource/products/100/100.jpg                                                      ', 2200000, N'Gymstore xin được giới thiệu cho bạn Impact Whey Isolate - sản phẩm Whey Protein của thương hiệu Myprotein. Đây là hãng sản xuất thực phẩm bổ sung cho người tập gym với giá thành tương đối rẻ. Đặc biệt IMPACT WHEY ISOLATE là loại WHEY PROTEIN 100% Isolate nhưng vẫn giữ được mức giá cạnh tranh nhất trong phân khúc Whey Protein cao cấp. ', NULL, 100)
GO
INSERT [dbo].[Product] ([id], [name], [category_id], [brand_id], [image], [price], [info], [solds], [stock]) VALUES (101, N'MyProtein Impact Whey Isolate, 1 Kg (40 servings)', 7, 11, N'http://localhost/resource/products/101/101.jpg                                                      ', 790000, N'Impact Whey Isolate là dòng sữa tăng cơ Whey Protein với mức giá cực kỳ cạnh tranh nhưng vẫn đảm bảo chất lượng cao so với các sản phẩm khác trên thị trường, hỗ trợ xây dựng và phục hồi, kích thích tăng khối lượng cơ bắp hiệu quả.', NULL, 100)
GO
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
SET IDENTITY_INSERT [dbo].[Role] ON 
GO
INSERT [dbo].[Role] ([id], [name]) VALUES (1, N'admin')
GO
INSERT [dbo].[Role] ([id], [name]) VALUES (2, N'staff')
GO
INSERT [dbo].[Role] ([id], [name]) VALUES (3, N'user')
GO
SET IDENTITY_INSERT [dbo].[Role] OFF
GO
INSERT [dbo].[Watch] ([account_id], [product_id], [times]) VALUES (1, 2, 1)
GO
INSERT [dbo].[Watch] ([account_id], [product_id], [times]) VALUES (1, 3, 1)
GO
INSERT [dbo].[Watch] ([account_id], [product_id], [times]) VALUES (1, 7, 1)
GO
INSERT [dbo].[Watch] ([account_id], [product_id], [times]) VALUES (2, 2, 3)
GO
INSERT [dbo].[Watch] ([account_id], [product_id], [times]) VALUES (2, 3, 2)
GO
INSERT [dbo].[Watch] ([account_id], [product_id], [times]) VALUES (2, 7, 1)
GO
INSERT [dbo].[Watch] ([account_id], [product_id], [times]) VALUES (3, 2, 1)
GO
/****** Object:  Index [IX_Account]    Script Date: 4/20/2024 8:08:53 AM ******/
ALTER TABLE [dbo].[Account] ADD  CONSTRAINT [IX_Account] UNIQUE NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD  CONSTRAINT [FK_Cart_Product] FOREIGN KEY([product_id])
REFERENCES [dbo].[Product] ([id])
GO
ALTER TABLE [dbo].[Cart] CHECK CONSTRAINT [FK_Cart_Product]
GO
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD  CONSTRAINT [FK_Comment_Account] FOREIGN KEY([account_id])
REFERENCES [dbo].[Account] ([id])
GO
ALTER TABLE [dbo].[Comment] CHECK CONSTRAINT [FK_Comment_Account]
GO
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD  CONSTRAINT [FK_Comment_Post] FOREIGN KEY([post_id])
REFERENCES [dbo].[Post] ([id])
GO
ALTER TABLE [dbo].[Comment] CHECK CONSTRAINT [FK_Comment_Post]
GO
ALTER TABLE [dbo].[FK_Account_Role]  WITH CHECK ADD  CONSTRAINT [FK_FK_Account_Role_Account] FOREIGN KEY([account_id])
REFERENCES [dbo].[Account] ([id])
GO
ALTER TABLE [dbo].[FK_Account_Role] CHECK CONSTRAINT [FK_FK_Account_Role_Account]
GO
ALTER TABLE [dbo].[FK_Account_Role]  WITH CHECK ADD  CONSTRAINT [FK_FK_Account_Role_Role] FOREIGN KEY([role_id])
REFERENCES [dbo].[Role] ([id])
GO
ALTER TABLE [dbo].[FK_Account_Role] CHECK CONSTRAINT [FK_FK_Account_Role_Role]
GO
ALTER TABLE [dbo].[FK_Product_Use]  WITH CHECK ADD  CONSTRAINT [FK_FK_Product_Use_Product] FOREIGN KEY([product_id])
REFERENCES [dbo].[Product] ([id])
GO
ALTER TABLE [dbo].[FK_Product_Use] CHECK CONSTRAINT [FK_FK_Product_Use_Product]
GO
ALTER TABLE [dbo].[FK_Product_Use]  WITH CHECK ADD  CONSTRAINT [FK_FK_Product_Use_Use] FOREIGN KEY([use_id])
REFERENCES [dbo].[Use] ([id])
GO
ALTER TABLE [dbo].[FK_Product_Use] CHECK CONSTRAINT [FK_FK_Product_Use_Use]
GO
ALTER TABLE [dbo].[Item]  WITH CHECK ADD  CONSTRAINT [FK_Item_Order] FOREIGN KEY([order_id])
REFERENCES [dbo].[Order] ([id])
GO
ALTER TABLE [dbo].[Item] CHECK CONSTRAINT [FK_Item_Order]
GO
ALTER TABLE [dbo].[Item]  WITH CHECK ADD  CONSTRAINT [FK_Item_Product] FOREIGN KEY([product_id])
REFERENCES [dbo].[Product] ([id])
GO
ALTER TABLE [dbo].[Item] CHECK CONSTRAINT [FK_Item_Product]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Account] FOREIGN KEY([account_id])
REFERENCES [dbo].[Account] ([id])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Account]
GO
ALTER TABLE [dbo].[Post]  WITH CHECK ADD  CONSTRAINT [FK_Post_Account] FOREIGN KEY([author_id])
REFERENCES [dbo].[Account] ([id])
GO
ALTER TABLE [dbo].[Post] CHECK CONSTRAINT [FK_Post_Account]
GO
ALTER TABLE [dbo].[Post_Content]  WITH CHECK ADD  CONSTRAINT [FK_Post_Content_Post] FOREIGN KEY([post_id])
REFERENCES [dbo].[Post] ([id])
GO
ALTER TABLE [dbo].[Post_Content] CHECK CONSTRAINT [FK_Post_Content_Post]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Brand] FOREIGN KEY([brand_id])
REFERENCES [dbo].[Brand] ([id])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Brand]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Category] FOREIGN KEY([category_id])
REFERENCES [dbo].[Category] ([id])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Category]
GO
ALTER TABLE [dbo].[Watch]  WITH CHECK ADD  CONSTRAINT [FK_Watch_Account] FOREIGN KEY([account_id])
REFERENCES [dbo].[Account] ([id])
GO
ALTER TABLE [dbo].[Watch] CHECK CONSTRAINT [FK_Watch_Account]
GO
ALTER TABLE [dbo].[Watch]  WITH CHECK ADD  CONSTRAINT [FK_Watch_Product] FOREIGN KEY([product_id])
REFERENCES [dbo].[Product] ([id])
GO
ALTER TABLE [dbo].[Watch] CHECK CONSTRAINT [FK_Watch_Product]
GO
USE [master]
GO
ALTER DATABASE [FitStoreDB] SET  READ_WRITE 
GO
