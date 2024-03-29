USE [master]
GO
/****** Object:  Database [Movie]    Script Date: 04/22/20 3:26:41 PM ******/
CREATE DATABASE [Movie]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Movie', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Movie.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Movie_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Movie_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Movie] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Movie].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Movie] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Movie] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Movie] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Movie] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Movie] SET ARITHABORT OFF 
GO
ALTER DATABASE [Movie] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Movie] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Movie] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Movie] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Movie] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Movie] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Movie] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Movie] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Movie] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Movie] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Movie] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Movie] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Movie] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Movie] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Movie] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Movie] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Movie] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Movie] SET RECOVERY FULL 
GO
ALTER DATABASE [Movie] SET  MULTI_USER 
GO
ALTER DATABASE [Movie] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Movie] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Movie] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Movie] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Movie] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Movie', N'ON'
GO
ALTER DATABASE [Movie] SET QUERY_STORE = OFF
GO
USE [Movie]
GO
/****** Object:  Table [dbo].[Banner]    Script Date: 04/22/20 3:26:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Banner](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[HinhAnh] [varchar](100) NULL,
	[IdPhim] [int] NULL,
	[Status] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ChiTietPhimBo]    Script Date: 04/22/20 3:26:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietPhimBo](
	[Id] [int] NOT NULL,
	[SoTap] [int] NOT NULL,
	[TenTapPhim] [nvarchar](100) NULL,
	[NgayPhatHanh] [date] NULL,
	[DuongDanPhim] [nvarchar](max) NULL,
	[LuotXem] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC,
	[SoTap] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DanhSachPhim]    Script Date: 04/22/20 3:26:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DanhSachPhim](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TenPhim] [nvarchar](100) NULL,
	[HinhAnh] [nvarchar](200) NULL,
	[NgayThem] [date] NULL,
	[NgayPhatHanh] [date] NULL,
	[TomTatNoiDung] [nvarchar](max) NULL,
	[DuongDanPhim] [nvarchar](max) NULL,
	[LuotXem] [int] NULL,
	[DanhGia] [float] NULL,
	[TheLoai] [int] NULL,
	[LoaiPhim] [int] NULL,
	[HienThi] [bit] NULL,
	[Tag] [nvarchar](100) NULL,
 CONSTRAINT [PK__DanhSach__3214EC07A874D650] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LoaiPhim]    Script Date: 04/22/20 3:26:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoaiPhim](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TenLoaiPhim] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LoaiTaiKhoan]    Script Date: 04/22/20 3:26:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoaiTaiKhoan](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TenLoai] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TaiKhoan]    Script Date: 04/22/20 3:26:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TaiKhoan](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](50) NULL,
	[HoTen] [nvarchar](100) NULL,
	[Email] [varchar](100) NULL,
	[MatKhau] [varchar](100) NULL,
	[Status] [int] NULL,
	[LoaiTaiKhoan] [int] NULL,
 CONSTRAINT [PK__TaiKhoan__3214EC07CE8696E5] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TheLoai]    Script Date: 04/22/20 3:26:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TheLoai](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TenTheLoai] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TuPhim]    Script Date: 04/22/20 3:26:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TuPhim](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idphim] [int] NULL,
	[iduser] [int] NULL,
 CONSTRAINT [PK_TuPhim] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Banner] ON 

INSERT [dbo].[Banner] ([Id], [HinhAnh], [IdPhim], [Status]) VALUES (1013, N'Mortal Kombat48.jpg', 1021, 1)
INSERT [dbo].[Banner] ([Id], [HinhAnh], [IdPhim], [Status]) VALUES (1015, N'Mortal Kombat48.jpg', 1021, 1)
SET IDENTITY_INSERT [dbo].[Banner] OFF
INSERT [dbo].[ChiTietPhimBo] ([Id], [SoTap], [TenTapPhim], [NgayPhatHanh], [DuongDanPhim], [LuotXem]) VALUES (1036, 1, NULL, CAST(N'2018-02-02' AS Date), N' <div itemscope itemtype="https://schema.org/VideoObject"><meta itemprop="uploadDate" content="Wed Apr 22 2020 02:50:14 GMT+0700 (Indochina Time)" /><meta itemprop="name" content="Birds Of Prey – Official Trailer 2" /><meta itemprop="duration" content="PT2M19.71S" /><meta itemprop="thumbnailUrl" content="https://content.jwplatform.com/thumbs/4rJ6XDE9-1280.jpg" /><meta itemprop="contentUrl" content="https://content.jwplatform.com/videos/4rJ6XDE9-3VdzlUrU.mp4" /><div style="position:relative; overflow:hidden; padding-bottom:56.25%"> <iframe src="https://cdn.jwplayer.com/players/4rJ6XDE9-NL5rjR4j.html" width="100%" height="100%" frameborder="0" scrolling="auto" title="Birds Of Prey – Official Trailer 2" style="position:absolute;" allowfullscreen></iframe> </div></div>', 22)
INSERT [dbo].[ChiTietPhimBo] ([Id], [SoTap], [TenTapPhim], [NgayPhatHanh], [DuongDanPhim], [LuotXem]) VALUES (1036, 2, NULL, CAST(N'2018-02-02' AS Date), N'<div itemscope itemtype="https://schema.org/VideoObject"><meta itemprop="uploadDate" content="Wed Apr 22 2020 03:12:08 GMT+0700 (Indochina Time)"/><meta itemprop="name" content="Sát Thủ Lưỡi Kéo - Scissor Seven Phần 2 Tập 4 Full Vietsubs- Hunglapis"/><meta itemprop="duration" content="PT13M34.301S" /><meta itemprop="thumbnailUrl" content="https://content.jwplatform.com/thumbs/qdlfq58p-1280.jpg"/><meta itemprop="contentUrl" content="https://content.jwplatform.com/videos/qdlfq58p-3VdzlUrU.mp4"/><div style="position:relative; overflow:hidden; padding-bottom:56.25%"> <iframe src="https://cdn.jwplayer.com/players/qdlfq58p-NL5rjR4j.html" width="100%" height="100%" frameborder="0" scrolling="auto" title="Sát Thủ Lưỡi Kéo - Scissor Seven Phần 2 Tập 4 Full Vietsubs- Hunglapis" style="position:absolute;" allowfullscreen></iframe> </div></div>', 23)
INSERT [dbo].[ChiTietPhimBo] ([Id], [SoTap], [TenTapPhim], [NgayPhatHanh], [DuongDanPhim], [LuotXem]) VALUES (1036, 3, NULL, CAST(N'2018-02-02' AS Date), N'<div itemscope itemtype="https://schema.org/VideoObject"><meta itemprop="uploadDate" content="Wed Apr 22 2020 03:12:07 GMT+0700 (Indochina Time)"/><meta itemprop="name" content="Sát Thủ Lưỡi Kéo - Scissor Seven Phần 2 Tập 3 Full Vietsubs- Hunglapis"/><meta itemprop="duration" content="PT16M43.567S" /><meta itemprop="thumbnailUrl" content="https://content.jwplatform.com/thumbs/0WEAmXQi-640.jpg"/><meta itemprop="contentUrl" content="https://content.jwplatform.com/videos/0WEAmXQi-PzRhYTgO.mp4"/><div style="position:relative; overflow:hidden; padding-bottom:56.25%"> <iframe src="https://cdn.jwplayer.com/players/0WEAmXQi-NL5rjR4j.html" width="100%" height="100%" frameborder="0" scrolling="auto" title="Sát Thủ Lưỡi Kéo - Scissor Seven Phần 2 Tập 3 Full Vietsubs- Hunglapis" style="position:absolute;" allowfullscreen></iframe> </div></div>', 22)
INSERT [dbo].[ChiTietPhimBo] ([Id], [SoTap], [TenTapPhim], [NgayPhatHanh], [DuongDanPhim], [LuotXem]) VALUES (1036, 4, NULL, CAST(N'2018-02-02' AS Date), N'<div itemscope itemtype="https://schema.org/VideoObject"><meta itemprop="uploadDate" content="Wed Apr 22 2020 03:12:07 GMT+0700 (Indochina Time)"/><meta itemprop="name" content="Sát Thủ Lưỡi Kéo - Scissor Seven Phần 2 Tập 3 Full Vietsubs- Hunglapis"/><meta itemprop="duration" content="PT16M43.567S" /><meta itemprop="thumbnailUrl" content="https://content.jwplatform.com/thumbs/0WEAmXQi-640.jpg"/><meta itemprop="contentUrl" content="https://content.jwplatform.com/videos/0WEAmXQi-PzRhYTgO.mp4"/><div style="position:relative; overflow:hidden; padding-bottom:56.25%"> <iframe src="https://cdn.jwplayer.com/players/0WEAmXQi-NL5rjR4j.html" width="100%" height="100%" frameborder="0" scrolling="auto" title="Sát Thủ Lưỡi Kéo - Scissor Seven Phần 2 Tập 3 Full Vietsubs- Hunglapis" style="position:absolute;" allowfullscreen></iframe> </div></div>', 22)
SET IDENTITY_INSERT [dbo].[DanhSachPhim] ON 

INSERT [dbo].[DanhSachPhim] ([Id], [TenPhim], [HinhAnh], [NgayThem], [NgayPhatHanh], [TomTatNoiDung], [DuongDanPhim], [LuotXem], [DanhGia], [TheLoai], [LoaiPhim], [HienThi], [Tag]) VALUES (1021, N'Mortal Kombat', N'4VlXER3FImHeFuUjBShFamhIp9M.jpg', CAST(N'2020-02-05' AS Date), CAST(N'2020-04-14' AS Date), N'The champions of Outworld and Earthrealm fight to the death in a brutal tournament that determines the fate of Earth.', N' <div itemscope itemtype="https://schema.org/VideoObject"><meta itemprop="uploadDate" content="Wed Apr 22 2020 02:50:14 GMT+0700 (Indochina Time)" /><meta itemprop="name" content="Birds Of Prey – Official Trailer 2" /><meta itemprop="duration" content="PT2M19.71S" /><meta itemprop="thumbnailUrl" content="https://content.jwplatform.com/thumbs/4rJ6XDE9-1280.jpg" /><meta itemprop="contentUrl" content="https://content.jwplatform.com/videos/4rJ6XDE9-3VdzlUrU.mp4" /><div style="position:relative; overflow:hidden; padding-bottom:56.25%"> <iframe src="https://cdn.jwplayer.com/players/4rJ6XDE9-NL5rjR4j.html" width="100%" height="100%" frameborder="0" scrolling="auto" title="Birds Of Prey – Official Trailer 2" style="position:absolute;" allowfullscreen></iframe> </div></div>', 205522, 3, 1, 1, 1, NULL)
INSERT [dbo].[DanhSachPhim] ([Id], [TenPhim], [HinhAnh], [NgayThem], [NgayPhatHanh], [TomTatNoiDung], [DuongDanPhim], [LuotXem], [DanhGia], [TheLoai], [LoaiPhim], [HienThi], [Tag]) VALUES (1022, N'
I Lost My Body', N'z5dXCywyo8zEPNDkeQY7nbvkrz8.jpg', CAST(N'2020-02-05' AS Date), CAST(N'2020-11-06' AS Date), N'Tình yêu, bí ẩn và phiêu lưu cùng đan xen trong bộ phim hoạt hình hấp dẫn khi chàng trai trẻ rơi vào lưới tình và bàn tay bị cắt rời lặn lội khắp Paris để tìm chủ nhân.', N'<div itemscope itemtype="https://schema.org/VideoObject"><meta itemprop="uploadDate" content="Wed Apr 22 2020 03:12:00 GMT+0700 (Indochina Time)"/><meta itemprop="name" content="I Lost My Body - Official Trailer - Netflix"/><meta itemprop="duration" content="PT1M59.339S" /><meta itemprop="thumbnailUrl" content="https://content.jwplatform.com/thumbs/I621aNj8-1920.jpg"/><meta itemprop="contentUrl" content="https://content.jwplatform.com/videos/I621aNj8-eQcf0s0m.mp4"/><div style="position:relative; overflow:hidden; padding-bottom:56.25%"> <iframe src="https://cdn.jwplayer.com/players/I621aNj8-NL5rjR4j.html" width="100%" height="100%" frameborder="0" scrolling="auto" title="I Lost My Body - Official Trailer - Netflix" style="position:absolute;" allowfullscreen></iframe> </div></div>', 5555, 3, 2, 1, 1, NULL)
INSERT [dbo].[DanhSachPhim] ([Id], [TenPhim], [HinhAnh], [NgayThem], [NgayPhatHanh], [TomTatNoiDung], [DuongDanPhim], [LuotXem], [DanhGia], [TheLoai], [LoaiPhim], [HienThi], [Tag]) VALUES (1023, N'A Night of Horror:', N'g7EYDfGgNEF1IQymS7EvDLKnpxT.jpg', CAST(N'2020-02-05' AS Date), CAST(N'2020-02-26' AS Date), N'Rod, DJ đài phát thanh, tổ chức một chương trình có chủ đề kinh dị nổi tiếng với những câu chuyện khủng bố cho những người nghe háo hức. Khi anh nhận được những cuộc gọi đáng báo động từ một đứa trẻ kinh hoàng, mọi thứ bắt đầu cảm thấy khó chịu.', N'<div itemscope itemtype="https://schema.org/VideoObject"><meta itemprop="uploadDate" content="2020-04-21T20:08:39+00:00"/><meta itemprop="name" content="Fighter In The Wind - Final Fight"/><meta itemprop="duration" content="PT5M11S" /><meta itemprop="thumbnailUrl" content="https://content.jwplatform.com/thumbs/YP5REjWx-640.jpg"/><meta itemprop="contentUrl" content="https://content.jwplatform.com/videos/YP5REjWx-PzRhYTgO.mp4"/><div style="position:relative; overflow:hidden; padding-bottom:56.25%"> <iframe src="https://cdn.jwplayer.com/players/YP5REjWx-NL5rjR4j.html" width="100%" height="100%" frameborder="0" scrolling="auto" title="Fighter In The Wind - Final Fight" style="position:absolute;" allowfullscreen></iframe> </div></div>', 1655, 3, 1, 1, 1, NULL)
INSERT [dbo].[DanhSachPhim] ([Id], [TenPhim], [HinhAnh], [NgayThem], [NgayPhatHanh], [TomTatNoiDung], [DuongDanPhim], [LuotXem], [DanhGia], [TheLoai], [LoaiPhim], [HienThi], [Tag]) VALUES (1024, N'Fighter in the Wind', N'dz0Rnu1F8LB75D54EgJSzYwuW2r.jpg', CAST(N'2020-02-05' AS Date), CAST(N'2004-08-12' AS Date), N'Bộ phim dựng về cuộc đời của huyền thoại võ thuật Mas Oyama người đã sáng lập hệ phái Karate Kyokushin, Mas Oyama vốn là người Hàn Quốc cho nên năm 2004 điện ảnh Hàn Quốc dựng bộ phim này kỉ niệm 10 năm ngày mất của ông.', N' <div itemscope itemtype="https://schema.org/VideoObject"><meta itemprop="uploadDate" content="Wed Apr 22 2020 02:50:14 GMT+0700 (Indochina Time)" /><meta itemprop="name" content="Birds Of Prey – Official Trailer 2" /><meta itemprop="duration" content="PT2M19.71S" /><meta itemprop="thumbnailUrl" content="https://content.jwplatform.com/thumbs/4rJ6XDE9-1280.jpg" /><meta itemprop="contentUrl" content="https://content.jwplatform.com/videos/4rJ6XDE9-3VdzlUrU.mp4" /><div style="position:relative; overflow:hidden; padding-bottom:56.25%"> <iframe src="https://cdn.jwplayer.com/players/4rJ6XDE9-NL5rjR4j.html" width="100%" height="100%" frameborder="0" scrolling="auto" title="Birds Of Prey – Official Trailer 2" style="position:absolute;" allowfullscreen></iframe> </div></div>', 1654, 3, 1, 1, 1, NULL)
INSERT [dbo].[DanhSachPhim] ([Id], [TenPhim], [HinhAnh], [NgayThem], [NgayPhatHanh], [TomTatNoiDung], [DuongDanPhim], [LuotXem], [DanhGia], [TheLoai], [LoaiPhim], [HienThi], [Tag]) VALUES (1025, N'Sonic the Hedgehog', N'aQvJ5WPzZgYVDrxLX4R6cLJCEaQ.jpg', CAST(N'2020-02-05' AS Date), CAST(N'2020-02-12' AS Date), N'Chuyến phiêu lưu tới San Francisco của cảnh sát trưởng Tom Wachowski để hỗ trợ chú nhím xanh hình người Sonic chống lại bác sĩ Robotnik
DIỄN VIÊN', N'<div itemscope itemtype="https://schema.org/VideoObject"><meta itemprop="uploadDate" content="Wed Apr 22 2020 03:12:08 GMT+0700 (Indochina Time)"/><meta itemprop="name" content="Sonic The Hedgehog (2020) - New Official Trailer - Paramount Pictures"/><meta itemprop="duration" content="PT2M51.758S" /><meta itemprop="thumbnailUrl" content="https://content.jwplatform.com/thumbs/Lucs1bA1-1920.jpg"/><meta itemprop="contentUrl" content="https://content.jwplatform.com/videos/Lucs1bA1-eQcf0s0m.mp4"/><div style="position:relative; overflow:hidden; padding-bottom:56.25%"> <iframe src="https://cdn.jwplayer.com/players/Lucs1bA1-NL5rjR4j.html" width="100%" height="100%" frameborder="0" scrolling="auto" title="Sonic The Hedgehog (2020) - New Official Trailer - Paramount Pictures" style="position:absolute;" allowfullscreen></iframe> </div></div>', 654, 4, 1, 1, 1, NULL)
INSERT [dbo].[DanhSachPhim] ([Id], [TenPhim], [HinhAnh], [NgayThem], [NgayPhatHanh], [TomTatNoiDung], [DuongDanPhim], [LuotXem], [DanhGia], [TheLoai], [LoaiPhim], [HienThi], [Tag]) VALUES (1026, N'Superman: Red Son', N'FVU9HZ87VfYMe5vIJvM3hFTG5i.jpg', CAST(N'2020-02-25' AS Date), CAST(N'2020-02-25' AS Date), N'Một “vị khách” đến từ một hành tinh nào đó ngoài kia, bên ngoài Trái Đất, người có thể “thay đổi dòng chảy của những con sông hùng vĩ”, có thể “uốn cong sắt thép bằng tay không”, con người đó là “nhà vô địch', N'<div itemscope itemtype="https://schema.org/VideoObject"><meta itemprop="uploadDate" content="Wed Apr 22 2020 03:12:09 GMT+0700 (Indochina Time)"/><meta itemprop="name" content="Superman- Red Son - Official Trailer (2020)"/><meta itemprop="duration" content="PT1M54.405S" /><meta itemprop="thumbnailUrl" content="https://content.jwplatform.com/thumbs/NEwnOYuu-1920.jpg"/><meta itemprop="contentUrl" content="https://content.jwplatform.com/videos/NEwnOYuu-eQcf0s0m.mp4"/><div style="position:relative; overflow:hidden; padding-bottom:56.25%"> <iframe src="https://cdn.jwplayer.com/players/NEwnOYuu-NL5rjR4j.html" width="100%" height="100%" frameborder="0" scrolling="auto" title="Superman- Red Son - Official Trailer (2020)" style="position:absolute;" allowfullscreen></iframe> </div></div>', 31321, 3, 1, 1, 1, NULL)
INSERT [dbo].[DanhSachPhim] ([Id], [TenPhim], [HinhAnh], [NgayThem], [NgayPhatHanh], [TomTatNoiDung], [DuongDanPhim], [LuotXem], [DanhGia], [TheLoai], [LoaiPhim], [HienThi], [Tag]) VALUES (1027, N'Portrait of a Lady', N'3NTEMlG5mQdIAlKDl3AJG0rX29Z.jpg', CAST(N'2020-05-02' AS Date), CAST(N'2020-06-17' AS Date), N'Câu chuyện xảy ra vào cuối thế kỷ thứ mười tám, Marianne là một họa sĩ trẻ, được giao nhiệm vụ vẽ một bức chân dung của một phụ nữ trẻ sẽ được sử dụng để tìm kiếm những lời cầu hôn', N'<div itemscope itemtype="https://schema.org/VideoObject"><meta itemprop="uploadDate" content="Wed Apr 22 2020 03:12:05 GMT+0700 (Indochina Time)"/><meta itemprop="name" content="Portrait Of A Lady On Fire [Official Trailer] – In Theaters December 6, 2019"/><meta itemprop="duration" content="PT2M15.21S" /><meta itemprop="thumbnailUrl" content="https://content.jwplatform.com/thumbs/c7X2oG62-1920.jpg"/><meta itemprop="contentUrl" content="https://content.jwplatform.com/videos/c7X2oG62-eQcf0s0m.mp4"/><div style="position:relative; overflow:hidden; padding-bottom:56.25%"> <iframe src="https://cdn.jwplayer.com/players/c7X2oG62-NL5rjR4j.html" width="100%" height="100%" frameborder="0" scrolling="auto" title="Portrait Of A Lady On Fire [Official Trailer] – In Theaters December 6, 2019" style="position:absolute;" allowfullscreen></iframe> </div></div>', 654, 3, 2, 1, 1, NULL)
INSERT [dbo].[DanhSachPhim] ([Id], [TenPhim], [HinhAnh], [NgayThem], [NgayPhatHanh], [TomTatNoiDung], [DuongDanPhim], [LuotXem], [DanhGia], [TheLoai], [LoaiPhim], [HienThi], [Tag]) VALUES (1028, N'
Long Shot', N'fEjwJfeDxgsRBlYgEWMgvrKQ6VB.jpg', CAST(N'2020-05-02' AS Date), CAST(N'2020-05-02' AS Date), N'Bộ phim Long Shot kể về Fred Flarsky (Beth Rogen) là một nhà báo có năng khiếu và tự do với mối quan hệ rắc rối. Charlotte Field (Charlize Theron) là một trong những người phụ nữ thông minh, tinh tế, thành đạt và có ảnh hưởng trên thế giới. Hai người không có gì chung, ngoại trừ việc cô là người giữ trẻ và người yêu thời thơ ấu của anh', N' <div itemscope itemtype="https://schema.org/VideoObject"><meta itemprop="uploadDate" content="Wed Apr 22 2020 02:50:14 GMT+0700 (Indochina Time)" /><meta itemprop="name" content="Birds Of Prey – Official Trailer 2" /><meta itemprop="duration" content="PT2M19.71S" /><meta itemprop="thumbnailUrl" content="https://content.jwplatform.com/thumbs/4rJ6XDE9-1280.jpg" /><meta itemprop="contentUrl" content="https://content.jwplatform.com/videos/4rJ6XDE9-3VdzlUrU.mp4" /><div style="position:relative; overflow:hidden; padding-bottom:56.25%"> <iframe src="https://cdn.jwplayer.com/players/4rJ6XDE9-NL5rjR4j.html" width="100%" height="100%" frameborder="0" scrolling="auto" title="Birds Of Prey – Official Trailer 2" style="position:absolute;" allowfullscreen></iframe> </div></div>', 6541, 3, 2, 1, 1, NULL)
INSERT [dbo].[DanhSachPhim] ([Id], [TenPhim], [HinhAnh], [NgayThem], [NgayPhatHanh], [TomTatNoiDung], [DuongDanPhim], [LuotXem], [DanhGia], [TheLoai], [LoaiPhim], [HienThi], [Tag]) VALUES (1029, N'Ophelia', N'mCcMJTJEAcVlneuFqgPMIshGSm3.jpg', CAST(N'2020-05-02' AS Date), CAST(N'2019-06-28' AS Date), N'Khi Ophelia làm thị nữ cho Nữ hoàng Gertrude, cá tính của cô đã chiếm được tình cảm của Hamlet. Khi dục vọng và sự phản bội đe dọa vương quốc, Ophelia thấy mình bị mắc kẹt giữa tình yêu đích thực và việc kiểm soát vận mệnh của chính mình.', N'<div itemscope itemtype="https://schema.org/VideoObject"><meta itemprop="uploadDate" content="Wed Apr 22 2020 03:12:04 GMT+0700 (Indochina Time)"/><meta itemprop="name" content="Ophelia Official Trailer (2019) Daisy Ridley, Naomi Watts Movie Hd"/><meta itemprop="duration" content="PT2M14.595S" /><meta itemprop="thumbnailUrl" content="https://content.jwplatform.com/thumbs/kNhrpcWL-1920.jpg"/><meta itemprop="contentUrl" content="https://content.jwplatform.com/videos/kNhrpcWL-eQcf0s0m.mp4"/><div style="position:relative; overflow:hidden; padding-bottom:56.25%"> <iframe src="https://cdn.jwplayer.com/players/kNhrpcWL-NL5rjR4j.html" width="100%" height="100%" frameborder="0" scrolling="auto" title="Ophelia Official Trailer (2019) Daisy Ridley, Naomi Watts Movie Hd" style="position:absolute;" allowfullscreen></iframe> </div></div>', 132, 3, 2, 1, 1, NULL)
INSERT [dbo].[DanhSachPhim] ([Id], [TenPhim], [HinhAnh], [NgayThem], [NgayPhatHanh], [TomTatNoiDung], [DuongDanPhim], [LuotXem], [DanhGia], [TheLoai], [LoaiPhim], [HienThi], [Tag]) VALUES (1030, N'Aladdin', N'3BUmvNKdPLxraqYRyniixn34UjN.jpg', CAST(N'2018-02-02' AS Date), CAST(N'2020-05-22' AS Date), N'Aladdin 2019 là một phiên bản live action đầy màu sắc sống động và không kém phần hồi hộp, được chuyển thể từ bộ phim hoạt hình kinh điển cả hãng phim Disney', N' <div itemscope itemtype="https://schema.org/VideoObject"><meta itemprop="uploadDate" content="Wed Apr 22 2020 02:50:14 GMT+0700 (Indochina Time)" /><meta itemprop="name" content="Birds Of Prey – Official Trailer 2" /><meta itemprop="duration" content="PT2M19.71S" /><meta itemprop="thumbnailUrl" content="https://content.jwplatform.com/thumbs/4rJ6XDE9-1280.jpg" /><meta itemprop="contentUrl" content="https://content.jwplatform.com/videos/4rJ6XDE9-3VdzlUrU.mp4" /><div style="position:relative; overflow:hidden; padding-bottom:56.25%"> <iframe src="https://cdn.jwplayer.com/players/4rJ6XDE9-NL5rjR4j.html" width="100%" height="100%" frameborder="0" scrolling="auto" title="Birds Of Prey – Official Trailer 2" style="position:absolute;" allowfullscreen></iframe> </div></div>', 112, 4, 2, 1, 1, NULL)
INSERT [dbo].[DanhSachPhim] ([Id], [TenPhim], [HinhAnh], [NgayThem], [NgayPhatHanh], [TomTatNoiDung], [DuongDanPhim], [LuotXem], [DanhGia], [TheLoai], [LoaiPhim], [HienThi], [Tag]) VALUES (1031, N'Ne Zha', N'vhnxaQel1CwfcwLtCkTNpSdjte1.jpg', CAST(N'2018-02-02' AS Date), CAST(N'2020-07-26' AS Date), N'Từ thuở xa xưa, tinh hoa đất trời hội tụ thành một viên ngọc chứa đựng năng lượng khổng lồ. Nguyên Thủy Thiên Tôn đã phân tách viên ngọc này thành 1 viên Linh Châu và 1 viên Ma Hoàn', N'<div itemscope itemtype="https://schema.org/VideoObject"><meta itemprop="uploadDate" content="Wed Apr 22 2020 03:12:02 GMT+0700 (Indochina Time)"/><meta itemprop="name" content="Ne Zha Official Trailer (2019) Animation Manga"/><meta itemprop="duration" content="PT2M41.355S" /><meta itemprop="thumbnailUrl" content="https://content.jwplatform.com/thumbs/2b9ZbjA7-1920.jpg"/><meta itemprop="contentUrl" content="https://content.jwplatform.com/videos/2b9ZbjA7-eQcf0s0m.mp4"/><div style="position:relative; overflow:hidden; padding-bottom:56.25%"> <iframe src="https://cdn.jwplayer.com/players/2b9ZbjA7-NL5rjR4j.html" width="100%" height="100%" frameborder="0" scrolling="auto" title="Ne Zha Official Trailer (2019) Animation Manga" style="position:absolute;" allowfullscreen></iframe> </div></div>', 3213, 5, 3, 1, 1, NULL)
INSERT [dbo].[DanhSachPhim] ([Id], [TenPhim], [HinhAnh], [NgayThem], [NgayPhatHanh], [TomTatNoiDung], [DuongDanPhim], [LuotXem], [DanhGia], [TheLoai], [LoaiPhim], [HienThi], [Tag]) VALUES (1032, N'Spies in Disguise', N'30YacPAcxpNemhhwX0PVUl9pVA3.jpg', CAST(N'2018-02-02' AS Date), CAST(N'2020-12-24' AS Date), N'Bộ phim hoạt hình mới nhất của xưởng phim Blue Sky sẽ theo chân siêu điệp viên Lance Sterling cùng nhà khoa học trẻ tuổi Walter Beckett trong cuộc hành trình phá vụ án quan trọng', N'<div itemscope itemtype="https://schema.org/VideoObject"><meta itemprop="uploadDate" content="Wed Apr 22 2020 03:12:09 GMT+0700 (Indochina Time)"/><meta itemprop="name" content="Spies In Disguise - Official Trailer 3 [Hd] - 20th Century Fox"/><meta itemprop="duration" content="PT2M37.292S" /><meta itemprop="thumbnailUrl" content="https://content.jwplatform.com/thumbs/1HDxt5n1-1920.jpg"/><meta itemprop="contentUrl" content="https://content.jwplatform.com/videos/1HDxt5n1-eQcf0s0m.mp4"/><div style="position:relative; overflow:hidden; padding-bottom:56.25%"> <iframe src="https://cdn.jwplayer.com/players/1HDxt5n1-NL5rjR4j.html" width="100%" height="100%" frameborder="0" scrolling="auto" title="Spies In Disguise - Official Trailer 3 [Hd] - 20th Century Fox" style="position:absolute;" allowfullscreen></iframe> </div></div>', 1325, 4, 3, 1, 1, NULL)
INSERT [dbo].[DanhSachPhim] ([Id], [TenPhim], [HinhAnh], [NgayThem], [NgayPhatHanh], [TomTatNoiDung], [DuongDanPhim], [LuotXem], [DanhGia], [TheLoai], [LoaiPhim], [HienThi], [Tag]) VALUES (1033, N'Pokémon: Mewtwo', N'ou7m7tnfb2bcE8LcFgUJzAwN2R8.jpg', CAST(N'2018-02-02' AS Date), CAST(N'2019-07-12' AS Date), N'Sau khi nhận lời mời của một huấn luyện viên bí ẩn, Ash, Misty và Brock gặp Mewtwo – một Pokémon nhân tạo muốn gây chiến.', N'<div itemscope itemtype="https://schema.org/VideoObject"><meta itemprop="uploadDate" content="Wed Apr 22 2020 03:12:05 GMT+0700 (Indochina Time)"/><meta itemprop="name" content="Pokémon- Mewtwo Strikes Back—evolution - Official Trailer - Netflix"/><meta itemprop="duration" content="PT1M56.959S" /><meta itemprop="thumbnailUrl" content="https://content.jwplatform.com/thumbs/NU56LCqp-1920.jpg"/><meta itemprop="contentUrl" content="https://content.jwplatform.com/videos/NU56LCqp-eQcf0s0m.mp4"/><div style="position:relative; overflow:hidden; padding-bottom:56.25%"> <iframe src="https://cdn.jwplayer.com/players/NU56LCqp-NL5rjR4j.html" width="100%" height="100%" frameborder="0" scrolling="auto" title="Pokémon- Mewtwo Strikes Back—evolution - Official Trailer - Netflix" style="position:absolute;" allowfullscreen></iframe> </div></div>', 215, 4, 3, 1, 1, NULL)
INSERT [dbo].[DanhSachPhim] ([Id], [TenPhim], [HinhAnh], [NgayThem], [NgayPhatHanh], [TomTatNoiDung], [DuongDanPhim], [LuotXem], [DanhGia], [TheLoai], [LoaiPhim], [HienThi], [Tag]) VALUES (1034, N'The Addams Family', N'q1epO0eO8DWu8Vo8tPfvVlzW48T.jpg', CAST(N'2018-02-02' AS Date), CAST(N'2019-10-10' AS Date), N'Cuộc sống gia đình Addams bị đảo lộn bởi sự xuất hiện trước cửa nhà đầy bất ngờ một người dẫn chương trình truyền hình thực tế xảo trá, trong khi họ đang chuẩn bị đón chào họ hàng thân thích đến dự đại lễ kỷ niệm của cả gia đình', N'<div itemscope itemtype="https://schema.org/VideoObject"><meta itemprop="uploadDate" content="Wed Apr 22 2020 03:12:10 GMT+0700 (Indochina Time)"/><meta itemprop="name" content="The Addams Family Trailer #1 (2019) - Movieclips Trailers"/><meta itemprop="duration" content="PT2M43.329S" /><meta itemprop="thumbnailUrl" content="https://content.jwplatform.com/thumbs/aDDGnYkd-1920.jpg"/><meta itemprop="contentUrl" content="https://content.jwplatform.com/videos/aDDGnYkd-eQcf0s0m.mp4"/><div style="position:relative; overflow:hidden; padding-bottom:56.25%"> <iframe src="https://cdn.jwplayer.com/players/aDDGnYkd-NL5rjR4j.html" width="100%" height="100%" frameborder="0" scrolling="auto" title="The Addams Family Trailer #1 (2019) - Movieclips Trailers" style="position:absolute;" allowfullscreen></iframe> </div></div>', 3121, 4, 4, 1, 1, NULL)
INSERT [dbo].[DanhSachPhim] ([Id], [TenPhim], [HinhAnh], [NgayThem], [NgayPhatHanh], [TomTatNoiDung], [DuongDanPhim], [LuotXem], [DanhGia], [TheLoai], [LoaiPhim], [HienThi], [Tag]) VALUES (1035, N'The Silence', N'lTVOquzxw2DPF3MKuYd1ynz9F6H.jpg', CAST(N'2018-02-02' AS Date), CAST(N'2019-05-16' AS Date), N'Thế giới bị những con quái thú ngàn năm xâm chiếm, chúng săn con mồi bằng thính giác cấp tính. Để sinh tồn, gia đình Ally phải giữ im lặng tuyệt đối...', N'<div itemscope itemtype="https://schema.org/VideoObject"><meta itemprop="uploadDate" content="Wed Apr 22 2020 03:12:10 GMT+0700 (Indochina Time)"/><meta itemprop="name" content="The Silence - Official Trailer [Hd] - Netflix"/><meta itemprop="duration" content="PT2M1.765S" /><meta itemprop="thumbnailUrl" content="https://content.jwplatform.com/thumbs/QXXUd5oU-1920.jpg"/><meta itemprop="contentUrl" content="https://content.jwplatform.com/videos/QXXUd5oU-eQcf0s0m.mp4"/><div style="position:relative; overflow:hidden; padding-bottom:56.25%"> <iframe src="https://cdn.jwplayer.com/players/QXXUd5oU-NL5rjR4j.html" width="100%" height="100%" frameborder="0" scrolling="auto" title="The Silence - Official Trailer [Hd] - Netflix" style="position:absolute;" allowfullscreen></iframe> </div></div>', 23, 4, 4, 1, 1, NULL)
INSERT [dbo].[DanhSachPhim] ([Id], [TenPhim], [HinhAnh], [NgayThem], [NgayPhatHanh], [TomTatNoiDung], [DuongDanPhim], [LuotXem], [DanhGia], [TheLoai], [LoaiPhim], [HienThi], [Tag]) VALUES (1036, N'Scissor Seven', N'57bdddc1302d08ea0210e77b205e1e7e.jpg', CAST(N'2018-02-02' AS Date), CAST(N'2018-02-02' AS Date), N'Sát Thủ Lưỡi Kéo - Scissor Seven Phần 2 Tập 1 Full Vietsubs', N' <div itemscope itemtype="https://schema.org/VideoObject"><meta itemprop="uploadDate" content="Wed Apr 22 2020 02:50:14 GMT+0700 (Indochina Time)" /><meta itemprop="name" content="Birds Of Prey – Official Trailer 2" /><meta itemprop="duration" content="PT2M19.71S" /><meta itemprop="thumbnailUrl" content="https://content.jwplatform.com/thumbs/4rJ6XDE9-1280.jpg" /><meta itemprop="contentUrl" content="https://content.jwplatform.com/videos/4rJ6XDE9-3VdzlUrU.mp4" /><div style="position:relative; overflow:hidden; padding-bottom:56.25%"> <iframe src="https://cdn.jwplayer.com/players/4rJ6XDE9-NL5rjR4j.html" width="100%" height="100%" frameborder="0" scrolling="auto" title="Birds Of Prey – Official Trailer 2" style="position:absolute;" allowfullscreen></iframe> </div></div>', NULL, 4, 4, 2, 1, NULL)
INSERT [dbo].[DanhSachPhim] ([Id], [TenPhim], [HinhAnh], [NgayThem], [NgayPhatHanh], [TomTatNoiDung], [DuongDanPhim], [LuotXem], [DanhGia], [TheLoai], [LoaiPhim], [HienThi], [Tag]) VALUES (1037, N'Bad Boys for Life', N'Bad Boys for Life34.jpg', CAST(N'2021-12-22' AS Date), CAST(N'2020-01-15' AS Date), N'Sau khi dừng lại ở phần 2 cách đây 16 năm, loạt phim hài hành động nổi đính đám Bad Boys đã chính thức trở lại với khán giả trên toàn thế giới. ', N' <div itemscope itemtype="https://schema.org/VideoObject"><meta itemprop="uploadDate" content="Wed Apr 22 2020 02:50:14 GMT+0700 (Indochina Time)" /><meta itemprop="name" content="Birds Of Prey – Official Trailer 2" /><meta itemprop="duration" content="PT2M19.71S" /><meta itemprop="thumbnailUrl" content="https://content.jwplatform.com/thumbs/4rJ6XDE9-1280.jpg" /><meta itemprop="contentUrl" content="https://content.jwplatform.com/videos/4rJ6XDE9-3VdzlUrU.mp4" /><div style="position:relative; overflow:hidden; padding-bottom:56.25%"> <iframe src="https://cdn.jwplayer.com/players/4rJ6XDE9-NL5rjR4j.html" width="100%" height="100%" frameborder="0" scrolling="auto" title="Birds Of Prey – Official Trailer 2" style="position:absolute;" allowfullscreen></iframe> </div></div>', 0, 4, 1, 1, 1, N'Rap')
SET IDENTITY_INSERT [dbo].[DanhSachPhim] OFF
SET IDENTITY_INSERT [dbo].[LoaiPhim] ON 

INSERT [dbo].[LoaiPhim] ([Id], [TenLoaiPhim]) VALUES (1, N'Phim lẻ')
INSERT [dbo].[LoaiPhim] ([Id], [TenLoaiPhim]) VALUES (2, N'Phim bộ')
SET IDENTITY_INSERT [dbo].[LoaiPhim] OFF
SET IDENTITY_INSERT [dbo].[LoaiTaiKhoan] ON 

INSERT [dbo].[LoaiTaiKhoan] ([Id], [TenLoai]) VALUES (1, N'khách hàng')
INSERT [dbo].[LoaiTaiKhoan] ([Id], [TenLoai]) VALUES (2, N'quản lý')
SET IDENTITY_INSERT [dbo].[LoaiTaiKhoan] OFF
SET IDENTITY_INSERT [dbo].[TaiKhoan] ON 

INSERT [dbo].[TaiKhoan] ([Id], [UserName], [HoTen], [Email], [MatKhau], [Status], [LoaiTaiKhoan]) VALUES (1, N'khoa', N'Đăng Khoa', N'khoa123@gmail.com', N'khoa', 1, 1)
INSERT [dbo].[TaiKhoan] ([Id], [UserName], [HoTen], [Email], [MatKhau], [Status], [LoaiTaiKhoan]) VALUES (2, N'nghia', N'Hữu Nghĩaaa121112', N'nghia123aa@gmail.com', N'nghia', 1, 1)
INSERT [dbo].[TaiKhoan] ([Id], [UserName], [HoTen], [Email], [MatKhau], [Status], [LoaiTaiKhoan]) VALUES (3, N'admin', N'Nghia admin', N'nghia123@gmail.com', N'admin', 0, 2)
INSERT [dbo].[TaiKhoan] ([Id], [UserName], [HoTen], [Email], [MatKhau], [Status], [LoaiTaiKhoan]) VALUES (4, N'admin2', N'Nghia Tran Huu', N'panyeu1202@gmail.com', N'admin2', 1, 2)
INSERT [dbo].[TaiKhoan] ([Id], [UserName], [HoTen], [Email], [MatKhau], [Status], [LoaiTaiKhoan]) VALUES (5, N'admin2', N'Nghia Tran Huu', N'panyeu120@gmail.com', N'admin2', 1, 2)
INSERT [dbo].[TaiKhoan] ([Id], [UserName], [HoTen], [Email], [MatKhau], [Status], [LoaiTaiKhoan]) VALUES (6, NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[TaiKhoan] ([Id], [UserName], [HoTen], [Email], [MatKhau], [Status], [LoaiTaiKhoan]) VALUES (1006, N'1358374914362776', N'Lý Tầm  Hoan', N'panyeu120@yahoo.com.vn', N'1358374914362776', NULL, 1)
SET IDENTITY_INSERT [dbo].[TaiKhoan] OFF
SET IDENTITY_INSERT [dbo].[TheLoai] ON 

INSERT [dbo].[TheLoai] ([Id], [TenTheLoai]) VALUES (1, N'Hành động')
INSERT [dbo].[TheLoai] ([Id], [TenTheLoai]) VALUES (2, N'Tình cảm')
INSERT [dbo].[TheLoai] ([Id], [TenTheLoai]) VALUES (3, N'Hoạt hình')
INSERT [dbo].[TheLoai] ([Id], [TenTheLoai]) VALUES (4, N'Kỳ ảo')
SET IDENTITY_INSERT [dbo].[TheLoai] OFF
SET IDENTITY_INSERT [dbo].[TuPhim] ON 

INSERT [dbo].[TuPhim] ([id], [idphim], [iduser]) VALUES (2, 8, 2)
INSERT [dbo].[TuPhim] ([id], [idphim], [iduser]) VALUES (3, 10, 2)
SET IDENTITY_INSERT [dbo].[TuPhim] OFF
ALTER TABLE [dbo].[DanhSachPhim] ADD  CONSTRAINT [DF__DanhSachP__HienT__4222D4EF]  DEFAULT ((1)) FOR [HienThi]
GO
ALTER TABLE [dbo].[ChiTietPhimBo]  WITH CHECK ADD  CONSTRAINT [FK__ChiTietPhimB__Id__46E78A0C] FOREIGN KEY([Id])
REFERENCES [dbo].[DanhSachPhim] ([Id])
GO
ALTER TABLE [dbo].[ChiTietPhimBo] CHECK CONSTRAINT [FK__ChiTietPhimB__Id__46E78A0C]
GO
ALTER TABLE [dbo].[DanhSachPhim]  WITH CHECK ADD  CONSTRAINT [FK__DanhSachP__LoaiP__440B1D61] FOREIGN KEY([LoaiPhim])
REFERENCES [dbo].[LoaiPhim] ([Id])
GO
ALTER TABLE [dbo].[DanhSachPhim] CHECK CONSTRAINT [FK__DanhSachP__LoaiP__440B1D61]
GO
ALTER TABLE [dbo].[DanhSachPhim]  WITH CHECK ADD  CONSTRAINT [FK__DanhSachP__TheLo__4316F928] FOREIGN KEY([TheLoai])
REFERENCES [dbo].[TheLoai] ([Id])
GO
ALTER TABLE [dbo].[DanhSachPhim] CHECK CONSTRAINT [FK__DanhSachP__TheLo__4316F928]
GO
ALTER TABLE [dbo].[TaiKhoan]  WITH CHECK ADD  CONSTRAINT [FK__TaiKhoan__LoaiTa__398D8EEE] FOREIGN KEY([LoaiTaiKhoan])
REFERENCES [dbo].[LoaiTaiKhoan] ([Id])
GO
ALTER TABLE [dbo].[TaiKhoan] CHECK CONSTRAINT [FK__TaiKhoan__LoaiTa__398D8EEE]
GO
USE [master]
GO
ALTER DATABASE [Movie] SET  READ_WRITE 
GO
