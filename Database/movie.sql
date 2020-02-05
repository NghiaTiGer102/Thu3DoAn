USE master
IF EXISTS(select * from sys.databases where name='Movie')
DROP DATABASE Movie
go

CREATE DATABASE Movie
GO

USE Movie
GO

CREATE TABLE LoaiTaiKhoan
(
	Id int IDENTITY(1,1),
	TenLoai nvarchar(100),
	PRIMARY KEY(Id)
)

GO

CREATE TABLE TaiKhoan
(
	Id int IDENTITY(1,1),
	HoTen nvarchar(100),
	Email varchar(100),
	MatKhau varchar(100),
	LoaiTaiKhoan int,
	PRIMARY KEY(Id),
	FOREIGN KEY (LoaiTaiKhoan) REFERENCES LoaiTaiKhoan(Id)
)

GO

CREATE TABLE Banner
(
	Id int IDENTITY(1,1),
	HinhAnh varchar(100),
	PRIMARY KEY(Id)
)

GO

CREATE TABLE TheLoai
(
	Id int IDENTITY(1,1),
	TenTheLoai nvarchar(100),
	PRIMARY KEY(Id)
)

GO

CREATE TABLE LoaiPhim
(
	Id int IDENTITY(1,1),
	TenLoaiPhim nvarchar(100),
	PRIMARY KEY(Id)
)

GO

CREATE TABLE DanhSachPhimLe
(
	Id int IDENTITY(1,1),
	TenPhim nvarchar(100),
	HinhAnh varchar(100),
	NgayPhatHanh Date,
	TomTatNoiDung nvarchar(MAX),
	LuotXem int,
	DanhGia float,
	TheLoai int,
	PRIMARY KEY(Id),
	FOREIGN KEY (TheLoai) REFERENCES TheLoai(Id)
)

GO

CREATE TABLE DanhSachPhimBo
(
	Id int IDENTITY(1,1),
	TenPhim nvarchar(100),
	HinhAnh varchar(100),
	NgayPhatHanh Date,
	TomTatNoiDung nvarchar(MAX),
	LuotXem int,
	DanhGia float,
	TheLoai int,
	PRIMARY KEY(Id),
	FOREIGN KEY (TheLoai) REFERENCES TheLoai(Id)
)

GO

CREATE TABLE ChiTietPhimBo
(
	Id int,
	SoTap int,
	TenTapPhim nvarchar(100),
	NgayPhatHanh Date,
	LuotXem int,
	PRIMARY KEY(Id, SoTap),
	FOREIGN KEY (Id) REFERENCES DanhSachPhimBo(Id)
)

GO

INSERT INTO LoaiTaiKhoan (TenLoai) VALUES (N'khách hàng');
INSERT INTO LoaiTaiKhoan (TenLoai) VALUES (N'quản lý');

INSERT INTO TaiKhoan (HoTen, Email, MatKhau, LoaiTaiKhoan) VALUES (N'Đăng Khoa', 'khoa123@gmail.com', 'khoa', 1);
INSERT INTO TaiKhoan (HoTen, Email, MatKhau, LoaiTaiKhoan) VALUES (N'Hữu Nghĩa', 'nghia123@gmail.com', 'nghia', 2);

INSERT INTO Banner (HinhAnh) VALUES ('1.jpg');
INSERT INTO Banner (HinhAnh) VALUES ('2.jpg');
INSERT INTO Banner (HinhAnh) VALUES ('3.jpg');
INSERT INTO Banner (HinhAnh) VALUES ('4.jpg');

INSERT INTO TheLoai (TenTheLoai) VALUES (N'Hành động');
INSERT INTO TheLoai (TenTheLoai) VALUES (N'Tình cảm');
INSERT INTO TheLoai (TenTheLoai) VALUES (N'Anime');
INSERT INTO TheLoai (TenTheLoai) VALUES (N'Hoạt hình');

INSERT INTO LoaiPhim (TenLoaiPhim) VALUES (N'Phim lẻ');
INSERT INTO LoaiPhim (TenLoaiPhim) VALUES (N'Phim bộ');

INSERT INTO DanhSachPhimLe (TenPhim, HinhAnh, NgayPhatHanh, TomTatNoiDung, DanhGia, TheLoai) VALUES (N'Force 2', '11.jpg', '20160929', N'Khi nhiều đặc vụ của cơ quan tình báo hải ngoại Ấn Độ liên tiếp bị sát hại do một kẻ nội gian tố giác, cảnh sát Yash và đặc vụ KK được cử đi điều tra vụ việc. Hành trình truy bắt khiến họ phải đặt ra câu hỏi đâu mới là động cơ thực sự của tên gián điệp thông minh khi hắn quyết tâm đi tới cùng bất chấp mọi hiểm nguy?',5,1);
INSERT INTO DanhSachPhimLe (TenPhim, HinhAnh, NgayPhatHanh, TomTatNoiDung, DanhGia, TheLoai) VALUES (N'Me before you', 'm2.jpg', '20170101', N'Bộ phim mở đầu bằng biến cố kinh hoàng xảy ra với nhân vật nam chính Will Traynor. Từ người thừa kế giàu có, đẹp trai, tài giỏi, yêu thể thao và du lịch, anh bị một chiếc xe môtô tông trúng, khiến phải sống cuộc đời tật nguyền vĩnh viễn. Will trở nên u uất, tuyệt vọng, giết thời gian bằng cách hàng ngày nhìn qua cửa sổ, trông ra tòa lâu đài hoang vu.',4.5,2);
INSERT INTO DanhSachPhimLe (TenPhim, HinhAnh, NgayPhatHanh, TomTatNoiDung, DanhGia, TheLoai) VALUES (N'Storks', 'm5.jpg', '20180101', N'Nội dung bộ phim dựa theo truyền thuyết cổ về những em bé khi được sinh ra được bọc trong vải trắng và được những chú cò vận chuyển.',4,3);
INSERT INTO DanhSachPhimLe (TenPhim, HinhAnh, NgayPhatHanh, TomTatNoiDung, DanhGia, TheLoai) VALUES (N'Storks', 'm5.jpg', '20180101', N'Nội dung bộ phim dựa theo truyền thuyết cổ về những em bé khi được sinh ra được bọc trong vải trắng và được những chú cò vận chuyển.',4,4);

INSERT INTO DanhSachPhimBo (TenPhim, HinhAnh, NgayPhatHanh, TomTatNoiDung, LuotXem, DanhGia, TheLoai) VALUES (N'Hopeless', 'm6.jpg', '20190101', N'Phim Hàn Quốc dài tập',800,4,2);
INSERT INTO DanhSachPhimBo (TenPhim, HinhAnh, NgayPhatHanh, TomTatNoiDung, LuotXem, DanhGia, TheLoai) VALUES (N'Hopeless', 'm6.jpg', '20190101', N'Phim Hàn Quốc dài tập',750,4,2);
INSERT INTO DanhSachPhimBo (TenPhim, HinhAnh, NgayPhatHanh, TomTatNoiDung, LuotXem, DanhGia, TheLoai) VALUES (N'Hopeless', 'm6.jpg', '20190101', N'Phim Hàn Quốc dài tập',1000,4,2);
INSERT INTO DanhSachPhimBo (TenPhim, HinhAnh, NgayPhatHanh, TomTatNoiDung, LuotXem, DanhGia, TheLoai) VALUES (N'Hopeless', 'm6.jpg', '20190101', N'Phim Hàn Quốc dài tập',482,4,2);
INSERT INTO DanhSachPhimBo (TenPhim, HinhAnh, NgayPhatHanh, TomTatNoiDung, LuotXem, DanhGia, TheLoai) VALUES (N'Hopeless', 'm6.jpg', '20190101', N'Phim Hàn Quốc dài tập',555,4,2);

INSERT INTO ChiTietPhimBo (Id, SoTap, TenTapPhim, NgayPhatHanh, LuotXem) VALUES (1,1,N'Hopeless tập 1', '20190101', 175);
INSERT INTO ChiTietPhimBo (Id, SoTap, TenTapPhim, NgayPhatHanh, LuotXem) VALUES (1,2,N'Hopeless tập 2', '20190108', 215);
INSERT INTO ChiTietPhimBo (Id, SoTap, TenTapPhim, NgayPhatHanh, LuotXem) VALUES (1,3,N'Hopeless tập 3', '20190115', 100);
INSERT INTO ChiTietPhimBo (Id, SoTap, TenTapPhim, NgayPhatHanh, LuotXem) VALUES (1,4,N'Hopeless tập 4', '20190122', 400);