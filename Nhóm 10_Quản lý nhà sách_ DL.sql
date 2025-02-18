use master
if exists (select * from sysdatabases where name = 'DBQuanLyNhaSach')
	drop database DBQuanLyNhaSach
go
create database DBQuanLyNhaSach
go
use DBQuanLyNhaSach
go

CREATE TABLE NHAXUATBAN(
	MaNXB		VARCHAR(10) primary key,
	TenNXB		NVARCHAR(50)	NOT NULL 
)
go
insert into NHAXUATBAN
values ('XB01',N'Thanh Niên '),
		('XB02',N'Phụ Nữ '),
		('XB03',N'Văn Học '),
		('XB04',N'Thời Đại'),
		('XB05',N'Trẻ'),
		('XB06',N'Dân Trí '),
		('XB07',N'Lao Động'),
		('XB08',N'Đông A');
		select * from NHAXUATBAN
-------------------------------------------------------------------------------
CREATE TABLE THELOAI(
	MaTL		VARCHAR(10) primary key,
	TenTL		NVARCHAR(50)	NOT NULL 
)
go

insert into THELOAI
values	('TL01',N'Thiếu Nhi'),
		('TL02',N'Ngoại văn'),
		('TL03',N'Tác phẩm kinh điển');
select * from THELOAI
----------------------------------------------------------------------------------

CREATE TABLE SACH(
	MaISBN		VARCHAR(20) primary key,
	TuaSach		NVARCHAR(100)	NOT NULL ,
	KichThuoc	VARCHAR(10),
	SoTrang		SMALLINT,
	HinhThuc	NVARCHAR(20),
	MoTa		NVARCHAR(MAX),
	DaBan		INT,
	NamXB		INT,
	DoTuoi		NVARCHAR(20),
	SoLuong		INT				NOT NULL ,
	MaTL		VARCHAR(10) foreign key references THELOAI(MaTL),
	MaNXB		VARCHAR(10) foreign key references NHAXUATBAN(MaNXB) 
)
go
-- Kiểm tra check bảng sách 
ALTER TABLE SACH 
ADD CONSTRAINT c_sach CHECK ( 
					HinhThuc IN (N'Bìa mềm', N'Bìa cứng')
			  AND 	SoLuong	>= 0
			  AND	DaBan >=0 
			  AND	SoTrang >= 1
			  );
-- Thể loại 01 
insert into SACH
values ('8935212361750',N'Ngôi Sao May Mắn Sâu Bắp Cải ','21x17 cm',43,N'Bìa mềm',N'Phiêu lưu cùng chú bọ ngựa dũng cảm , đi tìm kiếm ông ốc sên già bị mất tích'
		,1,2022,N'Từ 0-2 tuổi',9,'TL01','XB01'),
		('9786045629437',N' Ông Biết Tuốt, Đầu Bò Và Tự Kỷ','21x17 cm',116,N'Bìa mềm',N'Với cuốn sách này, chúng ta không khỏi day dứt bởi vấn đề lớn chưa được giải quyết ',
		0,2022, N'Từ 0-2 tuổi',10,'TL01','XB01'),
		('9786045635506',N'Chú Cá Vàng Thứ 14 ','21x17 cm',192,N'Bìa mềm',N'Chúng mình làm bạn, con nhé? – Vì sao mẹ sinh ra con trên đời này '
		,0,2016,N'Từ 3-5 tuổi',10,'TL01','XB02'),
		('9786045622797',N' Chúng Mình Làm Bạn Con Nhé','21x17 cm',143,N'Bìa mềm',N'Hàng loạt những câu hỏi, thắc mắc hoặc những tình huống có thật  '
		,0,2016,N'Từ 3-5 tuổi',10,'TL01','XB02'),
		('9786045616543',N' Cùng Bé Chơi Đất Nặn','21x17 cm',100,N'Bìa cứng',N'Trong quá trình tập nặn đất, đôi bàn tay của trẻ trở nên linh hoạt hơn'
		,0,2013,N'Từ 6-8 tuổi',10,'TL01','XB03'),
		('9786045622827',N'Tôi Không Sợ Hãi ','21x17 cm',288,N'Bìa mềm',N'Một vài ngôi nhà mất hút trong đồng lúa mì '
		,1,2013,N'Từ 6-8 tuổi',9,'TL01','XB03'),
		('9786046811121',N'Những Vật Dụng Quanh Ta ','21x17 cm',233,N'Bìa mềm',null
		,0,2014,N'Từ 6-8 tuổi',10,'TL01','XB03'),
		('9786046808213',N'Con Ruồi Tham Ăn ','21x17 cm','24',N'Bìa mềm',null
		,0,2014,N'Từ 9-12 tuổi',10,'TL01','XB04'),
		('9786046808206',N'Con Chó Lò Xo ','21x17 cm',48,N'Bìa mềm',null
		,0,2013,N'Từ 9-12 tuổi',10,'TL01','XB04'),
		('9786046855453',N'Mũ Rơm Ở Đồng Quê ','21x17 cm',80,N'Bìa cứng',null
		,0,2013,N'Từ 9-12 tuổi',10,'TL01','XB04');
-- Thể loại 02
insert into SACH
values 
		('9786049994968',N' Chưa Kịp Lớn Đã Phải Trưởng Thành','21x17 cm',209,N'Bìa mềm',null
		,0,2021,null,10,'TL02','XB03'),
		('2010380004831',N'Tủ Sách Học Tiếng Anh Bằng Hình','21x17 cm',300,N'Bìa mềm',null
		,0,2021,null,10,'TL02','XB03'),
		('8935251409123',N'Săn Học Bổng','21x17 cm',200,N'Bìa mềm',null
		,0,2021,null,10,'TL02','XB03'),
		('9786048416089',N'Sách Học Tiếng Anh Cấp Tốc','21x17 cm',350,N'Bìa mềm',null
		,1,2021,null,9,'TL02','XB06'),
		('8934980025765',N'Tủ Sách Học Tiếng Anh Qua Tranh Vẽ','21x17 cm',150,N'Bìa mềm',null
		,0,2020,null,10,'TL02','XB06'),
		('9786043779028',N'Tocfl Môn Nghe','21x17 cm',200,N'Bìa mềm',null
		,0,2020,null,10,'TL02','XB06'),
		('9786048471712',N'Nâng Cao Vốn Từ Vựng Tiếng Trung Theo Chủ Đề','21x17 cm',450,N'Bìa mềm',null 
		,0,2020,null,10,'TL02','XB06'),
		('9786043090963',N'Ngữ Pháp Hán Ngữ Thực Dụng','21x17 cm',150,N'Bìa mềm',N'Ngữ Thực Dụng - đúng như tên gọi, được biên soạn một cách thực dụng'
		,0,2020,null,10,'TL02','XB08'),
		('8935236423878',N'10 Phút Tự Học Tiếng Trung Mỗi Ngày','21x17 cm',250,N'Bìa mềm',null
		,1,2020,null,9,'TL02','XB08'),
		('8935236421287 ',N'Tiếng Trung Thương Mại','21x17 cm',200,N'Bìa mềm',N'Cuốn sách gồm 60 bài, với những mẫu câu giao tiếp kèm theo thuật'
		,0,2020,null,10,'TL02','XB08')
-- Thể loại 03
insert into SACH
values 
		('9786041121317',N'Suối Nguồn','14 x 20 cm',203,N'Bìa mềm',N'Suối nguồn (The Fountainhead) tiểu thuyết của Ayn Rand,tác giả có ảnh hưởng lớn nhất đến độc giả Mỹ trong thế kỷ 20.
			- Tác phẩm đã bán được 6 triệu bản trong hơn 60 năm qua kể từ khi xuất bản lần đầu (năm 1943). 
			- Được dịch ra nhiều thứ tiếng và vẫn liên tục được tái bản hàng năm. 
			- Một tiểu thuyết kinh điển cần đọc nay đã có mặt tại Việt Nam với bản dịch tiếng Việt. Xin trân trọng giới thiệu cùng quý độc giả.'
		,0,2015,N'Trên 13 tuổi',10,'TL03','XB01'),
		('8935251419863',N'Phương Pháp Đọc Sách Hiệu Quả ','14 x 20 cm',178,N'Bìa mềm',null
		,0,2015,null,10,'TL03','XB01'),
		('9786045582091',N'Tiếng Triều Dâng','14 x 20 cm',165,N'Bìa mềm',null
		,0,2015,N'Từ 13 tuổi',10,'TL03','XB05'),
		('8935212353861',N'Tiếng Gọi Của Hoang Dã','14 x 20 cm',231,N'Bìa mềm',N'Tiểu thuyết nổi tiếng thế giới của nhà văn Mỹ - Jack London. Cốt truyện kể về một chú chó tên là Buck đã được thuần hóa, cưng chiều. Nhưng do một loạt các sự kiện xảy ra khi Buck bị bắt khỏi trang trại, để trở thành chó kéo xe ở khu vực Alaska lạnh giá; trong giai đoạn mọi người đổ xô đi tìm vàng thế kỷ 19, thiên nhiên nguyên thủy đã đánh thức bản năng của Buck. Buck trở lại cuộc sống hoang dã, Buck trở về rừng và sống chung với lũ sói '
		,0,2013,N'Từ 13 tuổi',10,'TL03','XB05'),
		('9786049829444 ',N'Hồng Lâu Mộng','14 x 20 cm',103,N'Bìa mềm',null
		,0,2013,null,10,'TL03','XB05'),
		('8935235228351',N'Cây Cam Ngọt Của Tôi','14 x 20 cm',239,N'Bìa mềm',N'Mở đầu bằng những thanh âm trong sáng và kết thúc lắng lại trong những nốt trầm hoài niệm, Cây cam ngọt của tôi khiến ta nhận ra vẻ đẹp thực sự của cuộc sống đến từ những điều giản dị như bông hoa trắng của cái cây sau nhà, và rằng cuộc đời thật khốn khổ nếu thiếu đi lòng yêu thương và niềm trắc ẩn '
		,0,2013,null,10,'TL03','XB05'),
		('8935235205338',N' Những Người Khổng Lồ Cuối Cùng','14 x 20 cm', 106,N'Bìa mềm',null
		,1,2012,null,10,'TL03','XB07'),
		('8935235234161',N'Kim Các Tự','14 x 20 cm',352,N'Bìa cứng',null
		,0,2022,null,10,'TL03','XB07'),
		('8935235227873',N'Những Tù Nhân Của Địa Lý','14 x 20 cm', 432,N'Bìa cứng',null
		,0,2020,null,10,'TL03','XB07'),
		('8935235232006',N'Chia Rẽ','14 x 20 cm',396,N'Bìa cứng',null
		,0,2021,null,10,'TL03','XB07');
		

-----------------------------------------
		SELECT * FROM SACH ORDER BY MaTL;

CREATE TABLE NGONNGU(
	MaNgonNgu	VARCHAR(10) primary key,
	TenNgonNgu	NVARCHAR(50)	NOT NULL 
)
go
insert into NGONNGU
values ('NN01',N'Tiếng Việt'),
		('NN02',N'Tiếng Anh'),
		('NN03', N'Tiếng trung');
		select * from NGONNGU
		--------------------------------------------------------

CREATE TABLE SUDUNG(
	MaNgonNgu	VARCHAR(10) foreign key references NGONNGU(MaNgonNgu),
	MaISBN		VARCHAR(20) foreign key references SACH(MaISBN)
	constraint pk_SD primary key(MaNgonNgu,MaISBN)
)
go 
-- Thêm NN01
insert into SUDUNG 
values 
		('NN01','8935212361750'),
		('NN01','9786045629437'),
		('NN01','9786045635506'),
		('NN01','9786045622797'),
		('NN01','9786045616543'), 
		('NN01','9786045622827'),
		('NN01','9786046811121'),
		('NN01','9786046808213'),
		('NN01','9786046808206'),
		('NN01','9786046855453'),
		('NN01','9786049994968'),
		('NN01','2010380004831'),
		('NN01','8935251409123'),
		('NN01','9786048416089'),
		('NN01','8934980025765'),
		('NN01','9786043779028'),
		('NN01','9786048471712'),
		('NN01','9786043090963'),
		('NN01','8935236423878'),
		('NN01','8935236421287'),
		('NN01','9786041121317'),
		('NN01','8935251419863'),
		('NN01','9786045582091'),
		('NN01','8935212353861'),
		('NN01','9786049829444'),
		('NN01','8935235228351'),
		('NN01','8935235205338'),
		('NN01','8935235234161'),
		('NN01','8935235227873'),
		('NN01','8935235232006');
-- Thêm NN02 và NN03
insert into SUDUNG 
values 
		('NN02','9786049994968'),
		('NN02','2010380004831'),
		('NN02','8935251409123'),
		('NN02','9786048416089'),
		('NN02','8934980025765' ),
		('NN02','9786043779028'),

		('NN03','9786048471712'),
		('NN03','9786043090963'),
		('NN03','8935236423878'),
		('NN03','8935236421287');


	select * from SUDUNG
		
------------------------------------------------------------	
CREATE TABLE TACGIA(
	MaTG		VARCHAR(10) primary key,
	TenTG		NVARCHAR(50)	NOT NULL 
)
go
insert into TACGIA 
values ('TG01',N'Nguyễn Thị Việt Nga'),
		('TG02',N'Phong Điệp'),
		('TG03',N'Trần Hồng Thắng'),
		('TG04',N'Lưu Thị Lương'),
		('TG05',N'Tớ Là Mây'),
		('TG06',N'Thu Ngân'),
		('TG07',N'Nguyễn Thị Thu'),
		('TG08',N'Lee Jun Bok'),
		('TG09',N'Seong Ryong'),
		('TG10',N'Mishima Yukio'),
		('TG11',N'Charles Van Doren'),
		('TG12',N'Mortimer J.Adler'),
		('TG13',N'Jack London'),
		('TG14',N'Ayn Rand');
	select * from TACGIA
	------------------------------------------------------------

CREATE TABLE THAMGIAVIET(
	MaTG		VARCHAR(10) foreign key references TACGIA(MaTG),
	MaISBN		VARCHAR(20) foreign key references SACH(MaISBN),
	NamViet		INT
	constraint pk_TGV primary key(MaTG,MaISBN)
)
go

insert into THAMGIAVIET
values	('TG01','8935212361750',2020),
		('TG01','9786045629437',2020),
		('TG02','9786045635506',2014),
		('TG02','9786045622797',2014),
		('TG03','9786045616543',2011),
		('TG03','9786045622827',2011),
		('TG03','9786046811121',2012),
		('TG04','9786046808213',2012),
		('TG04','9786046808206',2011),
		('TG04','9786046855453',2011),
		('TG05','9786049994968',2019),
		('TG05','2010380004831',2019),
		('TG06','8935251409123',2019),
		('TG06','9786048416089',2019),
		('TG07','8934980025765',2018),
		('TG07','9786043779028',2018),
		('TG08','9786048471712',2018),
-- Cùng sách nhưng nhiều tác giả viết 
		('TG08','9786043090963',2018),
		('TG09','9786043090963',2018),
---
		('TG09','8935236423878',2018),
		('TG09','8935236421287',2018),
		('TG10','9786041121317',2013),
		('TG10','9786045582091',2013),
-- Cùng sách nhưng nhiều tác giả viết 
		('TG11','8935251419863',2013),
		('TG12','8935251419863',2013),
---		
		('TG13','8935212353861',2011),
		('TG13','9786049829444',2011),
		('TG13','8935235228351',2011),

		('TG14','8935235205338',2010),
		('TG14','8935235234161',2020),
		('TG14','8935235227873',2018),
		('TG14','8935235232006',2019);
 

		select * from THAMGIAVIET
		
------------------------------------------------------
CREATE TABLE DICHGIA(
	MaDG		VARCHAR(10) primary key,
	TenDG		NVARCHAR(50)	NOT NULL 
)
go
insert into DICHGIA
values ('DG01',N'Trịnh Thị Hà'),
		('DG02',N'Đặng Thùy Trang'),
		('DG03',N'Vũ Lan Anh'),
		('DG04',N'Nguyễn Kim Ngọc'),
		('DG05',N'Trần Mai Loan'),
		('DG06',N'Vũ Hoàng Linh');
		select * from DICHGIA
---------------------------------------------------------------------------
CREATE TABLE THAMGIADICH(
	MaDG		VARCHAR(10) foreign key references DICHGIA(MaDG),
	MaISBN		VARCHAR(20) foreign key references SACH(MaISBN),
	NamDich 	INT
	constraint pk_TGD primary key(MaDG,MaISBN)
)
go
insert into THAMGIADICH
values	('DG01','9786048471712',2019),
		('DG01','9786043090963',2019),
		('DG02','8935236423878',2019),
		('DG02','8935236421287',2019),
		('DG03','9786041121317',2014),
-- Cùng sách nhưng nhiều dịch giả dịch 
		('DG03','8935251419863',2014),
		('DG04','8935251419863',2014),
--
		('DG04','9786045582091',2014),
		('DG04','8935212353861',2012),
		('DG04','9786049829444',2012),

		('DG05','8935235228351',2012),
		('DG05','8935235205338',2011),
		('DG05','8935235234161',2021),
-- Cùng sách nhưng nhiều dịch giả dịch 
		('DG05','8935235232006',2020),
		('DG06','8935235232006',2020),
-- 
		('DG06','8935235227873',2019);
		
		select * from THAMGIADICH


----------------------------------------------------------------------------
CREATE TABLE CHUCVU(
	MaCV		VARCHAR(10) primary key,
	TenCV		NVARCHAR(50)	NOT NULL ,
	LoaiCV		NVARCHAR(50)	NOT NULL 
)
go
insert into CHUCVU 
values	('CV01',N'Nhân viên kho ',N'Nhân viên'),
		('CV02',N'Nhân viên bán hàng ',N'Quản lý'),
		('CV03',N'Nhân viên bán hàng ',N'Nhân viên');
		select * from CHUCVU
---------------------------------------------------------------------

CREATE TABLE NHANVIEN(
	MaNV		VARCHAR(10) primary key,
	HoTenNV		NVARCHAR(50)	 NOT NULL,
	NgaySinhNV	DATE			 NOT NULL,
	GioiTinhNV	NVARCHAR(3)		 NOT NULL,
	SDTNV		VARCHAR(20)		 NOT NULL,
	MaCV		VARCHAR(10) foreign key references CHUCVU(MaCV)
)
go
-- Kiểm tra check bảng NHANVIEN 
ALTER TABLE NHANVIEN 
ADD CONSTRAINT c_nv CHECK (GioiTinhNV IN ('Nam',N'Nữ'));

insert into NHANVIEN
values	('NV01',N'Huỳnh Triệu Quyễn Lam','2003-4-25',N'Nữ','0893420069','CV01'),
		('NV02',N'Nguyễn Kim Thiên Thiên','2003-4-2',N'Nữ','0893650069','CV02'),
		('NV03',N'Trần Truyết Nhi','2003-3-2',N'Nữ','0913288161','CV03'),
		('NV04',N'Trần Hoàng Yến','2003-5-2',N'Nữ','0913288164','CV03');
		select * from NHANVIEN
---------------------------------------------------------------------------------
CREATE TABLE LOAIKH(
	MaLoai		VARCHAR(10) primary key,
	TenLoai 	NVARCHAR(50)	NOT NULL
)
go
insert into LOAIKH
values	('ML01',N'Đồng'),
		('ML02',N'Bạc'),
		('ML03',N'Vàng');
		select * from LOAIKH
---------------------------------------------------------------------------


CREATE TABLE KHACHHANG(
	MaKH				VARCHAR(10) primary key,
	HoTenKH				NVARCHAR(50)	NOT NULL,
	NgaySinhKH			DATE			NOT NULL,
	GioiTinhKH			NVARCHAR(3)		NOT NULL,
	SDTKH				VARCHAR(20)		NOT NULL,
	DiaChiKH			NVARCHAR(100)	NOT NULL,
	EmailKH				NVARCHAR(50)	NOT NULL,
	DiemThuongTichLuy	INT				NOT NULL,
	MaLoai				VARCHAR(10) foreign key references LOAIKH(MaLoai)
)
go
-- Kiểm tra check bảng KHACHHANG
ALTER TABLE  KHACHHANG 
ADD CONSTRAINT c_kh CHECK (GioiTinhKH IN ('Nam',N'Nữ')
					and DiemThuongTichLuy >= 0);

insert into KHACHHANG
values	('KH01',N'Nguyễn Thị Thu Hằng','2003/1/17',N'Nữ','0917277196',N'828 Sư Vạn Hạnh, Phường 13 Quận 10','hang123@gmail.ocm',100,'ML01'),
		('KH02',N'An Đoàn Kim Khuê','2003/1/1',N'Nữ','0913477196',N'162 Nguyễn Văn Lượng Gò Vấp','khue123@gmail.com',200,'ML02'),
		('KH03',N'Nguyễn Hoàng Duyên','2003/11/17',N'Nữ','0917677196',N'20 Hà Huy Giáp Quận 12','duyen@gmail.com',300,'ML03');
		select * from KHACHHANG
--------------------------------------------------------------
CREATE TABLE BINHLUAN(
	MaKH		VARCHAR(10) foreign key references KHACHHANG(MaKH),
	MaISBN		VARCHAR(20) foreign key references SACH(MaISBN),
	NoiDungBL	NVARCHAR(50),
	NgayDang	DATE		NOT NULL,
	SoSao		SMALLINT	NOT NULL 
	constraint pk_BL primary key(MaKH,MaISBN)
	)
go
-- Kiểm tra check bảng BINHLUAN 
ALTER TABLE  BINHLUAN 
ADD CONSTRAINT c_bl CHECK (SoSao > 0 AND SoSao <= 5);

insert into BINHLUAN
values	('KH01','8935212361750',N'Sách hay lắm, nên mua ','2023-8-6',5),
		('KH01','9786045635506',N'Giao hàng siêu nhanh','2023-8-6',5),
		('KH02','9786048416089',N'Shop tư vấn rất tận tình ','2023-8-6',5),
		('KH03','8935235205338',N'Đóng gói cẩn thận','2023-8-7',5);
		select * from BINHLUAN
----------------------------------------------------------
CREATE TABLE NHACUNGCAP(
	MaNCC		VARCHAR(10) primary key,
	TenNCC		NVARCHAR(50)	NOT NULL,
	Email_NCC	NVARCHAR(50)	 NOT NULL,
	SDT_NCC		VARCHAR(20)		 NOT NULL,
	DiaChi_NCC	NVARCHAR(100)	 NOT NULL
)
go
insert into NHACUNGCAP 
values	('NCC01',N'AZ Việt Nam','azvn@gmail.com','0862934696',N'585/2A Sư Vạn Hạnh, phường 13, quận 10, Thành phố Hồ Chí Minh'),
		('NCC02',N'Nhã Nam ','nhanam@gmail.com','0903244248',N'59 - Đỗ Quang - Trung Hòa - Cầu Giấy - Hà Nội'),
		('NCC03',N'Skybooks','skybooks@gmail.com','0803244248',N'Số 83 Lý Nam Đế, Phường Cửa Đông, Quận Hoàn Kiếm, Hà Nội');
		select * from NHACUNGCAP
--------------
CREATE TABLE PHIEUNHAP(
	MaPN			VARCHAR(10)		primary key,
	NgayNhap		DATE			NOT NULL,
	TongCongPN		INT				NOT NULL,
	TongSachNhap	INT				NOT NULL,
	DVTPN			NVARCHAR(10)	NOT NULL,
	MaNCC			VARCHAR(10) foreign key references NHACUNGCAP(MaNCC),
	MaNV			VARCHAR(10) foreign key references NHANVIEN(MaNV)
)
go
-- Kiểm tra check bảng  PHIEUNHAP
ALTER TABLE   PHIEUNHAP 
ADD CONSTRAINT c_pn CHECK (
		TongCongPN >= 0 
	AND	TongSachNhap >=0 );

insert into PHIEUNHAP
values	('PN01','2023-7-25',10900000,100,N'Cuốn','NCC01','NV01'),
		('PN02','2023-7-25',18120000,100,N'Cuốn','NCC02','NV01'),
		('PN03','2023-7-26',11480000,100,N'Cuốn','NCC03','NV02');
		select * from PHIEUNHAP

--------------------------------------------------------------------------------------
CREATE TABLE CHITIETPHIEUNHAP(
	MaISBN		VARCHAR(20) foreign key references SACH(MaISBN),
	MaPN		VARCHAR(10) foreign key references PHIEUNHAP(MaPN),
	SoLuongPN	INT				NOT NULL,
	DonGiaPN	INT				NOT NULL,
	PhanTramCK	float			NOT NULL,
	ThanhTien	INT				NOT NULL
	constraint pk_CTPN primary key(MaPN,MaISBN)
)
go
-- Kiểm tra check bảng CHITIETPHIEUNHAP
ALTER TABLE   CHITIETPHIEUNHAP
ADD CONSTRAINT c_ctpn CHECK (
		SoLuongPN >= 0 
	AND	DonGiaPN  >=0 
	AND	( PhanTramCK >=0 AND PhanTramCK <=1 )
	AND ThanhTien >=0 );

-- Phiếu nhập 01 
insert into CHITIETPHIEUNHAP
values	('8935212361750','PN01',10,1000000,0.2,800000),
		('9786045629437','PN01',10,1500000,0,1500000),
		('9786045635506','PN01',10,2000000,0.2,1600000),
		('9786045622797','PN01',10,2000000,0,2000000),
		('9786045616543','PN01',10,1480000,0,1480000),
		('9786045622827','PN01',10,1480000,0.2,1180000),
		('9786046811121','PN01',10,500000,0.2,400000),
		('9786046808213','PN01',10,500000,0,500000),
		('9786046808206','PN01',10,800000,0.2,640000),
		('9786046855453','PN01',10,800000,0,800000),
-- Phiếu nhập 02
		('9786049994968','PN02',10,2500000,0.1,2250000),
		('2010380004831','PN02',10,2500000,0.1,2250000),
		('8935251409123','PN02',10,1070000,0.1,960000),
		('9786048416089','PN02',10,1070000,0.1,960000),
		('8934980025765','PN02',10,3170000,0.1,2850000),
		('9786043779028','PN02',10,3170000,0.1,2850000),
		('9786048471712','PN02',10,1190000,0.1,1070000),
		('9786043090963','PN02',10,1190000,0.1,1070000),
		('8935236423878','PN02',10,2150000,0.1,1930000),
		('8935236421287','PN02',10,2150000,0.1,1930000),
-- Phiếu nhập 03
		('9786041121317','PN03',10,830000,0.15,710000),
		('8935251419863','PN03',10,830000,0.15,710000),
		('9786045582091','PN03',10,1230000,0.15,1050000),
		('8935212353861','PN03',10,1230000,0.15,1050000),
		('9786049829444','PN03',10,1380000,0.15,1170000),
		('8935235228351','PN03',10,1380000,0.15,1170000),
		('8935235205338','PN03',10,2540000,0.15,2160000),
		('8935235234161','PN03',10,2540000,0.15,2160000),
		('8935235227873','PN03',10,770000,0.15,650000),
		('8935235232006','PN03',10,770000,0.15,650000);
		select * from CHITIETPHIEUNHAP
------------------------------------------------------------------------------

CREATE TABLE KHUYENMAI(
	MaKM		VARCHAR(10) primary key,
	TenCTKM		NVARCHAR(50)	NOT NULL ,
	PhanTramKM	float			NOT NULL ,
	NgayBatDau	DATE			NOT NULL ,
	NgayKetThuc	DATE			NOT NULL 
)
go
-- Kiểm tra check bảng  PHIEUNHAP
ALTER TABLE  KHUYENMAI
ADD CONSTRAINT c_km CHECK (
		NgayBatDau <= NgayKetThuc
	AND	( PhanTramKM >=0 AND PhanTramKM <=1 ));

insert into KHUYENMAI
values ('KM01',N'Tưng bừng khai trường. Rộng ràng niềm vui ',0.2,'2023-07-25','2023-8-14'),
	   ('KM02',N'Sale sập sàn ngày 7 tháng 8',0.1,'2023-7-8','2023-8-8');
select * from KHUYENMAI
----------------------------------------------------------------------------------------------------------
CREATE TABLE BIENDONGGIA(
	MaBienDongGia		VARCHAR(10) , 
	MaISBN				VARCHAR(20) foreign key references SACH(MaISBN),
	GiaGoc				INT		NOT NULL,
	GiaBan				INT		NOT NULL,
	NgayBDG				DATE	NOT NULL,
	MaKM				VARCHAR(10) foreign key references KHUYENMAI(MaKM)
	constraint pk_BDG primary key(MaBienDongGia,MaISBN)
	)
go
-- Kiểm tra check bảng BIENDONGGIA
ALTER TABLE  BIENDONGGIA
ADD CONSTRAINT c_hbdg CHECK (
		GiaGoc	 >= 0 
	AND	GiaBan	 >= 0 );

insert into BIENDONGGIA 
values	('BDG01','8935212361750',100000,80000,'2023-7-25','KM01'),
		('BDG02','9786045629437',150000,150000,'2023-7-25',null),
		('BDG03','9786045635506',200000,160000,'2023-7-25','KM01'),
		('BDG04','9786045622797',200000,200000,'2023-7-25',null),
		('BDG05','9786045616543',148000,148000,'2023-7-25',null),
		('BDG06','9786045622827',148000,133000,'2023-7-25','KM02'),
		('BDG07','9786046811121',50000,50000,'2023-7-25',null),
		('BDG08','9786046808213',50000,45000,'2023-7-25','KM02'),
		('BDG09','9786046808206',80000,80000,'2023-7-25',null),
		('BDG10','9786046855453',80000,64000,'2023-7-25','KM01'),

		( 'BDG11','9786049994968',250000,200000,'2023-7-25','KM01'),
		( 'BDG12','2010380004831',250000,200000,'2023-7-25','KM01'),
		( 'BDG13','8935251409123',107000,86000,'2023-7-25','KM01'),
		( 'BDG14','9786048416089',107000,86000,'2023-7-25','KM01'),
		( 'BDG15','8934980025765',317000,317000,'2023-7-25',null),
		( 'BDG16','9786043779028',317000,317000,'2023-7-25',null),
		( 'BDG17','9786048471712',119000,119000,'2023-7-25',null),
		( 'BDG18','9786043090963',119000,119000,'2023-7-25',null),
		( 'BDG19','8935236423878',215000,215000,'2023-7-25',null),
		( 'BDG20','8935236421287',215000,215000,'2023-7-25',null),
		
		( 'BDG21','9786041121317',83000,66000,'2023-7-26','KM01'),
		( 'BDG22','8935251419863',83000,66000,'2023-7-26','KM01'),
		( 'BDG23','9786045582091',123000,123000,'2023-7-26',null),
		( 'BDG24','8935212353861',123000,123000,'2023-7-26',null),
		( 'BDG25','8935235228351',138000,138000,'2023-7-26',null),
		( 'BDG26','8935235228351',138000,138000,'2023-7-26',null),
		( 'BDG27','8935235205338',254000,254000,'2023-7-26',null),
		( 'BDG28','8935235205338',254000,254000,'2023-7-26',null),
		( 'BDG29','8935235205338',254000,254000,'2023-7-26',null),
		( 'BDG30','8935235205338',254000,254000,'2023-7-26',null);
		select * from BIENDONGGIA		
-----------------------------------------------------------------------
CREATE TABLE THANHTOAN(
	MaTT		VARCHAR(10) primary key,
	PhuongThuc	NVARCHAR(50) NOT NULL
)
go 
insert into THANHTOAN 
values	('TT01',N'Tiền mặt'),
		('TT02',N'Chuyển khoản');
	select * from THANHTOAN
-----------------------------------------------

CREATE TABLE HOADON(
	MaHD		VARCHAR(10) primary key,
	NgayHD		DATE			NOT NULL,
	TongSachMua	INT				NOT NULL,
	TongTienHD	INT				NOT NULL,			
	MaKH		VARCHAR(10) foreign key references KHACHHANG(MaKH),
	MaNV		VARCHAR(10) foreign key references NHANVIEN(MaNV),
	MaTT		VARCHAR(10) foreign key references THANHTOAN(MaTT)
)
go

-- Kiểm tra check bảng HOADON
ALTER TABLE   HOADON
ADD CONSTRAINT c_hd CHECK (
		TongSachMua	 >= 0 
	AND	TongTienHD >=0 );

insert into HOADON 
values	('HD01','2023-7-30',3,448000,'KH01','NV01','TT01'),
		('HD02','2023-7-30',2,322000,'KH02','NV03','TT01'),
		('HD03','2023-7-31',1,254000,'KH03','NV03','TT02');
		select * from HOADON
-------------------------------------------------------------------------------------------
CREATE TABLE CHITIETHOADON(
	MaHD		VARCHAR(10) foreign key references HOADON(MaHD),
	MaISBN		VARCHAR(20) foreign key references SACH(MaISBN),
	SoLuongHD	INT				  NOT NULL
	constraint pk_CTHD primary key(MaHD,MaISBN)
)
go
-- Kiểm tra check bảng CHITIETHOADON
ALTER TABLE   CHITIETHOADON
ADD CONSTRAINT c_cthd CHECK (
		SoLuongHD	 >= 0 );

insert into CHITIETHOADON
values ('HD01','8935212361750',1),
		('HD01','9786045635506',1),
		('HD01','9786045622827',1),
		('HD02','9786048416089',1),
		('HD02','8935236423878',1),
		('HD03','8935235205338',1);
		select * from CHITIETHOADON
--------------------------------------------------------------------------------
CREATE TABLE PHIEUGIAOHANG(
	MaVanDon	VARCHAR(10) primary key,
	DonViVC		NVARCHAR(50)		 NOT NULL,
	TenNVC		NVARCHAR(50)	     NOT NULL,
	SDTNVC		VARCHAR(20)			 NOT NULL,
	NgayGH		DATE				 NOT NULL,
	TienShip	INT					 NOT NULL,
	TrangThai	NVARCHAR(50)		 NOT NULL,
	MaHD		VARCHAR(10) foreign key references HOADON(MaHD)
)
go
insert into PHIEUGIAOHANG
values	('VD01','Viettel Post',N'Nguyễn Chí Tùng ','0709980036','2023-8-1',15000,N'Thành công','HD01'),
		('VD02','Viettel Post',N'Nguyễn Duy Hòa','0701280036','2023-8-2',15000,N'Thành công','HD02'),
		('VD03','Viettel Post',N'Ngô Xuân Nhật ','0129980036','2023-8-3',15000,N'Thành công','HD03');
		select * from PHIEUGIAOHANG

------------------------------------------------------------------------
															--- KIỂM TRA TÊN KHÔNG TRÙNG 
-- Khi thêm, sửa  dữ liệu trên bảng loại KH,  tên loại không được trùng  
CREATE TRIGGER trg_KTTL 
ON LOAIKH
FOR INSERT, UPDATE
AS
BEGIN
    IF EXISTS (	SELECT 1 FROM LOAIKH 
				WHERE TenLoai IN (SELECT TenLoai FROM inserted) 
				GROUP BY TenLoai
				HAVING COUNT(*) > 1)
    BEGIN
        ROLLBACK TRANSACTION
        RAISERROR(N'Tên loại không được trùng', 16, 1)
        RETURN
    END
END

-- KIỂM TRA THỬ 
INSERT INTO LOAIKH
values	('ML04',N'Đồng')

-- Khi thêm, sửa  dữ liệu trên bảng Ngonngu, tên ngôn ngữ hông được trùng  
CREATE TRIGGER trg_KTTNN 
ON NGONNGU
FOR INSERT, UPDATE
AS
BEGIN
    IF EXISTS (	SELECT 1 FROM NGONNGU
				WHERE TenNgonNgu IN (SELECT TenNgonNgu FROM inserted) 
				GROUP BY TenNgonNgu
				HAVING COUNT(*) > 1)
    BEGIN
        ROLLBACK TRANSACTION
        RAISERROR(N'Tên ngôn ngữ không được trùng', 16, 1)
        RETURN
    END
END

-- KIỂM TRA THỬ 
INSERT INTO NGONNGU
values ('NN04',N'Tiếng Việt')

-- -- Khi thêm, sửa  dữ liệu trên bảng thể loại, tên thể loại không được trùng
CREATE TRIGGER trg_KTTTL
ON THELOAI
FOR INSERT, UPDATE
AS
BEGIN
    IF EXISTS (	SELECT 1 FROM THELOAI
				WHERE TenTL IN (SELECT TenTL FROM inserted) 
				GROUP BY TenTL
				HAVING COUNT(*) > 1)
    BEGIN
        ROLLBACK TRANSACTION
        RAISERROR(N'Tên thể loại không được trùng', 16, 1)
        RETURN
    END
END

INSERT INTO THELOAI
values ('NN03',N'Thiếu Nhi')

--Khi thêm, sửa  dữ liệu trên bảng nhà cung cấp,  tên nhà cung cấp không được trùng
CREATE TRIGGER trg_KTTNCC
ON NHACUNGCAP
FOR INSERT, UPDATE
AS
BEGIN
    IF EXISTS (	SELECT 1 FROM NHACUNGCAP
				WHERE TenNCC IN (SELECT TenNCC FROM inserted) 
				GROUP BY TenNCC
				HAVING COUNT(*) > 1)
    BEGIN
        ROLLBACK TRANSACTION
        RAISERROR(N'Tên nhà cung cấp không được trùng', 16, 1)
        RETURN
    END
END

-- KIỂM TRA THỬ 
INSERT INTO NHACUNGCAP
values ('NCC10',N'AZ Việt Nam','azvn@gmail.com','0862934696',N'585/2A Sư Vạn Hạnh, phường 13, quận 10, Thành phố Hồ Chí Minh')

-- Khi thêm, sửa  dữ liệu trên bảng nhà xuất bản,  tên nhà xuất bản không được trùng
CREATE TRIGGER trg_KTTNXB
ON NHAXUATBAN
FOR INSERT, UPDATE
AS
BEGIN
    IF EXISTS (	SELECT 1 FROM NHAXUATBAN
				WHERE TenNXB IN (SELECT TenNXB FROM inserted) 
				GROUP BY TenNXB
				HAVING COUNT(*) > 1)
    BEGIN
        ROLLBACK TRANSACTION
        RAISERROR(N'Tên nhà xuất bản không được trùng', 16, 1)
        RETURN
    END
END

-- KIỂM TRA THỬ 
INSERT INTO NHAXUATBAN
values ('XB10',N'Thanh Niên ')

-- Khi thêm, sửa  dữ liệu trên bảng LoaiCV , tecv va loai cv không được trùng 
CREATE TRIGGER trg_KTCVVLCV 
ON CHUCVU
FOR INSERT, UPDATE
AS
BEGIN
    IF EXISTS (	SELECT 1 FROM CHUCVU
				WHERE TenCV IN (SELECT TenCV FROM inserted) 
				GROUP BY TenCV
				HAVING COUNT(*) > 1) (
										SELECT 1 FROM CHUCVU
										WHERE LoaiCV IN (SELECT LoaiCV FROM inserted) 
										GROUP BY LoaiCV
										HAVING COUNT(*) > 1)
				
    BEGIN
        ROLLBACK TRANSACTION
        RAISERROR(N'Tên chức vụ và loại chức vụ không được trùng', 16, 1)
        RETURN
    END
END

-- KIỂM TRA THỬ 
INSERT INTO CHUCVU
values	('CV04',N'Nhân viên kho ',N'Nhân viên')
