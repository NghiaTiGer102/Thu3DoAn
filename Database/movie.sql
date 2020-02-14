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

CREATE TABLE DanhSachPhim
(
	Id int IDENTITY(1,1),
	TenPhim nvarchar(100),
	HinhAnh varchar(100),
	NgayPhatHanh Date,
	TomTatNoiDung nvarchar(MAX),
	DuongDanPhim nvarchar(MAX),
	LuotXem int,
	DanhGia float,
	TheLoai int,
	LoaiPhim int,
	PRIMARY KEY(Id),
	FOREIGN KEY (TheLoai) REFERENCES TheLoai(Id),
	FOREIGN KEY (LoaiPhim) REFERENCES LoaiPhim(Id)
)

GO

CREATE TABLE ChiTietPhimBo
(
	Id int,
	SoTap int,
	TenTapPhim nvarchar(100),
	NgayPhatHanh Date,
	DuongDanPhim nvarchar(MAX),
	LuotXem int,
	PRIMARY KEY(Id, SoTap),
	FOREIGN KEY (Id) REFERENCES DanhSachPhim(Id)
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

INSERT INTO DanhSachPhim (TenPhim, HinhAnh, NgayPhatHanh, TomTatNoiDung, DuongDanPhim, LuotXem, DanhGia, TheLoai, LoaiPhim) VALUES (N'Robocop', 'm15.jpg', '20160929', N'Cảnh sát robot','1is5QLQAI-NW2Auz_5tVCARE6z4pzynFO',1000,5,1,1);
INSERT INTO DanhSachPhim (TenPhim, HinhAnh, NgayPhatHanh, TomTatNoiDung, DuongDanPhim, LuotXem, DanhGia, TheLoai, LoaiPhim) VALUES (N'Me before you', 'm2.jpg', '20170101', N'Bộ phim mở đầu bằng biến cố kinh hoàng xảy ra với nhân vật nam chính Will Traynor. Từ người thừa kế giàu có, đẹp trai, tài giỏi, yêu thể thao và du lịch, anh bị một chiếc xe môtô tông trúng, khiến phải sống cuộc đời tật nguyền vĩnh viễn. Will trở nên u uất, tuyệt vọng, giết thời gian bằng cách hàng ngày nhìn qua cửa sổ, trông ra tòa lâu đài hoang vu.','1is5QLQAI-NW2Auz_5tVCARE6z4pzynFO',500,4,2,1);
INSERT INTO DanhSachPhim (TenPhim, HinhAnh, NgayPhatHanh, TomTatNoiDung, DuongDanPhim, LuotXem, DanhGia, TheLoai, LoaiPhim) VALUES (N'Storks', 'm5.jpg', '20180101', N'Nội dung bộ phim dựa theo truyền thuyết cổ về những em bé khi được sinh ra được bọc trong vải trắng và được những chú cò vận chuyển.','1is5QLQAI-NW2Auz_5tVCARE6z4pzynFO',500,4,3,1);
INSERT INTO DanhSachPhim (TenPhim, HinhAnh, NgayPhatHanh, TomTatNoiDung, DuongDanPhim, LuotXem, DanhGia, TheLoai, LoaiPhim) VALUES (N'Finding Nemo,', 'c5.jpg', '20190101', N'Chú cá đi lạc','1is5QLQAI-NW2Auz_5tVCARE6z4pzynFO',1200,4,4,1);
INSERT INTO DanhSachPhim (TenPhim, HinhAnh, NgayPhatHanh, TomTatNoiDung, DuongDanPhim, LuotXem, DanhGia, TheLoai, LoaiPhim) VALUES (N'X-men,', 'm16.jpg', '20170801', N'Những người có năng lực đặc biệt','1is5QLQAI-NW2Auz_5tVCARE6z4pzynFO',752,3,1,1);
INSERT INTO DanhSachPhim (TenPhim, HinhAnh, NgayPhatHanh, TomTatNoiDung, DuongDanPhim, LuotXem, DanhGia, TheLoai, LoaiPhim) VALUES (N'Zootopia,', 'c2.jpg', '20190201', N'Thành phố tương lai của thế giới động vật','1is5QLQAI-NW2Auz_5tVCARE6z4pzynFO',2000,5,4,1);
INSERT INTO DanhSachPhim (TenPhim, HinhAnh, NgayPhatHanh, TomTatNoiDung, DuongDanPhim, LuotXem, DanhGia, TheLoai, LoaiPhim) VALUES (N'Deadpool,', 'm3.jpg', '20160801', N'Siêu anh hùng kì nhất Marvel','1is5QLQAI-NW2Auz_5tVCARE6z4pzynFO',324,2,1,1);
INSERT INTO DanhSachPhim (TenPhim, HinhAnh, NgayPhatHanh, TomTatNoiDung, DuongDanPhim, LuotXem, DanhGia, TheLoai, LoaiPhim) VALUES (N'Rambo,', 'm14.jpg', '20150505', N'1 mình chấp cả thế giới','1is5QLQAI-NW2Auz_5tVCARE6z4pzynFO',481,3,1,1);
INSERT INTO DanhSachPhim (TenPhim, HinhAnh, NgayPhatHanh, TomTatNoiDung, DuongDanPhim, LuotXem, DanhGia, TheLoai, LoaiPhim) VALUES (N'Machenic,', 'm7.jpg', '20170808', N'Đừng đụng vào bạn gái anh trọc','1is5QLQAI-NW2Auz_5tVCARE6z4pzynFO',905,4,1,1);
INSERT INTO DanhSachPhim (TenPhim, HinhAnh, NgayPhatHanh, TomTatNoiDung, DuongDanPhim, LuotXem, DanhGia, TheLoai, LoaiPhim) VALUES (N'Warcraft,', 'm11.jpg', '20180807', N'Lấy ý tưởng từ game cùng tên, phim nói về cuộc chiến giữa loài người và Orc','1is5QLQAI-NW2Auz_5tVCARE6z4pzynFO',700,4,1,1);
INSERT INTO DanhSachPhim (TenPhim, HinhAnh, NgayPhatHanh, TomTatNoiDung, DuongDanPhim, LuotXem, DanhGia, TheLoai, LoaiPhim) VALUES (N'Inferno,', 'm9.jpg', '20191010', N'Cuộc chiến với virus giết người hàng loạt','1is5QLQAI-NW2Auz_5tVCARE6z4pzynFO',852,4,1,1);

INSERT INTO DanhSachPhim (TenPhim, HinhAnh, NgayPhatHanh, TomTatNoiDung, DuongDanPhim, LuotXem, DanhGia, TheLoai, LoaiPhim) VALUES (N'Hopeless', 'm6.jpg', '20180101', N'Nội dung bộ phim dựa theo truyền thuyết cổ về những em bé khi được sinh ra được bọc trong vải trắng và được những chú cò vận chuyển.','1is5QLQAI-NW2Auz_5tVCARE6z4pzynFO',1000,3,2,2);

INSERT INTO ChiTietPhimBo (Id, SoTap, TenTapPhim, NgayPhatHanh, DuongDanPhim, LuotXem) VALUES (12,1,N'Hopeless tập 1', '20190101', '1is5QLQAI-NW2Auz_5tVCARE6z4pzynFO', 175);
INSERT INTO ChiTietPhimBo (Id, SoTap, TenTapPhim, NgayPhatHanh, DuongDanPhim, LuotXem) VALUES (12,2,N'Hopeless tập 2', '20190108', '1is5QLQAI-NW2Auz_5tVCARE6z4pzynFO', 215);
INSERT INTO ChiTietPhimBo (Id, SoTap, TenTapPhim, NgayPhatHanh, DuongDanPhim, LuotXem) VALUES (12,3,N'Hopeless tập 3', '20190115', '1is5QLQAI-NW2Auz_5tVCARE6z4pzynFO', 100);
INSERT INTO ChiTietPhimBo (Id, SoTap, TenTapPhim, NgayPhatHanh, DuongDanPhim, LuotXem) VALUES (12,4,N'Hopeless tập 4', '20190122',' 1is5QLQAI-NW2Auz_5tVCARE6z4pzynFO', 400);

 --select * from DanhSachPhim where LoaiPhim = 2 order by LuotXem DESC