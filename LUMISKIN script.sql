USE [master]
GO
/****** Object:  Database [LUMISKIN]    Script Date: 3/21/2025 9:19:08 PM ******/
CREATE DATABASE [LUMISKIN]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'LUMISKIN', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.LIEMTRUC\MSSQL\DATA\LUMISKIN.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'LUMISKIN_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.LIEMTRUC\MSSQL\DATA\LUMISKIN_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [LUMISKIN] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [LUMISKIN].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [LUMISKIN] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [LUMISKIN] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [LUMISKIN] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [LUMISKIN] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [LUMISKIN] SET ARITHABORT OFF 
GO
ALTER DATABASE [LUMISKIN] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [LUMISKIN] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [LUMISKIN] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [LUMISKIN] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [LUMISKIN] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [LUMISKIN] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [LUMISKIN] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [LUMISKIN] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [LUMISKIN] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [LUMISKIN] SET  ENABLE_BROKER 
GO
ALTER DATABASE [LUMISKIN] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [LUMISKIN] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [LUMISKIN] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [LUMISKIN] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [LUMISKIN] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [LUMISKIN] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [LUMISKIN] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [LUMISKIN] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [LUMISKIN] SET  MULTI_USER 
GO
ALTER DATABASE [LUMISKIN] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [LUMISKIN] SET DB_CHAINING OFF 
GO
ALTER DATABASE [LUMISKIN] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [LUMISKIN] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [LUMISKIN] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [LUMISKIN] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [LUMISKIN] SET QUERY_STORE = ON
GO
ALTER DATABASE [LUMISKIN] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [LUMISKIN]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 3/21/2025 9:19:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[uID] [int] IDENTITY(1,1) NOT NULL,
	[username] [varchar](255) NOT NULL,
	[password] [varchar](255) NOT NULL,
	[email] [varchar](255) NULL,
	[phone] [varchar](15) NULL,
	[isSeller] [bit] NULL,
	[isAdmin] [bit] NULL,
	[createdAt] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[uID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 3/21/2025 9:19:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[cid] [int] IDENTITY(1,1) NOT NULL,
	[cname] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[cid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Contact]    Script Date: 3/21/2025 9:19:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contact](
	[UserID] [int] NOT NULL,
	[Email] [varchar](30) NOT NULL,
	[TenKhachHang] [nvarchar](20) NOT NULL,
	[TenSanPham] [nvarchar](30) NULL,
	[NoiDung] [nvarchar](250) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pay]    Script Date: 3/21/2025 9:19:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pay](
	[MaKH] [varchar](6) NOT NULL,
	[UserID] [int] NOT NULL,
	[CardID] [int] NOT NULL,
	[TenKhachHang] [nvarchar](50) NOT NULL,
	[SoDienThoai] [varchar](15) NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[PTTT] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaKH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 3/21/2025 9:19:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ProductID] [int] IDENTITY(1,1) NOT NULL,
	[ProductName] [nvarchar](255) NOT NULL,
	[image] [nvarchar](max) NULL,
	[price] [money] NOT NULL,
	[description] [nvarchar](max) NULL,
	[cid] [int] NOT NULL,
	[sub_id] [int] NOT NULL,
	[created_at] [datetime] NULL,
	[updated_at] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ShoppingCart]    Script Date: 3/21/2025 9:19:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ShoppingCart](
	[CartID] [int] IDENTITY(1,1) NOT NULL,
	[ProductID] [int] NOT NULL,
	[ProductName] [nvarchar](255) NOT NULL,
	[Price] [bigint] NULL,
	[Quantity] [int] NULL,
	[Total]  AS ([Price]*[Quantity]),
PRIMARY KEY CLUSTERED 
(
	[CartID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SubCategory]    Script Date: 3/21/2025 9:19:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SubCategory](
	[sub_id] [int] IDENTITY(1,1) NOT NULL,
	[subname] [nvarchar](50) NOT NULL,
	[cid] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[sub_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Account] ON 

INSERT [dbo].[Account] ([uID], [username], [password], [email], [phone], [isSeller], [isAdmin], [createdAt]) VALUES (1, N'user1', N'pass123', N'user1@example.com', N'0123456789', 0, 0, CAST(N'2025-03-15T22:54:00.690' AS DateTime))
INSERT [dbo].[Account] ([uID], [username], [password], [email], [phone], [isSeller], [isAdmin], [createdAt]) VALUES (2, N'seller1', N'sellerpass', N'seller1@example.com', N'0987654321', 1, 0, CAST(N'2025-03-15T22:54:00.690' AS DateTime))
INSERT [dbo].[Account] ([uID], [username], [password], [email], [phone], [isSeller], [isAdmin], [createdAt]) VALUES (3, N'admin', N'admin123', N'admin@example.com', NULL, 0, 1, CAST(N'2025-03-15T22:54:00.690' AS DateTime))
INSERT [dbo].[Account] ([uID], [username], [password], [email], [phone], [isSeller], [isAdmin], [createdAt]) VALUES (4, N'user2', N'pass234', N'user2@example.com', N'0112233445', 0, 0, CAST(N'2025-03-15T22:54:00.690' AS DateTime))
INSERT [dbo].[Account] ([uID], [username], [password], [email], [phone], [isSeller], [isAdmin], [createdAt]) VALUES (5, N'user3', N'pass345', N'user3@example.com', N'0223344556', 0, 0, CAST(N'2025-03-15T22:54:00.690' AS DateTime))
INSERT [dbo].[Account] ([uID], [username], [password], [email], [phone], [isSeller], [isAdmin], [createdAt]) VALUES (6, N'user4', N'pass456', N'user4@example.com', N'0334455667', 0, 0, CAST(N'2025-03-15T22:54:00.690' AS DateTime))
INSERT [dbo].[Account] ([uID], [username], [password], [email], [phone], [isSeller], [isAdmin], [createdAt]) VALUES (7, N'user5', N'pass567', N'user5@example.com', N'0445566778', 0, 0, CAST(N'2025-03-15T22:54:00.690' AS DateTime))
INSERT [dbo].[Account] ([uID], [username], [password], [email], [phone], [isSeller], [isAdmin], [createdAt]) VALUES (8, N'seller2', N'sellerpass2', N'seller2@example.com', N'0887766554', 1, 0, CAST(N'2025-03-15T22:54:00.690' AS DateTime))
INSERT [dbo].[Account] ([uID], [username], [password], [email], [phone], [isSeller], [isAdmin], [createdAt]) VALUES (9, N'seller3', N'sellerpass3', N'seller3@example.com', N'0998877665', 1, 0, CAST(N'2025-03-15T22:54:00.690' AS DateTime))
INSERT [dbo].[Account] ([uID], [username], [password], [email], [phone], [isSeller], [isAdmin], [createdAt]) VALUES (10, N'seller4', N'sellerpass4', N'seller4@example.com', N'0776655443', 1, 0, CAST(N'2025-03-15T22:54:00.690' AS DateTime))
INSERT [dbo].[Account] ([uID], [username], [password], [email], [phone], [isSeller], [isAdmin], [createdAt]) VALUES (11, N'seller5', N'sellerpass5', N'seller5@example.com', N'0665544332', 1, 0, CAST(N'2025-03-15T22:54:00.690' AS DateTime))
INSERT [dbo].[Account] ([uID], [username], [password], [email], [phone], [isSeller], [isAdmin], [createdAt]) VALUES (12, N'admin2', N'adminpass2', N'admin2@example.com', NULL, 0, 1, CAST(N'2025-03-15T22:54:00.690' AS DateTime))
INSERT [dbo].[Account] ([uID], [username], [password], [email], [phone], [isSeller], [isAdmin], [createdAt]) VALUES (13, N'admin3', N'adminpass3', N'admin3@example.com', NULL, 0, 1, CAST(N'2025-03-15T22:54:00.690' AS DateTime))
SET IDENTITY_INSERT [dbo].[Account] OFF
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([cid], [cname]) VALUES (1, N'Chăm sóc da')
INSERT [dbo].[Category] ([cid], [cname]) VALUES (2, N'Nâng niu làn da')
INSERT [dbo].[Category] ([cid], [cname]) VALUES (3, N'Sản phẩm khác')
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
INSERT [dbo].[Contact] ([UserID], [Email], [TenKhachHang], [TenSanPham], [NoiDung]) VALUES (1, N'nguyenvana@email.com', N'Nguyễn Văn A', N'DHC', N'Sản phẩm này mua sỉ giá sao shop?')
INSERT [dbo].[Contact] ([UserID], [Email], [TenKhachHang], [TenSanPham], [NoiDung]) VALUES (2, N'tranthib@email.com', N'Trần Thị B', N'Dầu dưỡng tóc', N'Mua số lượng lớn có giảm giá gì không shop?')
INSERT [dbo].[Contact] ([UserID], [Email], [TenKhachHang], [TenSanPham], [NoiDung]) VALUES (3, N'levanc@email.com', N'Lê Văn C', N'Bột rửa mặt Nhật Bản', N'Bên em có phân phối bột rửa mặt của Nhật Bản hàng chính hãng nhập khẩu chính ngạch từ Nhật về không biết shop có quan tâm không ạ?')
INSERT [dbo].[Contact] ([UserID], [Email], [TenKhachHang], [TenSanPham], [NoiDung]) VALUES (4, N'phamthid@email.com', N'Phạm Thị D', N'Mi giả', N'Sản phẩm tệ quá mua chỗ khác rẻ mà đẹp hơn chỗ này.')
GO
INSERT [dbo].[Pay] ([MaKH], [UserID], [CardID], [TenKhachHang], [SoDienThoai], [Email], [PTTT]) VALUES (N'KH001', 1, 1, N'Nguyễn Văn A', N'0987654321', N'nguyenvana@email.com', N'Tiền mặt')
INSERT [dbo].[Pay] ([MaKH], [UserID], [CardID], [TenKhachHang], [SoDienThoai], [Email], [PTTT]) VALUES (N'KH002', 2, 2, N'Trần Thị B', N'0978123456', N'tranthib@email.com', N'Tiền mặt')
INSERT [dbo].[Pay] ([MaKH], [UserID], [CardID], [TenKhachHang], [SoDienThoai], [Email], [PTTT]) VALUES (N'KH003', 3, 3, N'Lê Văn C', N'0968543210', N'levanc@email.com', N'ATM')
INSERT [dbo].[Pay] ([MaKH], [UserID], [CardID], [TenKhachHang], [SoDienThoai], [Email], [PTTT]) VALUES (N'KH004', 4, 4, N'Phạm Thị D', N'0912345678', N'phamthid@email.com', N'Tiền mặt')
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([ProductID], [ProductName], [image], [price], [description], [cid], [sub_id], [created_at], [updated_at]) VALUES (1, N'Sữa Rửa Mặt Làm Trắng Da, Ngừa Mụn Senana 60g Trẻ Hóa, Kiểm Soát Dầu, Dưỡng Ẩm Lấy Sạch Bụi Bẩn A234', N'https://down-vn.img.susercontent.com/file/vn-11134207-7qukw-ljtfvq8fl69u32@resize_w900_nl.webp', 55000.0000, N'Sữa Rửa Mặt Làm Trắng Da, Ngừa Mụn Senana 60g

Trẻ Hóa, Kiểm Soát Dầu, Dưỡng Ẩm Lấy Sạch Bụi Bẩn



Trọng lượng: 60g Công dụng của SRM Senana 

- Rửa trôi lớp bụi bẩn, bã nhờn và tế bào chết hàng ngày. 

- cung cấp độ ẩm cho da có hệ dưỡng ẩm 3 ảnh hưởng 

- Dưỡng da ẩm mượt; tươi trẻ 

- Ngăn ngừa, làm cho sạch mụn đồng thời vẫn giữ cho da mềm mịn, ko khô ráp 

- Giúp điều tiết được lượng dầu do da bài tiết giúp da đủ độ ẩm mà ko bị nhờn dầu 

- Giúp khiến sạch và thông thoáng những nang lông bị bức bí dưới da và đẩy lùi những nhân mụn

 - Giúp làm cho gạnh nhanh nhân mụn bị đỏ song song hỗ trợ ức chế sự tăng trưởng của các vi khuẩn 

- Kiểm soát an ninh làn da khỏi sự hình thành của nhân mụn mới. 

- Diệt khuẩn và ngăn phòng ngừa nguy cơ mụn trở lại 

- Ngừa mụn, tránh các hậu quả, ngừa thâm



COMBO 4 CHAI Gồm:

- Whitening: Trắng Sáng

- Retouch: Lành Mụn

- Amino Acid: Sạch Sâu

- Exfloliating: Tẩy tế bào chết



HƯỚNG DẪN SỬ DỤNG: 

3 Chai sữa rửa mặt mình sử dụng chai nào cũng được

Bước 1: Làm ướt da mặt bằng nước ấm.

Bước 2: Cho một lượng sữa rửa mặt vừa đủ ra lòng bàn tay và tạo bọt.

Bước 3: Thoa phần bọt lên mặt từ 30 giây đến 1 phút.

Bước 4: Rửa mặt sạch và lau khô



Tẩy tế bào chết:

+ Giữ mặt và tay khô ráo khi thoa sản phẩm

+ Dùng một lượng nhỏ và xoa tròn lên vùng mặt cho đến khi lớp tế bào da chết xuất hiện

+ Làm sạch với nước và tiếp tục dùng sữa rửa mặt

+ Có thể sử dụng hằng ngày hoặc 3-4 lần/tuần', 1, 1, CAST(N'2025-03-15T22:46:52.430' AS DateTime), CAST(N'2025-03-15T22:46:52.430' AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [image], [price], [description], [cid], [sub_id], [created_at], [updated_at]) VALUES (2, N'Sữa rửa mặt Cerave Foaming, Hydrating, SA Smoothing Cleanser cho da dầu mụn, khô, nhạy cảm 88ML - 236ML - 473ML', N'https://down-vn.img.susercontent.com/file/vn-11134258-7ra0g-m6z5x0y7gb6p54', 175000.0000, N'Sữa rửa mặt Cerave Foaming, Hydrating, SA Smoothing Cleanser cho da dầu mụn, khô, nhạy cảm

- Xuất xứ thương hiệu: Mỹ

- Nơi sản xuất: Trung Quốc

- Dung tích: 473ML - 236ML - 88ML

- Hạn sử dụng: 3 năm kể từ ngày sản xuất

- Ngày sản xuất: In trên bao bì

- Thành phần: Xem chi tiết trên bao bì



• PHÂN LOẠI: 

- CeraVe Foaming Cleanser: Dành cho da dầu mụn

- CeraVe Hydrating Cleanser: Dành cho da thường và da khô

- CeraVe SA Smoothing Cleanser: Dành cho da nhạy cảm



• THÀNH PHẦN VÀ CÔNG DỤNG:

1. CeraVe Foaming Cleanser (Da Dầu Mụn):

- Có 3 loại Ceramides thiết yếu:  Giúp khôi phục hàng rào độ ẩm da

- Hyaluronic Acid: Giúp duy trì độ ẩm tự nhiên của da

- Niacinamide: Giúp làm dịu, nuôi dưỡng và củng cố hàng rào da



2. CeraVe Hydrating Cleanser (Da Khô):

- Có 3 loại Ceramides thiết yếu:  Giúp khôi phục hàng rào độ ẩm da

- Công nghệ MVE: Khóa ẩm suốt 24h

- Hyaluronic Acid: Giúp duy trì độ ẩm tự nhiên của da



3. CeraVe SA Smoothing Cleanser (Da Nhạy Cảm)

-Có 3 loại Ceramides thiết yếu:  Giúp khôi phục hàng rào độ ẩm da

- Hyaluronic Acid: Giúp duy trì độ ẩm tự nhiên của da

- Salicylic Acid (BHA): Tẩy tế bào chết và làm mịn da



• LƯU Ý: 

+ Tránh tiếp xúc với mắt, nếu có, rửa kỹ lại với nước

+ Thông tin dị ứng (nếu có): xem bảng thành phần. 

+ Hướng dẫn bảo quản: Bảo quản nơi khô ráo, thoáng mát, tránh ánh nắng trực tiếp từ mặt trời. Để xa tầm tay trẻ em. 



ĐIỀU TUYỆT VỜI KHI MUA HÀNG TẠI MỸ PHẨM MAI HÂN

⍣ Cam kết 100% sản phẩm là hàng chính hãng

⍣ Sản phẩm có tem chống hàng giả điện tử, xác nhận hàng thật bằng tin nhắn

⍣ Đội ngũ tư vấn viên nhiệt tình, hỗ trợ giải đáp thắc mắc trong thời gian ngắn nhất

⍣ Hỗ trợ đổi trả theo quy định của Shopee với điều kiện:

➊ Hàng vẫn còn mới, chưa qua sử dụng

➋ Hàng bị lỗi hoặc hư hỏng do vận chuyển hoặc do nhà sản xuất

➌ Có video quay lại quá trình mở hộp và kiểm tra từng sản phẩm. Video rõ ràng, thấy được gói hàng còn nguyên vẹn, còn niêm phong.



⛔ Nếu thiếu một trong các điều kiện trên, shop từ chối giải quyết khiếu nại. Thời gian khiếu nại tối đa 7 ngày từ lúc nhận được hàng.', 1, 1, CAST(N'2025-03-15T22:46:52.430' AS DateTime), CAST(N'2025-03-15T22:46:52.430' AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [image], [price], [description], [cid], [sub_id], [created_at], [updated_at]) VALUES (3, N'Sữa Rửa Mặt Trà Xanh Rau Má Sica White 100Ml, Ngăn Ngừa Và Hỗ Trợ Da Dầu Mụn - SICA WHITE', N'https://down-vn.img.susercontent.com/file/vn-11134207-7ras8-m5sfzu56g11z56@resize_w900_nl.webp', 38000.0000, N'[THÀNH PHẦN] Sữa Rửa Mặt Trà Xanh Rau Má:

﻿﻿Chiết xuất trà xanh, rau má...

﻿﻿Thành phần chi tiết vui lòng xem trên sản phẩm.

[HƯỚNG DẪN SỬ DỤNG] Sữa Rửa Mặt Trà Xanh Rau Má:

﻿﻿Dùng ngày 2 lần sáng tối, dùng sau bước tẩy trang.

﻿﻿Lấy lượng sữa rửa mặt vừa đủ, tạo bọt rồi massage lên da 1-2 phút rồi rửa sạch lại với nước sạch.

[HẠN SỬ DỤNG VÀ BẢO QUẢN] Sữa Rửa Mặt Trà Xanh Rau Má:

Hạn sử dụng 24 tháng. Bảo quản nơi thoáng mát. Tránh nơi có nhiệt độ cao (ánh nắng trực tiếp).

﻿﻿Sản phẩm được sản xuất tại nhà máy Sica Lab đạt chuẩn CGMP toàn quốc.

• Sản phẩm được SỞ Y TẾ cấp phép lưu hành trên toàn quốc', 1, 1, CAST(N'2025-03-15T22:46:52.430' AS DateTime), CAST(N'2025-03-15T22:46:52.430' AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [image], [price], [description], [cid], [sub_id], [created_at], [updated_at]) VALUES (4, N'Sữa Rửa Mặt Wonder Bath Balancing PHA 5.5 Cleansing Foam 130ml', N'https://down-vn.img.susercontent.com/file/vn-11134201-7ras8-m42yqgpr6byf41@resize_w900_nl.webp', 77000.0000, N'THÀNH PHẦN:
- PHA (Polyhydroxy Acids): làm sạch da, loại bỏ tế bào chết dịu nhẹ, cải thiện tình trạng mụn, dưỡng ẩm, chống oxy hóa, ít gây kích ứng.
- Chiết xuất trà Phổ Nhĩ Hàn Quốc: làm mát da, dưỡng ẩm, chống lão hóa, củng cố lớp hàng rào bảo vệ da trước các tác nhân gây hại bên ngoài môi trường.
- Dầu dừa và dầu cọ: làm sạch da, dưỡng ẩm, giảm mụn, mờ thâm nám, ức chế sự phát triển của sắc tố melanin, giúp da trắng sáng, chống lão hóa da.

CÔNG DỤNG: 
- Làm sạch sâu, nhẹ nhàng loại bỏ bụi bẩn, tạp chất, tế bào chết và lớp trang điểm cứng đầu trên da một cách triệt để.
- Bổ sung và cân bằng độ ẩm trên da, cho da luôn căng bóng, mịn màng.
- Cân bằng độ pH trên da.
- Ngăn mụn, làm sáng da, cải thiện những vùng da không đều màu, làm mờ thâm nám.
- Củng cố lớp hàng rào bảo vệ da khỏi các tác nhân gây hại bên ngoài môi trường.
- Cung cấp độ ẩm, hỗ trợ cân bằng dầu nhờn trên da.
- Tái tạo, phục hồi tổn thương, dưỡng da sáng khỏe và mềm mại.

CÁCH SỬ DỤNG:
- B1: Sau khi làm ướt mặt, cho một lượng vừa đủ sản phẩm Sữa Rửa Mặt Byvibes Wonder Bath PHA 5.5 150ml lên tay rồi xoa đều để tạo bọt. 
- B2: Apply sữa rửa mặt lên da nhẹ nhàng theo chuyển động tròn, tránh vùng mắt.
- B3: Rửa sạch lại với nước ấm.
- B4: Tiếp tục thực hiện các bước chăm sóc da tiếp theo.
', 1, 1, CAST(N'2025-03-15T22:46:52.430' AS DateTime), CAST(N'2025-03-15T22:46:52.430' AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [image], [price], [description], [cid], [sub_id], [created_at], [updated_at]) VALUES (5, N'Sữa Rửa Mặt Trắng Da Hatomugi Cleansing And Facial Washing Nhật Bản - COCO COSMETICS', N'https://down-vn.img.susercontent.com/file/vn-11134258-7ra0g-m6z5fr3jghi977', 46500.0000, N'Sữa rửa mặt Trắng Da Hatomugi cleansing and facial washing
Xuất xứ: Nhật Bản
Thương hiệu: Hatomugi
Trọng lượng: 130g & 170g

Công dụng: 
💦💦Sữa rửa mặt trắng da Hatomugi cleansing and facial washing tuýp 130g giúp cho độ tuổi teen chống lại các loại mụn dậy thì khỏi sạm thâm. Ngoài ra, các bạn nên biết rằng từ tuổi 25 trở đi, mỗi năm chúng ta mất đi từ 1 – 1,5% collagen, nguyên nhân khiến da chúng ta bị chùng nhão, nhăn. Do đó, cần trang bị loại sữa rửa mặt này vì hạt ý dĩ cũng lặp chiến công không nhỏ trong nhiệm vụ làm chậm quá trình lão hóa và làm săn chắc da cực tốt.

- Khoáng chất trong sữa thẩm thấu sâu dưới lớp hạ bì dưỡng ẩm cho da hiệu quả.
- Vitamin B trong hạt ý dĩ Khống chế lượng dầu, ngăn ngừa viêm da, cải thiện làn da khô.
- Ngăn ngừa lão hóa da, ngăn ngừa vết nhăn, ngăn ngừa chảy xệ.
- Se khít lỗ chân lông, hạn chế bã nhờn.
- Làm trắng sáng da, mờ thâm.

❄️ Hướng dẫn sử dụng:
- Rửa mặt 2 lần vào buổi sáng và tối.
- Lấy một lượng kem vừa đủ tạo bọt và thoa lên cùng da đã làm ướt.
- Massge nhẹ nhàng theo chuyển động vòng tròn.
- Rửa lại mặt bằng nước sạch. 
____________', 1, 1, CAST(N'2025-03-15T22:46:52.430' AS DateTime), CAST(N'2025-03-15T22:46:52.430' AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [image], [price], [description], [cid], [sub_id], [created_at], [updated_at]) VALUES (6, N'Sữa rửa mặt LAIKOU Sakura 50g + Sakura Serum 17ml + Kem dưỡng da 25g', N'https://down-vn.img.susercontent.com/file/sg-11134301-7rdw9-lyhkzr42127o12@resize_w900_nl.webp', 66000.0000, N'Laikou Nhật Bản Sữa rửa mặt làm trắng da mặt Serum giảm đốm nhăn Bộ chăm sóc da



Thương hiệu: LAIKOU

Xuất xứ: Trung Quốc

Thành phần: Chiết xuất Sakura, glycerin, nước hoa, v.v.

Bảo quản: Để nơi thoáng mát

Thời hạn sử dụng: 5 năm



Các tính năng:

Nó có thể làm sáng da và làm chậm các dấu hiệu lão hóa da ban đầu.

Phục hồi da hư tổn và làm sạch lỗ chân lông, bụi bẩn

Làm cho làn da của bạn sạch sẽ và tươi sáng

Làm sạch sâu và loại bỏ bụi bẩn, dầu mỡ và tế bào chết trên da



Loại: Sữa rửa mặt Sakura 50g

Huyết thanh Sakura 17ml

Kem dưỡng da mặt Sakura 25g



Cách sử dụng:

1.Lấy một lượng sữa rửa mặt thích hợp để rửa mặt

2.Sau bước toner, nhỏ vài giọt serum lên mặt, tránh vùng mắt, vỗ nhẹ cho đến khi thẩm thấu hết.

3.Thoa đều kem lên toàn bộ khuôn mặt



Gói Bao gồm: 1x 50g Sữa rửa mặt + 1x 17ml serum Sakura + 1x 25g kem Sakura', 1, 1, CAST(N'2025-03-15T22:46:52.430' AS DateTime), CAST(N'2025-03-15T22:46:52.430' AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [image], [price], [description], [cid], [sub_id], [created_at], [updated_at]) VALUES (7, N'Gel Rửa mặt La Roche Posay Effaclar Foarming 400ml , Sữa Rửa Mặt La Roche Posay Cho Da Dầu Nhạy Cảm', N'https://down-vn.img.susercontent.com/file/vn-11134201-7ra0g-m6zllo6114yv2f@resize_w900_nl.webp', 85000.0000, N'Gel Rửa mặt La Roche Posay Effaclar Foarming 400ml , Sữa Rửa Mặt La Roche Posay Cho Da Dầu Nhạy Cảm
THÔNG TIN THƯƠNG HIỆU

La Roche-Posay là nhãn hàng dược mỹ phẩm đến từ Pháp trực thuộc tập đoàn L’Oreal đã hoạt động được hơn 30 năm, phối hợp nghiên cứu với các bác sĩ da liễu trên toàn thế giới cho ra đời các sản phẩm dưỡng da hướng đến thị trường sản phẩm dành cho da nhạy cảm, ngoài ra còn có dòng sản phẩm dành cho trẻ em. Thành phần nổi bật xuất hiện trong các sản phẩm của La Roche-Posay (LRP) là nước suối khoáng – thermal spring water. Tất cả những sản phẩm thuộc La Roche Posay đều được thử nghiệm lâm sàng và đánh giá khách quan từ bệnh viện Saint Jacques-Toulouse. Quy trình bào chế của sản phẩm cũng rất nghiêm ngặt mang lại cho người sử dụng vẻ đẹp tự nhiên và rất an toàn.

THÔNG TIN SẢN PHẨM:

Độ an toàn

- Độ pH trung tính 5.5.

- Không chứa xà phòng, không chứa cồn, không chất tạo màu và không paraben.



Thành phần

- ZINC PCA (kẽm) giúp kiểm soát dầu giảm bã nhờn hiệu quả.

- Nước khoáng La Roche-Posay (loại nước duy nhất có chất chống lão hoá Selenium) giúp làm dịu da

- Công thức được lựa chọn kĩ càng với các thành phần làm sạch dịu nhẹ phù hợp cho da dầu và da mụn nhạy cảm.



ƯU ĐIỂM NỔI BẬT: Nhẹ nhàng làm sạch bụi bẩn và bã nhờn dư thừa , mang đến da sạch và thoáng mát.



HIỆU QUẢ SỬ DỤNG

- Làm sạch da: Sữa rửa mặt La Roche-Posay có khả năng loại bỏ các bụi bẩn, tạp chất, dầu thừa, tế bào chết bám trên da. Từ đó giúp da được làm sạch sâu, lỗ chân lông được thông thoáng.

- Tẩy trang nhẹ nhàng: Sữa rửa mặt La Roche-Posay có kết cấu dạng sữa dịu nhẹ chứa nhiều dưỡng chất tốt cho da. Vì vậy chúng sẽ giúp da được làm sạch một cách nhẹ nhàng kể cả làn da nhạy cảm.

- Cung cấp độ ẩm, dưỡng ẩm da: Trong thành phần của sữa rửa mặt La Roche-Posay chứa nước khoáng và nhiều dưỡng chất có khả năng hạn chế sự thoát hơi nước, cung cấp độ ẩm, giữ da luôn mềm mịn, tươi sáng.

- Hỗ trợ giảm mụn, ngăn ngừa mụn: Sữa rửa mặt La Roche-Posay còn có tác dụng kiểm soát lượng dầu thừa trên da mặt hiệu quả. Từ đó ngăn chặn sự hình thành và phát triển của mụn.

- Sản phẩm không chứa các chất bảo quản, hương liệu, xà phòng nên không làm khô da hay gây mẩn đỏ cho da khi sử dụng.



HƯỚNG DẪN SỬ DỤNG

- Sử dụng sữa rửa mặt hằng ngày vào buổi sáng và tối.

- Làm ẩm da với nước ấm, lấy một lượng vừa đủ sữa rửa mặt ra tay, tạo bọt với nước rồi thoa sữa rửa mặt lên mặt, tránh vùng da quanh mắt

- Massage nhẹ nhàng, sau đó rửa sạch lại với nước và lau khô.



HSD: 03 năm kể từ NSX

NSX: Xem trên bao bì

Xuất xứ thương hiệu: Pháp

Nơi sản xuất: Pháp', 1, 1, CAST(N'2025-03-15T22:48:48.870' AS DateTime), CAST(N'2025-03-15T22:48:48.870' AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [image], [price], [description], [cid], [sub_id], [created_at], [updated_at]) VALUES (8, N'Sữa Rửa Mặt Bùn Khoáng COLORKEY LUMINOUS Phù Hợp Da Nhạy Cảm Giúp Làm Sạch Sâu, Giữ Ẩm, Không Gây Khô Da 100g', N'https://down-vn.img.susercontent.com/file/vn-11134207-7ras8-m35yqh9wx31747@resize_w900_nl.webp', 94000.0000, N'Thông tin sản phẩm: Sữa Rửa Mặt Bùn Khoáng COLORKEY LUMINOUS	



Thương hiệu: COLORKEY LUMINOUS	

Khối lượng tịnh: 100g

Hạn sử dụng: 3 năm

Nơi sản xuất: Quảng Châu.	

Công dụng: Cấp ẩm cho da, hỗ trợ làm sáng, phục hồi da. 



Hướng dẫn sử dụng:	

Bước 1: Cho một lượng sản phẩm thích hợp vào lòng bàn tay 

Bước 2: Thêm nước và xoa đều để tạo bọt, thoa đều lên mặt và massage nhẹ nhàng khắp mặt

Bước 3: Cuối cùng, rửa lại bằng nước sạch.



Lưu ý	

1. Kiểm tra tình trạng kích ứng của da bằng cách lấy một lượng nhỏ và bôi lên phía sau tai và theo dõi trong 24h.

2.Ngưng sử dụng nếu có xuất hiện tình trạng kích ứng khi đắp.', 1, 1, CAST(N'2025-03-15T22:48:48.870' AS DateTime), CAST(N'2025-03-15T22:48:48.870' AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [image], [price], [description], [cid], [sub_id], [created_at], [updated_at]) VALUES (9, N'YIHETANG tinh chất serum giảm mụn ẩn thâm mụn mờ thâm chăm sóc da thu nhỏ lỗ chân lông 30ML', N'https://down-vn.img.susercontent.com/file/sg-11134201-7rcf9-m6l7skrsi1s9d7@resize_w900_nl.webp', 139000.0000, N'✅Loại tinh dịch khử mụn này, lựa chọn tinh túy nhiều loại thực vật tự . Ôn hòa thân da, xâm nhập tầng dưới chót của da thịt, chuẩn xác đối  căn nguyên mụn trứng cá.  ,  tiết dầu mỡ trên da, làm nhạt mụn trứng cá, lành da thịt bị tổn thương. Kiên sử dụng, giúp bạn tạm biệt mụn trứng cá, lấy lại trạng thái da thịt mịn màng, nhẹ nhàng



✅Hỗ trợ tái phát

Công thức thực vật  có thể loại bỏ mụn trứng cá hiện có, mà còn chú trọng từ bên trong da thịt. Bằng cách chỉnh cân bằng nước và dầu của da, tăng cường chức năng rào cản da,   Sử dụng lâu dài, có thể làm cho da thịt ở vào trạng thái khỏe mạnh ổn định, tạm biệt mụn trứng cá quấy nhiễu.



✅Nhẹ nhàng

Sau khi kiểm tra an toàn nghiêm ngặt, Serum khử mụn không thêm rượu, tinh chất, hormone và các thành phần có hại khác, phù hợp cho tất cả các loại chất da sử dụng, bao gồm cả da nhạy cảm. Công thức ôn hòa của nó trong khử mụn, sẽ không gây thêm gánh nặng cho da thịt, để bạn yên tâm hưởng thụ quá trình khử mụn.



✅ giảm thâm mụn trứng cá

Bước đầu tiên là loại bỏ mụn trứng cá;



Bước thứ hai là loại bỏ các dấu vết do mụn trứng cá để lại;



Bước thứ ba là phục hồi da, lỗ chân lông tinh tế, giảm sự xuất hiện lại của mụn trứng cá;





🧡Giới thiệu Cách sử dụng Serum giảm mụn: 

1, Làm sạch da mặt: Làm sạch da mặt triệt để với các sản phẩm làm sạch dịu nhẹ, loại bỏ bụi bẩn, dầu và mỹ phẩm dư thừa, đồng thời tạo nền tảng tốt cho sự hấp thụ tinh chất.



2, Lấy Một Lượng Tinh Chất Thích Hợp Và Thoa Nó Vào Vị Mụn, Ngày 1 Lần Vào Buổi Sáng Và 1 Lần Vào Buổi Tối.



3, Nếu Mụn Nghiêm Trọng Hơn, Bạn Có Thể Vắt Mụn Và Bôi Ngay, Tập Trung Áp Dụng 3-4 Lần Một Ngày.



✅Thành phần Thành phần: WATER、BUTYLENE GLYCOL、HYDROLYZED ELASTIN、1,2-HEXANEDIOL、TOTAROL、HEXAMIDINE DIISETHIONATE、o-CYMEN-5-OL、OUBAKU EKISU、SALIX ALBA (WILLOW) BARK EXTRACT、REHMANNIA CHINENSIS ROOT EXTRACT、AZADIRACHTA INDICA LEAF EXTRACT、SCUTELLARIA BAICALENSIS ROOT EXTRACT、HOUTTUYNIA CORDATA EXTRACT、GLYCINE SOJA (SOYBEAN) SEED EXTRACT、ALOE BARBADENSIS LEAF WATER



● Được khuyên dùng cho:  giảm mụn trứng cá, thu nhỏ lỗ chân lông;



● Phương pháp bảo quản: Bảo quản nơi thoáng mát tránh ánh nắng trực tiếp;



● Thời hạn sử dụng: 3 năm kể từ ngày sản xuất', 1, 2, CAST(N'2025-03-15T22:48:48.870' AS DateTime), CAST(N'2025-03-15T22:48:48.870' AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [image], [price], [description], [cid], [sub_id], [created_at], [updated_at]) VALUES (10, N'Serum DELUCIR Cấp Ẩm Phục Hồi Căng Bóng Trẻ Hóa Da - Dung Tích 30ml', N'https://down-vn.img.susercontent.com/file/vn-11134207-7ras8-m3doisj3xa8xc8@resize_w900_nl.webp', 184000.0000, N'1. THÔNG TIN SẢN PHẨM

- Tên sản phẩm: Serum Cấp Ẩm Phục Hồi Cấp Tốc 24h DeLucir Trẻ Hóa Căng Bóng Da 30ml

- Thương hiệu: DeLucir

- Xuất xứ thương hiệu: Việt Nam

- Hạn sử dụng: 24 tháng 



2. THÀNH PHẦN

- Thành phần Serum cấp ẩm căng bóng: Tinh chất cam ép lạnh, Niacinemide, Colaggen, Chiết xuất xạ hương, GLYCENRIN,  Các thành phần thiên nhiên khác



3. CÔNG DỤNG SẢN PHẨM 

- Công dụng Serum cấp ẩm căng bóng: Giúp làn da trở nên căng mọng, mịn màng. Cấp ẩm hiệu quả cho làn da, duy trì độ ẩm tự nhiên để da luôn trong trạng thái căng bóng.



4. HƯỚNG DẪN SỬ DỤNG

- HDSD Serum cấp ẩm căng bóng: dùng mỗi ngày 2-3 lần sau đó rửa mặt và làm ẩm bằng xịt khoáng, với những vùng da ná.m sạ.m nhiều, mỗi lần dùng bạn có thể layer hai lớp để tăng hiệu quả việc dưỡng trắng và làm sáng da.



5. ĐỐI TƯỢNG SỬ DỤNG

- Do thành phần sản phẩm chiết xuất từ thiên nhiên an toàn lành tính nên phù hợp với mọi loại da, từ da nhạy cảm đến da dầu mụn, da khô



6. BẢO QUẢN SẢN PHẨM

- Bảo quản nơi khô ráo thoáng mát, tránh ánh nắng trực tiếp. Đậy kín nắp sản phẩm khi sử dụng xong.



7. CAM KẾT KHI MUA HÀNG TẠI SHOP 

- Chúng tôi cam kết mang đến sản phẩm chất lượng tốt với giá cả hợp lý nhất cho khách hàng. 

- Sản phẩm 100% là hàng chính hãng, có đầy đủ giấy tờ. Cam kết bù tiền x5 lần nếu quý khách thấy hàng không đạt chuẩn

- Dịch vụ hỗ trợ khách hàng "tận tâm - trung thực - nhiệt tình - phục vụ khách hàng 24/7"

- Hỗ trợ giao hàng hỏa tốc trong 3-6 giờ trong nội thành (giao trong giờ hành chính) 

- Hỗ trợ Đổi/trả trong nếu sản phẩm bị Lỗi từ nhà sản xuất theo quy định của Shopee

Quý khách vui lòng liên hệ với Shop để được giải đáp thắc thắc cũng như giải quyết vấn đề (nếu có)', 1, 2, CAST(N'2025-03-15T22:48:48.870' AS DateTime), CAST(N'2025-03-15T22:48:48.870' AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [image], [price], [description], [cid], [sub_id], [created_at], [updated_at]) VALUES (11, N'Serum The Ordinary Niacinamide 10% + Zinc 1% [30ml]', N'https://down-vn.img.susercontent.com/file/vn-11134207-7ras8-m4zvpdy54a2r89@resize_w900_nl.webp', 69000.0000, N'✨✨Tinh chất dưỡng da The Ordinary Niacinamide 10% + Zinc 1% [30ml] ✨✨✨

🌷 THÀNH PHẦN

- Serum The Ordinary Nia có các thành phần chính:

+ Niacinamide: loại bỏ dần những nốt thâm mụn, đốm nâu và cả tàn nhang trên da, chống lão hóa.

+ ZinC: giảm tình trạng tiết dầu đồng thời tái tạo làn da mới khỏe mạnh hơn.

- Thành phần đầy đủ: Aqua (Water), Niacinamide, Pentylene Glycol, Zinc PCA, Dimethyl Isosorbide, Tamarindus Indica Seed Gum, Xanthan gum, Isoceteth-20, Ethoxydiglycol, Phenoxyethanol, Chlorphenesin.

- Tinh Chất Niacinamide 10% + Zinc 1% không chứa các chất: Cồn, dầu, silicone, gluten.

CÔNG DỤNG:

Công dụng chính

+ Làm dịu da, làm dịu các nốt mụn sưng, mụn viêm và ngăn ngừa mụn trứng cá.

+ Điều tiết dầu thừa và bã nhờn.

+ Chống lão hóa, chống oxi hóa.

+ Làm sáng da và đều màu da.

+ Kích thích sản xuất collagen giúp da căng mịn, giảm nếp nhăn.

+ Khắc phục các khuyết điểm trên da như tàn nhang, đốm nâu, mụn thâm.



🌷 HƯỚNG DẪN SỬ DỤNG & BẢO QUẢN

- Sau khi làm sạch da mặt và cân bằng da (nếu có), apply một lượng The Ordinary Serum vừa đủ khắp mặt cho cả sáng và tối. Dùng kem dưỡng ẩm sau đó.

- Nếu bạn dùng nhiều loại serum thì có thể apply Serum T.h.e O.r.d.i.n.a.r.y Nia theo quy tắc lỏng trước đặc sau và mỗi bước cách nhau 2-3 phút để sản phẩm kịp thấm vào da.

- Không dùng The Ordinary  Niacinamide 10% + Zinc 1% cùng thời điểm với Vitamin C trong chu trình skincare.

- Không sử dụng Serum The Ordinary lên vùng da đang bị thương, có vết hở

- Nên test Nia serum lên vùng da khác (cổ tay) trước khi sử dụng lên da mặt

- Thoa serm TO tránh xa vùng mắt.



🌷 Serum The Ordinary Nia phù hợp với mọi loại da, đặc biệt da dầu mụn, thâm mụn, kể cả da nhạy cảm.



🌷 BAO BÌ SẢN PHẨM

- Hộp giấy màu trắng chữ đen style basic của hãng, vỏ chai thủy tinh vô cùng chắc chắn - Lọ serum không có tem seal niêm phong. - The Ordinary không chú trọng hình thức, chú trọng chất lượng sản phẩm - The Ordinary có nhiều mẫu bao bì, đồng thời thay đổi thường xuyên sẽ có sự khác biệt theo từng lô sản xuất cũng như rất hay lỗi.

Chúng tôi sẵn sàng giải quyết mọi thắc mắc về sản phẩm.

Vui lòng quay video khi khui hàng.', 1, 2, CAST(N'2025-03-15T22:48:48.870' AS DateTime), CAST(N'2025-03-15T22:48:48.870' AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [image], [price], [description], [cid], [sub_id], [created_at], [updated_at]) VALUES (12, N'Serum giảm mụn làm dịu da cho nam Men Stay Simplicity Calm Skin Relief Facial Serum 30ml', N'https://down-vn.img.susercontent.com/file/vn-11134207-7ra0g-m6ru7b0e838866@resize_w900_nl.webp', 225000.0000, N'THÀNH PHẦN CHÍNH & CƠ CHẾ HOẠT ĐỘNG

Sản phẩm serum giảm mụn & làm dịu da cho nam Men Stay Simplicity sử dụng chiết xuất thiên nhiên lành tính, an toàn cho nhiều làn da nam giới, kể cả da nhạy cảm.

- Kết hợp từ Terpineol-4, Salix Alba (Willow) Bark Extract, Salicylic Acid cùng hoạt chất vàng Zinc PCA mang tới công dụng X3: Ngừa mụn, làm dịu trực tiếp các điểm mụn, giảm đỏ, sưng rát, kiềm dầu nhờn. 

- BHA nồng độ 1%: Tấn công sâu vào lỗ chân lông, làm bong lớp sừng hóa gây bít tắc, làm sạch bụi bẩn, bã nhờn. Để làm sạch mụn ẩn sâu bên trong da, BHA 1% có cơ chế đẩy mụn*.

- Zinc PCA: Bình thường hoá quá trình bài tiết bã nhờn, hạn chế gia tăng vi khuẩn gây mụn trứng cá. Khô cồi mụn nhanh.

- Glycerin: Dưỡng ẩm giúp da không bị khô.

 

(*) Đẩy mụn: Hiện tượng bình thường khi dùng BHA. Thường diễn ra trong 2-8 tuần ở các vị trí nhiều mụn ẩn, mụn đầu đen.

HƯỚNG DẪN SỬ DỤNG SERUM GIẢM MỤN & LÀM DỊU DA CHO NAM MEN STAY SIMPLICITY

Với mục đích giảm mụn: Chấm 1-2 giọt serum lên vùng da mụn đã được làm sạch và để khô. 

- Da mụn nhẹ, mụn đầu đen, mụn trứng cá, mụn đầu trắng: Dùng 2 lần/ ngày vào sáng và tối trước khi đi ngủ.

- Da mụn viêm, viêm có mủ: Dùng 2-3 lần/ ngày, chấm trực tiếp vào các nốt mụn.

- Da sau mụn: Duy trì 1 lần/ ngày vào buổi tối khi mụn đã giảm.

Đặc biệt, kết hợp dùng serum giảm mụn & làm dịu da cùng sữa rửa mặt sạch dầu & ngừa mụn, kem dưỡng ẩm đa năng 5 in 1 sẽ đạt hiệu quả tốt hơn.

 

Với mục đích tẩy tế bào chết: Bôi đều 1-2 giọt serum lên toàn bộ nền da mặt đã được làm sạch và để khô. Dùng 2-3 lần mỗi tuần. Phù hợp da ít mụn hoặc sạch mụn.

 

LƯU Ý

Người dùng hoạt chất (AHA, BHA, Niacinamide,...) lần đầu cần đặc biệt lưu ý: Sử dụng lượng ít trên một vùng da nhỏ, 1 lần/ ngày và cách ngày để da làm quen với hoạt chất. Tăng dần lượng dùng, số lần dùng, vùng da sử dụng như phần “Hướng dẫn sử dụng” tùy theo mức độ làm quen của da sau khoảng 1 tuần sử dụng.



THÔNG TIN SẢN PHẨM

- Tên sản phẩm: Serum giảm mụn & làm dịu da cho nam Men Stay Simplicity Calm Skin Relief Facial Serum 30ml

- Thương hiệu: Men Stay Simplicity thuộc Công ty Cổ phần Parsley

- Xuất xứ thương hiệu: Việt Nam

- Nơi sản xuất: Việt Nam

- Hạn sử dụng: 3 năm kể từ ngày sản xuất

- Ngày sản xuất: Xem chi tiết trên bao bì

- Hướng dẫn bảo quản: Để sản phẩm nơi thoáng mát, tránh ánh nắng trực tiếp

 

NGUYÊN TẮC THÂN THIỆN

- Không sử dụng những thành phần hoá học mạnh, gây kích ứng

- Không chứa Paraben

- Không chứa hương liệu nhân tạo

', 1, 2, CAST(N'2025-03-15T22:48:48.870' AS DateTime), CAST(N'2025-03-15T22:48:48.870' AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [image], [price], [description], [cid], [sub_id], [created_at], [updated_at]) VALUES (13, N'Serum dưỡng ẩm sâu trẻ hoá da và phục hồi Losionerie Men HA B5 30ml. ', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lp52wyijg09nfd@resize_w900_nl.webp', 38000.0000, N'Serum dưỡng ẩm và phục hồi Losionerie HA B5 30ml với chiết xuất từ các hoạt chất: Hyaluronic acid phân tử thấp, Antaromonas, Niacinamide, Panthenol, Squalane và các thành phần thiên nhiên lành tính như: Chiết xuất Sâm Ngọc Linh, Chiết xuất Dưa Leo, Chiết xuất Diếp Cá hỗ trợ giúp tái tạo làn da thiếu sức sống, da không đều màu, đồng thời giúp trẻ hóa làn da, mang lại cho các quý ông làn da tươi sáng, căng mịn.



Công dụng của Serum dưỡng ẩm, mờ vết nhăn và phục hồi Losionerie HA B5 Moisturizing And Restoring Serum với chiết xuất thiên nhiên cho nam:

1) Dưỡng Ẩm Vượt Trội

- Thành phần chứa HA và các chiết xuất tự nhiên giúp cấp ẩm sâu cho làn da, giữ cho da luôn mềm mại, mịn màng và khỏe mạnh.

- Bảng thành phần vượt trội với HA, Hydrolyzed Collagen, Pseudoalteromonas ferment extract, Squalene, chiết xuất và hàm lượng cao từ thiên nhiên Sâm Ngọc Linh, Cúc La Mã, Dưa Leo, Diếp Cá

2) Tăng Sinh Collagen và Mờ Nếp Nhăn: 

- Serum HA B5 kích thích quá trình tăng sinh collagen tự nhiên, giúp da căng bóng, mờ nếp nhăn và trẻ trung hơn.

3) Da Tràn Đầy Sức Sống: 

- Công thức đặc biệt giúp làn da trở nên tràn đầy sức sống, tái tạo tế bào, giảm viêm và làm giảm tình trạng da mất nước.

4) An Toàn và Tinh Khiết: 

- Cam kết không chứa paraben, cồn, sulfate và silicone, đảm bảo da được chăm sóc một cách an toàn và tinh khiết nhất.', 1, 2, CAST(N'2025-03-15T22:48:48.870' AS DateTime), CAST(N'2025-03-15T22:48:48.870' AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [image], [price], [description], [cid], [sub_id], [created_at], [updated_at]) VALUES (14, N'LAIKOU Bộ sản phẩm Chăm sóc da Vitamin C 5 món giúp làm sáng da, mở thâm', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lnl4982dksml66@resize_w900_nl.webp', 117000.0000, N'Bộ 5 sản phẩm chăm sóc da vitamin C/LAIKOU Vitamin C skincare set



Thời hạn sử dụng: 5 năm

Thành phần chính: Chiết xuất Vitamin C và Citrus Tangerina (Tangerine)

Tác dụng: Làm sáng da/ Giữ ẩm/ Làm mờ nếp nhăn

Sử dụng chăm sóc da hàng ngày



1. Sữa rửa mặt: lấy một ít sữa rửa mặt tạo bọt trên tay sau đó thoa lên mặt và massage nhẹ nhàng mặt, sau đó rửa sạch với nước.

2. Toner: Thoa đều lên toàn bộ khuôn mặt và vỗ nhẹ cho đến khi nó được hấp thụ.

3. Serum: Nhỏ 2-4 giọt serum vào lòng bàn tay, sau đó thoa đều lên mặt.

4. Kem dưỡng mắt: Thoa dọc theo vùng mắt và massage nhẹ nhàng cho đến khi được hấp thụ.

5. Kem dưỡng: Thoa kem dưỡng da mặt lên toàn bộ khuôn mặt và massage nhẹ nhàng cho đến khi nó được hấp thụ hoàn toàn.

6. kem chống nắng: Kết cấu tươi mát và không nhờn, có thể nhanh chóng hình thành một lớp màng bảo vệ trên bề mặt da và ngăn ngừa hiệu quả tình trạng cháy nắng



-Lưu trữ: Để tránh tiếp xúc trực tiếp với ánh nắng mặt trời, vui lòng bảo quản sản phẩm ở nơi khô ráo và thoáng mát.

-Thận trọng: Da nhạy cảm nên được test thử trên da tay trước khi sử dụng. Nếu bạn cảm thấy không thoải mái, hãy ngừng sử dụng ngay lập tức.', 1, 2, CAST(N'2025-03-15T22:48:48.870' AS DateTime), CAST(N'2025-03-15T22:48:48.870' AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [image], [price], [description], [cid], [sub_id], [created_at], [updated_at]) VALUES (15, N'FOCALSKIN Serum Dưỡng Trắng Da Mờ Thâm Mụn Gấp Đôi Vitamin C + Niacinamide B3 + Alpha Arbutin 30ml', N'https://down-vn.img.susercontent.com/file/vn-11134207-7ra0g-m7ao32i5ycxo97@resize_w900_nl.webp', 141000.0000, N'FOCALSKIN Serum Dưỡng Trắng Da Mờ Thâm Mụn Gấp Đôi Vitamin C + Niacinamide B3 +  Alpha Arbutin Dưỡng Ẩm Mờ Nám 30ml



CÔNG THỨC “VÀNG”

- Dưỡng trắng chuyên sâu nhờ công thức “vàng” Niacinamide (Vitamin B3) + Alpha Arbutin: hỗ trợ kiểm soát và ức chế việc hình thành hắc sắc tố Melanin được nhân đôi. Khi kết hợp với Tranexamic Acid và Vitamin C sẽ càng đẩy mạnh công dụng dưỡng trắng, tạo thành một công thức “vàng” có hiệu quả làm trắng gấp 10 lần Serum Vitamin C thông thường.

- Niacinamide (Vitamin B3) thể tinh khiết giúp làm mờ thâm mụn, mẩn đỏ hiệu quả. Đồng thời giảm tiết dầu thừa, bã nhờn trên da, từ đó hỗ trợ ngăn ngừa mụn đầu đen, mụn đầu trắng và thu nhỏ lỗ chân lông.

- Alpha Arbutin hỗ trợ ức chế sự hình thành hắc sắc tố Melanin tối màu từ gốc tế bào. Làm mờ các đốm nâu cũ và hạn chế hình thành đốm nâu mới.

- Dẫn xuất Vitamin C thế hệ mới 3-O-Ethyl Ascorbic Acid (EAA): tính ổn định cao, không dễ oxy hóa. Hỗ trợ mang lại làn da tươi tắn, giảm những tổn thương do ánh nắng mặt trời và stress ảnh hướng đến da.

- Tranexamic Acid: làm sáng da, mờ đốm nâu, ngăn ngừa hình thành các đốm nâu mới. Khi được kết hợp cùng những hợp chất trên sẽ đẩy mạnh khả năng thâm nhập vào trong da, giúp da hấp thụ dưỡng chất tốt hơn, đồng thời làm tăng hiệu quả làm trắng sáng.

- Nước hoa hồng Damascna: có hàm lượng chất chống Oxy hóa dồi dào, giúp làn da tươi khỏe, săn chắc và ẩm mịn.



ĐẶC ĐIỂM NỔI BẬT



- KHÔNG CỒN - KHÔNG DẦU KHOÁNG - KHÔNG PARABEN - KHÔNG SULFATE.

- Thành phần lành tính, có chiết xuất thực vật phù hợp cho mọi loại da kể cả da nhạy cảm

- Kết hợp các hoạt chất dưỡng sáng một cách cân bằng, an toàn và khoa học.

- Công thức “vàng” được nghiên cứu và phát triển tại Pháp. Tỷ lệ thành phần cân bằng và khoa học, đủ để phát huy tác dụng và bổ trợ công dụng dưỡng sáng mà vẫn đảm bảo giảm thiểu tình trạng kích ứng.

- Kết cấu mỏng nhẹ, thấm nhanh vào da, giúp làn da thoáng mát không nhờn rít.

- Sản phẩm có đầy đủ giấy chứng nhận về nguồn gốc thành phần, công dụng sản phẩm và độ an toàn cho người dùng.



HƯỚNG DẪN SỬ DỤNG



Bước 1: Rửa sạch mặt với sữa rửa mặt.

Bước 2: Lấy một lượng toner phù hợp thoa toàn mặt.

Bước 3: Cho vài giọt serum lên mặt, thoa đều và massage nhẹ nhàng để dưỡng chất thấm vào da

Bước 4: Dùng kem dưỡng để khóa ẩm

Bước 5: Thoa kem chống nắng (bước này chỉ thực hiện khi bạn chăm sóc da vào ban ngày).



LƯU Ý



- Nên sử dụng sản phẩm trên nền da đã được làm sạch bụi bẩn, makeup.

- Vui lòng bảo quản sản phẩm ở nơi thoáng mát, tránh ánh nắng trực tiếp và nhiệt độ cao.



HẠN SỬ DỤNG



HSD được in trên bao bì, ngày sản xuất cách HSD 36 tháng.

Sau khi mở nắp, quý khách nên sử dụng sản phẩm trong vòng 12 tháng.', 1, 2, CAST(N'2025-03-15T22:48:48.870' AS DateTime), CAST(N'2025-03-15T22:48:48.870' AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [image], [price], [description], [cid], [sub_id], [created_at], [updated_at]) VALUES (16, N'Serum Glycolic Melasyl 8% [Melasyl+Glycolic+Niacinamide] dưỡng sáng da, mờ thâm mụn & nám Loreal Paris', N'https://down-vn.img.susercontent.com/file/vn-11134201-7ra0g-m7bq535x52ybd8@resize_w900_nl.webp', 329000.0000, N'• Serum dưỡng sáng Glycolic-Bright MỚI với thành phần đột phá sáng da MelasylTM từ viện nghiên cứu L’oreal Paris – hiệu quả hơn 5 hoạt chất sáng da phổ biến, cùng phức hợp hoạt chất 8% [Melasyl+Glycolic+Niacinamide] giúp mang đến khả năng vượt trội GIẢM 77% THÂM MỤN & NÁM*.  

Sản phẩm thích hợp cho mọi loại da, kể cả làn da nhạy cảm 

 

• VÌ SAO BẠN SẼ THÍCH? 

Trải qua hơn 18 năm nghiên cứu, sàng lọc từ hơn 100,000 phân tử, viện nghiên cứu L’oreal Paris đã tìm ra một thành phần đột phá sáng da MelasylTM với 27 bằng sáng chế, nay có trong serum dưỡng sáng Glycolic-Bright MỚI – hiệu quả hơn 5 hoạt chất sáng da phổ biến 

Serum Glycolic-Bright Melasyl Mới với công thức phức hợp hoạt chất 8% [Melasyl + Glycolic + Niacinamide] giúp mang đến khả năng toàn diện GIẢM 77% THÂM MỤN & NÁM*. 

*Kiểm nghiệm trên 176 đốm nâu, 88 phụ nữ trong vòng 8 tuần sử dụng 

 • Thành phần chính:

8% [Melasyl + Glycolic + Niacinamide]: ngăn chặn hắc sắc tố xuất hiện, làm mờ thâm nám.

Chứa 5 hoạt chất: Vitamin C 7%, PHE Resorcinol 0.5%, Niacinamide 4%, TXA 1%, Arbutine 7%: dưỡng sáng da, làm mờ các loại thâm nám và đốm nâu lâu năm.

• Thành phần đầy đủ:

Aqua / Water, Glycolic Acid, Hydroxyethylpiperazine Ethane Sulfonic Acid, Glycerin, Sodium Hydroxide, Citric Acid, Pentylene Glycol, Ascorbyl Glucoside, Panthenol, Peg-40 Hydrogenated Castor Oil, Ppg-26-Buteth-26, Tocopherol, Bis-Peg-18 Methyl Ether Dimethyl Silane, Benzyl Alcohol, Hexyl Cinnamal, Limonene, Linalool, Salicylic Acid, Parfum / Fragrance

• Bảo quản:

Nơi khô ráo thoáng mát.

Tránh ánh nắng trực tiếp, nơi có nhiệt độ cao hoặc ẩm ướt.

Đậy nắp kín sau khi sử dụng.

• ƯU ĐIỂM NỔI BẬT 

Hiệu quả sáng da rõ rệt 

Mờ thâm mụn & sạm da 

Mờ nhiều loại thâm nám, kể cả các đốm nâu lâu năm 

Hiệu quả cho mọi tông da châu á 

Hiệu quả cho mọi loại da, kể cả da nhạy cảm 

 

• HIỆU QUẢ SỬ DỤNG  

Hiệu quả sử dụng đã chứng minh, sản phẩm giúp giảm 77% thâm mụn & nám, làn da đều màu và trông sáng, rạng rỡ hơn từ sau 8 tuần. 

(*) Theo đánh giá hiệu quả sau khi sử dụng trên 1000 người phụ nữ châu Á, 18~35 tuổi, nhiều loại da. Tuy nhiên, tùy theo cơ địa và các khuyết điểm trên da của từng trường hợp người dùng mà hiệu quả có thể thay đổi nhưng không đáng kể.   

 

• HƯỚNG DẪN SỬ DỤNG 

Dùng hàng ngày vào sáng và tối, trước bước kem dưỡng ẩm. Nên dùng kèm Kem dưỡng GLYCOLIC-BRIGHT để đạt hiệu quả tốt nhất. Tránh tiếp xúc vào vùng da quanh mắt. 

Bạn nên sử dụng thêm kem chống nắng UV Defender Invisible Fluid trước khi ra đường để làn da được bảo vệ tối ưu 

Xuất xứ thương hiệu: Pháp  

Xuất xứ: Indonesia 

HSD: 3 năm kể từ ngày sản xuất  

NSX: Xem trên bao bì 

• THÔNG TIN THƯƠNG HIỆU

Hơn 100 năm thành lập, L’Oréal là tập đoàn chuyên về mỹ phẩm và chăm sóc sắc đẹp lớn nhất thế giới. L’Oréal Paris đã có mặt tại hơn 120 quốc gia với các dòng sản phẩm về chăm sóc tóc, chăm sóc da và trang điểm dành cho đại chúng. Được xây dựng trên nền tảng khoa học, áp dụng những phát minh công nghệ mới nhất, các sản phẩm L’Oréal Paris có chất lượng cao cấp, đa dạng, dễ sử dụng, với mức giá phù hợp cho tất cả mọi người, đáp ứng nhiều nhu cầu làm đẹp.

*L’Oréal Paris là nhãn hiệu mỹ phẩm hàng đầu tại Châu Âu được sản xuất tại nhiều nhà máy trên toàn thế giới như Trung Quốc, Mỹ, Indonesia… Dù được sản xuất ở đâu, các sản phẩm đều tuân theo quy trình kiểm soát chất lượng nghiêm ngặt và đồng đều của L’Oréal Toàn Cầu. Các sản phẩm chính hãng đều có tem nhãn tiếng Việt phía sau và nhập khẩu trực tiếp từ công ty TNHH L’Oréal Việt Nam nên các bạn hoàn toàn yên tâm.', 1, 2, CAST(N'2025-03-15T22:48:48.870' AS DateTime), CAST(N'2025-03-15T22:48:48.870' AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [image], [price], [description], [cid], [sub_id], [created_at], [updated_at]) VALUES (17, N'GMEELAN KEM LƯỜI BIỂN GLUTA TRẮNG 30g SPF20 WHITENING LAZY CREAM', N'https://down-vn.img.susercontent.com/file/cn-11134207-7ras8-m5v8le64yi0rb9@resize_w900_nl.webp', 116000.0000, N'💗Tìm kiếm toàn cầu GMEELAN để giải mã bí mật làm trắng da

 - Miluomu, Còn được gọi là cỏ phượng hoàng Nam Phi, còn được gọi là "cỏ tái sinh", mọc trên cao nguyên Nam Phi cổ xưa và bí ẩn, nó chứa đựng sức mạnh bản thân. Phục hồi mạnh mẽ, chỉ cần 1 giọt nước là có thể phục hồi sức sống không bị héo



. Thông tin sản phẩm

[Tên sản phẩm] [Kem làm trắng da dành cho người lười biếng Glutathione

[Dung lượng sản phẩm] 30g

[Công dụng của sản phẩm] Làm trắng, sáng, dưỡng ẩm

[Đối tượng sử dụng] Dùng được cho nhiều loại da khác nhau, đặc biệt là da cần làm trắng và dưỡng ẩm



👏Lợi ích:

1 ️ ⃣ trang điểm trong 10 giây, lớp trang điểm tạo cảm giác tự nhiên, kéo dài 8 giờ

2 ️ ⃣ làm trắng sau 3 giây, trắng da tự nhiên, không trắng giả Làm trắng nhanh trong 7 ngày, tạm biệt da mặt xỉn màu

4 ️ ⃣ Kem chống nắng SPF20, PA + +, chống sạm da do bức xạ tia cực tím



💥Thành phần nổi tiếng:

* Thành phần làm trắng gấp 5 lần

 Làm trắng da chuyên nghiệp từ gốc đến biểu bì, làm trắng da trong 7 ngày.

 

* Thành phần dinh dưỡng kép

- - Chiết xuất Miluomu Châu Phi, ceramide NP Hàn Quốc, dưỡng ẩm và dưỡng ẩm, nhanh chóng thẩm thấu vào da, khóa ẩm và củng cố hàng rào bảo vệ da, mang lại làn da mềm mại và tươi sáng hơn.

 

* Chiết xuất hương thơm kép

- - Chiết xuất từ bưởi, chiết xuất từ lá bạc hà, giúp đàn hồi và làm mềm da, chống oxy hóa, kháng khuẩn và chống viêm, cải thiện mùi hôi, cho làn da tươi trẻ và mềm mại.



📢Trong trường hợp sử dụng:

· Trước khi hẹn hò, không có thời gian trang điểm

Khi trang điểm, trang điểm giả trắng, phấn trôi và không tự nhiên

Da dầu và lớp trang điểm tan chảy hàng ngày, khuôn mặt trở thành gương phản chiếu



👉Thích hợp cho mọi loại da:

✔Không có cồn

✔Không chứa Paraben

✔Không có dầu khoáng

✔Không có chất tạo màu

✔Thuần chay, thân thiện



[💥Cách sử dụng] Sau khi rửa mặt sạch, thực hiện các bước dưỡng da cơ bản, lấy một lượng vừa đủ thoa đều lên mặt, thoa đều; Chờ vài giây để lớp trang điểm Trắng và trong suốt tự nhiên.

 

[📢Những điều cần chú ý]

1 ️ ⃣ vui lòng không thoa lên vùng da bị tổn thương như gãy, bỏng, phát ban, mụn mủ, sắc tố bất thường, v.v.

2 ️ ⃣ sản phẩm này mềm mại nhưng không loại bỏ phản ứng dị ứng cho từng người dùng. Nên thử trên một vùng nhỏ sau tai và bên trong cánh tay trước khi sử dụng, nếu cảm thấy khó chịu vui lòng ngừng sử dụng ngay lập tức.

3 ️ ⃣ nếu chẳng may dính vào mắt, rửa sạch bằng nhiều nước sạch ngay lập tức.', 1, 3, CAST(N'2025-03-15T22:49:10.813' AS DateTime), CAST(N'2025-03-15T22:49:10.813' AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [image], [price], [description], [cid], [sub_id], [created_at], [updated_at]) VALUES (18, N'Gmeelan KEM LƯỜI PHỤC HỒI DURVILLEA POLYPEPTIDE, đại dương tuyết Nam Cực 30g', N'https://down-vn.img.susercontent.com/file/cn-11134207-7ras8-m6di3a5gd7ln10@resize_w900_nl.webp', 176000.0000, N'Bạn có làn da nhạy cảm, không muốn để mặt mộc nhưng lại không dám trang điểm? Sáng tôi dậy muộn, vội vã đi làm

đi làm hơn nữa ngày, cần phải nhanh chóng trang điểm lại

sắp trễ cuộc hẹn, không kịp trang điểm

da tôi rất nhạy cảm và tôi cũng không dám sử dụng mỹ phẩm

đi công tác và du lịch, mang theo rất nhiều chai lọ



công cụ thần kỳ cho người có làn da nhạy cảm, dễ dàng trang điểm mà không gây gánh nặng,

ứng dụng 3S, làm sáng da đều

phân tử sửa chữa 8X, chống lại tổn thương da

phân tử làm trắng 8X, làm trắng sâu 24h* 



Kết quả thực tế khác nhau tùy theo từng người



Công thức ban đầu của GMEELAN 

gồm các thành phần tự nhiên toàn cầu + các thành phần nghiên cứu khoa học nổi tiếng + công nghệ tiên tiến quốc tế 



tảo tuyết cực

phục hồi vàng và các cơ da bị tổn thương một cách hiểu quả

tổng hợp polypeptide tetrapeptide

làm dịu đa chiều 

Công nghệ quấn của Hàn Quốc 

làm sáng và cải thiện tông màu da không đồng đều * Kết quả thực tế khác nhau từ người này sang người khác



GMEELAN 

khám phá thế giới để giữ cho làn da không bị xỉn màu.



Khám phá tuyết và đại dương ở Nam Cực.

dòng sản phẩm Tảo Tuyết 



Dòng Tảo Tuyết chọn lọc loại tảo tuyết quý giá từ tuyết và đại dương ở Nam Cực, một loại tảo vùng cực. Nó đã phải chịu nhiệt độ khắc nghiệt và tia cực tím mạnh quanh năm, điều này không những không ảnh hưởng đến sự phát triển của nó mà còn giúp nó có khả năng chống chịu căng thẳng mạnh mẽ và có khả năng sửa chữa hiệu quả.Chất diệp lục tế bào và carotenoids chứa trong nó không chỉ có thể bảo vệ và kích hoạt tế bào da, Nó cũng có thể tăng cường cơ chế bảo vệ của da và sửa chữa hiệu quả hàng rào bảo vệ da bị tổn thương.



Báo cáo thử nghiệm của tổ chức có thẩm quyền 

GMEELAN 

làm trắng sâu 24h 

--------------------------------- 

Làm trắng, tinh tế, dưỡng ẩm 

---- ---- --------------------------------------- 

Hiệu quả cuối cùng của việc sử dụng thay đổi từ tùy từng người và sẽ tùy thuộc vào làn da. Tùy vào mức độ nghiêm trọng của vấn đề.

', 1, 3, CAST(N'2025-03-15T22:49:10.813' AS DateTime), CAST(N'2025-03-15T22:49:10.813' AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [image], [price], [description], [cid], [sub_id], [created_at], [updated_at]) VALUES (19, N'Kem dưỡng ẩm cho da khoẻ mạnh 5X Ceramide Gel dưỡng ẩm SKINTIFIC 30g', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lt6cw4h05fb861@resize_w900_nl.webp', 169000.0000, N'🔥🔥kem dưỡng ẩm cho da khoẻ mạnh 5X Ceramide Gel dưỡng ẩm SKINTIFIC 30g🔥🔥

Gel dưỡng ẩm kết hợp Ceramide, Hyaluronic Acid, Centella Asiatica giúp cải thiện các vấn đề về hàng rào bảo vệ da bị tổn thương như mụn, m.ẩn đỏ, da sần, da khô một cách nhanh chóng nhưng vẫn an toàn cho hàng rào bảo vệ da. Với công nghệ 5X Ceramide, là sự kết hợp của 5 loại Ceramide giúp dưỡng ẩm sâu và giữ các lớp da khoẻ mạnh. 5X Ceramide này giúp cải thiện hàng rào bảo vệ da bằng cách giữ ẩm và tránh các nhân tố gây hại bên ngoài.

Khối lượng: 30g

 

Công dụng:

- Cải thiện các vấn đề về hàng rào bảo vệ da như mụn trứng cá, m.ẩn đỏ, da khô và da sần sùi

- Dưỡng ẩm cho da

- Kiểm soát dầu cho da

- Cải thiện hàng rào bảo vệ da

- Làm da dịu đi và mềm mịn

Hiệu quả sản phẩm phụ thuộc vào tình trạng da và cơ địa của mỗi người

 

Cách sử dụng:

- Sử dụng sau khi làm sạch da

- Thoa một lượng phù hợp lên da mặt, mát xa đều; có thể dùng cả cho vùng cổ

- Sử dụng ngày 1-2 lần vào sáng, tối; tránh vùng mắt và các vết thương hở

 

Thành phần nổi bật:

5X Ceramide: Sự kết hợp của 5 loại Ceramide giúp cải thiện và tạo lớp màng bảo vệ da cho da không bị mất độ ẩm

Hyaluronic Acid: Cấp nước nhanh cho da và cải thiện các tế bào da

Centella Asiatica: Cải thiện và giúp vấn đề vi.êm da dịu đi

Marine-Collagen: Giữ độ ẩm và độ mềm mại cho da

 

Dành cho tuổi 13 trở lên

Hạn sử dụng: 3 năm (xem trên bao bì)

Bao bì có thể thay đổi theo từng lô hàng

Xuất xứ thương hiệu: Canada

Nơi sản xuất: Trung Quốc

Bảo quản nơi khô ráo, thoáng mát, tránh ánh nắng trực tiếp', 1, 3, CAST(N'2025-03-15T22:49:10.813' AS DateTime), CAST(N'2025-03-15T22:49:10.813' AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [image], [price], [description], [cid], [sub_id], [created_at], [updated_at]) VALUES (20, N'Kem dưỡng ẩm cấp nước Neutrogena® Hydro Boost Hyaluronic Acid Water Gel (50g)', N'https://down-vn.img.susercontent.com/file/vn-11134201-7ras8-m33bncidb00ef3@resize_w900_nl.webp', 277000.0000, N'Kem dưỡng ẩm cấp nước Neutrogena® Hydro Boost Hyaluronic Acid Water Gel (50g) giúp KHÓA ẨM đến 72H & TĂNG CƯỜNG SỨC SỐNG cho LÀN DA - Được phát triển bởi Chuyên Gia Da Liễu



TĂNG 5X ĐỘ ẨM tức thì nhờ phức hợp ĐỘC QUYỀN NMF - Tăng cường cơ chế giữ ẩm tự nhiên của da: 

• HYALURONIC ACID: Cấp ẩm tức thì & Khóa ẩm cho làn da căng mọng dài lâu

• AMINO ACID: Hỗ trợ hàng rào bảo vệ da, ngăn thất thoát độ ẩm

• CHẤT ĐIỆN GIẢI:  Giúp làn da hấp thu dưỡng chất tối ưu

(*) NMF: Natural Moisturizing Factor



HÀNG RÀO BẢO VỆ DA KHỎE HƠN 80% - DA CĂNG MƯỚT ĐẦY SỨC SỐNG

• 97% đồng ý DA CĂNG MƯỚT tức thì

• 81% đồng ý DA KHỎE HƠN từ lần dùng đầu tiên



KẾT CẤU DẠNG GEL MÁT LÀNH:

• Thấm nhanh - Không nhờn rít - Không gây mụn

• Phù hợp với làn da & khí hậu Việt Nam



CÔNG THỨC DỊU LÀNH VỚI CẢ LÀN DA NHẠY CẢM: 

• KHÔNG CỒN KHÔ - PHTHALATES - PHẨM MÀU



HƯỚNG DẪN SỬ DỤNG: 

• Bước 1: Làm sạch tay và rửa mặt với sữa rửa mặt Neutrogena 

• Bước 2: Lấy ra tay một lượng sản phẩm vừa đủ và thoa đều trên lòng bàn tay.

• Bước 3: Vỗ nhẹ lên bề mặt da cho đến khi thẩm thấu hoàn toàn. Nên kết hợp với Serum Neutrogena Hydro Boost Niacinamide để đảm bảo hiệu quả tối ưu. 



CÁCH BẢO QUẢN:

Tránh ánh sáng trực tiếp, nơi có nhiệt độ cao hoặc ẩm ướt. Để xa tầm tay trẻ em. Không sử dụng cho vùng da tổn thương. Ngưng sử dụng ngay khi có biểu hiện kích ứng và hỏi ý kiến bác sĩ da liễu.



HSD: 3 năm kể từ ngày sản xuất



NSX: Xem trên bao bì sản phẩm



Xuất xứ thương hiệu: Hoa Kỳ



Nơi sản xuất: Hàn Quốc



Thành phần: In trên bao bì', 1, 3, CAST(N'2025-03-15T22:49:10.813' AS DateTime), CAST(N'2025-03-15T22:49:10.813' AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [image], [price], [description], [cid], [sub_id], [created_at], [updated_at]) VALUES (21, N'Kem Dưỡng Ẩm Redwin Vitamin E Cream 300g Úc , Giúp Dưỡng Da Mặt Và Body Hết Khô, Nứt Nẻ , Mềm Mịn', N'https://down-vn.img.susercontent.com/file/vn-11134201-7ra0g-m77tsrx37gxi8e@resize_w900_nl.webp', 95000.0000, N'Kem Dưỡng Ẩm Redwin Vitamin E Cream 300g Úc , Giúp Dưỡng Da Mặt Và Body Hết Khô, Nứt Nẻ , Mềm Mịn
Trọng lượng: Hũ 300g

Công dụng của Kem Dưỡng Ẩm Redwin Vitamin E Cream 300g Úc
– Dưỡng ẩm cho da
– Kem Dưỡng Ẩm Redwin Vitamin E Cream 300g Úc Làm giảm tình trạng khô ráp, sần sùi
– Kem Dưỡng Ẩm Redwin Vitamin E Cream 300g Úc Làm mềm mịn da, phục hồi vùng da ở khuỷu tay, đầu gối, gót chân
– Kem vitamin E Cream duy trì độ đàn hồi, căng mượt cho da
– Giảm sự xuất hiện nếp nhăn, nếp gấp, lão hóa
– Thu hẹp lỗ chân lông
– Làm sáng da, mờ vết thâm sạm
– Phục hồi da tổn thương, thâm sẹo, mụn
– Chống oxy hóa, làm giảm thiểu tác động từ môi trường, UV
– Giảm nguy cơ dị ứng da Mềm Mịn
– Kem dưỡng ẩm Redwin Vitamin E Cream làm chậm quá trình lão hóa Mềm Mịn

Cách sử dụngKem Dưỡng Ẩm Redwin Vitamin E Cream 300g Úc 
– Làm sạch da (mặt và body)
– Bôi kem lên da, massage nhẹ nhàng cho kem thẩm thấu hết.
– Dùng được cho mặt và body nhé!
– Lưu ý, bảo quản nơi khô ráo, tránh nhiệt cao', 1, 3, CAST(N'2025-03-15T22:49:10.813' AS DateTime), CAST(N'2025-03-15T22:49:10.813' AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [image], [price], [description], [cid], [sub_id], [created_at], [updated_at]) VALUES (22, N'Kem Diếp Cá Organic Luxmom dưỡng ẩm, mờ thâm, dưỡng trắng, giảm nám, giảm mụn', N'https://down-vn.img.susercontent.com/file/vn-11134207-7ras8-m2urv79r8kj4d1@resize_w900_nl.webp', 169000.0000, N'Kem Diếp Cá Organic Luxmom dưỡng ẩm, mờ thâm, dưỡng trắng, giảm nám, giảm mụn



👉THÔNG TIN CHI TIẾT:

Kem diếp cá Luxmom 

✅ THÀNH PHẦN:

•  Chiết xuất diếp cá: Làm mát, làm dịu da, giảm mụn trứng cá, mụn ẩn, mụn sưng đỏ rõ rệt.

•  Chiết xuất dừa sáp, lá trà, hoa sen: Phục hồi thương tổn da sau mụn, tái tạo da sáng đều màu, giảm thâm và không cho hình thành sẹo trên da.

•  Vitamin E: chống oxy hóa cho sản phẩm, dưỡng da mịn màng, mềm mại..



✅ CÔNG DỤNG:

•  Thải độc, giảm mụn mờ thâm nám.

•  Hấp thu bã nhờn và bụi bẩn sâu trong lỗ chân lông.

•  Làm dịu và giữ ấm cho da nhạy cảm.

•  Cải thiện kết cấu da, làm mềm mịn da.

•  Làm đều màu da, giúp da căng bóng, khỏe mạnh.

•  Dạng kem mềm mịn, dùng không bị khô căng như các loại kem thông thường.



✅ HƯỚNG DẪN SỬ DỤNG :

•  Rửa sạch mặt.

•  Lấy một lượng vừa đủ kem diếp cá thoa đều lên mặt.

•  Để 20-30p rồi rửa mặt với  nước.

•  Dùng đều đặn hàng ngày, đặt biệt trước khi ngủ để có kết quả tốt nhất.





❌ LUXMOM XIN CAM KẾT:

1. Trợ giá phí vận chuyển toàn quốc, nhận hàng thanh toán

2. Hàng luôn có sẵn, đóng gói cẩn thận trước khi giao đi

3. Hỗ trợ đổi hàng khi không đúng hoặc sản phẩm bị lỗi

4. Hỗ trợ 24/24, tư vấn nhiệt tình trước và sau khi bán hàng', 1, 3, CAST(N'2025-03-15T22:49:10.813' AS DateTime), CAST(N'2025-03-15T22:49:10.813' AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [image], [price], [description], [cid], [sub_id], [created_at], [updated_at]) VALUES (23, N'Kem dưỡng ẩm SCINIC The Simple Relief 80ml SCINIC the simple relief moisturizing cream', N'https://down-vn.img.susercontent.com/file/sg-11134207-7rces-lsuq1iwpln3ecf@resize_w900_nl.webp', 186000.0000, N'Kem dưỡng ẩm làm dịu có tính axit nhẹ

Giữ nó đơn giản cho da nhạy cảm



Kem dưỡng ẩm làm dịu có tính axit mang lại cảm giác sảng khoái và dưỡng ẩm cho làn da nhạy cảm thiếu ẩm.



Chỉ chứa các thành phần thiết yếu để giảm thiểu gánh nặng

Giảm kích ứng với chăm sóc axit nhẹ

Các bước đơn giản để giảm gánh nặng cho da



Đối với da nhạy cảm, hãy đơn giản hóa nó hơn một chút



Dung dịch nhẹ có tính axit nhẹ



An ủi làn da nhạy cảm đã bị kích ứng và nhạy cảm!

Kem dưỡng ẩm nhẹ có tính axit nhẹ



Với kết cấu dạng gel nhẹ, độ nhớt thấp, để lại một kết thúc tươi mát và mịn màng mà không gây bết dính ngay cả khi thoa nhiều lần



Làm mát làm dịu với một lượng ẩm và tươi mát ngay khi chạm vào da, làm dịu làn da nhạy cảm



Cách sử dụng Kem dưỡng ẩm giảm nhẹ đơn giản



Làm dịu làm dịu da nhạy cảm dưới mặt nạ

Làm dịu làm dịu da bị kích ứng bởi môi trường nóng ẩm dưới mặt nạ



100% vegan ĐẸP



Được chứng nhận bởi EVE VEGAN từ Pháp

Sản phẩm được chứng nhận 100% thuần chay không bao gồm các thành phần có nguồn gốc động vật để đề cao giá trị tôn trọng cuộc sống.



Chiết xuất Madecassoside & Centella Asiatica

Giúp làm dịu da và giữ cho da khỏe mạnh



Chiết xuất thân cây xương rồng Opuntia

Cung cấp độ ẩm và làm dịu để giữ cho làn da thoải mái', 1, 3, CAST(N'2025-03-15T22:49:10.813' AS DateTime), CAST(N'2025-03-15T22:49:10.813' AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [image], [price], [description], [cid], [sub_id], [created_at], [updated_at]) VALUES (24, N'Set sản phẩm chăm sóc da LAIKOU gồm kem dưỡng da 25g + serum sáng da 17ml chiết xuất hoa anh đào', N'https://down-vn.img.susercontent.com/file/my-11134201-23020-26i10mwfgnnv1a@resize_w900_nl.webp', 127000.0000, N'Thời gian giao hàng ước tính cho sản phẩm này là 7-9 ngày

  

  Kem dưỡng ẩm kiểu hoa anh đào Nhật Bản LAIKOU với axit Hyaluronic chống lão hóa 25g + Serum LAIKOU kiểu Nhật với tinh chất hoa anh đào làm trắng 17ml

  

  ★★★ Giới thiệu về cửa hàng ★★★

  Chào mừng bạn đến với cửa hàng LAIKOU chính hãng, chúng tôi luôn tin rằng những sản phẩm chất lượng có thể mang đến cho bạn trải nghiệm tốt, mong bạn có một khởi đầu tốt đẹp mọi lúc. Ngày.

  

  💕Cửa hàng LAIKOU chính hãng💕Hỗ trợ bán buôn💕 Mang lại cho bạn giá tốt nhất!!! 💕

  

  ✅Có 25g huyết thanh anh đào

  Thương hiệu: LAIKOU

  Khối lượng tịnh: 25g

  Xuất xứ: Trung Quốc

  Loại da phù hợp: mọi loại da, đặc biệt là da khô

  Thời hạn sử dụng: 3 năm

  Thành phần chính: Chiết xuất hoa anh đào, ceramide, axit hyaluronic, glycerin, v.v.

  Cách sử dụng: Nhỏ vài giọt serum lên mặt, xoa bóp cho đến khi thẩm thấu. và sau đó thoa kem dưỡng da mặt.

  

  ✅ Tác dụng của huyết thanh anh đào 17ml:

  1. Nâng màu da và săn chắc da

  2. Dưỡng ẩm và làm sáng màu da,

  3. Phục hồi và nuôi dưỡng làn da, hydrat hóa

  4. Làm sạch sâu, dưỡng ẩm

  5. Mịn màng và tinh tế, rạng rỡ và màu mỡ 

  6. Da hấp thụ nhanh chóng

  

  📢Huyết thanh anh đào

  Chiết xuất anh đào có thể dưỡng ẩm sâu và khóa ẩm. Cho làn da mỏng manh được dưỡng ẩm, mịn màng, loại bỏ các tác nhân có hại cho da và làm sáng da.

  ', 1, 3, CAST(N'2025-03-15T22:49:10.813' AS DateTime), CAST(N'2025-03-15T22:49:10.813' AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [image], [price], [description], [cid], [sub_id], [created_at], [updated_at]) VALUES (25, N'GMEELAN Chiba Rose Kem chống nắng 30g SPF50+ PA++++ Alpha-arbutin Hàn Quốc trắng da', N'https://down-vn.img.susercontent.com/file/cn-11134207-7ras8-m6hx6hmboj6kb5@resize_w900_nl.webp', 165000.0000, N'GMEELAN - Chiba Rose Kem chống nắng

GMEELAN tìm kiếm toàn cầu để giải mã bí mật làm trắng da

1、Tại sao bạn chọn chúng tôi:

Dung tích: 30g

SPF: 50+ PA++++

Hiệu quả sản phẩm: chống nắng, phục hồi và dưỡng trắng chuyên sâu.

Loại da: Tất cả loại da

2、Tại sao bạn chọn chúng tôi:

SPF50+ PA++++ Bảo vệ thực sự, không bết dính

Kem chống nắng hiệu quả cao, mỏng nhẹ và không gây bóng nhờn.

Rose centifolia và arbutin để làm dịu, phục hồi và dưỡng trắng chuyên sâu.

3、Các bước sử dụng:

 Lấy 2-3 pump kem chống nắng ra tay và dùng ngón tay chấm đều lên mặt, cổ và cơ thể.

Thoa đều kem chống nắng theo chuyển động tròn theo cùng một hướng.

Sau 30 giây là có thể trang điểm.

LỜI KHUYÊN: Nếu bạn ở ngoài trời trong thời gian dài, hãy thoa lại sau mỗi 2 giờ.Thoa lại thường xuyên để duy trì sự bảo vệ, đặc biệt là sau khi đổ mồ hôi,bơi lội hoặc lau bằng khăn.

4、Q&A

Q1. Da dầu, da mụn và da nhạy cảm có dùng được không?

Được. Chúng tôi không thêm các thành phần như cồn, chất bảo quản truyền thống và kích thích tố vào sản phẩm của mình và nó có thể được sử dụng cho mọi loại da.

Q2. Thời gian bảo vệ của kem chống nắng là bao lâu?

Thời gian bảo vệ trong nhà là 8 tiếng, còn nếu ở ngoài trời lâu thì cứ 2-3 tiếng bạn cần thoa lại một lần.

Q3. Tôi có cần tẩy trang sau khi sử dụng không?

Bạn không cần phải tẩy trang. Bạn có thể rửa sạch bằng sữa rửa mặt.Gmeelan ', 1, 4, CAST(N'2025-03-15T22:49:51.250' AS DateTime), CAST(N'2025-03-15T22:49:51.250' AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [image], [price], [description], [cid], [sub_id], [created_at], [updated_at]) VALUES (26, N'Sữa Chống Nắng Phổ Rộng Vô Hình Thoáng Da, Kháng Mọi Tác Động UV Invisible Resist', N'https://down-vn.img.susercontent.com/file/vn-11134201-7ra0g-m7bq54afge7w70@resize_w900_nl.webp', 283000.0000, N'1. Sữa Chống Nắng Phổ Rộng UV Defender Invisible Resist SPF 50+ PA ++++ cản nắng bảo vệ da tối đa với 2 lớp màng bảo vệ (Màng lọc Mexoryl SX và Mexoryl XL) và công nghệ Netlock độc quyền giúp cản tia UVA và UVB cả ngày dài. Kết cấu dạng sữa vô hình thoáng da, bền bỉ kháng mọi tác động trước Nước, Mồ Hôi, Nhiệt, Ma sát, Cát và Ô nhiễm. 



●  VÌ SAO BẠN SẼ THÍCH? 

Chống nắng màng lọc khủng thường dày bí da? Chống nắng mỏng nhẹ thường dùng liệu bảo vệ tối ưu?

Chọn chống nắng: chọn mỏng nhẹ hay bảo vệ tối ưu? Không cần đắn đo nữa vì bạn có tất cả trong một!

Giới thiệu Sữa Chống Nắng Phổ Rộng UV Defender Invisible Resist Diện Mạo Mới Từ L’Oréal Paris, Chuyên Gia Khoa Học Chống Nắng với hơn 80 Năm Nghiên Cứu. Với phát minh độc quyền NETLOCK, màng chắn bức xạ triệu điểm trong kết cấu thoáng nhẹ vô hình trên da, bền bỉ thách thức 7 cấp độ kiểm tra khắc nghiệt (Thoáng Da, Chà Xát, Nhiệt, Mồ Hôi, Nước, Khói Bụi, UV Camera).

●  Thành phần chính: 

Kem chống nắng L’Oreal Paris UV Defender Invisible Resist chứa 6 màng lọc gồm Octisaltate, Uvinul T150, Tinosorb S, Avobenzone, Mexoryl XL, Mexoryl SX với chỉ số chống nắng SPF50+ PA++++

●  ƯU ĐIỂM NỔI BẬT 

Được kiểm nghiệm và chứng minh hiệu quả trên da châu Á, bền bỉ thách thức mọi điều kiện:

2 TIẾNG BỀN BỈ TRONG ĐIỀU KIỆN PHÒNG XÔNG HƠI NÓNG ẨM (35-40 ĐỘ C)

80 PHÚT BỀN BỈ TRONG ĐIỀU KIỆN DƯỚI NƯỚC, ĐỔ MỒ HÔI NHIỀU

● Không bóng nhờn

● Không nhờn rít

● Không gây bít tắt lỗ chân lông

● Phù hợp cho mọi loại da



HƯỚNG DẪN SỬ DỤNG 

● Phù hợp với mọi loại da. 

● Dùng 1 lượng kem vừa đủ và chia đều trên mặt và cổ, sau đó thoa đều nhẹ nhàng khắp mặt và cổ. 

● Sử dụng vào ban ngày, trước khi ra nắng 30 phút, sau các bước dưỡng da thông thường, và trước các bước trang điểm tiếp theo (nếu có)

+ Hướng dẫn bảo quản: Nơi khô ráo, thoáng mát. Tránh ánh nắng trực tiếp, nơi có nhiệt độ cao hoặc ẩm ướt. Đậy nắp kín sau khi sử dụng.

2. Nước tẩy trang cấp ẩm căng mịn da Hyaluronic Acid 1.5% 400ml

Với sự kết hợp không chỉ 1 mà đến 2 loại Hyaluronic Acid ưu việt sẽ mang đến giải pháp chăm sóc da hiệu quả, cho làn da căng mịn và sáng da tức thì. Với Revitalift da sẽ có sự thay đổi rõ rệt, mang đến vẻ ngoài rạng rỡ cho bạn. 

- Thích hợp sử dụng cho mọi loại da, đặc biệt là da khô hoặc hỗn hợp thiên khô

ĐẶC ĐIỂM NỔI BẬT: 

● Thành phần không chỉ chứa 1 mà đến 2 loại Hyaluronic Acid: 

● Macro [HA]: Cấp ẩm tối đa cho bề mặt da căng mịn tức thì 

● Micro [HA]: Thẩm thấu sâu giúp căng đầy nếp nhăn và sáng da từ sâu bên trong.

Thành phần chính: Aqua / Water, Hexylene Glycol, Glycerin, Rosa Gallica Flower Extract, Sorbitol, Poloxamer 184, Disodium Cocoamphodiacetate, Disodium Edta, Propylene Glycol, BHT , Polyaminopropyl Biguanide.

THÔNG TIN THƯƠNG HIỆU 

Hơn 100 năm thành lập, L’Oréal là tập đoàn chuyên về mỹ phẩm và chăm sóc sắc đẹp lớn nhất thế giới. L’Oréal Paris đã có mặt tại hơn 120 quốc gia với các dòng sản phẩm về chăm sóc tóc, chăm sóc da và trang điểm dành cho đại chúng. Được xây dựng trên nền tảng khoa học, áp dụng những phát minh công nghệ mới nhất, các sản phẩm L’Oréal Paris có chất lượng cao cấp, đa dạng, dễ sử dụng, với mức giá phù hợp cho tất cả mọi người, đáp ứng nhiều nhu cầu làm đẹp. *L’Oréal Paris là nhãn hiệu mỹ phẩm hàng đầu tại Châu Âu được sản xuất tại nhiều nhà máy trên toàn thế giới như Trung Quốc, Mỹ, Indonesia… Dù được sản xuất ở đâu, các sản phẩm đều tuân theo quy trình kiểm soát chất lượng nghiêm ngặt và đồng đều của L’Oréal Toàn Cầu. Các sản phẩm chính hãng đều có tem nhãn tiếng Việt phía sau và nhập khẩu trực tiếp từ công ty TNHH L’Oréal Việt Nam nên các bạn hoàn toàn yên tâm về chất lượng sản phẩm. 

Xuất xứ: Indonesia

HSD: 3 năm kể từ ngày sản xuất', 1, 4, CAST(N'2025-03-15T22:49:51.250' AS DateTime), CAST(N'2025-03-15T22:49:51.250' AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [image], [price], [description], [cid], [sub_id], [created_at], [updated_at]) VALUES (27, N'Kem Chống Nắng Nâng Tone Thiên Nhiên Thấm Nhanh An Toàn Cho Mọi Loại Da Khô Dầu Hây Hây SPF 40, PA ++ Cỏ Mềm 60g', N'https://down-vn.img.susercontent.com/file/vn-11134207-7ra0g-m7c24j8ntuuu31@resize_w900_nl.webp', 260000.0000, N'HƯỚNG DẪN SỬ DỤNG:



Sau khi rửa mặt và dưỡng ẩm, thoa đều kem kem chống nắng lên mặt và cổ. Dùng trước các bước trang điểm và luôn tẩy trang vào cuối ngày.



Hạn dùng: 24 tháng. Mở nắp:12 tháng



Khối lượng: 60g



Số CBMP: 8680/20/CBMP-HN



Bảo quản: Nơi khô mát. Tránh nắng nóng và nguồn nhiệt.



Đối tượng sử dụng: Mọi người bao gồm cả trẻ em > 6 tháng tuổi (đặc biệt những làn da nhạy cảm)



--------------------------------

- Thương hiệu: Cỏ Mềm

- Xuất xứ thương hiệu: Việt Nam

- Sản xuất tại: Việt Nam', 1, 4, CAST(N'2025-03-15T22:49:51.250' AS DateTime), CAST(N'2025-03-15T22:49:51.250' AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [image], [price], [description], [cid], [sub_id], [created_at], [updated_at]) VALUES (28, N'Kem chống nắng SCINIC enjoy foundation skip tone up SPF50 + PA + + + + 50g SCINIC enjoy foundation skip tone up suncream', N'https://down-vn.img.susercontent.com/file/sg-11134207-7rcd7-ls17nm7oppqv5a@resize_w900_nl.webp', 132000.0000, N'Kem nền SCINIC Enjoy Skip Tone Up Sunscreen SPF 50 + PA + + + + 50g

Mỹ phẩm ba chức năng chống tia cực tím, làm trắng và cải thiện nếp nhăn

Kem chống nắng nâng tông tự nhiên giúp làn da của bạn trông đẹp tự nhiên mà không có bất kỳ vết thâm nào

Khả năng chống tia cực tím là nhất định, với tông màu be tự nhiên cho hiệu ứng điều chỉnh tông màu da và kết cấu



Kem chống nắng Moist Tone Up

Giàu độ ẩm, với tông màu be tự nhiên

Nâng tông phù hợp với da

Kem chống nắng nâng tông bám chặt vào da như của bạn



100% vegan ĐẸP

Được chứng nhận thuần chay EVE, không bao gồm các thành phần có nguồn gốc động vật



Cảm thấy nhẹ nhàng trên da như thể không áp dụng

Nâng tông tự nhiên với hiệu ứng hiệu chỉnh kết cấu mượt mà



Dưỡng ẩm và kết dính mỏng để lên tông màu be hồng đào tự nhiên



Phù hợp với màu da của tôi

Bỏ qua kem nền để tự chăm sóc nâng tông độ ẩm



Bảo tồn độ trong suốt tự nhiên của da

Hoàn thành nhẹ nhàng mà không cần kem nền

Nâng tông tự nhiên đạt được trong một lớp duy nhất



Khả năng chống tia cực tím đáng tin cậy được xác nhận thông qua các thử nghiệm ứng dụng của con người

', 1, 4, CAST(N'2025-03-15T22:49:51.250' AS DateTime), CAST(N'2025-03-15T22:49:51.250' AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [image], [price], [description], [cid], [sub_id], [created_at], [updated_at]) VALUES (29, N'Sữa chống nắng phổ rộng mỏng nhẹ bảo vệ da và dưỡng sáng mờ thâm nám ', N'https://down-vn.img.susercontent.com/file/vn-11134201-7ra0g-m7bmw4fb0cxi8e@resize_w900_nl.webp', 292000.0000, N'ƯU ĐIỂM NỔI BẬT 

Được kiểm nghiệm và chứng minh hiệu quả trên da châu Á

Không bóng nhờn

Không nhờn rít

Không gây bít tắt lỗ chân lông

Phù hợp cho da nhạy cảm



HIỆU QUẢ SỬ DỤNG  

Trong 12 tuần sử dụng:

Giảm 53% thâm nám và đốm nâu

Tăng 45% da đều màu và rạng rỡ hơn

Giảm 90% Thâm mụn và nám khi kết hợp sử dụng cùng Serum Glycolic Melasyl 8%

Kiêm nghiệm lâm sàng trên 78 phụ nữ sử dụng sản phẩm trong 12 tuần

HƯỚNG DẪN SỬ DỤNG 

Dùng 1 lượng kem vừa đủ và chia đều trên mặt và cổ, sau đó thoa đều nhẹ nhàng khắp mặt và cổ. 

Sử dụng vào ban ngày, trước khi ra nắng 30 phút, sau các bước dưỡng da thông thường, và trước các bước trang điểm tiếp theo (nếu có).

Hiệu quả hơn khi kết hợp sử dụng với Serum Glycolic Melasyl 8% [Melasyl+Glycolic+Niacinamide] để dưỡng sáng và mờ thâm nám.

HƯỚNG DẪN BẢO QUẢN

Bảo quản nơi khô ráo, thoáng mát, tránh ánh nắng trực tiếp hoặc nơi có nhiệt độ cao / ẩm ướt.

THÔNG TIN THƯƠNG HIỆU 

Hơn 100 năm thành lập, L’Oréal là tập đoàn chuyên về mỹ phẩm và chăm sóc sắc đẹp lớn nhất thế giới. L’Oréal Paris đã có mặt tại hơn 120 quốc gia với các dòng sản phẩm về chăm sóc tóc, chăm sóc da và trang điểm dành cho đại chúng', 1, 4, CAST(N'2025-03-15T22:49:51.250' AS DateTime), CAST(N'2025-03-15T22:49:51.250' AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [image], [price], [description], [cid], [sub_id], [created_at], [updated_at]) VALUES (30, N'Scinic Enjoy Kem Chống Nắng Dòng SPF 50+PA++++ SCINICEnjoy sunscreens', N'https://down-vn.img.susercontent.com/file/sg-11134207-7rep8-m2g4n380p7li2e@resize_w900_nl.webp', 195000.0000, N'Thưởng THỨC SUPER MILD SUN ESSENCE SPF 50% / PA + + + +



Kiểm tra cải thiện độ bám của lớp trang điểm đã hoàn thành



Đã hoàn thành thử nghiệm duy trì độ ẩm trong 8 giờ



Nếu bạn đang tìm kiếm một loại kem chống nắng cung cấp lớp nền dưỡng ẩm và mịn màng cho da

“Không còn kem chống nắng dễ bị mòn!



Tự tin trước mặt trời

Phun sương ẩm hấp thụ nhanh chóng!

"Khóa ẩm #sun Tinh chất giúp tăng tuổi thọ lớp trang điểm. "



"Giảm bóng và tăng độ ẩm để có vẻ ngoài ngậm nước hơn."

Kem chống nắng dưỡng ẩm đáng tin cậy và đáng tin cậy. "



"Giữ ẩm 8 giờ."

Khả năng tương thích trang điểm là tốt.

Ứng dụng mượt mà.



Bảo vệ đồng thời chống lại tia UV và khô da. "

Kem chống nắng dưỡng ẩm và mịn màng. "

Phun sương giữ ẩm cho da trong 8 giờ đồng thời ngăn chặn tia UV.', 1, 4, CAST(N'2025-03-15T22:49:51.250' AS DateTime), CAST(N'2025-03-15T22:49:51.250' AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [image], [price], [description], [cid], [sub_id], [created_at], [updated_at]) VALUES (31, N'[Torriden Chính hãng] Kem chống nắng nâng tone da BALANCEFUL CICA với SPF 50+ PA++++, 60ml, Sun Cream', N'https://down-vn.img.susercontent.com/file/sg-11134207-7rfhf-m4eh21pxt2qj4b@resize_w900_nl.webp', 385000.0000, N'Kem chống nắng rau má nâng tông BALANCEFUL,

đánh bay nỗi lo về tia UV, tận hưởng ánh nắng mặt trời.



🟢 Đặc điểm chính

🍀 Kem chống nắng nâng tông da chống nắng 3 trong 1!

🍀 Điều chỉnh những vết mẩn đỏ trong thư

🍀 Chống nắng mạnh mẽ nhờ thành phần SPF50+, PA++++

🍀 Dành cho làn da nhạy cãm quanh năm 



🟢 Dành cho da

Còn sản phẩm chống tia UV, sản phẩm chống nhăn và sáng trắng làn da



🟢 Hiệu quả

🍀Thành phần 5D CICA

🍀Hiệu chỉnh tông da màu xanh

🍀An toàn cho cả làn dạy nhảm



🟢 Hướng dẫn sử dụng

Bước 1. Sau các bước dưỡng da, thoa một lượng kem vừa đủ lên vùng da dễ bị bắt nắng như trán, sóng mũi, quanh mắt, gò má trước

Bước 2. Vỗ nhẹ nhàng để kem hấp thụ đều vào da



🟢 Mẹo khi dùng!

🍀 Giải pháp hàng ngày giúp hiệu chỉnh tông màu da tự nhiên

🍀 Có thể dùng để thay kem lót trang điểm (Không cần dùng Foundation)

🍀 Nên dùng ở bước cuối cùng của quy trình dưỡng da và trước khi đánh kem nền foundation

', 1, 4, CAST(N'2025-03-15T22:49:51.250' AS DateTime), CAST(N'2025-03-15T22:49:51.250' AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [image], [price], [description], [cid], [sub_id], [created_at], [updated_at]) VALUES (32, N'Kem chống nắng hoa anh đào sử dụng cho mặt và toàn thân LAIKOU Sakura chống thấm nước SPF50 PA+++ 50g', N'https://down-vn.img.susercontent.com/file/vn-11134207-7ras8-m1xq689frtmnfb@resize_w900_nl.webp', 110000.0000, N'Kem chống nắng toàn thân LAIKOU Sakura chống thấm nước SPF50 PA+++50g

Thời hạn sử dụng: 3 năm
Thành phần chính: Chiết xuất hoa Prunus Lannesiana
Công dụng:
-Bảo vệ da khỏi tác hại của ánh sáng mặt trời
-Chặn các tia cực tím
-Chụp lại UVA & UVB
-Bảo vệ da khỏi môi trường ô nhiễm

Cách sử dụng:
Thoa đều một lượng kem chống nắng thích hợp lên mặt, cổ, cánh tay và chân trước khi trang điểm hoặc đi ra ngoài, mát xa nhẹ nhàng cho đến khi nó được hấp thụ.
Bảo quản: Để tránh tiếp xúc trực tiếp với ánh nắng mặt trời, vui lòng bảo quản sản phẩm ở nơi khô ráo, thoáng mát.
Thận trọng: Da nhạy cảm nên được thử trên da tay trước khi sử dụng. Nếu bạn cảm thấy không thoải mái, hãy ngừng sử dụng ngay lập tức', 1, 4, CAST(N'2025-03-15T22:49:51.250' AS DateTime), CAST(N'2025-03-15T22:49:51.250' AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [image], [price], [description], [cid], [sub_id], [created_at], [updated_at]) VALUES (33, N'Sữa tắm Susoft hương nước hoa Light Wishes, Golden Night, Sweet Love 800ml', N'https://down-vn.img.susercontent.com/file/vn-11134207-7ra0g-m7b1uchtvtkmc0@resize_w900_nl.webp', 127000.0000, N'🌵 THÔNG TIN SẢN PHẨM

- Thương hiệu: Susoft

- Dung tích: 800ml

- Hạn sử dụng: 3 năm từ ngày sản xuất

- Ngày sản xuất: xem trên bao bì

- Xuất xứ: Việt Nam', 2, 5, CAST(N'2025-03-15T22:50:02.333' AS DateTime), CAST(N'2025-03-15T22:50:02.333' AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [image], [price], [description], [cid], [sub_id], [created_at], [updated_at]) VALUES (34, N'Sữa tắm dưỡng trắng cánh hoa hồng Damask Weilaiya Shower Gel làm sạch và sáng da toàn thân 450ml', N'https://down-vn.img.susercontent.com/file/vn-11134207-7ra0g-m79a9woamm0s28@resize_w900_nl.webp', 364000.0000, N'CÔNG DỤNG SỮA TẮM TRẮNG DA CÁNH HOA HỒNG DAMASK WEILAIYA

- Sữa tắm trắng da Weilaiya với công nghệ độc quyền bảo quản cánh hoa hồng tươi Damask từ Bulgaria cùng 3 tầng hương nước hoa, giống mùi hương Elie Saab.

- Sữa tắm dưỡng da hoa hồng Damask Weilaiya có kết cấu thẩm thấu sâu, dưỡng ẩm cho làn da căng mướt, mịn màng, thúc đẩy da sản sinh collagen giúp da trắng hồng tự nhiên.

- Sữa tắm dưỡng trắng toàn thân Weilaiya phù hợp cho mọi loại da, kể cả da nhạy cảm

', 2, 5, CAST(N'2025-03-15T22:50:02.333' AS DateTime), CAST(N'2025-03-15T22:50:02.333' AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [image], [price], [description], [cid], [sub_id], [created_at], [updated_at]) VALUES (35, N'Sữa tắm trắng da dưỡng ẩm tẩy da chết GRACE AND GLOW Body Wash 400ml', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lladyx2o1igmec@resize_w900_nl.webp', 95000.0000, N'1. Sữa tắm hương nước hoa Grace and Glow dưỡng ẩm sáng da Black Opium  

Sữa tắm với hương thơm sang trọng của nước hoa Black Opium được bảo chế như một loại xà phòng tắm có thể làm sáng da, cho da mềm mại và ẩm mượt hơn.



Thành phần gồm có:

Niacinamide

Làm sáng da toàn thân

Duy trì độ ẩm cho da cơ thể

Làm sáng da tăng sắc tố

Ngăn ngừa mụn trên cơ thể

Bảo vệ cơ thể khỏi ô nhiễm, ánh nắng và độc tố



Glutathione

Có chức năng như một tác nhân làm sáng da toàn thân

Cải thiện độ đàn hồi của da', 2, 5, CAST(N'2025-03-15T22:50:02.333' AS DateTime), CAST(N'2025-03-15T22:50:02.333' AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [image], [price], [description], [cid], [sub_id], [created_at], [updated_at]) VALUES (36, N'Combo dưỡng trắng da body sữa tắm, sữa dưỡng thể Five Grains Niacinamide, Alpha-Arbutin 500ml', N'https://down-vn.img.susercontent.com/file/vn-11134207-7ra0g-m6q9m4svt8pkd7@resize_w900_nl.webp', 229000.0000, N'*SỮA TẮM DƯỠNG TRẮNG NIACINAMIDE 500ML

Dung tích 500ml

Công dụng: 

- Dưỡng ẩm, làm sạch

- Nuôi dưỡng làn da trắng sáng tự nhiên 

- Hương thơm dễ chịu bền lâu

Lớp bọt tinh tế đáp ứng hương thơm làm đẹp, mang lại làn da ẩm mượt và làm sạch; chứa nhiều tinh chất dưỡng da chiết xuất từ ​​thực vật, nhẹ nhàng làm sạch da và tỏa hương thơm dễ chịu sau khi tắm. Chứa công thức Bio Active được chiết xuất từ 9 thành phần thiên nhiên an toàn, lành tính cho mọi làn da.

Sữa tắm không dùng cho trẻ sơ sinh.

Hướng dẫn sử dụng: Cho sữa tắm vào lòng bàn tay hoặc bông tắm, tạo bọt rồi mát-xa đều khắp cơ thể. Sau đó tắm lại với nước sạch.

Xuất xứ: P.R.C

Dung tích: 500ml

', 2, 5, CAST(N'2025-03-15T22:50:02.333' AS DateTime), CAST(N'2025-03-15T22:50:02.333' AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [image], [price], [description], [cid], [sub_id], [created_at], [updated_at]) VALUES (37, N'Sữa Tắm Dược Liệu Lherbs Hương Thư Giãn Giúp Dưỡng Ẩm, Mềm Mại Da, Sạch Bã Nhờn Và Cải Thiện Mụn', N'https://down-vn.img.susercontent.com/file/vn-11134207-7ras8-m0wrzlaugdv1af@resize_w900_nl.webp', 75000.0000, N'CÔNG DỤNG

- Làm sạch da và bã nhờn.

- Các chiết xuất thảo mộc giúp dưỡng ẩm da, giúp da mềm mại, hồng hào tươi nhuận.

- Gel tắm thảo mộc an toàn giúp cải thiện các vấn đề về da như rôm sảy, mẩn ngứa, trứng cá trên cơ thể và làm dịu các vết côn trùng cắn.

- Hương thư giãn với thành phần chủ yếu của hương liệu tự nhiên và tinh dầu thiên nhiên sẽ đem lại sự thư giãn, thoải mái.



HƯỚNG DẪN SỬ DỤNG

- Cho một lượng vừa đủ sản phẩm ra tay hoặc bông tắm -> làm ướt và chà xát tạo bọt trước khi massage đều khắp cơ thể.

- Xả sạch bằng nước ấm.

- Xả lần cuối với nước mát hơn để da săn chắc. m|n màng. Có thể sử dụng hằng ngày.', 2, 5, CAST(N'2025-03-15T22:50:02.333' AS DateTime), CAST(N'2025-03-15T22:50:02.333' AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [image], [price], [description], [cid], [sub_id], [created_at], [updated_at]) VALUES (38, N'Sữa tắm dưỡng da thiên nhiên Enchanteur Naturelle hương hoa Lavender/ Iris/ Rose 510g - Live', N'https://down-vn.img.susercontent.com/file/sg-11134201-7rd51-m6rn7rbq5v2qea@resize_w900_nl.webp', 145000.0000, N'SẢN PHẨM VỚI CÁC THÀNH PHẦN VÀ CÔNG DỤNG:

- Sữa tắm dưỡng da Enchanteur Naturelle hương hoa Lavender/ Iris 510gr ứng dụng công nghệ Micellar đầu tiên tại Việt Nam, thanh lọc da dịu nhẹ, giúp mật ong thấm sâu nuôi dưỡng da tốt hơn.

- Thành phần mật ong Acacia thiên nhiên từ Pháp giúp nuôi dưỡng làn da, tăng cường độ ẩm.

- Hương hoa lavender từ Pháp mang lại cảm giác thư giãn tuyệt vời.

- 0% Paraben, Silicone.', 2, 5, CAST(N'2025-03-15T22:50:02.333' AS DateTime), CAST(N'2025-03-15T22:50:02.333' AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [image], [price], [description], [cid], [sub_id], [created_at], [updated_at]) VALUES (39, N'Sữa Tắm LASHE SUPERFOOD Dưỡng Da Sáng Mịn / Dưỡng Ẩm Chuyên Sâu / Dưỡng Da Tươi Trẻ / Dưỡng Da Căng Bóng 610G', N'https://down-vn.img.susercontent.com/file/vn-11134201-7ra0g-m795p0hfiwl2dc@resize_w900_nl.webp', 142000.0000, N'1. Sữa tắm Lashe Superfood Dưỡng Da Sáng Mịn chứa Niacinamide và chiết xuất Kỷ Tử, Dầu Hạnh Nhân 610g

Tác động môi trường như thời tiết, ánh nắng, khói bụi...khiến da trở nên khô sạm, xỉn màu. LASHE SUPERFOOD cung cấp dưỡng chất cho da khi tắm với chiết xuất từ nguyên liệu tự nhiên, bổ sung NIACINAMIDE và công nghệ X-VITA, giúp dưỡng da hiệu quả, cho da sáng mịn đầy sức sống.

ĐẶC ĐIỂM NỔI BẬT

- Chứa NIACINAMIDE được biết giúp dưỡng sáng da hiệu quả, đều màu da.

- Thành phần từ SUPERFOOD: chiết xuất Kỷ Tử giàu Vitamin C và Dầu Hạnh Nhân giàu Vitamin E

+ Vitamin C: hạn chế sự chuyển hóa melanin, giúp dưỡng sáng da

+ Vitamin E: giúp cải thiện tính đàn hồi của da, giúp da mịn màng. 

- Công nghệ X-VITA chuyên biệt cho da.

Cung cấp dưỡng chất cho da mịn màng ngời sáng, xóa tan nỗi lo da xỉn màu.

HIỆU QUẢ SỬ DỤNG

- 3x sức mạnh sáng da

**Với 3 thành phần sáng da

', 2, 5, CAST(N'2025-03-15T22:50:02.333' AS DateTime), CAST(N'2025-03-15T22:50:02.333' AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [image], [price], [description], [cid], [sub_id], [created_at], [updated_at]) VALUES (40, N'Sữa tắm dưỡng da nước hoa cao cấp Vi Jully thơm và dưỡng da mềm mịn', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-ly3x45h3jjyb55@resize_w900_nl.webp', 120000.0000, N'“Hạnh phúc tỏa ra như hương thơm của hoa và mang những điều tốt đẹp cho bạn!”



Xuất phát từ góc nhìn đó, VIJULLY đã tích cực tìm kiếm và phát triển dòng sản phẩm mới với mong muốn mang đến cho khách hàng “mùi hương của hạnh phúc” - để khi đầu mũi của bạn chạm vào hương thơm, cơ thể sẽ từ từ được thả lỏng, thư giãn và đắm chìm trong mùi hương nhẹ nhàng ấy.



BST Sữa tắm nước hoa Heureux by VIJULLY là dòng sản phẩm được nghiên cứu kỹ lưỡng, cẩn thận dựa trên cơ địa của người Châu Á nói chung và Việt Nam nói riêng. Phù hợp với thời tiết nhiệt đới, với những nốt hương nước hoa từ dịu dàng, thanh mát đến nồng ấm và thích hợp với mọi lứa tuổi.



Bên cạnh đó, BST Sữa tắm nước hoa Heureux by VIJULLY còn chứa các thành phần lành tính từ thiên nhiên như: chiết xuất dâu tằm, tảo biển, tảo nâu, táo, nho, dầu hoa hướng dương,... cùng điều kiện tiên quyết là nói KHÔNG với: #Silicon, #Paraben, #Cồn - tất cả cộng hưởng cho ra đời một sản phẩm: An toàn - Lành tính - Chất lượng. Ngoài việc làm sạch, BST Sữa tắm nước hoa Heureux by VIJULLY còn giúp tăng cường hàng rào giữ ẩm cho da, tẩy tế bào chết nhẹ nhàng và làm săn chắc da,...', 2, 5, CAST(N'2025-03-15T22:50:02.333' AS DateTime), CAST(N'2025-03-15T22:50:02.333' AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [image], [price], [description], [cid], [sub_id], [created_at], [updated_at]) VALUES (41, N'Tẩy Tế Bào Chết Body Scrub Cà Phê Organic - Mắc Ca 235g MACALAND Dưỡng Ẩm, Chăm Da Sáng Mịn', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lzadrrca51l920@resize_w900_nl.webp', 209000.0000, N'Macaland là thương hiệu mỹ phẩm Việt đang trên hành trình ứng dụng Dầu Mắc Ca cùng các thành phần thiên nhiên từ nguồn nông sản Việt, kết hợp quy trình sản xuất công nghệ tiến tiến vào các sản phẩm phục hồi hư tổn.
Lần này, Macaland triển khai khai thác vùng nguyên liệu Cà phê đạt chuẩn Organic ứng dụng vào mỹ phẩm. Tẩy tế bào chết toàn thân kết hợp từ Bột Mắc Ca, Dầu Mắc Ca và Cà Phê Organic với hy vọng lan tỏa nhận thức về ưu điểm của mỹ phẩm organic. Đồng thời sản phẩm giúp nông dân địa phương gia tăng thu nhập và thúc đẩy chuyển đổi nông nghiệp bền vững.', 2, 6, CAST(N'2025-03-15T22:50:29.570' AS DateTime), CAST(N'2025-03-15T22:50:29.570' AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [image], [price], [description], [cid], [sub_id], [created_at], [updated_at]) VALUES (42, N'Tẩy tế bào chết toàn thân Lelnia Aloe Tẩy tế bào chết Làm sạch sâu', N'https://down-vn.img.susercontent.com/file/sg-11134201-7ra0i-m581cqvcmfzfb1@resize_w900_nl.webp', 27000.0000, N'1. Tẩy da chết nhẹ nhàng, không có hạt để ngăn ngừa làm sạch quá mức
2. Nhẹ nhàng làm tan lớp biểu bì cũ mà không làm tổn thương da
3. Kết cấu Gel làm mới, tan chảy ngay khi bạn thoa và không nhờn
4. Làm sạch và làm sáng da, hút bụi bẩn trong lỗ chân lông và thúc đẩy sự hấp thụ của các sản phẩm chăm sóc da sau đó.
5. Làm sạch lớp biểu bì lão hóa và loại bỏ bụi bẩn và dầu thừa
6. Cải thiện làn da thô ráp, làm mềm và dưỡng ẩm, bổ sung và khóa ẩm, giúp da sạch và ẩm.', 2, 6, CAST(N'2025-03-15T22:50:29.570' AS DateTime), CAST(N'2025-03-15T22:50:29.570' AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [image], [price], [description], [cid], [sub_id], [created_at], [updated_at]) VALUES (43, N'Tẩy da chết cơ thể cà phê Đắk Lắk Cocoon cho làn da mềm mại và rạng rỡ 200ml Coffee Body Polish', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-ltrigxkjo4qy27@resize_w900_nl.webp', 90000.0000, N'Cơ thể chúng ta hằng ngày vẫn đang đào thải hàng tỉ tế bào chết, chúng được lưu lại trên da, kết thành mảng cùng bụi bẩn, gây bít tắc lỗ chân lông, có thể khiến da nổi mụn. Vậy việc loại bỏ những lớp da chết ấy là điều cần thiết khi chăm sóc da.

Thành phần chính
Cà phê Đăk Lăk
Cà phê có tác dụng chống oxi hóa, Caffein trong bã cà phê có tác dụng lưu thông máu, ngăn chặn quá trình lão hóa. 

Bơ ca cao
Có khả năng giữ ẩm tuyệt vời, chống những vết rạn, làm mềm da khô và chống nhăn da.

Công dụng
• Làm bỏ da chết toàn thân

• Mang lại làn da mịn màng ngay sau khi sử dụng

• Giúp da sáng mịn, đều màu.


Ưu điểm
• Không sử dụng vi hạt nhựa

Thành phần đầy đủ
Aqua/Water, Coffea Arabica (coffee) Seed Powder, Cetearyl Alcohol, Cocos Nucifera (coconut) Oil, Cocamidopropyl Betaine, Glyceryl Stearate, C15-19 Alkane, Glycerin, Ceteareth-20, Ceteareth-12, Theobroma Cacao (Cocoa) Seed Butter, Butyrospermum Parkii (shea) butter, Cetyl Palmitate, Glycine Soja (soybean) Sterols, Phospholipids, Crosspolymer, Tocopheryl Acetate, Xanthan gum, Phenoxyethanol, Sodium Hydroxide, BHT, Ethylhexylglycerin, Trisodium Ethylenediamine Disuccinate.
 
Hướng dẫn sử dụng
Thoa một lượng sản phẩm lên da ướt. Mát-xa nhẹ nhàng từ cổ đến chân, sau đó tắm sạch lại với nước. Dùng 2-3 lần một tuần để đạt kết quả tốt nhất.

Xuất xứ: Việt Nam
Dung tích: 200ml
Hạn sử dụng: 3 năm kể từ NSX', 2, 6, CAST(N'2025-03-15T22:50:29.570' AS DateTime), CAST(N'2025-03-15T22:50:29.570' AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [image], [price], [description], [cid], [sub_id], [created_at], [updated_at]) VALUES (44, N' Tẩy Tế Bào Chết Da Đầu Rootoo Giảm Gàu Nhờn Kháng Nấm Ngừa Bết Rụng Tóc (150g/300g)', N'https://down-vn.img.susercontent.com/file/vn-11134207-7ra0g-m76a3lq6yfdk7f@resize_w900_nl.webp', 124000.0000, N'[LƯU Ý 1: QUÀ TẶNG ÁP DỤNG CHO ĐƠN HÀNG MUA PHÂN LOẠI 150G/300G, PHÂN LOẠI 50G ĐỂ KHÁCH MUA TRẢI NGHIỆM THỬ SP]

[LƯU Ý 2: QUÝ KHÁCH VUI LÒNG CHECK KỸ GIỎ HÀNG, THÊM QUÀ TẶNG TRƯỚC KHI CHỐT ĐƠN]

Tẩy Tế Bào Chết Da Đầu với sự kết hợp tinh tế từ các loại dầu và tinh dầu tự nhiên như: Dầu jojoba, Dầu macca, Dầu argan, Tinh dầu hoa bưởi, Tinh dầu chanh sần, Tinh dầu bạc hà,...cùng các chiết xuất thảo dược như: Chiết xuất cỏ mần trầu, Chiết xuất cà phê, Chiết xuất gừng,... giúp làm sạch sâu và loại bỏ các tạp chất trên da đầu. Đồng thời bảo vệ da đầu một cách hiệu quả, giúp cân bằng độ pH trên da đầu, thúc đẩy sự phục hồi và nâng cao hiệu quả của các sản phẩm chăm sóc tóc khác.



1. THÔNG TIN SẢN PHẨM:

- Tên sản phẩm: Tẩy Tế Bào Chết Da Đầu Rootoo Thao Dược (BEST SELLER - ĐỘC QUYỀN)

- Dạng sản phẩm: dạng hũ có nắp vặn tiện lợi

- Mùi hương: hương thơm dịu nhẹ với mùi thảo dược tự nhiên

- Khối lượng: 150g/300g

- Loại da đầu phù hợp: da đầu gàu và dầu nhờn

- Hạn sử dụng: 2 năm kể từ ngày sản xuất - 1 năm kể từ ngày mở nắp', 2, 6, CAST(N'2025-03-15T22:50:29.570' AS DateTime), CAST(N'2025-03-15T22:50:29.570' AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [image], [price], [description], [cid], [sub_id], [created_at], [updated_at]) VALUES (45, N'Tẩy tế bào chết muối hồng Himalaya Eumony làm sạch sâu, dưỡng ẩm, sáng da đều màu, hương nước hoa', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-ltufo52lijnub7@resize_w900_nl.webp', 139000.0000, N'

Trong quy trình chăm sóc da hàng ngày, việc tẩy tế bào chết không chỉ đơn thuần là một bước, mà là trọng điểm quan trọng giữa việc giữ cho làn da của bạn sạch sẽ và làm mới nó. Là bí quyết không thể thiếu để giữ cho làn da luôn trẻ trung, rạng rỡ và đầy sức sống.



Hãy khám phá sản phẩm Tẩy tế bào chết muối hồng Himalaya SoftSmooth Body Srub Eumony hương nước hoa - một giải pháp hiệu quả và an toàn để giúp làn da của bạn thở phấn khích và tràn đầy sức sống mỗi ngày.



THÔNG TIN SẢN PHẨM:

- Tên sản phẩm: Tẩy tế bào chết muối hồng Himalaya SoftSmooth Body Srub Eumony hương nước hoa

- Dung tích: 300g

- Hạn sử dụng: 36 tháng

- Sản xuất tại: Việt Nam



CÔNG DỤNG:

- Tẩy tế bào chết cơ thể giúp làm sạch nhẹ nhàng cho da, làm sạch tế bào da chết, làm sạch bụi bẩn bã nhờn trên da, hỗ trợ giảm mụn lưng, dưỡng ẩm da, giúp da mềm mại và mịn màng.', 2, 6, CAST(N'2025-03-15T22:50:29.570' AS DateTime), CAST(N'2025-03-15T22:50:29.570' AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [image], [price], [description], [cid], [sub_id], [created_at], [updated_at]) VALUES (46, N'Tẩy tế bào chết body - Cám Gạo làm sáng da, dưỡng ẩm, ngăn ngừa lão hóa SHSO Beauty 200g - NPC PHAR', N'https://down-vn.img.susercontent.com/file/vn-11134207-7ras8-m4poqkp0ee7k1a@resize_w900_nl.webp', 92500.0000, N'“Cám gạo” có kết cấu hạt siêu mịn giúp tẩy sạch tế bào chết trên da một cách nhẹ nhàng, dưỡng ẩm sâu và mang lại cho bạn làn da sáng mịn ngay lần đầu sử dụng mà không gây tổn thương hay bào mòn da.



I. THÔNG TIN SẢN PHẨM:

- Thành phần chính: Dầu cám gạo, Niacinamide (vitamin B3), Vitamin B5, Muối biển, Đường non Hàn Quốc, Vitamin E,Tế bào gốc từ lá Tía tô

- Dung tích: 250 gram

- Mùi hương: gạo tinh khiết từ thiên nhiên

- Hạn dùng: 3 năm. Mở nắp: 9 tháng



II. ĐẶC ĐIỂM NỔI BẬT:

- Sản phẩm được sản xuất theo công nghệ "Water Less" không sử dụng nước nên mỗi khách hàng sử dụng sản phẩm là đang chung tay góp phần bảo vệ môi trường và bảo vệ trái đất
III. CÔNG DỤNG:

- Giúp dễ dàng lấy đi tế bào chết trên da. thông thoáng lỗ chân lông. 

- Làm sạch lỗ chân lông, ngăn ngừa viêm tắc, giảm mụn lưng đem lại làn da sáng khỏe, mịn mượt phù hợp với với những ai đang bị tình trạng viêm tắc nang lông.

- Bổ sung các dưỡng chất cho da, tái tạo da và xóa mờ vết thâm

- Giúp ngăn chặn tình trạng da sần vỏ cam trên cơ thể.

- Hỗ trợ làm sạch mụn lưng, mụn mông, viêm lỗ chân lông

- Tăng cường khả năng giữ ẩm da, làm mềm da, giúp ngăn ngừa các dấu hiệu lão hóa cho làn da luôn sáng mịn đều màu và tươi trẻ.', 2, 6, CAST(N'2025-03-15T22:50:29.570' AS DateTime), CAST(N'2025-03-15T22:50:29.570' AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [image], [price], [description], [cid], [sub_id], [created_at], [updated_at]) VALUES (47, N'Tẩy da chết Body Bơ Tươi BESILKI 3in1 sáng mịn, ẩm mượt 170ml, 280ml', N'https://down-vn.img.susercontent.com/file/vn-11134201-7ra0g-m79amlhw5vlf66@resize_w900_nl.webp', 113000.0000, N'Tẩy tế bào chết Besilki từ chiết xuất quả Bơ giàu các loại dầu tự nhiên, các loại Vitamin E & C giúp tăng cường độ ẩm, tái tạo da, cho da sáng mịn và ẩm mượt tức thì.

Công nghệ siêu thẩm thấu Niosome đưa vitamin C thẩm thấu sâu vào các tầng biểu bì, mang lại hiệu quả sáng da gấp 10 lần (*).

(*) so với vitamin C thông thường

Bổ sung ngay sản phẩm vào chu trình chăm sóc để có làn da sáng chuẩn Spa tại nhà.



Kết Hợp Tắm - Tẩy - Dưỡng trong 1 lần tẩy da chết:

Làm sạch thay sữa tắm: Loại bỏ bụi bẩn, bã nhờn trên bề mặt da, không cần tốn nhiều bước.

Tẩy tế bào chết: Công thức đặc biệt kết hợp Bơ nghiền nguyên trái và hạt tẩy thiên nhiên nghiền mịn giúp loại bỏ tế bào chết nhẹ nhàng, cấp nước và siêu dưỡng ẩm, cho da mềm mướt, căng mịn.



Dưỡng da sáng mịn: Vitamin C với công nghệ Niosome, hiệu quả sáng da gấp 10 lần (*).



Giải pháp tẩy da chết hiệu quả cho:

Da khô bong tróc, thiếu nước, thiếu ẩm. 

Da sần sùi, thô ráp, tích tụ nhiều da chết.', 2, 6, CAST(N'2025-03-15T22:50:29.570' AS DateTime), CAST(N'2025-03-15T22:50:29.570' AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [image], [price], [description], [cid], [sub_id], [created_at], [updated_at]) VALUES (48, N'Tẩy tế bào chết toàn thân sáng da B3 BRIGHTENING SCRUB Grace and Glow 220g', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lzaawhsmbhcx92@resize_w900_nl.webp', 122000.0000, N'Tẩy tế bào chết toàn thân sáng da B3 BRIGHTENING SCRUB Grace and Glow 220g

1. Tẩy tế bào chết toàn thân bằng texture đất sét có mùi hương nước hoa Black Opium

2. Chứa AHA và Niacinamide

3. Có chứa các hạt scrub dễ dàng lấy đi tế bào chết



Công dụng:

1. Làm sạch cơ thể

2. Lấy đi tế bào da chết

3. Làm sáng da



CÁCH SỬ DỤNG

Lấy một lượng sản phẩm vừa đủ lên da khô hoặc ẩm. Massage nhẹ nhàng theo chuyển động tròn, đợi cho đến khi khô một nửa rồi chà nhẹ cho đến khi bụi bẩn được loại bỏ. Rửa sạch bằng nước. 



THÀNH PHẦN CHÍNH

1. AHA

2. Niacinamide

Thành phần:

Nước, glycerin, dextrin, kaolin, caprylic/capric triglyceride, glyceryl stearate, niacinamide, propanediol, disteardimonium hectorite, CI 77891, PEG-100 stearate, glyceryl stearate, hương liệu, phenoxyethanol, triethanolamine, cellulose, methylparaben, niacinamide, ethylhexylglycerin, triethoxycaprylylsilane, alumina, axit glycolic, axit ascorbic, glutathione, CI 73360, CI 77007.



Khối lượng tịnh: 220gr', 2, 6, CAST(N'2025-03-15T22:50:29.570' AS DateTime), CAST(N'2025-03-15T22:50:29.570' AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [image], [price], [description], [cid], [sub_id], [created_at], [updated_at]) VALUES (49, N'Tinh chất làm dịu thuần chay cô đặc Beyond Angel Deep Moisture Calming Ampoule 50ml', N'https://down-vn.img.susercontent.com/file/vn-11134201-7ras8-m1o0ayqn361f81@resize_w900_nl.webp', 250000.0000, N'THÔNG TIN SẢN PHẨM

Đặc điểm nổi bật và thành phần

1. Dưỡng ẩm và làm dịu da

- Tri-sap Complex TM: Phức hợp nhựa cây chiết xuất từ bạch dương + tre + nho giàu acid amin và khoáng chất. Giúp tăng cường hàng rào độ ẩm cho da

- True Eco Complex TM: Phức hợp 3 thành phần hữu cơ 100% không th.u.ố.c t.r.ừ s.â.u ( trà xanh Hàn Quốc + lá neem Ấn Độ + thanh hoa hoa vàng USA) có hiệu quả gấp 3 lần panthenol. Giúp cấp ẩm, làm dịu da

- 5 loại HA vegan: tạo màng ẩm bên ngoài và cấp ẩm bên trong ( micro)

- Panthenol: tiền vitamin B5 hoạt động như chất dưỡng ẩm tự nhiên cũng có hàng rào bảo vệ da giúp bảo vệ độ ẩm và làm dịu da

2. T/ă/n/g c/ư/ờ/n/g làm dịu da: Relief CICA Complex TM

- Chiết xuất cây Nga Sâm từ đảo Ulleung HQ có hiệu quả làm dịu da m/ạ/n/h m/ẽ, dư/ỡ/ng ẩ/m và săn chắc

- Madecassoside ( chiết xuất rau má/ cica) giúp gia tăng bảo vệ, thúc đẩy tổng hợp collagen, tăng đàn hồi. Đồng thời làm dịu da bị k/í/c/h ứ/n/g bởi các yếu tố có hại bên ngoài', 2, 7, CAST(N'2025-03-15T22:51:03.703' AS DateTime), CAST(N'2025-03-15T22:51:03.703' AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [image], [price], [description], [cid], [sub_id], [created_at], [updated_at]) VALUES (50, N'Tinh chất dưỡng trắng da 9 Wishes Miracle White Ampule Serum 25ml', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lwsavdppm28r60@resize_w900_nl.webp', 228000.0000, N'Tinh chất dưỡng trắng da 9 Wishes Miracle White Ampule Serum 25ml là một dạng tinh chất dưỡng trắng da cô đặc đến từ hãng mỹ phẩm 9 Wishes. Sản phẩm với kết cấu nhẹ, dễ dàng thấm sâu vào da, nuôi dưỡng, phục hồi làn da mệt mỏi, xạm đen vì nắng và các tia UV. Với thành phần gồm các thành phần mang lại hiệu quả cao như Glutathione, Niacinamide và Allantoin có khả năng làm giảm số lượng và cường độ của đốm đen trên da. Sản phẩm mang lại làn da mềm mại, đủ ẩm và trắng sáng dần từ bên trong.



THÔNG TIN CHUNG:

- Xuất xứ: Hàn Quốc

- Nơi sản xuất: Hàn Quốc

- Dung tích: 25ml

- HSD: 3 năm kể tử ngày sản xuất

- Ngày sản xuất: In trên bao bì sản phẩm', 2, 7, CAST(N'2025-03-15T22:51:03.703' AS DateTime), CAST(N'2025-03-15T22:51:03.703' AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [image], [price], [description], [cid], [sub_id], [created_at], [updated_at]) VALUES (51, N'Tinh chất chăm sóc lỗ chân lông hoàn hảo CELLMAZING, 30ml, Ampoule', N'https://down-vn.img.susercontent.com/file/sg-11134207-7rbnl-m5sikwadzrgg4a@resize_w900_nl.webp', 440000.0000, N'CELLMAZING Pore Perfecting Ampoule 30ml

Light and moisturizing ampoule formula that absorbs quickly into skin without stickiness

Tinh chất chăm sóc lỗ chân lông hoàn hảo CELLMAZING Pore Perfecting 30ml



🎀 Đặc điểm chính

🤍 Thành phần chứa Collagen 5D + các gốc Peptide

🤍 Thu nhỏ lỗ chân lông

🤍 Chăm sóc bã nhờn sâu trong lỗ chân lông và tế bào da chết 

🤍 Cải thiện độ đàn hồi da, bổ sung độ ẩm cho da



🎀 Dành cho da

🤍 Lỗ chân lông sâu và to, tế bào da chết, bã nhờn, da khô, da thiếu đàn hồi



🎀 Hiệu quả

🤍 Tinh chất giải quyết hiệu quả 8 vấn đề thường gặp của lỗ chân lông da chỉ sau 2 tuần sử dụng

🤍 Se khít lỗ chân lông

🤍 Dưỡng ẩm và thúc đẩy độ đàn hồi lỗ chân lông, làm đầy những lỗ chân lông có độ sâu lớn.

🤍 Kết cấu dịu nhẹ, nhẹ nhàng nên có thể dùng hàng ngày mà không bết dính da.

🎀 Hướng dẫn sử dụng

1. Nhỏ vài giọt tinh chất lên mặt và thoa đều nhẹ nhàng.

2. Vỗ nhẹ để tinh chất thẩm thấu đều vào da.



🔔 Đối với những vùng da có độ đàn hồi lỗ chân lông kém thì nên dùng tinh chất kết hợp với kem làm săn chắc da Collagen.



🎀 Thành phần

Water, Butylene Glycol, Glycerin, Caprylic/Capric Triglyceride, Niacinamide, 1,2-Hexanediol, Cetearyl Olivate, Cetyl Ethylhexanoate, Collagen Extract, Soluble Collagen, Collagen Amino Acids, Collagen, Hydrolyzed Collagen, Hexapeptide-2, Panthenol, Allantoin, Hydrolyzed Hyaluronic Acid, Sodium Hyaluronate, Hydroxyethyl Acrylate/Sodium Acryloyldimethyl Taurate Copolymer, Sodium Hyaluronate Crosspolymer, Potassium Hyaluronate, Hydroxypropyltrimonium Hyaluronate, Hyaluronic Acid, Sodium Acetylated Hyaluronate, Heptyl Undecylenate, Glyceryl Stearate, C10-18 Triglycerides, Acrylates/C10-30 Alkyl Acrylate Crosspolymer, Valine, Threonine, Proline, Isoleucine, Histidine, Methionine, Cysteine, Biotin, Pentylene Glycol, Glycine, Serine, Glutamic Acid, Aspartic Acid, Leucine, Alanine, Lysine, Arginine, Tyrosine, Phenylalanine, Adenosine, Sorbitan Olivate, Sorbitan Isostearate, Cetearyl Alcohol, Vinyl Dimethicone, Tromethamine, Glyceryl Acrylate/Acrylic Acid Copolymer, PVM/MA Copolymer, Xanthan Gum, Disodium EDTA, Ethylhexylglycerin

- BAO BÌ BỀN VỮNG: Thân thiện với môi trường

- CÔNG THỨC SẠCH: Chứng nhận Thuần chay 

- BẢO VỆ ĐỘNG VẬT: Không thử nghiệm trên động vật', 2, 7, CAST(N'2025-03-15T22:51:03.703' AS DateTime), CAST(N'2025-03-15T22:51:03.703' AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [image], [price], [description], [cid], [sub_id], [created_at], [updated_at]) VALUES (52, N'DRCEUTICS Tinh Chất B5 Basic Hydration 5% DrCeutics Cho Da Dầu Mụn (30ml)', N'https://down-vn.img.susercontent.com/file/vn-11134207-7qukw-ljxod1bbhvw4f9@resize_w900_nl.webp', 133000.0000, N'• Thương hiệu: Dr Ceutics

• Xuất xứ: Việt Nam

• Dung tích: 30g, 100g, 150g

Serum B5 Basic Hydration DrCeutics là tinh chất cấp ẩm có kết cấu mỏng nhẹ, khô thoáng và nhanh ráo trên da.

 

CÔNG DỤNG:

- Với Calcium Pantothenate 5% cung cấp độ ẩm và phục hồi da tối đa. 

- Làm dịu da, cấp ẩm.

- Hỗ trợ quá trình chữa lành làn da mụn.

- Tinh chất serum nhanh thấm, khô ráo không gây bí da.

 

CÁCH SỬ DỤNG:

- Làm sạch da với sữa rửa mặt

- Cho Serum B5 Basic Hydration DrCeutics ra tay hoặc trực tiếp lên da mặt, mát xa nhẹ nhàng và vỗ nhẹ để tinh chất thấm nhanh vào da

- Có thể sử dụng ngày 2 lần sáng và tối



Hạn sử dụng: 3 năm từ ngày sản xuất (in trên hộp sản phẩm)', 2, 7, CAST(N'2025-03-15T22:51:03.703' AS DateTime), CAST(N'2025-03-15T22:51:03.703' AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [image], [price], [description], [cid], [sub_id], [created_at], [updated_at]) VALUES (53, N'Tinh Chất Chống Lão Hóa Dr. Pepti Exo Biome Ampoule 50ml', N'https://down-vn.img.susercontent.com/file/vn-11134207-7ras8-m5s0q48skegmf4@resize_w900_nl.webp', 390000.0000, N'1/ THÔNG TIN THƯƠNG HIỆU

DR.PEPTI là thương hiệu mỹ phẩm chăm sóc da nổi tiếng đến từ Hàn Quốc, nổi tiếng với các dòng sản phẩm làm đẹp chứa PEPTIDE - nguyên liệu “vàng” trong quá trình giúp da trẻ hóa, chống lão hoá hàng đầu thế giới. Nhờ tác dụng nhanh chóng nhưng lành tính của thành phần này, các sản phẩm của DR.PEPTI được ưu tiên sử dụng trong nhiều liệu trình chăm sóc da chống lão hóa tại các spa Hàn Quốc.



2. THÔNG TIN SẢN PHẨM

2.1 Thông tin sản phẩm:

Dr. Pepti Exo Biome Ampoule là một sản phẩm chăm sóc da tiên tiến, được thiết kế để cung cấp giải pháp chuyên sâu cho việc cân bằng da và tái tạo tế bào, giúp mang lại làn da trẻ trung, mềm mại và sáng bóng.



2.2 Công dụng:

Bảo vệ làn da khỏi môi trường bên ngoài và duy trì sự cân bằng cho làn da với công nghệ Exo-liposome.

Phục hồi kết cấu và cải thiện tone da, giúp gương mặt trở nên trắng và đều màu.

Với 2 loại peptide giúp da mịn màng và săn chắc tạo nên làn da khỏe mạnh, săn chắc.

Kết cấu ampoule dạng sợi, giúp tinh chất thẩm thấu vào sâu bên trong tốt nhất.



Thành phần:

Peptide Cao Cấp: Sự hiện diện của peptide trong ampoule giúp kích thích sự sản xuất collagen và elastin, giúp da trở nên đàn hồi hơn và giảm nếp nhăn.

Exo Biome Complex: Một hỗn hợp độc đáo của các vi khuẩn có lợi (probiotics) và các chất chống oxy hóa mạnh mẽ, giúp cân bằng sinh học cho da, hỗ trợ quá trình tái tạo tế bào và ngăn chặn tác động của tác nhân môi trường.

Hyaluronic Acid: Làm dịu và dưỡng ẩm sâu, giúp da trở nên mềm mại, đàn hồi và giữ nước cho làn da khỏe mạnh.

Glycerin: Là một chất dưỡng ẩm hiệu quả, giúp giữ nước cho da và làm cho da trở nên mềm mại và đàn hồi.

Butylene Glycol: Là một chất làm ẩm và dung môi, giúp sản phẩm thấm sâu vào da.

Glycereth-26: Một dạng được biến đổi của glycerin, có chức năng giữ nước cho da và làm dịu da.

Niacinamide: Còn được gọi là vitamin B3, niacinamide có nhiều lợi ích cho da, bao gồm cải thiện sự đồng đều màu da, giảm mụn và làm giảm nếp nhăn.



3/ HƯỚNG DẪN SỬ DỤNG

Sử dụng sản phẩm sau khi tẩy trang, rửa mặt và toner.

Lấy một lượng sản phẩm vừa đủ thoa lên toàn bộ gương mặt, massage nhẹ nhàng để tinh chất thẩm thấu.



4/ BẢO QUẢN

- Đậy nắp kĩ ngay sau khi sử dụng.

- Bảo quản nơi khô ráo, thoáng mát. Tránh ánh nắng trực tiếp.

- Để xa tầm tay trẻ em.', 2, 7, CAST(N'2025-03-15T22:51:03.703' AS DateTime), CAST(N'2025-03-15T22:51:03.703' AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [image], [price], [description], [cid], [sub_id], [created_at], [updated_at]) VALUES (54, N'Tinh chất Travel Size Skin1004 Madagascar Centella Tone Brightening Capsule Ampoule 30ml', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-ll3dtcxqg6h4ff@resize_w900_nl.webp', 126000.0000, N'Thương hiệu : Skin1004

Xuất xứ : Hàn Quốc

Dung tích : 30ml

Ngày Sản Xuất: xem trên bao bì sản phẩm

HSD: xem trên bao bì sản phẩm

1) Tinh chất làm sáng da chuyên sâu

  - Niacin Amide 4% (thành phần làm sáng da) + Tranexamic Acid 2%(làm đều màu và nâng tông da) + 3-O-Ethyl Ascorbic Acid(Dẫn xuất Vitamin C có tính ổn định cao)

  - Tinh chất được nâng cấp với sự kết hợp của 3 thành phần làm sáng da

  - Cải thiện làn da không đều màu, mờ các vết thâm do mụn



2) MadeWhite, thành phần làm sáng da từ rau má Madagascar

  - MadeWhite, thành phần làm sáng da có chứa Madecassoside từ rau má Madagascar

  - Lượng Madewhite cao 20.000ppm được bào chế dưới dạng hạt để có độ ổn định và hiệu quả cao

  - Có thể sử dụng cả ngày và đêm cho da nhạy cảm do loại Vitamin C có tính độ ổn định cao so với các thành phần làm sáng hiện có trên thị trường



3) Chức năng làm sáng da và dịu da mạnh mẽ

  - Với sản phẩm có chức năng làm sáng hiệu quả cao, chiết xuất rau má được tăng lên đến 90% để tăng cường khả năng chăm sóc và làm dịu da từ sâu bên trong

  - Phục hồi da bằng cách làm dịu và củng cố hàng rào bảo vệ da



4) Công thức tinh chất dưỡng ẩm không gây bết dính

 - Tinh chất dạng lỏng chứa các hạt làm trắng MadeWhite

 - Cho phép thoa nhiều lớp trên da mà không gây bết dính

 - Tinh chất dạng lỏng tươi mát, dưỡng ẩm sâu, không gây cảm giác khô căng sau khi sử dụng



5) Không chất tạo màu, tạo mùi

  - Công thức không sử dụng chất tạo mùi và chất tạo màu để tránh gây kích ứng da', 2, 7, CAST(N'2025-03-15T22:51:03.703' AS DateTime), CAST(N'2025-03-15T22:51:03.703' AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [image], [price], [description], [cid], [sub_id], [created_at], [updated_at]) VALUES (55, N'Tinh Chất Làm Sáng Da, Mờ Đốm Nâu LEVEL UP 10 Days Dark-Spots Intelligence - Losionerie', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lytk0ar6y5k189@resize_w900_nl.webp', 52000.0000, N'Tinh Chất Làm Sáng Da, Mờ Đốm Nâu LEVEL UP 10 Days Dark-Spots Intelligence

==== +1 Intelligence cho làn da của bạn ====



Dưỡng sáng và cải thiện đốm nâu trên da trong 10 ngày với bộ đôi thành phần từ Albatin & Alplha Arbutin, kết hợp Vitamin C với nồng độ an toàn cho da, không gây kích ứng và dễ bảo quản.

Tự tin trải nghiệm làn da tươi sáng, rạng rỡ và đều màu hơn trông thấy chỉ sau 2 tuần sử dụng.



Thông tin thành phần:

Công thức dưỡng sáng, mờ thâm ưu việt từ bộ đôi siêu thành phần Albatin & Alplha Arbutin được thực nghiệm lâm sàng mạnh mẽ:

- Albatin: làm mờ các vết nám, đốm nâu, tàn nhang trên da mặt bằng cách phân tán hắc sắc tố

- Alpha Arbutin: giúp ngăn ngừa sự hình thành đốm đen cho làn da luôn đều màu

- Vitamin C (3-O-Ethyl Ascorbic Acid): hỗ trợ làm sáng & đều màu da

- Hi-clera & Pentavitin: tăng cường dưỡng ẩm làn da hiệu quả', 2, 7, CAST(N'2025-03-15T22:51:03.703' AS DateTime), CAST(N'2025-03-15T22:51:03.703' AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [image], [price], [description], [cid], [sub_id], [created_at], [updated_at]) VALUES (56, N'Tinh dầu ngăn ngừa và làm giảm mụn, sưng tấy Naruko trà tràm Tea Tree Purifying Essential Oil 10ml (Bản Đài)', N'https://down-vn.img.susercontent.com/file/e3fdf59d707eb8f15fcf0eb925ae55c0@resize_w900_nl.webp', 225000.0000, N'Naruko – Trà tràm – Tinh dầu
Tác dụng chính: giảm mụn, giúp da sạch dầu

Công dụng: Tinh dầu trà tràm Naruko có tác dụng giảm sự sinh trưởng của mụn; cải thiện các vấn đề mụn xuất hiện trên da; làm sạch dầu trên các lỗ chân lông, giảm thiểu tổi đa khả năng mọc mụn; duy trì, cân bằng lượng dầu ổn định trên da; tái tạo làm mới da; giúp lỗ chân lông luôn thông thoáng.

Thời hạn sử dụng: 3 năm kể từ ngày sản xuất

Lưu ý: Sản phẩm không khuyến khích sử dụng ở vùng mắt và miệng, đề nghị quý khách lưu ý. Nếu không may đang sử dụng, sản phẩm bị dính vào mắt, đề nghị dùng một lượng lớn nước rửa thật sạch. Nếu như da bạn có hiện tượng dị ứng, nổi ngứa, lên mẩn đỏ… lập tức dừng sử dụng ngay. Khách hàng cũng nên hỏi ý kiến bác sỹ để nhận được lời khuyên hữu ích. Sản phẩm không được phép ăn. Đề nghị để xa tầm tay trẻ em, tránh các trường hợp không mong muốn xảy ra. Sản phẩm không sử dụng cho trẻ em dưới 3 tuổi.

NSX – HSD: Xem trên bao bì

Sản xuất bởi:  Công ty Beauty Essentials Limited, Taiwan Branch

Xuất xứ : Đài Loan

Sản phẩm phù hợp với: Tất cả mọi loại da, đặc biệt khuyên dùng trên các làn da dầu, da có lỗ chân lông to, thô, da bị mụn trứng cá, hoặc da dễ nổi mụn

Hướng dẫn sử dụng:
 Sau khi rửa mặt sạch và thực hiện các bước dưỡng da cơ bản, lấy sản phẩm bôi trực tiếp lên vùng da bị mụn, sử dụng kèm các sản phẩm khác trong bộ sản phẩm để đạt hiệu quả tốt hơn.

Thương hiệu: Naruko   
Dung tích: 10ml

Bao bì thay đổi theo từng đợt nhập hàng.

*Sản phẩm không phải là thuốc', 2, 7, CAST(N'2025-03-15T22:51:03.703' AS DateTime), CAST(N'2025-03-15T22:51:03.703' AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [image], [price], [description], [cid], [sub_id], [created_at], [updated_at]) VALUES (57, N'Sữa Dưỡng Thể Sáng Da Dưỡng Ẩm Ngăn Ngừa Lão Hoá Cỏ Mềm 150ml', N'https://down-vn.img.susercontent.com/file/vn-11134207-7ras8-m31rbme8xjga81@resize_w900_nl.webp', 165000.0000, N'*** CÔNG DỤNG: 

-	Sữa dưỡng da toàn thân;

-	 Giúp dưỡng ẩm da, làm mềm da, dưỡng sáng da, cho làn da mềm mịn, đều màu và tươi sáng hơn. Góp phần ngăn ngừa lão hóa da.

-	Mềm mịn da. Dưỡng cả tay và nail. Sáng da dần lên, hiệu quả sau 4 tuần sử dụng

-	Không gây mụn, không bít tắc lỗ chân lông. Không gây rậm lông

--------------------

***THÀNH PHẦN: Purified water (Nước tinh khiết), Glycerin, Niacinamide, Arachidyl Alcohol (and) Behenyl Alcohol (and) Arachidyl Glucoside, Hydrogenated Ethylhexyl Olivate (and) Hydrogenated Olive Oil Unsaponifiables, Caprylic/Capric Triglyceride, Helianthus Annuus (Sunflower) Seed Oil (Dầu Hướng dương), Butyrospermum parkii butter (Bơ Hạt mỡ) , Oryza sativa bran oil (Dầu Cám gạo), Sclerocarya Birrea Seed Oil (and) Tetradecane, Polyglyceryl-3 Distearate and Glyceryl Stearate Citrate, Hydroxyethyl Acrylate/Sodium Acryloyldimethyl Taurate Copolymer, Acrylates/C10-30 Alkyl Acrylate Crosspolymer, Benzyl alcohol (and) Ethylhexylglycerin (and) Tocopherol, Fragrance.', 2, 8, CAST(N'2025-03-15T22:51:17.487' AS DateTime), CAST(N'2025-03-15T22:51:17.487' AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [image], [price], [description], [cid], [sub_id], [created_at], [updated_at]) VALUES (58, N'Dưỡng Thể Olay B3 + Retinol, Olay Bright Ultra Whitening Bản Mới Nhất', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-luj27xpt1bmt84@resize_w900_nl.webp', 100000.0000, N'Cùng với  dòng Olay Retinol nổi đình nổi đám thì nay em Olay Super Bright B3 Ultra Whitening + Vitamin C thế hệ mới nhất chuyên sâu về phục hồi và làm trắng da x3 hiệu quả đã sẵn hàng để phục vụ các khách yêu.



 Ngoài thành phần B3 là thành phần dưỡng trắng nổi tiếng quá quen thuộc rồi, nay lại thêm Vitamin C nồng đô cao kết hợp sẽ nâng hiệu quả thẩm thấu, phát huy tác dụng triệt để. 



Theo thông tin từ hãng thì dòng này là dòng Whitening đã được cải tiến nên khả năng dưỡng trắng được đánh giá là nhanh hơn so với dòng Olay Retinol vốn đã được review rất nhiều. Và hiện thì Dòng này là dòng được các Chị em xứ Trung ưa chuộng hơn nhiều. Lượt mua và đánh giá về khả năng dưỡng trắng cao gấp 1.5 lần so với Dòng Olay Retinol.



Điều đặc biệt là do là sản phẩm mới nên giá thành hiện vẫn đang còn mềm mại hơn nhiều thế nên nếu bạn kì vọng vào một sản phẩm có tác dụng nhanh hơn giá cả tốt hơn thì không thể bỏ qua dòng sản phẩm này nhé.

THÀNH PHẦN VÀ CÔNG DỤNG

-Chứa 5% Ninacinamide giúp da đều màu, ngừa thâm, giảm tác động của tia UV



-Vitamin C hàm lượng cao với công nghệ mới giúp dưỡng trắng vượt bậc



-Inositol 1 dạng của vitamin B8 có hiệu quả làm trắng da



-Kết cấu kem olay nhanh thấm không gây bết dính da



-Mùi thơm Vani Đào nhẹ nhàng không gây khó chịu khi sử dụng



-Công thức collagen thúc đẩy tăng trưởng tự phát giúp da săn chắc

HƯỚNG DẪN SỬ DỤNG:



- Bước 1 : Làm sạch da với sữa tắm rồi sau đó lau khô bằng khăn sạch.



- Bước 2 : Lấy một lượng sữa dưỡng thể olay b3  thể đủ dùng vào bàn tay . 



- Bước 3 : Xoa hai lòng tay vào với nhau trong vài giây để làm ấm, từ đó giúp tinh chất có trong sản phẩm thẩm thấu vào da tốt hơn.



- Bước 4 : Thoa phần sữa dưỡng lên da đồng thời kết hợp với massage nhẹ nhàng trong vài phút.

LƯU Ý:
- Sản phẩm có chứa hàm lượng B3+ (Niacinamide) cao hơn dòng cũ, có thể gây kích ứng đối với da nhạy cảm vì vậy nếu bạn chưa sử dụng thì nên mua tuýp nhỏ dùng thử trước.



- Da sẽ trắng lên sau khoảng 14-28 ngày sử dụng đều đặn.



- Sản phẩm không nuôi lông (tùy cơ địa nhưng % có nuôi lông không cao)



- Nếu bạn làm việc văn phòng, không thường xuyên tiếp xúc với ánh nắng mặt trời thì chỉ cần che chắn khi ra ngoài, nếu bạn vận động làm việc ngoài trời và tiếp xúc nhiều với ánh nắng thì nên sử dụng kem chống nắng cho body để đạt hiệu quả dưỡng trắng tốt nhất', 2, 8, CAST(N'2025-03-15T22:51:17.487' AS DateTime), CAST(N'2025-03-15T22:51:17.487' AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [image], [price], [description], [cid], [sub_id], [created_at], [updated_at]) VALUES (59, N'Sữa Dưỡng Thể Alpha Arbutin 3Plus + Collagen Tosowoong 500ml', N'https://down-vn.img.susercontent.com/file/vn-11134207-7ras8-m4a8qvjgab8wb5@resize_w900_nl.webp', 138000.0000, N'Dưỡng Trắng Da Alpha Arbutin Collagen Lotion 3++ 500ml với khả năng kích trắng dưỡng trắng da cao trên thị trường hiện nay, đồng thời mang lại cho khách hàng một làn da đẹp mịn màng trắng sáng hơn mỗi ngày, cho hiệu quả sử dụng vượt trội, với cấu trúc dịu nhẹ và hoàn toàn ko gây bết.

Xuất xứ : Thái Lan

Hạn sử dụng : 36 tháng



- Thành phần chính (Ingredients): Alpha Arbutin , Glycerin , Dầu Khoáng , Stearic Acid, Collagen 

AQUA, MINERAL OIL. NIACINAMIDE, GLYCERINE, STEARIC ACID, CETYL ALCOHOL, PERSEA GRATISSIMA OIL, POLYSORBATE 60.PHENOXYETHANOL, ARBUTIN, BUTYROSPERMUM PARKII (SHEA BUTTER), HYDROLYZED COLLAGEN, PERFUME, METHYLPARABEN, PROPYLPARABEN, CARBOMER, TRIETHANOLAMINE. XANTHAN GUM



CÁCH THỨC HOẠT ĐỘNG 

- Alpha Arbutin Body Cream chứa các hoạt chất Alpha Arbutin và Glutathione là hoạt chất dưỡng trắng hiệu quả và an toàn thông qua cơ chế ức chế quá trình chuyển hoá Tyrosine thành Melanocyte - chính là các hắc sắc tố khiến cho làn da bị sạm, nám, đồi mồi.



- Dưỡng trắng bên trong và bảo vệ da bên ngoài là nguyên tắc vàng để sở hữu một làn da mịn màng.

Do đó, Alpha Arbutin Collagen Lotion 3 Plus tăng cường các thành phần chống nắng giúp bảo vệ da từ bên ngoài, ngăn chặn các tia UVA và UVB tác động lên da.

------------------------------------------

II. Công Dụng Sản Phẩm

- Dưỡng trắng da bằng cơ chế ức chế quá trình chuyển hoá Tyrosine thành Melanin.

-  Tăng sự đàn hồi, ngăn ngừa, cải thiện lão hoá da.

- Tạo lớp màng ngăn ngừa các gốc tự do phá hoại cho làn da.

-  Ngăn chặn các tia UVA và UVB

------------------------------------------

III. Hướng Dẫn Sử Dụng:

- Thoa kem 2 ngày 1 lần sáng và tối sau khi tắm

- Có thể mix cùng viên kích trắng để tăng khả năng làm trắng da (3 viên kích trắng + 500ml dưỡng thể)

* Lưu ý: Tùy theo cơ địa mỗi người mà dẫn đến tác dụng sản phẩm khác nhau.

------------------------------------------

CHÍNH SÁCH BẢO HÀNH - ĐỔI TRẢ

- Cam kết 100% sản phẩm là hàng chính hãng

- Đội ngũ tư vấn viên nhiệt tình, hỗ trợ giải đáp thắc mắc trong thời gian ngắn nhất

- Hỗ trợ đổi trả theo quy định của Shopee với điều kiện:

+ Hàng vẫn còn mới, chưa qua sử dụng

+ Hàng bị lỗi hoặc hư hỏng do vận chuyển hoặc do nhà sản xuất

+ Có video quay lại quá trình mở hộp và kiểm tra từng sản phẩm. Video rõ ràng, thấy được gói hàng còn nguyên vẹn, còn niêm phong.

• Lưu ý: Nếu thiếu một trong các điều kiện trên, shop từ chối giải quyết khiếu nại. Thời gian khiếu nại tối đa 7 ngày từ lúc nhận được hàng.

------------------------------------------

CẢM ƠN BẠN ĐÃ LỰA CHỌN VÀ TIN DÙNG SẢN PHẨM CỦA SHOP!

FOLLOW NGAY ĐỂ KHÔNG BỎ LỠ BẤT KÌ ƯU ĐÃI NÀO CỦA SHOP NHÉ!

CHÚC BẠN CÓ NHỮNG GIÂY PHÚT MUA  SẮM VUI VẺ!

------------------------------------------', 2, 8, CAST(N'2025-03-15T22:51:17.487' AS DateTime), CAST(N'2025-03-15T22:51:17.487' AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [image], [price], [description], [cid], [sub_id], [created_at], [updated_at]) VALUES (60, N'Sữa Dưỡng Thể Lotion Thuần Chay MUSEDAY Dưỡng Sáng, Mềm Mịn, Trắng Da, Chống Nắng Size 50 ml, 200ml', N'https://down-vn.img.susercontent.com/file/vn-11134207-7ras8-m4y9684puiqf94@resize_w900_nl.webp', 70000.0000, N'Cây cỏ sữa được biết đến là 1 loại nguyên liệu dưỡng da vô cùng hiệu quả ở vùng Tây Bắc. Cỏ sữa chứa hoạt chất có khả năng hạn chế quá trình tổng hợp sắc tố melanin, giúp da trở nên trắng sáng, đều màu. Theo đó, với công thức cải tiến 4in1 , Museday mang đến sản phẩm sữa dưỡng thể/ lotion giúp làm sáng da ngay tức thì, đồng thời dưỡng trắng sâu từ bên trong sau 28 ngày sử dụng. Ngoài khả năng cấp ẩm sâu, với chỉ số chống nắng SPF 50 và PA++++, sản phẩm cung cấp sự bảo vệ toàn diện cho da.



Thành phần: Aqua, Glycerin, Cyclopentasiloxane, Persea Gratissima (Avocado) Oil, Panthenol, Niaciamide, Arbutin, Aloe Vera Callus Extract, Euphorbia thymifolia Linn Extract, Licorice Root Extract, Morus Alba Root (Mulberry) Extract, Terephthalylidene Dicamphor Sulfonic Acid, Titanium Dioxide, Zinc Dioxide, Polyacrylate Crosspolymer-6, Isoamyl Laurate, Isoamyl Cocoate, Tocophenol, Phenoxyethanol, Ethylhexylglycerin, Allatoin.



Công dụng:

- Make up, bật tone da tức thì

- Hỗ trợ dưỡng trắng chuyên sau 28 ngày

- Cung cấp độ ẩm

- Chống nắng & bảo vệ da dưới ánh nắng mặt trời



Hướng dẫn sử dụng: 

Lấy 1 lượng kem vừa đủ thoa đều trực tiếp lên toàn thân. Sử dụng đều mỗi ngày cho kết quả tốt nhất. Không nên tiếp xúc quá lâu với ánh nắng mặt trời ngay cả khi đã sử dụng sản phẩm.

Sản phẩm phù hợp với loại da thường, da dầu, da hỗn hợp



Chú ý: Sử dụng ngoài da, tránh tiếp xúc trực tiếp với mắt, tránh xa tầm tay trẻ em.



Bảo quản: Để nơi khô ráo thoáng mát, tránh ánh nắng trực tiếp và nhiệt độ cao.



NSX/ Số lô sản xuất: Xem trên bao bì 

Hạn sử dụng: 3 năm

Dung tích: 50ml, 200ml 



Xuất xứ: Việt Nam 

', 2, 8, CAST(N'2025-03-15T22:51:17.487' AS DateTime), CAST(N'2025-03-15T22:51:17.487' AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [image], [price], [description], [cid], [sub_id], [created_at], [updated_at]) VALUES (61, N'Sữa dưỡng thể sáng da Grace and Glow Black Opium Bright & Glow Body Serum 300ml', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-ll31w2hmjvtp83@resize_w900_nl.webp', 99000.0000, N'Sữa dưỡng thể hương nước hoa sáng da Black Opium Ultra Bright & Glow Solution Body Serum 300ML

Sữa dưỡng thể có hương thơm từ nước hoa cao cấp Black Opium. Được bào chế như một loại serum cho body với Niacinamide có tác dụng chống oxy hóa cao như một tác nhân làm sáng, giữ ẩm cho da và Galactomyces giàu vitamin, axit amin giúp tăng cường, làm sáng và làm mịn da. Cho một làn da trắng sáng và khoẻ mạnh.



Thành phần chính:

1、Niacinamide

Chống oxy hóa 

Làm sáng đều màu da

Giữ cho làn da luôn ẩm mướt

Tăng sắc tố giúp làm sáng da



2、Galactomyces

Giàu các vitamin và axit amin

Tăng cường hàng rào bảo vệ da

Làm sáng da toàn thân

Giúp da mềm mượt hơn



Công dụng:

- Làm sáng da

- Dưỡng ẩm 

- Tăng độ đàn hồi cho làn da

- Lưu hương thơm nước hoa trên cơ thể đến 3-4 tiếng.



Cách sử dụng: Lấy sữa dưỡng thể ra tay, nhẹ nhàng thoa đều khắp cơ thể để dưỡng chất thẩm thấu.

Sử dụng ngày 2 lần, vào buổi sáng và buổi tối trước khi đi ngủ.

Sản phẩm phát huy công dụng tốt nhất khi kết hợp với sữa tắm cùng loại của hãng Grace and Glow.



THÀNH PHẦN：

Water, glycerin, caprylic/capric triglyceride, cyclopentasiloxane, ci 77891, niacinamide, butylene glycol, panthenol, phenoxyethanol, carbomer, triethanolamine, chlorphenesin, sodium acrylate/sodium acryloyldimethyl taurate, copolymer, fragrance, isohexadecane, simmondsia chinensis (jojoba) seed oil, aluminum hydroxide, silica, polysorbate 80, triethoxycaprylylsilane, disodium edta, sorbitan oleate, butyrospermum parkii (shea) butter, sodium hyaluronate, glutathione, lactococcus ferment lysate, ellagic acid, ryoku-cha ekisu, hydrolyzed, soybean extract, morus nigra fruit extract, lactobacillus ferment, glycyrrhiza uralensis (licorice) root extract, pentylene glycol, 1,2-hexanediol, hydroxyacetophenone, lactic acid, sodium chloride, sodium benzoate', 2, 8, CAST(N'2025-03-15T22:51:17.487' AS DateTime), CAST(N'2025-03-15T22:51:17.487' AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [image], [price], [description], [cid], [sub_id], [created_at], [updated_at]) VALUES (62, N'Dưỡng thể Alpha Arbutin Collagen Lotion 500ml', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lwwaraycy57da9@resize_w900_nl.webp', 75000.0000, N'Thương Hiệu: Alpha Arbutin

Xuất Xứ: Thái Lan

Dung Tích: 500ml



Công dụng:

- Thành phần Alpha Arbutin hàm lượng cao 3x và tinh chất dưỡng trắng essence làm giảm đốm nâu, dưỡng da mền mại, trắng sáng 

- Collagen trong sữa dưỡng giúp da chống lại các tác nhân lão hóa và cải thiện, tăng độ đàn hồi cho da.

- Tạo lớp màng ngăn ngừa các gốc tự do phá hoại cho làn da giúp hục hồi làn da bị hư tổn, đen sạm do cháy nắng cực kì hiệu quả.

- Bổ sung độ ẩm, da không chỉ trắng sáng mà còn mềm mại, mịn màng , dưỡng trắng - ẩm - giảm thâm



Thành phần:

- Alpha Arbutin: hoạt chất dưỡng trắng, sáng da hiệu quả với cơ chế hoạt động an toàn và ít kích ứng hơn hydroquinone bằng cách ngăn sự hình thành của Melanin đồng thời phục hồi làn da nám, đốm nâu, không đều màu. 

- Collagen: hỗ trợ quá trình tái tạo làn da hư tổn trở nên khỏe mạnh, đàn hồi và săn chắc hơn. 

- Stearic Acid: làm dịu da và cũng có khả năng dưỡng ẩm da hiệu quả. 



Hướng dẫn sử dụng:

Lấy 1 lượng kem vừa đủ thoa đều khắp cơ thể, sử dụng ngày 2 lần sáng và trước khi ngủ', 2, 8, CAST(N'2025-03-15T22:51:17.487' AS DateTime), CAST(N'2025-03-15T22:51:17.487' AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [image], [price], [description], [cid], [sub_id], [created_at], [updated_at]) VALUES (63, N'Sữa dưỡng thể trắng da căng bóng Grace & Glow Rouge 540 Body Serum 300ml', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-ll30z34bevh902@resize_w900_nl.webp', 99000.0000, N'Sữa dưỡng thể trắng da căng bóng Grace & Glow Rouge 540 Body Serum 
Sữa dưỡng thể sáng da căng bóng Grace & Glow Rouge 540 Body Serum có hương nước hoa hàng hiệu Rouge 540, chứa Niacinamide và Bakuchiol giúp duy trì độ ẩm để da không bị khô, cho da căng bóng và săn chắc, cho cơ thể thơm mát cả ngày dài
Cách sử dụng: Lấy sữa dưỡng thể ra tay, nhẹ nhàng thoa đều khắp cơ thể để dưỡng chất thẩm thấu.
Sử dụng ngày 2 lần, vào buổi sáng và buổi tối trước khi đi ngủ.
Sản phẩm phát huy công dụng tốt nhất khi kết hợp với sữa tắm cùng loại của hãng Grace and Glow.
Thành phần:

Aqua, glycerin, caprylic/capric triglyceride, cyclopentasiloxane, CI 77891, fragrance, carbomer, sodium acrylate/sodium acryloyldimethyl taurate copolymer, phenoxyethanol, isohexadecane, panthenol, simmondsia chinensis (jojoba) seed oil, butyrospermum parkii (shea) butter, squalane, polysorbate 80, niacinamide, triethanolamine, chlorphenesin, hydroxyacetophenone, triethoxycaprylylsilane, sodium hyaluronate, disodium EDTA, sorbitan sesquioleate, bakuchiol

Dung tích: 300ml', 2, 8, CAST(N'2025-03-15T22:51:17.487' AS DateTime), CAST(N'2025-03-15T22:51:17.487' AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [image], [price], [description], [cid], [sub_id], [created_at], [updated_at]) VALUES (64, N'Combo Sữa Dưỡng Thể Thiên Nhiên Purité Hương Hoa Anh Đào 250ML + Tặng Sữa Tắm Purité Hoa Anh Đào 250ML', N'https://down-vn.img.susercontent.com/file/vn-11134201-7ra0g-m6ru0m4srdd347@resize_w900_nl.webp', 123000.0000, N'Sữa Dưỡng Thể Purité Sáng Mịn Hoa Anh Đào 250ml
Sữa Dưỡng Thể Purité Sáng Mịn Hoa Anh Đào với sự kết hợp hài hòa giữa tinh chất hoa anh đào, dầu olive Glycerine sẽ nhanh chóng thẩm thấu vào da, nuôi dưỡng làn da bạn từ sâu bên trong, đồng thời tác động làm hỗ trợ tái cấu trúc tế bào, giúp làn da bạn căng mịn, khỏe mạnh. Làn da bạn mỗi ngày sẽ thêm mềm mại và mượt mà hơn. Sản phẩm cho hương hoa anh đào ngọt ngào phảng phất trên da, không nồng mà thoang thoảng, xoa dịu mọi giác quan.
SẢN PHẨM VỚI CÁC THÀNH PHẦN VÀ CÔNG DỤNG:

+ Mang lại cho bạn làn da đẹp tự nhiên với hương thơm Hoa anh đào phảng phất đầy quyến rũ đồng thời làm mềm và giữ ẩm cho da.

+ Thành phần dầu Oliu giúp nuôi dưỡng làn da ẩm mịn từ bên trong.
LOẠI DA PHÙ HỢP:

+ Phù hợp cho mọi loại da.
HƯỚNG DẪN SỬ DỤNG:

+ Lấy một lượng sản phẩm vừa đủ và thoa đều lên cơ thể. Nên sử dụng ngay sau khi tắm, khi da vừa được lau khô và còn đang ẩm để sản phẩm được hấp thu tốt nhất.
HƯỚNG DẪN BẢO QUẢN:

+ Bảo quản: nơi khô ráo thoáng mát.

+ Không bảo quản nơi có nhiệt độ quá cao hoặc quá thấp, tránh ánh sáng trực tiếp.
HẠN SỬ DỤNG: 

+ 3 năm kể từ ngày sản xuất.
NGÀY SẢN XUẤT: 

+ Xem trên bao bì sản phẩm.
XUẤT XỨ:

+ Việt Nam.
THÔNG TIN THƯƠNG HIỆU:

+ Purité De Prôvence là thương hiệu chuyên về các sản phẩm làm đẹp và chăm sóc cơ thể nổi tiếng của nước Pháp. Lấy cảm hứng từ vẻ đẹp của vùng đất Provence kỳ diệu, Purité mang đến cho người dùng các sản phẩm được chiết xuất 100% từ những nguyên liệu thiên nhiên đặc trưng của mảnh đất Địa Trung Hải này như tinh dầu hoa hồng, hoa anh đào, hoa oải hương, dầu ô liu, dầu argan... Không chỉ làm việc miệt mài trong phòng thí nghiệm, các nhà khoa học của Purité còn làm việc trên cả những cánh đồng, để có thể đảm bảo từng nguyên liệu thảo mộc phát triển hoàn hảo.

', 2, 8, CAST(N'2025-03-15T22:51:17.487' AS DateTime), CAST(N'2025-03-15T22:51:17.487' AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [image], [price], [description], [cid], [sub_id], [created_at], [updated_at]) VALUES (65, N'Mặt Nạ Đất Sét Geoskincare Làm Sạch Sâu, Se Khít Lỗ Chân Lông, Giảm Dầu Nhờn, Dưỡng Da Ẩm Mịn 100ml', N'https://down-vn.img.susercontent.com/file/cn-11134207-7ras8-m6qbun54fy0860@resize_w900_nl.webp', 254000.0000, N'Giới thiệu sản phẩm

Mặt nạ bùn núi lửa Geoskincare 100ml giúp làm sạch lỗ chân lông, cấp ẩm và kiểm soát dầu nhờn. Dễ dàng rửa sạch mà không gây căng da, kết hợp với nhiều tinh chất từ thiên nhiên, mặt nạ giúp loại bỏ bụi bẩn trong khi vẫn giữ được độ ẩm và không gây khô da. Loại bỏ tình trạng da khô nứt nẻ, giúp da luôn mềm mịn và căng bóng.
Đặc điểm sản phẩm

1. Mặt nạ đất sét núi lửa (Đen) chứa than hoạt tính giúp làm sạch và thu nhỏ lỗ chân lông, tẩy sạch mụn đầu đen và lớp trang điểm còn sót lại mà không làm khô da. Giúp da trông tươi mát, mịn màng hơn. 

- Thành phần chính: New Zealand Glacier Clay* + Than hoạt tính + Đất sét núi lửa + Kaolin.

- Phù hợp cho các spa chăm sóc da, làm sạch da chuyên sâu.
2. Mặt nạ bùn núi lửa (Xanh Lá) giúp làm sạch sâu lỗ chân lông mà không gây kích ứng, kiểm soát dầu và cấp ẩm giúp da săn chắc hơn.

- Thành phần chính: 5 lớp đất sét khả năng hấp thụ tự nhiên giúp loại bỏ tạp chất. 5 thành phần chiết xuất thực vật làm dịu làn da "khó tính". 5 thành phần dưỡng ẩm cung cấp độ ẩm, hỗ trợ làn da sáng khỏe.

- Với lớp nền màu xanh ô liu phù hợp cho việc chăm sóc dưỡng ẩm hàng ngày.
3. Mặt nạ bùn băng (Xanh dương) với 2 loại đất sét giúp làm sạch sâu lỗ chân lông, kiềm dầu, dưỡng ẩm mà không gây căng da. Làm sạch mạnh mẽ và thanh lọc giúp làn da trở nên tươi sáng hơn. 

- Thành phần chính: New Zealand Glacier Clay + Kaolin + Đất sét núi lửa + Dầu hạt Jojoba + Zinc PCA + Niacinamide.

- Với lớp nền màu vàng nhạt phù hợp cho việc chăm sóc da, làm sạch lỗ chân lông, kiểm soát dầu.

*Đất sét Glacier của New Zealand hay còn gọi là Bùn sông băng New Zealand.
Thông tin sản phẩm

- Thương hiệu: Geoskincare

- Xuất xứ: Trung Quốc

- Sản phẩm: mặt nạ bùn núi lửa

- Phân loại: Đen, Xanh lá, Xanh dương

- Dung tích: 100ml

- Hạn sử dụng: 4 năm

- Phù hợp với loại da: Mọi loại da

- Công dụng: Làm sạch mụn đầu đen, sợi bả nhờn, kiểm soát dầu, cấp ẩm

- Cách bảo quản: Để nơi khô ráo, thoáng mát
Chính sách mua hàng và đổi trả tại Geoskincare VN

- Cam kết sản phẩm chính hãng, nguồn gốc xuất xứ rõ ràng

- Nếu có bất kỳ câu hỏi nào về sản phẩm, vui lòng liên hệ với shop qua chat để được hỗ trợ.

- Giao hàng trong vòng 36 giờ sau khi đặt đơn, nếu vào ngày nghỉ lễ sẽ bị trì hoãn 1 ngày.

- Đổi trả sản phẩm trong vòng 15 ngày theo chính sách của Shopee. 

- Sản phẩm đổi trả phải ở tình trạng mới Chưa mở niêm phong và Chưa qua sử dụng, bao bì đầy đủ và phụ kiện quà tặng kèm theo (nếu có). 

(Trước khi yêu cầu đổi trả, vui lòng nhắn tin cho Shop qua Chat để được hỗ trợ nhanh nhất)
Lưu ý: Màu sắc của sản phẩm trên hình ảnh đăng tải có thể có sự chênh lệch nhỏ do độ phân giải màn hình và ánh sáng, vui lòng tham khảo màu sắc thực tế của sản phẩm.

', 3, 9, CAST(N'2025-03-15T22:51:29.397' AS DateTime), CAST(N'2025-03-15T22:51:29.397' AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [image], [price], [description], [cid], [sub_id], [created_at], [updated_at]) VALUES (66, N' Mặt nạ đất sét MILAGANICS tràm trà BHA mask đất sét tràm trà hỗ trợ giảm mụn 60g', N'https://down-vn.img.susercontent.com/file/vn-11134207-7ras8-m3n6em13rlbc7a@resize_w900_nl.webp', 87300.0000, N'1. GIỚI THIỆU SẢN PHẨM
Sản phẩm mặt nạ Tràm Trà Milaganics với cơ chế hỗ trợ giảm mụn thông minh từ tinh dầu Tràm Trà, kết hợp cùng hoạt chất BHA sẽ ức chế sự sinh trưởng của vi khuẩn gây ra mụn, giúp xẹp các nốt mụn chỉ sau vài lần sử dụng. Sản phẩm có thêm tinh dầu Tràm Trà sẽ tác động đến lớp biểu bì, ngăn ngừa việc hình thành nhân mụn và hỗ trợ phục hồi vùng da bị thương tổn do mụn gây ra
2. THÀNH PHẦN 
Tinh dầu tràm trà, Kaolin, Lá nha đam tươi, Chiết xuất cây phỉ, Chiết xuất hoa hồng, Glycerin, Chiết xuất củ cải đường, Dầu dừa, Dầu cám gạo
3. CÔNG DỤNG
- Hỗ trợ giảm mụn: Thành phần tinh dầu Tràm Trà có trong mặt nạ Tràm Trà sẽ loại bỏ các vi khuẩn gây mụn, ức chế viêm nhiễm từ đó làm teo các nốt mụn đỏ từ bên trong, đồng thời làm khô các nốt mụn mủ và đẩy nhân mụn ra ngoài, giúp giảm mụn nhanh chóng sau một thời gian sử dụng.

- Se khít lỗ chân lông: Chiết xuất cây Phỉ, lá Nha Đam, Hoa Hồng và rễ Củ Cải Đường có tác dụng loại bỏ vi khuẩn và lớp bã nhờn ẩn trong lỗ chân lông, sau đó làm se khít lỗ chân lông.

- Dưỡng da sáng mịn: Hợp chất dầu Dừa, dầu Cám Gạo với hàm lượng khoáng chất cao sẽ bổ sung dưỡng chất cùng độ ẩm cần thiết cho da, hỗ trợ khả năng làm sáng da, chống oxy hóa, giảm sự tác động của những gốc tự do, từ đó giúp da mặt tươi trẻ và mịn màng hơn.

4. CAM KẾT CHẤT LƯỢNG
- Không chứa paraben

- Không màu nhân tạo

- Không chứa sulfate
5. HƯỚNG DẪN SỬ DỤNG
Rửa sạch mặt, sử dụng lượng sản phẩm vừa đủ thoa đều lên mặt, tránh vùng mắt, môi. Thư giãn từ 15-20 phút sau đó rửa lại với nước sạch. Sử dụng 3 lần/tuần để đạt hiệu quả tốt nhất.
6. LƯU Ý
Ngưng sử dụng nếu kích ứng với thành phần của sản phẩm.

', 3, 9, CAST(N'2025-03-15T22:51:29.397' AS DateTime), CAST(N'2025-03-15T22:51:29.397' AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [image], [price], [description], [cid], [sub_id], [created_at], [updated_at]) VALUES (67, N'Combo 5 bộ mặt nạ bơ tươi Pơ Lang tái tạo, cấp ẩm, dưỡng da, giúp trẻ hóa làn da', N'https://down-vn.img.susercontent.com/file/vn-11134207-7ras8-m37mxslf2zlo1f@resize_w900_nl.webp', 75000.0000, N'   Mặt nạ bột bơ tươi là sản phẩm được làm 100% từ thịt trái bơ tươi theo công nghê sấy thăng hoa. Thành phẩm sau khi chế biến vẫn giữ được sự nguyên chất, nguyên mùi vị, bột mịn và có màu xanh vàng. 
	Bột bơ chứa nhiều vitamin và dưỡng chất, không gây kích ứng phù hợp với nhiều loại da kể cả da nhạy cảm. Mặt nạ bột bơ tươi không chỉ nuôi dưỡng làn da khỏe mạnh từ trong ra ngoài mà còn giúp hạn chế và làm chậm quá trình lão hóa để bạn luôn tự tin mỗi ngày', 3, 9, CAST(N'2025-03-15T22:51:29.397' AS DateTime), CAST(N'2025-03-15T22:51:29.397' AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [image], [price], [description], [cid], [sub_id], [created_at], [updated_at]) VALUES (68, N'Mặt Nạ Bùn COLORKEY LUMINOUS Làm Sạch Da Không Gây Khô Da Khi Dùng 60g/hũ', N'https://down-vn.img.susercontent.com/file/vn-11134207-7ra0g-m7arh6lj714m3e@resize_w900_nl.webp', 134000.0000, N'Thông tin sản phẩm	

Thương hiệu: COLORKEY LUMINOUS	

Khối lượng tịnh 60g

Hạn sử dụng: 3 năm

Nơi sản xuất: Quảng Châu.	

Công dụng: Cấp ẩm cho da, hỗ trợ làm sáng, phục hồi da. 
Hướng dẫn sử dụng:	

Bước 1: Làm sạch da mặt

Bước 2: Lấy một lượng sản phẩm vừa đủ, thoa đều lên mặt 

Bước 3: Để trong vòng 10-15p rồi rửa lại với nước sạch. 
Lưu ý	
1. Kiểm tra tình trạng kích ứng của da bằng cách lấy một lượng nhỏ và bôi lên phía sau tai và theo dõi trong 24h.

2.Ngưng sử dụng nếu có xuất hiện tình trạng kích ứng khi đắp.

3. Mặt nạ bùn nên sử dụng 2-3 lần 1 tuần, không nên sử dụng liên tục. ', 3, 9, CAST(N'2025-03-15T22:51:29.397' AS DateTime), CAST(N'2025-03-15T22:51:29.397' AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [image], [price], [description], [cid], [sub_id], [created_at], [updated_at]) VALUES (69, N'Mặt Nạ Dưỡng Trắng, Trẻ Hóa, Cấp Ẩm & Cân Bằng Da Vùng Kín, Vùng Chữ Y Cho Tẩy Lông..', N'https://down-vn.img.susercontent.com/file/vn-11134207-7ras8-m5td6s2ex9av98@resize_w900_nl.webp', 183000.0000, N'Mặt Nạ Dưỡng Trắng, Trẻ Hóa, Cấp Ẩm Và Cân Bằng Da Vùng Kín, Vùng Chữ Y phù hợp cho những trường hợp như: tẩy lông waxing vùng kín thường xuyên, ngồi lâu bắt chéo chân, sau khi sinh hay sau các kỳ kinh nguyệt, thường xuyên tham gia các hoạt động như lái xe máy hay đạp xe làm ảnh hưởng, gây kích ứng vùng kín.   

* Giúp Làm Dịu Vùng Chữ Y

* Chứa 6 Loại Peptide Làm Săn Chắc Da, Ngăn Ngừa Lão Hóa Vùng  Chữ Y 

*  9 Loại Hyaluronic Có Tác Dụng Dưỡng Ẩm

* Hiệu Quả Làm Mát Dịu Vùng Chữ Y 

* Ngăn Ngừa Hiện Tượng Lông Mọc Ngược 

* Dùng Được Cho Cả Nam Và Nữ 

* Mặt NạTừ Vải Cotton 100% Nguyên Chất Mềm Mịn Chất Liệu Thân Thiện Với Môi Trường 

HDSD: 

Bước 1 Làm Sạch Mồ Hôi Và Các Chất Bẩn Ở Khu Vực Sẽ Dán Mặt Nạ 

Bước 2 Lấy Mặt Nạ Cấp Ẩm, Dưỡng Trắng Và Làm Dịu Vùng Chữ Y Blue Petal Y zone Diamond Calming Mask , 

Sau Đó Trải Miếng Dán Ra Sau Đó Đắp Lên Vùng Cần Sử Dụng  "

Bước 3 : Ấn Nhẹ Để Mặt Nạ Bám Đều Trên Da, Kéo Phần Dưới Mặt Để Nó Phủ Đều Lên Vị Trí Cần Thiết

Sau 10-20 phút, Hãy Tháo Mặt Nạ Và Vỗ Nhẹ Lên Vùng Da Để Các Tinh Chất Được Thẩm Thấu Sâu Vào Bên Trong 

*Bạn Có Thể Cắt Đôi Sản Phẩm Theo Chiều Dọc Để Sử Dụng Lên Chân Hoặc Cánh Tay Giúp Làm Mát Và Làm Dịu 

*Nếu sử dụng Sau Khi Để Vào Tủ Lạnh, Bạn Có Thể Cảm Nhận Cảm Giác Mát Lạnh Hơn Khi Sử Dụng

* Sản Phẩm Này Chỉ Sử Dụng Một Lần Và Không Thể Tái Sử Dụng Hãy Dùng Ngay Sau Khi Mở

', 3, 9, CAST(N'2025-03-15T22:51:29.397' AS DateTime), CAST(N'2025-03-15T22:51:29.397' AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [image], [price], [description], [cid], [sub_id], [created_at], [updated_at]) VALUES (70, N'Mặt Nạ Mắt BREYLEE Hỗ Trợ Trẻ Hóa, Giảm Nhăn, Làm Mờ Quầng Thâm Mắt (Hộp/60 miếng)', N'https://down-vn.img.susercontent.com/file/cn-11134207-7ras8-m52xfcdgxxh7ae@resize_w900_nl.webp', 108000.0000, N'Tên sản phẩm
MẶT NẠ MẮT BREYLEE CHIẾT XUẤT TỪ TRÁI THẠCH LỰU

Thông tin chi tiết
Số lượng: 60 Miếng / 30 cặp

Công dụng
Hiệu quả làm trắng và dưỡng ẩm cao, tạo ra làn da tươi mới và trắng sáng
Tinh chất trái thạch lựu đỏ và chống oxy hóa, hỗ trợ giảm quầng mắt, làm trắng da và làm sáng vùng da quanh mắt. Dưỡng da sâu với axit hyaluronic phân tử nhỏ hoạt tính cao, giúp vùng da quanh mắt luôn ẩm mượt và tươi sáng.

Thành phần
NƯỚC, SORBITOL, GLYCERIN, BUTYLENE GLYCOL, CHIẾT XUẤT TỪ TẢO NÂU, SODIUM HYALURONATE, CHIẾT XUẤT TỪ TỪ RÊU AILEN (CARRAGEENAN), POTASSIUM CHLORIDE, CHIẾT XUẤT TỪ RAU MÁ, CHIẾT XUẤT TỪ TRÁI LỰU, YẾN MẠCH (AVENA SATIVA) β-GLUCAN、ARBUTIN、XANTHAN GUM、CHIẾT XUẤT TỪ LÁ / HOA NHUNG TUYẾT、HYDROXYPROPYL METHYLCELLULOSE、PENTYLENE GLYCOL、DIPOTASSIUM GLYCYRRHIZATE、METHYLPARABEN、CALCIUM CHLORIDE、MICA、1,2-HEXANEDIOL、CHLORPHENESIN、DISODIUM EDTA、ALLANTOIN、NƯỚC HOA', 3, 9, CAST(N'2025-03-15T22:51:29.397' AS DateTime), CAST(N'2025-03-15T22:51:29.397' AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [image], [price], [description], [cid], [sub_id], [created_at], [updated_at]) VALUES (71, N'Mặt nạ giấy cấp ẩm chứa Hyaluronic Acid, 10 miếng, Jelly Mask', N'https://down-vn.img.susercontent.com/file/cn-11134207-7ras8-m6i1qkntfuncec@resize_w900_nl.webp', 89000.0000, N'Chi tiết sản phẩm Giới thiệu:

1.Tên: Floweryland Axit Hyaluronic Centella Asiatica Bursting Water Mask Dưỡng ẩm Sửa chữa Làm dịu Mặt nạ thạch

2.Hiệu quả: Axit Hyaluronic 8D, Dưỡng ẩm ba chiều, Dưỡng ẩm và Dưỡng ẩm

3.Nội dung thực: 23ml / miếng

4.Thời hạn sử dụng: 3 năm

', 3, 9, CAST(N'2025-03-15T22:51:29.397' AS DateTime), CAST(N'2025-03-15T22:51:29.397' AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [image], [price], [description], [cid], [sub_id], [created_at], [updated_at]) VALUES (72, N'Bộ 20 Mặt Nạ Ngủ Dạng Thạch 4ml Chứa Vitamin C Giúp Dưỡng Ẩm Và Làm Trắng Da', N'https://down-vn.img.susercontent.com/file/0428efd3d800d45c8eac7798d7a87a2a@resize_w900_nl.webp', 41000.0000, N'Sản phẩm - Mặt nạ ngủ làm trắng da dưỡng ẩm Vitamin C Good Night Jelly

Dung tích “ 4ml pcs

Thành phần - Collagen , natri hyaluronate, Nicotinamide. men bifid

Thích hợp cho mọi loại da
Công dụng “ Chứa đầy đủ tinh chất dưỡng ẩm phức hợp collagen , chăm sóc và nuôi dưỡng làn da vào ban đêm , cho làn da ngủ ngon và cảm nhận vẻ đẹp , bổ sung nước đậm đặc , khóa nước giữ độ ẩm cho trạng thái tươi trẻ .
Hạn sử dụng 3 năm

Hướng dẫn sử dụng “ Sau khi làm sạch và chăm sóc da cơ bản , hãy lấy hộp và xé nhãn

Lấy mặt nạ ra và thoa đều lên mặt , nghỉ ngơi một lúc rồi đi ngủ .
Ghi chú 

Chỉ sử dụng ngoài da , tránh tiếp xúc với mắt và da bị tổn thương .

Tránh xa trẻ sơ sinh và trẻ em .', 3, 9, CAST(N'2025-03-15T22:51:29.397' AS DateTime), CAST(N'2025-03-15T22:51:29.397' AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [image], [price], [description], [cid], [sub_id], [created_at], [updated_at]) VALUES (73, N'Nước Tẩy Trang Rootoo Thuần Tự Nhiên Sạch Sâu Không Cồn Cho Mọi Loại Da Không Kích Ứng(100ml)', N'https://down-vn.img.susercontent.com/file/vn-11134207-7ra0g-m76adwhcehiwaf@resize_w900_nl.webp', 84000.0000, N'Nước Tẩy Trang Rootoo với công thức dịu nhẹ và thành phần tự nhiên an toàn, lành tính giúp làm sạch sâu, loại bỏ bụi bẩn, bã nhờn và lớp trang điểm một cách nhẹ nhàng mà không gây kích ứng, khô căng da, kể cả làn da nhạy cảm.

1. THÔNG TIN SẢN PHẨM:

- Tên sản phẩm: Nước Tẩy Trang Rootoo

- Dạng sản phẩm: chai dạng pump

- Mùi hương: hương thơm dịu nhẹ với mùi thảo dược tự nhiên

- Dung tích: 100ml

- Loại da phù hợp: phù hợp cho mọi loại da, kể cả da nhạy cảm

- Hạn sử dụng: 2 năm kể từ ngày sản xuất - 1 năm kể từ ngày mở nắp

2. CÔNG DỤNG:

- Làm sạch sâu lớp trang điểm, dầu thừa bã nhờn nhưng không gây khô và căng da

- Không cay mắt.

- Đặc biệt phù hợp với mọi loại da, không gây kích ứng.', 3, 10, CAST(N'2025-03-15T22:51:41.507' AS DateTime), CAST(N'2025-03-15T22:51:41.507' AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [image], [price], [description], [cid], [sub_id], [created_at], [updated_at]) VALUES (74, N'Nước tẩy trang rau má AISASEA 500ml dưỡng ẩm khuôn mặt môi mắt làm sạch sâu cho da nhạy cảm', N'https://down-vn.img.susercontent.com/file/cn-11134207-7r98o-loos2ezyktwsc3@resize_w900_nl.webp', 115000.0000, N'

Nước tẩy trang rau má AISASEA 500ml chiết xuất thực vật tự nhiên dịu nhẹ dưỡng ẩm cho da nhạy cảm

Thể tích thực: 500ml

🔴Chiết xuất từ 7 loại thực vật thiên nhiên, chăm sóc da nhẹ nhàng, tẩy trang an toàn, làm sạch nhẹ nhàng, không làm căng da, công nghệ phân tử nhỏ, thẩm thấu sâu, tẩy trang sạch, không Cồn, bảo vệ làn da nhạy cảm, tạo cảm giác sạch sẽ và mềm mại cho Da khi sử dụng, thoải mái và thân thiện với làn da.

Loại bỏ không tốt, da có vấn đề? Lỗ chân lông to, nổi mụn, mẩn đỏ nhạy cảm. Cặn trang điểm, lỗ chân lông bị tắc?

✔️Thẩm thấu các phân tử nhỏ + dưỡng ẩm nhẹ

✔️Trải nghiệm tẩy trang cấp độ Spa

✔️Sử dụng cho mắt và môi

✔️Trang điểm hàng ngày dễ tẩy trang, vùng mắt và môi không dễ lưu lại

⭕ Bảy loại dưỡng chất thực vật, tự nhiên và nhẹ nhàng để bảo vệ da!
💧DƯỠNG ẨM VÀ NGẬM NƯỚC

Chiết xuất rễ Rau má,

Chiết xuất cám yến mạch (AVENA SATIVA),

💧Phục hồi và làm dịu

Chiết xuất cây xương rồng (OPUNTIA DILLENII)

Chiết xuất rễ OPHIOPOGON JAPONICUS (OPHIOPOGON JAPONICUS)

Chiết xuất rễ SCUTELLARIA BAICALENSIS (SCUTELLARIA BAICALENSIS)

💧Kích hoạt trẻ hóa da

Chiết xuất rễ hoa mẫu đơn (PAEONIA SUFFRUTICOSA)

Chiết xuất rễ hoa mẫu đơn (PAEONIA ALBIFLORA)

📖 Thích hợp để tẩy trang cho:

Trang điểm, chẳng hạn như kem nền dạng lỏng, mascara, son môi, v.v.

Kem chống nắng, chẳng hạn như không thấm nước, không bong tróc

Da nhạy cảm, chẳng hạn như mẩn đỏ, mụn trứng cá, mụn trứng cá, v.v.
📖 Cách sử dụng: 
Lấy một lượng vừa đủ sản phẩm này, đổ lên miếng bông và nhẹ nhàng lau sạch lớp trang điểm trên mặt theo hướng ra ngoài, lau nhiều lần cho đến khi sạch.', 3, 10, CAST(N'2025-03-15T22:51:41.507' AS DateTime), CAST(N'2025-03-15T22:51:41.507' AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [image], [price], [description], [cid], [sub_id], [created_at], [updated_at]) VALUES (75, N'Nước Tẩy Trang Carslan Làm Sạch Sâu Hiệu Quả 500ml', N'https://down-vn.img.susercontent.com/file/sg-11134201-22090-fl65in277zhvd6@resize_w900_nl.webp', 119000.0000, N'Thời gian giao hàng dự kiến cho sản phẩm này là từ 7-9 ngày
Cửa hàng chính hãng Carslan

Ra đời năm 2001, tập trung vào nghiên cứu, phát triển và đổi mới, tạo ra những sản phẩm tốt với sự khéo léo

Luôn duy trì sự nhạy bén về xu hướng thời trang quốc tế và văn hóa thời trang trẻ, đồng thời sử dụng thẩm mỹ quốc tế để xác định xu hướng trang điểm. Sử dụng chất lượng thế giới để xây dựng các sản phẩm danh tiếng
Lưu ý:
1. Do chênh lệch cài đặt ánh sáng và màn hình, màu sắc sản phẩm có thể hơi khác so với hình ảnh. Chúng tôi đảm bảo phong cách giống như trong hình ảnh. Cảm ơn bạn!

2. Cách bảo quản: để nơi thoáng mát, tránh ánh nắng mặt trời
', 3, 10, CAST(N'2025-03-15T22:51:41.507' AS DateTime), CAST(N'2025-03-15T22:51:41.507' AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [image], [price], [description], [cid], [sub_id], [created_at], [updated_at]) VALUES (76, N'Kem tẩy trang FOCALLURE 10x 75g chiết xuất thực vật làm sạch sâu dưỡng ẩm không gây kích ứng', N'https://down-vn.img.susercontent.com/file/sg-11134201-22120-wrr9bkdfp7kvd2@resize_w900_nl.webp', 197000.0000, N'ocallure#Plantfactory Instant Purifying Deep Cleansing Balm, có thể tan chảy trong 1 giây, loại bỏ tất cả các lớp trang điểm trong 10 giây và không có cặn; cũng chứa 10x chiết xuất thực vật, tươi và ẩm, nhẹ nhàng và không gây kích ứng.

[10 Giây Loại bỏ] Kết cấu kem, sẽ tan vào công thức dầu trong một giây khi tiếp xúc với da, nhũ hóa thành công thức sữa trong 1 giây với nước, nhanh chóng loại bỏ lớp trang điểm và làm sạch bụi bẩn còn sót lại trong 10 giây mà không để lại cặn

[Làm Sạch sâu] Dầu dưỡng làm sạch này có khả năng làm sạch mạnh mẽ, có thể dễ dàng loại bỏ lớp trang điểm mắt và lớp trang điểm không thấm nước mà không để lại cặn bẩn 

[Không Gây kích ứng] Công thức giàu 10 chiết xuất thực vật tự nhiên, giúp duy trì và bảo vệ sức khỏe của hàng rào bảo vệ da. Nó an toàn, nhẹ nhàng và không gây kích ứng với hương thơm tươi mát

[Làm Mới & Cấp ẩm] Dầu dưỡng làm sạch này được làm giàu với SIMMONDSIA CHINENSIS SEED OIL, HELIANTHUS ANNUUS SEED OIL, và GLYCINE MAX OIL, giúp giữ cho làn da mịn màng và ẩm mượt mà không làm bong tróc da. Độ ẩm tự nhiên, để lại nó tươi mát và mềm mại một cách dễ dàng

[Tích Hợp "Thìa"] Được tích hợp "thìa" tích hợp chất liệu dễ lau chùi, giúp bạn lấy dầu dưỡng làm sạch trong khi vẫn giữ móng tay ra khỏi goop, ngoài ra, thiết kế ngăn tốt hơn để giữ cho móng tay của bạn không bị bết dính Giữ vệ sinh', 3, 10, CAST(N'2025-03-15T22:51:41.507' AS DateTime), CAST(N'2025-03-15T22:51:41.507' AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [image], [price], [description], [cid], [sub_id], [created_at], [updated_at]) VALUES (77, N'Nước Tẩy Trang Bioderma Cho Da Dầu Mụn Và Da Nhạy Cảm, Sạch Sâu Lành Tính 500ML', N'https://down-vn.img.susercontent.com/file/vn-11134201-7ra0g-m6zlkvanbi9kc5@resize_w900_nl.webp', 115000.0000, N'Nước Tẩy Trang Bioderma Sensibio H2O Chính Hãng Cho Da Dầu Mụn Và Da Nhạy Cảm 500ml

THÔNG TIN SẢN PHẨM:

- Dung tích: 500ml

- Xuất xứ thương hiệu: Pháp

- Bao bi thay đổi tuỳ đợt nhập hàng

- Hướng dẫn bảo quản: Nơi thoáng mát, tránh ánh nắng trực tiếp, đậy nắp kín sau khi sử dụng

THÀNH PHẦN:

- Phức hợp Fluidactiv có tác dụng điều hòa chất lượng bã nhờn, giảm tình trạng bít lỗ chân lông và hình thành mụn.

- Sebium H2O thanh lọc, nhờ các thành phần như kẽm và đồng mang lại cho nó màu xanh đặc biệt. Ginkgo Biloba cải thiện chất lượng bã nhờn trên da

- Với chiết xuất rong biển và sự kết hợp của các hoạt chất, D.A.F. phức tạp làm tăng khả năng chịu đựng của da trong khi kích thích sức đề kháng. Do đó, lớp biểu bì của bạn được bảo vệ tốt hơn chống lại các gốc tự do, ô nhiễm, chất gây dị ứng và các yếu tố xâm lược

', 3, 10, CAST(N'2025-03-15T22:51:41.507' AS DateTime), CAST(N'2025-03-15T22:51:41.507' AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [image], [price], [description], [cid], [sub_id], [created_at], [updated_at]) VALUES (78, N'Maybelline Eye & Lip Makeup Remover Nước tẩy trang mắt môi chai 40ml-150ml mall Trung yishifa', N'https://down-vn.img.susercontent.com/file/vn-11134207-7ras8-m0my0ra5uktpc8@resize_w900_nl.webp', 94000.0000, N'Chi tiết sản phẩm 
Tên sản phẩm: Nước tẩy trang mắt và môi Maybelline
Cấu tạo: Gồm 2 lớp, 1 lớp dầu, 1 lớp nước
Dung tích: 150ml
Thương hiệu: Maybelline (Mỹ)
1. Thông tin sản phẩm
Nước Tẩy Trang Mắt Và Môi Maybelline là sản phẩm tẩy trang môi chuyên nghiệp của thương hiệu Maybelline. Nó được sử dụng cho vùng da quanh mắt và môi. Nó chứa tinh chất hoa hồng, có thể bảo vệ da, làm mềm da và tránh khô da sau khi tẩy trang.
2. Ưu điểm của nước tẩy trang mắt và môi Maybelline
Nước tẩy trang mắt và môi Maybelline hiện đã có mặt tại Skinfood World, với các tính năng nổi bật sau:
Tẩy trang chuyên nghiệp: Là sản phẩm tẩy trang mắt và môi hai lớp chuyên nghiệp, được trang bị dầu tẩy trang chuyên dụng và nước tẩy trang sâu.
Làm sạch da: Làm sạch mỹ phẩm mắt và môi một cách nhanh chóng và hiệu quả
Công thức an toàn: Chứa công thức dịu nhẹ, an toàn cho da và không gây kích ứng, kể cả da nhạy cảm
Mang lại cảm giác thoải mái: Tinh chất hoa hồng và chiết xuất Kawa có tác dụng tẩy trang và làm sạch da, nuôi dưỡng vùng da quanh mắt, lông mi, môi và lông mày một cách đặc biệt, mang lại sự thoải mái và mềm mại cho làn da
Làm sạch hiệu quả: Tẩy trang nhẹ nhàng, hiệu quả và nhanh chóng làm sạch lớp trang điểm mà không bị trôi.
Thích hợp cho mọi loại da, kể cả da nhạy cảm.
3. Ứng viên được đề xuất
Thích hợp cho mọi loại da, kể cả da nhạy cảm.
4. Cách bảo quản
Tránh ánh nắng trực tiếp
Để nơi khô ráo và thoáng mát
Sử dụng nắp sau để đậy nắp
5. Hướng dẫn sử dụng
Bước 1: Lắc kỹ để trộn đều dầu và nước tẩy trang.
Bước 2: Đổ một lượng vừa đủ nước tẩy trang vào miếng bông, chấm lên mắt và môi, giữ vài giây rồi lau nhẹ lớp trang điểm dọc theo lông mày và lông mi.
Bước 3: Thực hiện bước tiếp theo để làm sạch và chăm sóc da.', 3, 10, CAST(N'2025-03-15T22:51:41.507' AS DateTime), CAST(N'2025-03-15T22:51:41.507' AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [image], [price], [description], [cid], [sub_id], [created_at], [updated_at]) VALUES (79, N'Dầu tẩy trang hoa hồng cocoon 140ml (rose cleansing oil) sạch da, mềm mịn', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-ltxy89xaqpsvcd@resize_w900_nl.webp', 155000.0000, N'Dầu tẩy trang hoa hồng cocoon (rose cleansing oil) giúp làm sạch sâu lớp trang điểm, bụi bẩn và dầu thừa, dưỡng ẩm mà không để lại cảm giác nhờn rít khó chịu.

Công dụng Dầu tẩy trang hoa hồng cocoon
- Làm sạch sâu lớp trang điểm, bụi bẩn và bã nhờn tích tụ trong lỗ chân lông
- Cung cấp độ ẩm, mang đến làn da sạch, mềm mịn mà không để lại cảm giác nhờn rít trên da.

Thành phần chính Dầu tẩy trang hoa hồng cocoon
- Dầu hoa hồng : Giúp da săn chắc, ngăn ngừa lão hóa, cấp ẩm sâu cho làn da
- Vitamin E: Giúp dưỡng ẩm, làm mềm da và chống oxy hóa cho làn da.

Thành phần đầy đủ Dầu tẩy trang hoa hồng cocoon
GLYCERIN, AQUA/WATER, PEG-7 GLYCERYL COCOATE, C15-19 ALKANE, GLYCERETH-26, POLYSORBATE 20, ROSA DAMASCENA FLOWER OIL, TOCOPHERYL ACETATE, CARAMEL

Hướng dẫn sử dụng Dầu tẩy trang hoa hồng cocoon
Thoa sản phẩm lên da và mát-xa nhẹ nhàng để dầu hòa tan những bụi bẩn và lớp trang điểm trên bề mặt da. Rửa sạch lại với nước.

Cam kết Dầu tẩy trang hoa hồng cocoon
- Không dầu khoáng
- Không thử nghiệm trên động vật
- Không paraben
- Đã được kiểm nghiệm bởi chuyên gia da liễu 
Hạn sử dụng: 3 năm kể từ ngày sản xuất, in trên chai.
Mỡ nắp dùng trong 12 tháng.', 3, 10, CAST(N'2025-03-15T22:51:41.507' AS DateTime), CAST(N'2025-03-15T22:51:41.507' AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [image], [price], [description], [cid], [sub_id], [created_at], [updated_at]) VALUES (80, N'Nước tẩy trang Nature Republic Good Skin Cleansing Water 500ml', N'https://down-vn.img.susercontent.com/file/sg-11134201-22110-r3iklmg0xpjv1d@resize_w900_nl.webp', 135000.0000, N'Xuất xứ: Hàn Quốc      
Dung tích: 500ml
Thương hiệu: Nature Republic

Sản phẩm gồm có 3 loại:
1.  Nước tẩy trang dành cho da tối màu, xỉn màu Good Skin AHA Ampoule Cleansing Water 500 ml
- Thành phần: 
   + Chiết xuất Citric Acid (AHA)
   + Vỏ cây liễu
   + Công nghệ Micellar

- Công dụng: 
   + Làm sạch sâu các lớp trang điểm, dầu thừa và tạp chất trên da.
   + Loại bỏ tế bào chết, làm thông thoáng lỗ chân lông mang lại làn da sạch mịn.

- Đối tượng sử dụng: 
  + Mọi loại da
  + Da thô ráp, sần sùi.
  + Da tối, xỉn màu.

2. Nước tẩy trang dành cho da dầu, da hỗn hợp, da mụn Good Skin Tea Tree Ampoule Cleansing Water 500ml
- Thành phần: 
   + Chiết xuất Tràm trà
   + Vỏ cây Enantia Chlorantha
   + Công nghệ Micellar

- Công dụng: 
   + Làm sạch sâu các lớp trang điểm, dầu thừa và tạp chất trên da.
   + Giúp kiểm soát dầu từ đó giúp chăm sóc, cải thiện lỗ chân lông mang lại làn da sạch mịn.

- Đối tượng sử dụng: 
  + Da dầu, hỗn hợp.
  + Da mụn

3.  Nước tẩy trang dành cho mọi loại da Good Skin Mineral Ampoule Cleansing Water 500 ml
- Thành phần: 
   + Nước biển giàu các khoáng chất như canxi, magie…
   + Công nghệ Micellar

- Công dụng: Làm sạch sâu các lớp trang điểm, dầu thừa và tạp chất nhưng vẫn giữ được độ ẩm tự nhiên cho da không bị khô căng sau khi làm sạch.

- Đối tượng sử dụng: 
  + Moi loại da. Đặc biệt da khô, thường.
  + Da lão hóa

HƯỚNG DẪN SỬ DỤNG:

Lấy một lượng vừa đủ ra bông cotton nhẹ nhàng lau lên mặt sau đó rửa lại bằng nước ấm. Với vùng da trang điểm đậm/kỹ giữ và ấn nhẹ trong vòng 10 giây để có thể làm sạch hiệu quả.

HSD: 3 năm kể từ ngày sản xuất', 3, 10, CAST(N'2025-03-15T22:51:41.507' AS DateTime), CAST(N'2025-03-15T22:51:41.507' AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [image], [price], [description], [cid], [sub_id], [created_at], [updated_at]) VALUES (81, N'Máy massage mặt đẩy tinh chất nâng cơ mặt cầm tay máy điện di máy tẩy trang nâng cơ mặt làm sạch sâu cấp ẩm Halushop22', N'https://down-vn.img.susercontent.com/file/vn-11134207-7ras8-m5qsmb291ad4e3@resize_w900_nl.webp', 84000.0000, N'1. Máy đẩy tinh chất incor:		
Máy đẩy tinh chất incor là dụng cụ làm đẹp không thễ thiều cho các chị em. Công thức tác động tiêu chuẩn giúp		
các chị em có được làn da trắng sáng tự nhiên, mịn màng như ý		
Đặc điểm thiết kế nỗi bật của máy đẩy tinh chất incor		
Máy massage làm sạch, đấy tỉnh chất incor được thiết kế đơn giản, như thiết bị chăm sóc da tại nhà với công		
năng không kém gì các thiết bị chăm sóc chuyên sâu tại các cơ sở làm đẹp: Spa, Thắm mỹ Viện		
Thiết kế vỏ bọc máy chất lượng ABS cao cấp với phần đuôi máy nhỏ gọn, phù hợp với tay cằm của các bạn nữ.		
Màn hình LCD cao cấp, hiện đại, thễ hiện rõ nét các thông tin cho các chị em theo dõi		
Máy massage mặt incor đi kèm với 3 nút điều chỉnh chế độ massage đơn giản, dễ sử dụng		
Bề mặt diện tích tiếp xúc lớn tồi ưu khả năng chăm sóc các vùng trên da mặt		
		
2. Bộ máy đẩy tinh chất incor gồm những gì?		
Bộ máy massage da mặt gồm 1 máy massage, 1 đề sạc, 1 cáp sạc và hướng dẫn sử dụng rõ ràng		
Bộ máy massage được thiết kế đặt gọn gàng trong hộp. Mỗi thiết bị đều được gói túi bảo vệ cần thận		
		
3. Tính năng và cơ chế hoạt động:		
Chế độ chăm sóc	Tác động	
Massage nóng lạnh	Chế độ massage nóng lạnh hỗ trợ giản nở các lỗ chân lông, cải thiện	
	 hiệu quả các dấu hiệu  bụi bẩn trên da	
	Máy massage mặt incor hỗ trợ giảm tình trạng mụn và hạn chế hình thành mụn	
Massage giảm nhăn	Thiết bị hỗ trợ đẩy mạnh quá trình lưu thông khí huyết, hiệu quả trong 	
	hỗ trợ làm tăng sing collagen trên da	
	Hỗ trợ làm giảm nếp nhăn các vùng khóe mắt, khóe miệng, gò má,... 	
Chế độ làm sạch	Incor kết hợp với chế độ rung massage hỗ trợ  hút sạch các bụi bẩn và đưa chúng ra ngoài hiệu quả 	
	Hỗ trợ cải thiện vấn đề về bã nhờn gây bí tắc dưới da	
Chế độ ánh sáng sinh học 	Ánh sáng đỏ: hỗ trợ sản sinh collagen tự nhiên trên da, hỗ trợ cho da đàn hồi 	
	Ánh sáng xanh: hỗ trợ  bảo vệ da toàn diện, giúp giảm khô ráp và hư tổn trên da	
Khả năng đẩy tinh chất	Thiết bị đẩy tinh chất incor hỗ trợ hiệu quả trong tăng cường khả năng hấp thụ trên da	
	Các dưỡng chất từ các sản phẩm chăm sóc thẩm thấu tối đa trên da	
	Khả năng dưỡng ẩm đạt hiệu quả gấp đôi so với sử dụng sản phẩm dưỡng ẩm chay thông thường. 	
		
4. Hướng dẫn sử dụng máy đẩy tinh chất incor:		
Làm sạch da mặt với sữa rửa mặt, để da khô tự nhiên.		
Dũng dưỡng chất chăm sóc da: serum hoặc kem dưỡng để thoa trên da		
Dùng máy massage di chuyễn trên bề mặt da theo hướng từ dưới lên		
Dùng máy massage đấy nhẹ nhàng theo chiều dưới lên sẽ giúp các dưỡng chất thẩm thầu sâu và nâng cơ da mặt hiệu quả		
		
Lưu ý:		
Sử dụng máy massage chăm sóc da đều đặn để mang đền hiệu quả tối ưu		
Bảo quản thiết bị nơi khô ráo, thoáng mát, hạn chề để thiết bị tiếp xúc với nước		
		
5. Chính sách bảo hành và đổi trả:		
* Bảo hành chính hãng cho sản phẩm 01 đổi 01 trong vòng 07 ngày với những lỗi do nhà sản xuất 		
* Đổi và trả hàng:		
 Bước 1: Kiểm tra kỹ thông tin:		
Ngay khi nhận hàng, khách hàng kiểm tra kĩ thông tin người gửi, người nhận và sản phẩm.		
Nếu sản phẩm gặp lỗi, ', 3, 11, CAST(N'2025-03-15T22:51:56.460' AS DateTime), CAST(N'2025-03-15T22:51:56.460' AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [image], [price], [description], [cid], [sub_id], [created_at], [updated_at]) VALUES (82, N'Máy mát xa con lăn ngọc bích tự nhiên cho mặt Cơ thể lưng Con lăn Massage chân Nâng cơ mặt ', N'https://down-vn.img.susercontent.com/file/sg-11134301-7rdvl-lyygecrxknjg91@resize_w900_nl.webp', 101000.0000, N'Máy mát xa con lăn ngọc bích tự nhiên cho khuôn mặt Cơ thể lưng Con lăn Massage chân Nâng cơ mặt Chống nhăn Hai đầu Gua Sha Đá ngọc bích tự nhiên Máy mát xa con lăn ngọc bích tự nhiên cho mặt Cơ thể lưng Con lăn Massage chân Con lăn nâng cơ mặt Chống nhăn Hai đầu Gua Sha Jade Đá đá', 3, 11, CAST(N'2025-03-15T22:51:56.460' AS DateTime), CAST(N'2025-03-15T22:51:56.460' AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [image], [price], [description], [cid], [sub_id], [created_at], [updated_at]) VALUES (83, N'Bộ Que Nặn Mụn 8 Chi Tiết Hộp Thép Không Gỉ Xmusk Chuyên Dụng Spa,Thẩm Mỹ Viện (Tặng 6 Khăn Lau Cồn)', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-llx173qz66lb10@resize_w900_nl.webp', 69000.0000, N'Công cụ loại bỏ mụn đầu đen làm mờ vết thâm

8 trong 1 với Vỏ kim loại “” lựa chọn lý tưởng của bạn!

***Lưu ý: Sử dụng đúng cách để mọi thứ trở nên dễ dàng, chúng tôi không khuyến khích sử dụng bất kỳ mụn đầu đen nào trước khi mụn trưởng thành, và vui lòng lau tất Cả dụng cụ tẩm cồn trước và sau mỗi lần sử dụng và sử dụng theo chỉ dẫn.

***Hướng dẫn sử dụng:

1.Làm sạch mặt bằng nước ấm và giữ ấm khăn mặt trên da trong vài giây để lỗ chân lông mở ra.

2.Đặt đầu quanh mụn đầu đen bạn muốn chiết xuất.

3.Nhẹ nhàng ấn xuống một bên của mụn đầu đen - di chuyển dụng cụ trên cùng.

4.Làm sạch da một lần nữa, sau đó thoa toner và kem dưỡng ẩm.

5.Luôn rửa dụng cụ trong nước xà phòng / cồn nóng và để khô trong không khí.

Cách dùng: Dùng cho mụn trứng cá, mụn đầu đen, mụn đầu trắng, mụn trứng cá, mụn nhọt, mụn bọc, mụn trứng cá.

*** Điểm nổi bật:
- Chức năng tuyệt vời: Những công cụ khác nhau này có thể giúp loại bỏ mụn đầu đen, mụn trứng cá và nhiều nhược điểm khác nhau, giữ cho khuôn mặt của bạn sạch sẽ và mịn màng.Không có mẩn đỏ hoặc sẹo.
- Mọi thứ trong một bộ: Dụng cụ loại bỏ mụn đầu đen 4 cái / 8 cái, kích thước nhỏ gọn với trọng lượng nhẹ với hộp đựng để giữ dụng cụ an toàn và sạch sẽ, mọi vật dụng đều được thiết lập đúng nơi.
- Face Beauty: Bộ dụng cụ loại bỏ mụn đầu đen này được thiết kế để giải quyết các vấn đề về da mặt khác nhau, dễ dàng loại bỏ mụn đầu đen, mụn đầu trắng, mụn trứng cá.Trị mụn, vết thâm trên trán, má, mũi và cằm, giúp da mặt luôn sạch đẹp hiệu quả.
- Dễ sử dụng: Bộ dụng cụ nặn mụn này với thiết kế chống trượt giúp bạn kiểm soát áp lực tốt hơn trong quá trình sử dụng, tránh làm tổn thương da.Sự lựa chọn tuyệt vời cho các tiệm trang điểm chuyên nghiệp, studio mỹ phẩm và sử dụng tại nhà.
- Tay nghề tuyệt vời: Máy hút lỗ chân lông trên khuôn mặt này được làm bằng thép không gỉ cao cấp, nhẹ và bền cho cả thẩm mỹ viện và sử dụng hàng ngày.Tẩy mụn đầu đen của chúng tôi có thể hoạt động trên mọi loại da.Đi kèm với một hộp đựng đồ xinh xắn, di động và dễ dàng mang theo, nó sẽ không chiếm quá nhiều diện tích.
', 3, 11, CAST(N'2025-03-15T22:51:56.460' AS DateTime), CAST(N'2025-03-15T22:51:56.460' AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [image], [price], [description], [cid], [sub_id], [created_at], [updated_at]) VALUES (84, N'1 Con lăn mặt đá, con lăn lce để giảm bọng mắt & mặt, Đường viền mặt nạ và tăng cường chăm sóc da & phát sáng', N'https://down-vn.img.susercontent.com/file/sg-11134301-7rdyd-lzravtppovcn45@resize_w900_nl.webp', 31000.0000, N'Chất liệu sản phẩm: chất liệu silicon

Cải THIỆN LÀN DA: lăn đá mặt có thể loại bỏ tình trạng giảm bọng mắt, làm sáng da, se khít và thu nhỏ lỗ chân lông, kích thích lưu thông máu và giảm viêm, có nhiều chức năng như làm đẹp, làm sạch và lưu thông máu.

Dễ SỬ DỤNG: Đổ đầy nước vào khuôn máy mát xa con lăn đá. Để đông lạnh trong tủ lạnh hơn 4 giờ, khi sử dụng, hãy thoa đá lên da cách nhau 30 giây theo chuyển động tròn. Để có kết quả tối ưu, nên sử dụng 1 hoặc 2 ti

Tiết KIỆM TIỀN VÀ VERSATILE: Có thể nạp lại cho một khối lập phương tươi và sạch mỗi lần sử dụng. Đông lạnh các công thức nấu ăn hình khối thay thế, chẳng hạn như nước chanh để làm trắng da, trà xanh để giảm viêm, nước dưa chuột để giảm sưng tấy, lá bạc hà sảng khoái và dừa để cải thiện làn da Sữa.

Quà TẶNG HOÀN HẢO: Lý tưởng cho phòng tập thể dục da cá nhân của riêng bạn. Lướt đá khắp mặt, để tạo đường nét, điêu khắc và nâng da, Hãy chiêu đãi bản thân hoặc người thân một món quà không ngừng tặng và là món quà lý tưởng cho Ngày của Mẹ, sinh nhật, kỷ niệm', 3, 11, CAST(N'2025-03-15T22:51:56.460' AS DateTime), CAST(N'2025-03-15T22:51:56.460' AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [image], [price], [description], [cid], [sub_id], [created_at], [updated_at]) VALUES (85, N'Máy rửa mặt 4 trong 1 METIS thiết kế mini giúp rửa mặt di tinh chất làm sạch đẹp da', N'https://down-vn.img.susercontent.com/file/vn-11134207-7ra0g-m7aok9w1iqnq63@resize_w900_nl.webp', 669000.0000, N'Nguồn: USB thười lượng sử dụng lên tới 8H

Chất liệu: vỏ nhựa + đá tự nhiên

Kích thước sản phẩm: 97mm * 75mm * 28mm

Trọng lượng sản phẩm: 73g

Cơ chế hoạt động: massage rung + ánh sáng hồng ngoại làm ấm 

CHỨC NĂNG CƠ BẢN CỦA SẢN PHẨM

Máy massage mặt lưu thông hệ bạch huyết, tuần hoàn máu, đào thải độc tố giảm bọng mắt và cải thiện sắc da hồng hào, trắng sáng

Máy massage nóng kích thích nâng cơ, giảm chảy xệ và thon gọn mặt đồng thời kích thích tái sinh collagen trẻ hóa da

Đặc tính đá thiên nhiên tốt cho sức khỏe, kinh mạch, tiêu trừ các bức xạ hay từ trường xấu trên da mặt

Máy massage có kích cỡ nhỏ gọn và sang trọng thích hợp mang theo bên mình để massage mọi lúc mọi nơi khi căng thẳng mệt mỏi

NGOÀI CHỨC NĂNG DI TINH CHẤT MÁY CÒN CÓ ĐẦU RỬA MẶT MỀM MẠI. SẢN PHẨM CHẤT LƯỢNG MANG LẠI SỰ TIỆN LỢIĐể khởi động hoặc tắt máy, bạn hãy giữ nút nguồn 3 giây.

Để sử dụng các chế độ của máy, bạn hãy tham khảo hướng dẫn sau:


* Bấm lần 1 ( đèn màu xanh): Rửa mặt - Nhẹ nhàng cho da nhạy cảm


* Bấm lần 2 ( đèn màu xanh): Rửa mặt - Mức độ vừa phải


* Bấm lần 3 ( đèn màu xanh): Rửa mặt - Làm sạch sâu cho da thường


Bạn hãy chọn chế độ rửa mặt phù hợp với làn da của mình. Chúng mình khuyến khích bạn nên chọn chế độ nhẹ nhàng cho da nhạy cảm trước nhé.


* Bấm lần 4 ( đèn màu đỏ): Đẩy tinh chất - Nhiệt độ 42*


Hãy đợi 15 giây để máy lên nhiệt. Bạn có thể xoa tinh chất (serum) bằng tay trước rồi dùng máy đẩy cho thấm sâu hơn, hoặc trực tiếp bôi tinh chất lên mặt inox để thoa lên da trong 2 phút.


* Bấm lần 5 (đèn vừa xanh vừa đỏ): Massage rung ấm trên da mặt


Sau khi bôi kem dưỡng da, bạn hãy bấm sang nút thứ 5 và đưa máy di chuyển trên da theo hướng từ dưới lên trên. Riêng khu vực đường rãnh giữa mũi và miệng, bạn hãy đưa máy chéo sang hai bên nhé.**LƯU Ý									


- Nếu da có mụn sưng viêm nặng: nên sử dụng tính năng rửa mặt 1 tuần cho bớt sưng viêm sau đố mới đẩy tinh chất (mụn nhỏ, mụn thường đẩy tinh chất bình thường)									


- Sử dụng tính năng đẩy tinh chất với mặt nạ: mức nhiệt của máy là an toàn cho da nên khi qua 1 lớp mặt nạ giấy thì mức nhiệt sẽ giảm đi 1 chút -> mở chế độ đẩy tinh chất 1 phút để mặt inox nóng hẳn lên rồi đắp mặt nạ và di đều máy xung quanh mặt trong vòng 3 phút để đạt hiệu quả tốt nhất									


- Chế độ massage nâng cơ: mức nhiệt phù hợp với mức độ nhạy cảm của da. Máy ấm trên toàn bộ mặt inox tráng gương, càng để lâu tỏa nhiệt từ lõi lên mặt inox càng nhiều. Nếu da có mụn sưng nhạy cảm: đợi nhiệt lên trong vòng 15-30s và sử dụng. Nếu muốn ấm nóng hơn: đợi nhiệt lên trong vòng 1-2 phút', 3, 11, CAST(N'2025-03-15T22:51:56.460' AS DateTime), CAST(N'2025-03-15T22:51:56.460' AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [image], [price], [description], [cid], [sub_id], [created_at], [updated_at]) VALUES (86, N'Máy Chăm Sóc Da Nóng Lạnh Đẩy Tinh Chất Trị Liệu Ánh Sáng, Làm Trẻ Hóa Da Sạch Sâu Bảo Hành ', N'https://down-vn.img.susercontent.com/file/sg-11134201-22110-qa0664lkuzjv0f@resize_w900_nl.webp', 500000.0000, N'⚡Đặᴄ đɪểᴍ ᴠượᴛ ᴛʀộɪ ᴄủᴀ ᴍáʏ ᴄʜăᴍ sóᴄ ᴅᴀ ɴóɴɢ ʟạɴʜ  

 𝟷. ᴄôɴɢ ɴɢʜệ ɪᴏɴ ᴋếᴛ ʜợᴘ ɴʜɪệᴛ ɴóɴɢ 𝟺𝟻 độ ᴄ: ᴋíᴄʜ ᴛʜíᴄʜ ᴄáᴄ ᴅưỡɴɢ ᴄʜấᴛ ᴛʜấᴍ sâᴜ ᴠàᴏ ʜạ ʙì ᴅᴀ, ᴛăɴɢ ɢấᴘ 𝟹.𝟻 ʟầɴ ʜɪệᴜ ǫᴜả ɢɪảᴍ ᴛʜâᴍ ᴠà ᴅưỡɴɢ ᴛʀắɴɢ sᴏ ᴠớɪ ᴛʜᴏᴀ ᴛᴀʏ ᴛʜôɴɢ ᴛʜườɴɢ

 𝟸. xᴜɴɢ đɪệɴ ᴇᴍs: ɴâɴɢ ᴄơ ᴍặᴛ, ᴛʀẻ ʜóᴀ ᴅᴀ, ɢɪúᴘ ᴄảɪ ᴛʜɪệɴ ɴếᴘ ɴʜăɴ, ʟàᴍ ᴄăɴɢ ʙóɴɢ ᴅᴀ

 𝟹. sóɴɢ ʀᴜɴɢ ғ-ᴠɪʙʀᴀᴛɪᴏɴ: ᴄảɪ ᴛʜɪệɴ ᴛᴜầɴ ʜᴏ.àɴ ᴍá.ᴜ, ɴâɴɢ ᴄơ ᴠà ʟàᴍ săɴ ᴄʜắᴄ ᴅᴀ

 𝟺. ᴄʜế độ ʟàᴍ ʟạɴʜ: ᴍáᴛ xᴀ ᴅᴀ ᴛʜư ɢɪãɴ, ᴋʜóᴀ ᴅưỡɴɢ ᴠà sᴇ ᴋʜíᴛ ʟỗ ᴄʜâɴ ʟôɴɢ

 𝟻. Áɴʜ sáɴɢ sɪɴʜ ʜọᴄ xᴀɴʜ ᴠà đỏ: ᴄảɪ ᴛʜɪệɴ sắ.ᴄ ᴛ.ố ᴅᴀ, ᴛăɴɢ sɪɴʜ ᴄᴏʟʟᴀ.ɢᴇɴ, ᴋʜá.ɴɢ ᴠɪê.ᴍ, ɴɢăɴ ɴɢừᴀ ᴍ.ụɴ

 𝟼. 𝟻 ᴄʜế độ ʟàᴍ đẹᴘ, 𝟹 ᴄấᴘ độ ᴍạɴʜ ɴʜẹ, ᴀɴ ᴛᴏàɴ ᴄʜᴏ ᴄả ʟàɴ ᴅᴀ ɴʜạʏ ᴄảᴍ.

ᴍáʏ ᴄʜăᴍ sóᴄ ᴅᴀ ɴóɴɢ ʟạɴʜ ᴄó 𝟻 ᴄʜế độ ᴄʜăᴍ sóᴄ ᴄʜᴜʏêɴ sâᴜ, ʜᴏàɴ ᴄʜỉɴʜ ᴄʜᴜ ᴛʀìɴʜ ᴄʜăᴍ sóᴄ ᴠà ᴅưỡɴɢ ᴛʀắɴɢ ᴅᴀ ᴄủᴀ ʙạɴ:

 ⚡ ᴄʜế độ ᴄʟᴇᴀɴ ( ʟàᴍ sạᴄʜ) : ᴛʜờɪ ɢɪᴀɴ 𝟻 ᴘʜúᴛ

sử ᴅụɴɢ ɴʜɪệᴛ ʟàᴍ ɴóɴɢ+ʀᴜɴɢ ᴛầɴ số ᴄᴀᴏ(sᴏɴɪᴄ) ᴋếᴛ ʜợᴘ ᴠớɪ ʙôɴɢ ᴠà ᴍỹ ᴘʜẩᴍ ᴅạɴɢ ɴướᴄ để ʟàᴍ sạᴄʜ ᴅᴀ.

- ɴʜɪệᴛ ᴛạᴏ ʀᴀ ᴛừ ᴍáʏ ʟàᴍ ʙụɪ ʙẩɴ ʙáᴍ ᴠàᴏ ʟỗ ᴄʜâɴ ʟôɴɢ ᴅễ ᴅàɴɢ ʀơɪ ʀᴀ. ᴋếᴛ ʜợᴘ ᴠớɪ ʀᴜɴɢ sᴏɴɪᴄ ᴛầɴ số ᴄᴀᴏ sẽ đáɴʜ ʙậᴛ ᴄáᴄ ʙụɪ ʙẩɴ ᴛừ sâᴜ ʙêɴ ᴅướɪ ʟỗ ᴄʜâɴ ʟôɴɢ ʀᴀ ɴɢᴏàɪ.

 ⚡ ᴄʜế độ ᴄᴏᴏʟ sử ᴅụɴɢ ᴠớɪ đèɴ ʟᴇᴅ xᴀɴʜ(ʟàᴍ ʟạɴʜ) : ᴛʜờɪ ɢɪᴀɴ 𝟸 ᴘʜúᴛ: sᴇ ʟỗ ᴄʜâɴ ʟôɴɢ, ɢɪữ độ ẩᴍ ᴄʜᴏ ᴅᴀ, ʟᴇᴅ ʙʟᴜᴇ ʙướᴄ sóɴɢ 𝟺𝟽𝟶ɴᴍ ᴄó ᴛáᴄ ᴅụɴɢ ɢɪảᴍ ᴍụɴ ᴛʀứɴɢ ᴄá, ᴛɪêᴜ ᴅɪệᴛ ᴠà ɴɢăɴ ɴɢừᴀ ᴠɪ ᴋʜᴜẩɴ ᴛʀêɴ ᴅᴀ, ɴɢăɴ sẹᴏ ᴍớɪ ʜìɴʜ ᴛʜàɴʜ.

 ⚡ ᴄʜế độ ᴇᴍs ᴜᴘ : (ɴâɴɢ ᴄơ ᴍặᴛ) ᴛʜờɪ ɢɪᴀɴ 𝟻 ᴘʜúᴛ

ᴋʜɪ sử ᴅụɴɢ ᴄʜế độ ɴàʏ, ᴅᴀ sẽ ᴄảᴍ ɢɪáᴄ ɴʜư ɢɪậᴛ đɪệɴ ɴʜẹ.

ᴠớɪ ᴠɪệᴄ áᴘ ᴅụɴɢ ᴅòɴɢ xᴜɴɢ đɪệɴ ᴍɪᴄʀᴏ ᴇᴍs ᴄáᴄ ᴛầɴ số ᴛừ ᴛʜấᴘ đếɴ ᴄᴀᴏ, ᴋʜôɴɢ ᴄʜỉ ᴄó ᴘʜầɴ ᴄơ ᴛʀêɴ ʙề ᴍặᴛ ᴅᴀ, ᴍà ᴄả ᴘʜầɴ ᴄơ ở sâᴜ ʙêɴ ᴅướɪ ᴄũɴɢ đượᴄ ᴋíᴄʜ ᴛʜíᴄʜ ɢɪúᴘ ᴄơ ᴍặᴛ đượᴄ ᴄăɴɢ ʟêɴ.

STORE EVA CAM KẾT CHÍNH SÁCH BÁN HÀNG TỐT NHẤT ĐẾN TAY NGƯỜI TIÊU DÙNG:

   1- Sản phẩm 100% giống hình ảnh, mô tả

   2- Hàng hóa trước khi giao đến tay khách hàng đều được kiểm tra kỹ càng, cẩn thận và đóng gói chắc chắn

   3- Tư vấn nhiệt tình, đầy đủ và chân thật nhất về sản phẩm 24/7 để khách hàng có thể hiểu rõ nhất về sản phẩm

   4- Hàng được đặt luôn có sẵn tại kho, sẽ giao cho ĐVVC sớm nhất trong ngày

   5- Hoàn tiền, hỗ trợ bảo hành đầy đủ cho khách hàng kể từ 7 ngày khi nhận sản phẩm

 ', 3, 11, CAST(N'2025-03-15T22:51:56.460' AS DateTime), CAST(N'2025-03-15T22:51:56.460' AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [image], [price], [description], [cid], [sub_id], [created_at], [updated_at]) VALUES (87, N'Máy Cà Da Chết ion - Dùng Trong SPA - TMV', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lz2ta1cwdj8h3c@resize_w900_nl.webp', 210000.0000, N'- SHOPSPA- CUNG CẤP THIẾT BỊ THẨM MỸ CHÍNH HÃNG 
.....................................................................................................................
- Không tẩy da chết thường xuyên làm sạch da là nguyên nhân chính dẫn đến các bệnh lý về da. 
- Giải pháp cho các chị e đây cá nhân hay spa dùng đều dùng được. 
- Máy cà da chết, sủi da, kết hợp điện di ion hiệu quả vừa #tẩy_da_chết vừa #điện_di_ion 
- Máy tích điện tiện dụng dễ sử dụng', 3, 11, CAST(N'2025-03-15T22:51:56.460' AS DateTime), CAST(N'2025-03-15T22:51:56.460' AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [image], [price], [description], [cid], [sub_id], [created_at], [updated_at]) VALUES (88, N'Máy đẩy tinh chất massage nâng cơ mặt bằng sóng siêu âm, máy tẩy trang điện di tinh chất bằng ánh sáng sinh học', N'https://down-vn.img.susercontent.com/file/vn-11134207-7ra0g-m7933j3ocq2k3a@resize_w900_nl.webp', 169000.0000, N'Máy massage mặt 4 in 1, dụng cụ spa chăm sóc da
CHỨC NĂNG
1. Làm sạch sâu, sạch bụi siêu nhỏ 2.5 micromet, sạch phần dư thừa của lớp trang điểm và bã nhờn từ đó loại bỏ nguyên nhân ngây mụn.
2. Massage nóng (đẩy dưỡng): Thúc đẩy khả năng hấp thụ gấp đôi các sản phẩm chăm sóc da. Tổ hợp chức năng ion âm + rung sonic + nén nhiệt sẽ đẩy tinh chất trực tiếp cho da, tăng cường khả năng hiệu quả của tinh chất lên gấp 2 lần. Chức năng này các bạn có thể sử dụng với mặt nạ dưỡng da nha.
3. Nâng cơ EMS có thể làm giảm phù nề, cải thiện nếp nhăn và tăng độ đàn hồi cho da.
4.  Ánh sáng đỏ trẻ hóa và làm trắng da: làm cho da mịn màng và đầy đặn. Ánh sáng đỏ có khả năng đi sâu vào lớp cơ kích thích da sản sinh collagen và estatin từ đó thúc đẩy nhanh quá trình trẻ hóa cho làn da đã lão hóa.
5. Ánh sáng xanh ức chế sự phát triển của mụn
6. Massage quanh mắt, xóa mờ nếp nhăn, thư giãn

HƯỚNG DẪN SỬ DỤNG:
1.Nhấn nút nguồn 3 giây để bật, không sử dụng máy trong lúc sạc.
2.Tay để vị trí hai thanh cảm biến bằng kim loại 2 bên thân máy.
3.Ấn nút nguồn để chuyển chế độ khác
4.Ấn nút quạt gió để tăng hoặc giảm cấp độ
#dungculamdep #dungcuchamsocdamat #skincare #maylamsachdatainha #maymassagemat#dienditinhchat #matxa #taytrang #duongchat #maydaytinhchat #chonglaohoa #trehoalanda #nangco #duongtrang #nguanepnhan #sekhitlochanlong #lamsachsau #thongon#maymatxa#maylamda#ruamat#maymat#maylammat

***Máy đẩy tinh chất có 4 chức năng chính :
- Chế độ làm sạch da
- Chế độ ánh sáng  ( ánh sáng đỏ)
- Chế độ đưa tinh chất (ánh sáng xanh)
- Chế độ chăm sóc mắt', 3, 11, CAST(N'2025-03-15T22:51:56.460' AS DateTime), CAST(N'2025-03-15T22:51:56.460' AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [image], [price], [description], [cid], [sub_id], [created_at], [updated_at]) VALUES (89, N'Viên uống hỗ trợ miễn dịch, tăng sinh collagen Now L-Lysine 1000mg 100 viên', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-ltdbvsxporyxc9@resize_w900_nl.webp', 370000.0000, N'- Dạng bào chế: Dạng viên

- Quy cách: Hộp 100 viên

THÀNH PHẦN:

- L-Lysine (form L-Lysine Hydrochloride) 1000mg.

- Thành phần khác gồm: Microcrystalline Cellulose, Silicon Dioxide, Stearic Acid (vegetable source), Cellulose, Croscarmellose Sodium, Magnesium Stearate (vegetalbe source).

CÔNG DỤNG:

- Hỗ trợ việc điều chỉnh giảm mất cân bằng nội tiết – là nguyên nhân gây ra mụn, rụng tóc. Dùng L-Lysine kết hợp với collagen giảm mụn hiệu quả, ngăn tình trạng rụng tóc

- Hỗ trợ tổng hợp collagen: L-Lysine là nguyên liệu cần thiết để sản sinh collagen, đồng thời ngăn chặn sự hoạt động của các enzym tiêu thụ collagen,  làm quá trình phá hủy collagen trong cơ thể bị chậm đi

- Giúp giảm stress hiệu quả: L-Lysine tăng mức độ chất dẫn truyền thần kinh có tên gọi là hocmon hạnh phúc, giúp ăn ngon, ngủ ngon hơn, vui vẻ hơn…. 

- L-lysine giúp tăng hấp thụ canxi, tăng lượng kháng thể giúp hệ miễn dịch tốt hơn, đồng thời giúp mụn nhanh lành

- Nếu bạn nào đang sử dụng sắt và zinc (kẽm) thì nên dùng l-lysine kèm theo để tăng hiệu quả sử dụng vì L-Lysine tăng tính hấp thu 2 chất này: sắt, kẽm

HƯỚNG DẪN SỬ DỤNG

- Dùng 1 viên/lần, 1-3 lần/ngày (tùy theo lượng cần thiết của cơ thể).

- Sử dụng đều đặn hàng ngày để thấy rõ hiệu quả.

- Trong khi sử dụng sản phẩm nên hạn chế thức khuya và cần ăn uống điều độ.

CAM KẾT CỦA SHOP:

- Cam kết phân phối sản phẩm 100% chính hãng, nhập khẩu chính ngạch, đầy đủ giấy tờ tem niêm phong và tem phụ Tiếng Việt,...

- Hỗ trợ đổi trả trong vòng 07 ngày nếu sản phẩm gặp các vấn đề lỗi từ phía nhà sản xuất, sản phẩm gặp vấn đề trong quá trình vận chuyển.

- Sản phẩm đổi trả phải còn nguyên mác niêm phong, chưa qua sử dụng.

- Khách hàng nên quay lại quá trình mở kiện hàng vận chuyển để thuận tiện hơn trong quá trình đổi, trả hàng nếu có sai sót ở sản phẩm.

- Khi đổi trả sản phẩm, nếu không phải lỗi sản phẩm hay shop giao sai sản phẩm, quý khách vui lòng trả phí vận chuyển. 

Sản phẩm không phải là thuốc và không có tác dụng thay thế thuốc chữa bệnh.', 3, 12, CAST(N'2025-03-15T22:52:11.270' AS DateTime), CAST(N'2025-03-15T22:52:11.270' AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [image], [price], [description], [cid], [sub_id], [created_at], [updated_at]) VALUES (90, N'Viên sủi KUDOS EXTRA bổ sung 18 vitamin và khoáng chất hỗ trợ tăng đề kháng, năng lượng tức thì (20 viên/tuýp)', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lx9f3ammov6j78@resize_w900_nl.webp', 122850.0000, N'Điểm nổi bật:

-       Sản xuất tại Đức, tiêu chuẩn chất lượng Châu Âu

-       Không chứa lactose, gluten và dùng được cho người ăn chay

Công dụng: 

Bổ sung vitamin (B1, B2, B3, B5, B6, B8, B9, B12, C, E) và khoáng chất (magnesi, kẽm, mangan, đồng, iod, selen, crom) cho cơ thể. 

Thành phần 

Trong mỗi viên sủi 4,1 g chứa: Calci (Calci carbonat) 120 mg, Vitamin C (Acid L-ascorbic) 100 mg, Magnesi (Magnesi carbonat) 56 mg, Chiết xuất nhân sâm 50 mg, Niacin (Nicotinamid) 16 mg NE, Vitamin E (DL-alpha-tocopheryl acetat) 12 mg α-TE, Acid pantothenic (D-pantothenat, calci) 6 mg, Kẽm (Kẽm citrat) 5 mg, Vitamin B6 (Pyridoxin hydroclorid) 5 mg, Vitamin B1 (Thiamin mononitrat) 3 mg, Mangan (Mangan sulfat) 2 mg, Vitamin B2 (Riboflavin) 2 mg, Đồng (Đồng sulfat) 1 mg, Acid folic (Acid pteroymonoglutamic) 200 µg, Biotin (D-Biotin) 150 µg, Iod (Kali iodat) 100 µg, Selen (Natri selenit) 55 µg, Crom (Crom (III) clorid) 40 µg, Vitamin B12 (Cyanocobalamin) 5 µg. 

Phụ liệu: Chất điều chỉnh độ acid: acid citric, natri hydro carbonat, kali hydro carbonat; chất độn: 

sorbitol, maltodextrin, bột nước ép củ dền; chất tạo ngọt tổng hợp: natri cyclamat; hương liệu tổng hợp 

(hương trái cây nhiệt đới); chất tạo ngọt tổng hợp: natri saccharin 

●      Đối tượng sử dụng:  Người trưởng thành có nhu cầu bổ sung vitamin và khoáng chất.

●      Hướng dẫn sử dụng: Dùng 1 viên mỗi ngày, hòa tan trong một cốc nước (200 ml)

●      Bảo quản: Bảo quản dưới 25oC ở nơi khô ráo và đậy nắp kín

Chú ý:

• Thực phẩm này không phải là thuốc, không có tác dụng thay thế thuốc chữa bệnh.

• Không dùng cho người mẫn cảm, kiêng kỵ với bất cứ thành phần nào của sản phẩm.

• Phụ nữ có thai, đang cho con bú, người bị viêm loét dạ dày, tá tràng, nên tham khảo ý kiến bác sĩ, chuyên gia y tế trước khi dùng.

• Không dùng quá liều khuyến nghị hàng ngày.

• Không phù hợp cho trẻ em dưới 14 tuổi. Để xa tầm tay trẻ nhỏ.

• Không dùng sản phẩm sau ngày hết hạn.

• Sản phẩm là thực phẩm bảo vệ sức khỏe chứa vitamin, khoáng chất và chất tạo ngọt. 

• Thực phẩm bảo vệ sức khỏe không thay thế cho chế độ ăn uống đa dạng cân bằng và lối sống lành mạnh.

• Sản phẩm không chứa lactose, gluten và thân thiện với người ăn chay.

Thời hạn sử dụng: 36 tháng kể từ ngày sản xuất

NSX, HSD: Xem “MFD” và “EXP” ở đáy tuýp.

Khối lượng tịnh: 82 g (20 viên/tuýp x 4,1 g/viên)

Xuất xứ: Đức', 3, 12, CAST(N'2025-03-15T22:52:11.270' AS DateTime), CAST(N'2025-03-15T22:52:11.270' AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [image], [price], [description], [cid], [sub_id], [created_at], [updated_at]) VALUES (91, N'Viên uống Trắng da DHC Nhật Bản Adlay Extract', N'https://down-vn.img.susercontent.com/file/2970dc4fe94abf29fff64cffaaf5d1ae@resize_w900_nl.webp', 129000.0000, N'Viên uống Trắng da DHC Nhật Bản Adlay Extract

Thương hiệu: DHC

Xuất Xứ: Nhật Bản

Quy cách: Gói 15 viên, Gói 20 viên & Gói 30 viên

Công dụng của Viên uống trắng da DHC

- Làm trắng da, bổ sung và dưỡng ẩm cho da giúp ngăn ngừa hiện tượng khô da và da nứt nẻ

- Bổ sung các dưỡng chất cho da như: Vitamin E, Vitamin B1, B12, axit linoleic, axit palmitic, axit stearic, axit cis-8-oc-tadecenoic … giúp làm mềm và dưỡng ẩm, ngăn ngừa các dấu hiệu lão hóa da, loại bỏ các vết thâm đen

- Giúp ngăn ngừa nám da, làm mờ thâm sẹo, phục hồi tổn thương do tia UV gây ra, khôi phục lại sức sống cho làn da, tránh được tối đa sự hình thành những đốm nâu, tàn nhang

- Ngăn ngừa sự tích lũy của mỡ thừa, giúp duy trì vóc dáng thon gọn

- Giúp lợi tiểu, làm giảm thiểu sưng phù và giúp làm da tươi sáng, giảm vết thâm nám da hiệu quả

Thành phần của Viên uống trắng da Coix Extract DHC

Hàm lượng trong 1 viên: 555mg

- Dinh dưỡng: 3,2 kcal

- Đạm: 0,14 g

- Chất béo: 0,21 g

- Tinh bột: 0,18 g

- Natri: 0,52 mg

- Vitamin E (d-α tocopherol): 10 mg

- Bột chiết xuất lúa mạch: 170 mg

Cách sử dụng Viên uống trắng da DHC

- Uống 1 viên/ ngày

- Tốt nhất vào buổi tối trước khi đi ngủ

- Uống với nước hoặc nước ấm

Hạn sử dụng: 36 tháng kể từ ngày sản xuất.

Lưu ý: Bảo quản nơi khô ráo, thoáng mát, tránh những nơi ẩm ướt, tránh để viên uống trắng da DHC ở những nơi có nhiệt độ cao và tránh ánh nắng mặt trời

-	Sản phẩm này không phải là thuốc, không có tác dụng thay thế thuốc chữa bệnh.

', 3, 12, CAST(N'2025-03-15T22:52:11.270' AS DateTime), CAST(N'2025-03-15T22:52:11.270' AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [image], [price], [description], [cid], [sub_id], [created_at], [updated_at]) VALUES (92, N'Thực phẩm bảo vệ sức khỏe InnerB Aqua Bank (giữ ẩm cho da từ Axit Hyaluronic) lọ 56viên', N'https://down-vn.img.susercontent.com/file/vn-11134201-7r98o-lwzdukyk5hax15@resize_w900_nl.webp', 304000.0000, N'Công dụng:


- Bổ sung Hyaluronic Acid cho làn da

- Mang đến cho da mềm mịn đủ nước

- Cải thiện nếp gấp, nếp nhăn, rãnh sâu

- Hỗ trợ làm sáng da, cải thiện da tươi tắn và khỏe mạnh, đàn hồi

Đối tượng sử dụng:

- Phù hợp với mọi loại da

- Phù hợp cho độ tuổi từ 20 trở lên

Quy cách đóng gói: Lọ 16.8g - 56 viên 

Hạn sử dụng: 24 tháng kể từ ngày sản xuất

***Khuyến cáo sản phẩm này không phải là th.u.ốc và không có tác dụng thay thế th.u.ốc c.h.ữa bệnh.

Thương hiệu: InnerB

Xuất xứ thương hiệu: Hàn Quốc

Sản xuất tại: Hàn Quốc', 3, 12, CAST(N'2025-03-15T22:52:11.270' AS DateTime), CAST(N'2025-03-15T22:52:11.270' AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [image], [price], [description], [cid], [sub_id], [created_at], [updated_at]) VALUES (93, N'Viên uống bổ sung vitamin tổng hợp Collagen Bunkka 120 viên chăm sóc sức khỏe và làn da', N'https://down-vn.img.susercontent.com/file/vn-11134207-7ras8-m4k3wi9u7drk07@resize_w900_nl.webp', 93000.0000, N'THÔNG TIN CHUNG
- Thành phần chính: Vitamin A (dưới dạng Retinyl Palmitate), Vitamin D (dưới dạng Cholecalciferol), Thiamin (vitamin B1 dưới dạng Thiamin HCl), Riboflavin (vitamin B2), Niacin (vitamin B3 dưới dạng Niacinamide), Vitamin B6 (dưới dạng Pyridoxine HCl), Folate (200 mcg Folic Acid), Vitamin B12 (dưới dạng Methylcobalamin), Biotin, Pantothenic Acid (dưới dạng Calcium D-Pantothenate), Calcium (dưới dạng Tricalcium Phosphate), Phosphorus (dưới dạng Tricalcium Phosphate), Hỗn hợp Proprietary (Collagen Cá, Methylsulfonylmethane (MSM), Collagen Thủy Phân Loại II và III, Chiết xuất Tre (Bambusa vulgaris) (thân và lá) (chuẩn đến 70% silica), Dầu Dừa (Cocos Nucifera), Chiết xuất Cây Tầm Gai (Urtica Dioica) (rễ), Chiết xuất Hạt Nho (Vitis Vinifera), Acid Hyaluronic (dưới dạng Sodium Hyaluronate)), Glutathione, Gelatin, Microcrystalline Cellulose.
- Thương hiệu: Bunkka Hoa Kỳ
- Dạng: Viên nang
- Mùi vị: Không vị - tự nhiên
- Dung tích: 120 viên

LỢI ÍCH SẢN PHẨM
- Hỗ trợ sức khỏe mắt: Nhờ vào Vitamin A, giúp duy trì thị lực và bảo vệ mắt khỏi các tác nhân gây hại, mang lại đôi mắt sáng khỏe.
- Tăng cường hệ miễn dịch: Nhờ vào Vitamin D, giúp cơ thể chống lại các bệnh nhiễm trùng và duy trì sức khỏe xương, hỗ trợ cơ thể khỏe mạnh từ trong ra ngoài.
- Hỗ trợ chuyển hóa năng lượng: Nhờ vào Thiamin, Riboflavin, Niacin, Vitamin B6 và B12, giúp cơ thể chuyển hóa thực phẩm thành năng lượng hiệu quả, mang lại nguồn năng lượng dồi dào.
- Hỗ trợ sức khỏe da, tóc và móng: Nhờ vào Biotin, giúp duy trì sự khỏe mạnh và vẻ đẹp tự nhiên của da, tóc và móng, mang lại sự tự tin với làn da mịn màng và mái tóc bóng mượt.
- Hỗ trợ sức khỏe xương và răng: Nhờ vào Calcium và Phosphorus, giúp duy trì cấu trúc xương và răng chắc khỏe, phòng ngừa các bệnh về xương.
- Hỗ trợ sức khỏe khớp và da: Nhờ vào Collagen và Acid Hyaluronic, giúp duy trì độ đàn hồi và độ ẩm cho da, đồng thời hỗ trợ sức khỏe khớp, mang lại vẻ ngoài tươi trẻ và sức khỏe bền vững.

HƯỚNG DẪN SỬ DỤNG:
- Uống 2 viên mỗi ngày, tốt nhất là trong bữa ăn hoặc theo chỉ dẫn của chuyên gia y tế.
- Bảo quản: Nơi khô ráo, thoáng mát, tránh ánh nắng trực tiếp và xa tầm tay trẻ em.
- Lưu ý: Sản phẩm này không phải là thuốc, không có chức năng thay thế thuốc chữa bệnh.', 3, 12, CAST(N'2025-03-15T22:52:11.270' AS DateTime), CAST(N'2025-03-15T22:52:11.270' AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [image], [price], [description], [cid], [sub_id], [created_at], [updated_at]) VALUES (94, N'Collagen uống thủy phân dạng sủi chiết xuất da cá tuyết cao cấp nhật bản trẻ hóa sáng da lọ 20 viên NYOKO PHARM', N'https://down-vn.img.susercontent.com/file/vn-11134207-7ras8-m11548ir47fje3@resize_w900_nl.webp', 189000.0000, N'Collagen uống thủy phân dạng sủi chiết xuất da cá tuyết cao cấp nhật bản trẻ hóa sáng da lọ 20 viên NYOKO PHARM

1. THÔNG TIN SẢN PHẨM

- Tên: Viên Sủi Collagen Peptide Type S Hương Táo

- Thương hiệu: Nyoko Pharm

- Xuất xứ: Việt Nam

- Quy cách: Hộp 1 Lọ 20 Viên/lọ

- NSX: in trên bao bì sản phẩm

- HSD: 36 tháng từ ngày sản xuất

- Đối tượng sử dụng: Người trưởng thành muốn đẹp da. Người khô da, nhăn da, nám da
2. Thành phần

Thành phần cho 1 viên : Fish collagen peptide type S 1250mg, glutathione 250mg, Vitamin C 100mg, Acid hyaluronic 10mg, và các phụ liệu khác (in trên bao bì sản phẩm)

- Collagen thủy phân hiệu quả gấp 7 lần collagen thường

- Da cá tuyết ít chất béo không làm tăng cân như collagen thông thường

- Vitamin C : môi trường giúp collagen phát huy tối đa hiệu quả làm đẹp', 3, 12, CAST(N'2025-03-15T22:52:11.270' AS DateTime), CAST(N'2025-03-15T22:52:11.270' AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [image], [price], [description], [cid], [sub_id], [created_at], [updated_at]) VALUES (95, N'Viên uống Esunvy Hỗ trợ hạn chế thâm nám da, giảm bã nhờn, giảm mụn hộp 30v', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lwjkkkjcbaop01@resize_w900_nl.webp', 105000.0000, N'
CÔNG DỤNG
– Hỗ trợ thanh nhiệt, hỗ trợ giải độc, hỗ trợ tăng cường chức năng gan.

– Hỗ trợ hạn chế thâm nám da, hỗ trợ giảm bã nhờn, hỗ trợ giảm mụn.

– Hỗ trợ phục hồi vùng da bị tổn thương do mụn.

*Thực phẩm này không phải là thuốc và không có tác dụng thay thế thuốc chữa bênh.

CÁCH DÙNG
Uống 1 viên/lần × 2 lần/ngày.

*Lưu ý: Không sử dụng cho người mẫn cảm với bất kỳ thành phần nào của sản phẩm.

ĐỐI TƯỢNG SỬ DỤNG
Các trường hợp bị bã nhờn trên da, bị các loại mụn: mụn trứng cá, mụn viêm, mụn cám, mụn đầu trắng, mụn đầu đen, mụn mủ, mụn bọc.', 3, 12, CAST(N'2025-03-15T22:52:11.270' AS DateTime), CAST(N'2025-03-15T22:52:11.270' AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [image], [price], [description], [cid], [sub_id], [created_at], [updated_at]) VALUES (96, N'Viên Uống Trắng Da Glutathione Mix Collagen GC Hàn Quốc Lọ 60 Viên Giúp Trắng Da Sáng Ngời Và Duy Trì Làn Da Khỏe Mạnh', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lv5rlhnpczjt5c@resize_w900_nl.webp', 292000.0000, N'Viên Uống Trắng Da GLUTATHIONE MIX COLLAGEN Giúp Trắng Da Sáng Ngời Và Duy Trì Làn Da Khỏe Mạnh

*** Thông Tin Sản Phẩm:

 - Xuất Xứ: Hàn Quốc

 - Quy Cách: Lọ 60 Viên

 - Hàm lượng Glutathione: 600mg

 - Collagen Peptide 3000DA: Dưỡng ẩm, duy trì làn da khỏe mạnh chống lại tác động của tia UV.

 - Các Thành Phần Bổ Sung: Hyaluronic Acid, Vitamin C, Biotin, Tinh Chất từ Quả Cà Chua Trắng để bảo vệ tế bào khỏi oxy hóa.

*** Đặc Điểm Nổi Bật.

 - Kiểm soát sắc tố melanin với Vitamin C và Glutathione.

 - Cải thiện độ đàn hồi da với Collagen Peptide 3.000DA.

 - Phục hồi da, tóc, móng với Biotin, Prolastin, Tinh Chất từ Quả Cà Chua Trắng, Sữa Ceramide.

CÔNG DỤNG SẢN PHẨM: 

  - Giúp làn da trở nên mịn màng, căng bóng, trắng sáng và tràn đầy sức sống.

  - Chống oxy hóa, giúp bảo vệ làn da nhạy cảm khỏi những tác động xấu từ bên ngoài như: khói bụi, vi khuẩn, tia cực tím từ ánh mắt mặt trời,…

  - Dưỡng ẩm cho da, giúp làn da duy trì độ chắc khỏe, đàn hồi, mềm mịn. Tránh được tình trạng da khô, nứt nẻ, bong tróc.

  - Ngăn ngừa và giúp làm chậm lại quá trình lão hóa da. Đồng thời, sản phẩm còn giúp hạn chế những khuyết điểm về da như nếp nhăn, thâm sạm, tàn nhang.

 HƯỚNG DẪN SỬ DỤNG:

  - Ngày uống 1 - 2 viên sau ăn sáng. Liệu trình 3 hộp sau đó ngưng để hấp thụ sau đó có thể sử dụng tiếp.

Lưu Ý: Thực Phẩm Này Không Phải Là Thuốc, Không Có Tác Dụng Thay Thế Thuốc Chữa Bệnh', 3, 12, CAST(N'2025-03-15T22:52:11.270' AS DateTime), CAST(N'2025-03-15T22:52:11.270' AS DateTime))
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
SET IDENTITY_INSERT [dbo].[ShoppingCart] ON 

INSERT [dbo].[ShoppingCart] ([CartID], [ProductID], [ProductName], [Price], [Quantity]) VALUES (1, 1, N'Sữa Rửa Mặt Làm Trắng Da, Ngừa Mụn Senana 60g Trẻ Hóa, Kiểm Soát Dầu, Dưỡng Ẩm Lấy Sạch Bụi Bẩn A234', 123000, 2)
INSERT [dbo].[ShoppingCart] ([CartID], [ProductID], [ProductName], [Price], [Quantity]) VALUES (2, 2, N'Sữa rửa mặt Cerave Foaming, Hydrating, SA Smoothing Cleanser cho da dầu mụn, khô, nhạy cảm 88ML - 236ML - 473ML', 175000, 2)
INSERT [dbo].[ShoppingCart] ([CartID], [ProductID], [ProductName], [Price], [Quantity]) VALUES (3, 3, N'Sữa Rửa Mặt Trà Xanh Rau Má Sica White 100Ml, Ngăn Ngừa Và Hỗ Trợ Da Dầu Mụn - SICA WHITE', 38000, 2)
INSERT [dbo].[ShoppingCart] ([CartID], [ProductID], [ProductName], [Price], [Quantity]) VALUES (4, 4, N'Sữa Rửa Mặt Wonder Bath Balancing PHA 5.5 Cleansing Foam 130ml', 77000, 2)
SET IDENTITY_INSERT [dbo].[ShoppingCart] OFF
GO
SET IDENTITY_INSERT [dbo].[SubCategory] ON 

INSERT [dbo].[SubCategory] ([sub_id], [subname], [cid]) VALUES (1, N'Sữa rửa mặt', 1)
INSERT [dbo].[SubCategory] ([sub_id], [subname], [cid]) VALUES (2, N'Serum', 1)
INSERT [dbo].[SubCategory] ([sub_id], [subname], [cid]) VALUES (3, N'Kem dưỡng ẩm', 1)
INSERT [dbo].[SubCategory] ([sub_id], [subname], [cid]) VALUES (4, N'Kem chống nắng', 1)
INSERT [dbo].[SubCategory] ([sub_id], [subname], [cid]) VALUES (5, N'Sữa tắm dưỡng ẩm', 2)
INSERT [dbo].[SubCategory] ([sub_id], [subname], [cid]) VALUES (6, N'Tẩy tế bào chết body', 2)
INSERT [dbo].[SubCategory] ([sub_id], [subname], [cid]) VALUES (7, N'Tinh dầu thư giãn', 2)
INSERT [dbo].[SubCategory] ([sub_id], [subname], [cid]) VALUES (8, N'Dưỡng thể trắng da', 2)
INSERT [dbo].[SubCategory] ([sub_id], [subname], [cid]) VALUES (9, N'Mặt nạ', 3)
INSERT [dbo].[SubCategory] ([sub_id], [subname], [cid]) VALUES (10, N'Tẩy trang', 3)
INSERT [dbo].[SubCategory] ([sub_id], [subname], [cid]) VALUES (11, N'Dụng cụ chăm sóc da', 3)
INSERT [dbo].[SubCategory] ([sub_id], [subname], [cid]) VALUES (12, N'Thực phẩm chức năng', 3)
SET IDENTITY_INSERT [dbo].[SubCategory] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Account__AB6E61641269D350]    Script Date: 3/21/2025 9:19:09 PM ******/
ALTER TABLE [dbo].[Account] ADD UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Account__F3DBC57247AAAC47]    Script Date: 3/21/2025 9:19:09 PM ******/
ALTER TABLE [dbo].[Account] ADD UNIQUE NONCLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Account] ADD  DEFAULT ((0)) FOR [isSeller]
GO
ALTER TABLE [dbo].[Account] ADD  DEFAULT ((0)) FOR [isAdmin]
GO
ALTER TABLE [dbo].[Account] ADD  DEFAULT (getdate()) FOR [createdAt]
GO
ALTER TABLE [dbo].[Product] ADD  DEFAULT (getdate()) FOR [created_at]
GO
ALTER TABLE [dbo].[Product] ADD  DEFAULT (getdate()) FOR [updated_at]
GO
ALTER TABLE [dbo].[Contact]  WITH CHECK ADD  CONSTRAINT [FK_Contact_Account] FOREIGN KEY([UserID])
REFERENCES [dbo].[Account] ([uID])
GO
ALTER TABLE [dbo].[Contact] CHECK CONSTRAINT [FK_Contact_Account]
GO
ALTER TABLE [dbo].[Pay]  WITH CHECK ADD  CONSTRAINT [FK_Pay_Account] FOREIGN KEY([UserID])
REFERENCES [dbo].[Account] ([uID])
GO
ALTER TABLE [dbo].[Pay] CHECK CONSTRAINT [FK_Pay_Account]
GO
ALTER TABLE [dbo].[Pay]  WITH CHECK ADD  CONSTRAINT [FK_Pay_ShoppingCart] FOREIGN KEY([CardID])
REFERENCES [dbo].[ShoppingCart] ([CartID])
GO
ALTER TABLE [dbo].[Pay] CHECK CONSTRAINT [FK_Pay_ShoppingCart]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Category] FOREIGN KEY([cid])
REFERENCES [dbo].[Category] ([cid])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Category]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_SubCategory] FOREIGN KEY([sub_id])
REFERENCES [dbo].[SubCategory] ([sub_id])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_SubCategory]
GO
ALTER TABLE [dbo].[ShoppingCart]  WITH CHECK ADD  CONSTRAINT [FK_ShoppingCart_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ProductID])
GO
ALTER TABLE [dbo].[ShoppingCart] CHECK CONSTRAINT [FK_ShoppingCart_Product]
GO
ALTER TABLE [dbo].[SubCategory]  WITH CHECK ADD FOREIGN KEY([cid])
REFERENCES [dbo].[Category] ([cid])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD CHECK  (([price]>=(0)))
GO
USE [master]
GO
ALTER DATABASE [LUMISKIN] SET  READ_WRITE 
GO
