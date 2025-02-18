use DBQuanLyNhaSach
go


----------------------------------------------------thể loại  ------------------------------------------------
-- Bảng thể loại 
--Tạo thể loại 
Create proc sp_TaoTL
			@MaTL		VARCHAR(10),
			@TenTL		NVARCHAR(50)			
As
	Begin 
		Insert into TheLoai
		Values (@MaTL,@TenTL)
	End 
Exec sp_TaoTL 'TL04', N'Tâm lý'
select * from TheLoai

-- Sửa thể loại 
create proc sp_SuaTL
			@MaTL		VARCHAR(10),
			@TenTL		NVARCHAR(50)			
As
	Begin 
		Update	TheLoai
		Set		TenTL = @TenTL 
		Where	MaTL = @MaTL
	End 
Exec sp_SuaTL 'TL04', N'Trinh Thám'
select * from TheLoai
-- Xóa thể loại 
create proc sp_XoaTL
			@MaTL		VARCHAR(10)	
As
	Begin 
		Delete	From	THELOAI 
		WHERE			MaTL = @MaTL
	End 
Exec sp_XoaTL 'TL04'
select * from TheLoai
-- Xem Thể loại
create proc  sp_XemThongTinTL
			 @MaTL		VARCHAR(10)	
AS
BEGIN
		if exists (select 1 from THELOAI where MaTL = @MaTL)
		begin
			select *
			from  THELOAI
			where MaTL = @MaTL
		end
		else
		begin
			print N'Thể loại không tồn tại '
			return
		end
END 

exec  sp_XemThongTinTL 'TL01'

------------------------------------------------------------------- NHAXUATBAN --------------------------------
----------------TẠO----------------
-----------------------------------
CREATE proc sp_TaoNXB
	@MaNXB		VARCHAR(10) ,
	@TenNXB		NVARCHAR(50)
AS
	BEGIN
		INSERT INTO NHAXUATBAN
		VALUES (@MaNXB, @TenNXB)
	END

EXEC sp_TaoNXB 'XB09',N'Đông B'
SELECT * FROM NHAXUATBAN

----------------SỬA----------------
-----------------------------------
CREATE proc sp_SuaNXB
	@MaNXB		VARCHAR(10) ,
	@TenNXB		NVARCHAR(50)
AS
	BEGIN
		UPDATE	NHAXUATBAN
		SET		TenNXB = @TenNXB
		WHERE	MaNXB = @MaNXB
	END

EXEC sp_SuaNXB 'XB09',N'Đông'
SELECT * FROM NHAXUATBAN

----------------XÓA----------------
-----------------------------------
CREATE proc sp_XoaNXB
	@MaNXB		VARCHAR(10)
AS
	BEGIN
		DELETE FROM	NHAXUATBAN
		WHERE MaNXB = @MaNXB
	END

EXEC sp_XoaNXB 'XB09'
SELECT * FROM NHAXUATBAN

----------------XEM----------------
-----------------------------------
CREATE proc  sp_XemThongTinNXB
	@MaNXB	VARCHAR(10)
AS
BEGIN
		IF EXISTS (SELECT 1 FROM NHAXUATBAN WHERE MaNXB = @MaNXB)
		BEGIN
			SELECT *
			FROM  NHAXUATBAN
			WHERE MaNXB = @MaNXB
		END
		ELSE
		BEGIN
			PRINT N'Nhà xuất bản không tồn tại '
			RETURN
		END
END 

EXEC  sp_XemThongTinNXB 'XB09'

------------------------------------------------------------------ SACH ------------------------------------------
----------------TẠO----------------
CREATE proc sp_TaoS
	@MaISBN		VARCHAR(20),
	@TuaSach	NVARCHAR(100),
	@KichThuoc	VARCHAR(10),
	@SoTrang	SMALLINT,
	@HinhThuc	NVARCHAR(20),
	@MoTa		NVARCHAR(MAX),
	@DaBan		INT,
	@NamXB		INT,
	@DoTuoi		NVARCHAR(20),
	@SoLuong	INT,
	@MaTL		VARCHAR(10),
	@MaNXB		VARCHAR(10)
			
AS
	BEGIN
		INSERT INTO SACH
		VALUES (@MaISBN, @TuaSach, @KichThuoc, @SoTrang, @HinhThuc, @MoTa, @DaBan, @NamXB, @DoTuoi,@SoLuong, @MaTL, @MaNXB)
	END

EXEC sp_TaoS '9786043315516',N'Chưa Kịp Lớn Đã Phải Trưởng Thành', '21x17 cm', 200, N'Bìa cứng', 
N'Một cô gái thích tận hưởng những điều bình dị trong cuộc sống thường nhật',0,2014, N'Từ 18 tuổi',10,'TL02','XB01'
SELECT * FROM SACH

----------------SỬA----------------
-----------------------------------
CREATE or alter proc sp_SuaS
	@MaISBN		VARCHAR(20),
	@TuaSach	NVARCHAR(100),
	@KichThuoc	VARCHAR(10),
	@SoTrang	SMALLINT,
	@HinhThuc	NVARCHAR(20),
	@MoTa		NVARCHAR(MAX),
	@DaBan		INT,
	@NamXB		INT,
	@DoTuoi		NVARCHAR(20),
	@SoLuong	INT,
	@MaTL		VARCHAR(10), 
	@MaNXB		VARCHAR(10)
AS
	BEGIN
		UPDATE	SACH
		SET		TuaSach = @TuaSach, KichThuoc = @KichThuoc, SoTrang = @SoTrang, HinhThuc = @HinhThuc,
				MoTa = @MoTa,DaBan = @DaBan, NamXB = @NamXB, DoTuoi = @DoTuoi,SoLuong = @SoLuong, MaTL = @MaTL,
				MaNXB = @MaNXB 
		WHERE	MaISBN = @MaISBN
	END

EXEC sp_SuaS '9786043315516',N'Chưa Kịp Lớn Đã Phải Trưởng Thành', '21x17 cm', 180, N'Bìa cứng', 
N'Một cô gái thích tận hưởng những điều bình dị trong cuộc sống thường nhật',0,2014, N'Từ 16 tuổi',10,'TL02','XB01'
SELECT * FROM SACH

----------------XÓA----------------
-----------------------------------
--CREATE proc sp_XoaS
--	@MaISBN		VARCHAR(20)
--AS
--	BEGIN
--		DELETE FROM	SACH
--		WHERE MaISBN = @MaISBN
--	END

--EXEC sp_XoaS '9786043315516'
--SELECT * FROM SACH

----------------XEM----------------
-----------------------------------
CREATE proc  sp_XemThongTinS
	@MaISBN		VARCHAR(20)
AS
BEGIN
		IF EXISTS (SELECT 1 FROM SACH WHERE MaISBN = @MaISBN)
		BEGIN
			SELECT *
			FROM  SACH
			WHERE MaISBN = @MaISBN
		END
		ELSE
		BEGIN
			PRINT N'Sách không tồn tại '
			RETURN
		END
END 

EXEC  sp_XemThongTinS '9786043315516'

------------------------------------------------------------------Bảng NGONNGU------------------------------
----------------TẠO----------------
CREATE proc sp_TaoNN
	@MaNgonNgu	VARCHAR(10),
	@TenNgonNgu	NVARCHAR(50)
			
AS
	BEGIN
		INSERT INTO NGONNGU
		VALUES (@MaNgonNgu, @TenNgonNgu)
	END

EXEC sp_TaoNN 'NN04', N'Tiếng Hàn'
SELECT * FROM NGONNGU

----------------SỬA----------------
-----------------------------------
CREATE proc sp_SuaNN
	@MaNgonNgu	VARCHAR(10),
	@TenNgonNgu	NVARCHAR(50)
AS
	BEGIN
		UPDATE	NGONNGU
		SET		TenNgonNgu = @TenNgonNgu
		WHERE	MaNgonNgu = @MaNgonNgu
	END

EXEC sp_SuaNN 'NN04', N'Tiếng Pháp'
SELECT * FROM NGONNGU

----------------XÓA----------------
-----------------------------------
CREATE proc sp_XoaNN
	@MaNgonNgu	VARCHAR(10)
AS
	BEGIN
		DELETE FROM	NGONNGU
		WHERE MaNgonNgu = @MaNgonNgu
	END

EXEC sp_XoaNN 'NN04'
SELECT * FROM NGONNGU

----------------XEM----------------
-----------------------------------
CREATE proc  sp_XemThongTinNN
	@MaNgonNgu	VARCHAR(10)
AS
BEGIN
		IF EXISTS (SELECT 1 FROM NGONNGU WHERE MaNgonNgu = @MaNgonNgu)
		BEGIN
			SELECT *
			FROM  NGONNGU
			WHERE MaNgonNgu = @MaNgonNgu
		END
		ELSE
		BEGIN
			PRINT N'Ngôn ngữ không tồn tại '
			RETURN
		END
END 

EXEC  sp_XemThongTinNN 'NN04'

---------------------------------------------------------------------Bảng SUDUNG-------------------------------
----------------TẠO----------------
-----------------------------------
CREATE proc sp_TaoSD
	@MaNgonNgu	VARCHAR(10),
	@MaISBN		VARCHAR(20)			
AS
	BEGIN
		INSERT INTO SUDUNG
		VALUES (@MaNgonNgu, @MaISBN)
	END

EXEC sp_TaoSD 'NN03', '8935212361750'
SELECT * FROM SUDUNG
----------------XEM----------------
-----------------------------------
CREATE proc  sp_XemThongTinSD
	@MaNgonNgu	VARCHAR(10),
	@MaISBN		VARCHAR(20)			
AS
BEGIN
		IF EXISTS (SELECT 1 FROM SUDUNG WHERE MaNgonNgu = @MaNgonNgu AND MaISBN = @MaISBN)
		BEGIN
			SELECT *
			FROM  SUDUNG
			WHERE MaNgonNgu = @MaNgonNgu AND MaISBN = @MaISBN
		END
		ELSE
		BEGIN
			PRINT N'Không tồn tại'
			RETURN
		END
END 

EXEC  sp_XemThongTinSD 'NN03', '8935236423878'
----------- Xóa -----------------
--CREATE proc sp_XoaSD
--	@MaNgonNgu	VARCHAR(10),
--	@MaISBN		VARCHAR(20)			
--AS
--	BEGIN
--		DELETE FROM SUDUNG
--		WHERE  @MaNgonNgu = MaNgonNgu
--		AND	   @MaISBN = MaISBN 
--	END

--EXEC sp_XoaSD 'NN03', '9786048471712'
--SELECT * FROM SUDUNG


------------------------------------------------------------------------Bảng TACGIA---------------------------------------------------------------------
----------------TẠO----------------
-----------------------------------
CREATE proc sp_TaoTG
	@MaTG		VARCHAR(10),
	@TenTG		NVARCHAR(50)
			
AS
	BEGIN
		INSERT INTO TACGIA
		VALUES (@MaTG, @TenTG)
	END

EXEC sp_TaoTG 'TG15', N'Tố Hữu'
SELECT * FROM TACGIA

----------------SỬA----------------
-----------------------------------
CREATE proc sp_SuaTG
	@MaTG		VARCHAR(10),
	@TenTG		NVARCHAR(50)
AS
	BEGIN
		UPDATE	TACGIA
		SET		TenTG = @TenTG
		WHERE	MaTG = @MaTG
	END

EXEC sp_SuaTG 'TG15', N'Nguyễn Nhật Ánh'
SELECT * FROM TACGIA

----------------XÓA----------------
-----------------------------------
CREATE proc sp_XoaTG
	@MaTG		VARCHAR(10)
AS
	BEGIN
		DELETE FROM	TACGIA
		WHERE MaTG = @MaTG
	END

EXEC sp_XoaTG 'TG15'
SELECT * FROM TACGIA

----------------XEM----------------
-----------------------------------
CREATE proc  sp_XemThongTinTG
	@MaTG	VARCHAR(10)
AS
BEGIN
		IF EXISTS (SELECT 1 FROM TACGIA WHERE MaTG = @MaTG)
		BEGIN
			SELECT *
			FROM  TACGIA
			WHERE MaTG = @MaTG
		END
		ELSE
		BEGIN
			PRINT N'Tác giả không tồn tại '
			RETURN
		END
END 

EXEC  sp_XemThongTinTG 'TG15'

--------------------------------------------------------------------------------Bảng THAMGIAVIET---------------------------------------------
----------------TẠO----------------
-----------------------------------
CREATE proc sp_TaoTGV
	@MaTG		VARCHAR(10),
	@MaISBN		VARCHAR(20),
	@NamViet		INT
AS
	BEGIN
		INSERT INTO THAMGIAVIET
		VALUES (@MaTG, @MaISBN, @NamViet)
	END

EXEC sp_TaoTGV 'TG01','9786046811121',2020
SELECT * FROM THAMGIAVIET

----------------SỬA----------------
-----------------------------------
CREATE proc sp_SuaTGV
	@MaTG		VARCHAR(10),
	@MaISBN		VARCHAR(20),
	@NamViet		INT
AS
	BEGIN
		UPDATE	THAMGIAVIET
		SET		NamViet = @NamViet
		WHERE	MaTG = @MaTG AND MaISBN = @MaISBN
	END

EXEC sp_SuaTGV 'TG01','9786046811121',2021
SELECT * FROM THAMGIAVIET

----------------XÓA----------------
-----------------------------------
--CREATE proc sp_XoaTGV
--	@MaTG		VARCHAR(10),
--	@MaISBN		VARCHAR(20)
--AS
--	BEGIN
--		DELETE FROM	THAMGIAVIET
--		WHERE MaTG = @MaTG AND MaISBN = @MaISBN
--	END

--EXEC sp_XoaTGV 'TG01','9786046811121'
--SELECT * FROM THAMGIAVIET

----------------XEM----------------
-----------------------------------
CREATE proc  sp_XemThongTinTGV
	@MaTG		VARCHAR(10),
	@MaISBN		VARCHAR(20)
AS
BEGIN
		IF EXISTS (SELECT 1 FROM THAMGIAVIET WHERE MaTG = @MaTG AND MaISBN = @MaISBN)
		BEGIN
			SELECT *
			FROM THAMGIAVIET
			WHERE MaTG = @MaTG AND MaISBN = @MaISBN
		END
		ELSE
		BEGIN
			PRINT N'Không tồn tại '
			RETURN
		END
END 

EXEC  sp_XemThongTinTGV 'TG01','9786046811121'

---------------------------------------------------------------------------Bảng DICHGIA-----------------------------------------------
----------------TẠO----------------
-----------------------------------
CREATE proc sp_TaoDG
	@MaDG		VARCHAR(10) ,
	@TenDG		NVARCHAR(50)			
AS
	BEGIN
		INSERT INTO DICHGIA
		VALUES (@MaDG, @TenDG)
	END

EXEC sp_TaoDG 'DG07', N'Hàn Băng Vũ'
SELECT * FROM DICHGIA

----------------SỬA----------------
-----------------------------------
CREATE proc sp_SuaDG
	@MaDG		VARCHAR(10),
	@TenDG		NVARCHAR(50)
AS
	BEGIN
		UPDATE	DICHGIA
		SET		TenDG = @TenDG
		WHERE	MaDG = @MaDG
	END

EXEC sp_SuaDG 'DG07', N'Hàn Vũ'
SELECT * FROM DICHGIA

----------------XÓA----------------
-----------------------------------
CREATE proc sp_XoaDG
	@MaDG		VARCHAR(10)
AS
	BEGIN
		DELETE FROM	DICHGIA
		WHERE MaDG = @MaDG
	END

EXEC sp_XoaDG 'DG07'
SELECT * FROM DICHGIA

----------------XEM----------------
-----------------------------------
CREATE proc  sp_XemThongTinDG
	@MaDG	VARCHAR(10)
AS
BEGIN
		IF EXISTS (SELECT 1 FROM DICHGIA WHERE MaDG = @MaDG)
		BEGIN
			SELECT *
			FROM  DICHGIA
			WHERE MaDG = @MaDG
		END
		ELSE
		BEGIN
			PRINT N'Dịch giả không tồn tại '
			RETURN
		END
END 

EXEC  sp_XemThongTinDG 'DG07'

----------------------------------------------------------------------------Bảng THAMGIADICH--------------------------------------------
----------------TẠO----------------
-----------------------------------
CREATE proc sp_TaoTGD
	@MaDG		VARCHAR(10),
	@MaISBN		VARCHAR(20),
	@NamDich		INT
AS
	BEGIN
		INSERT INTO THAMGIADICH
		VALUES (@MaDG, @MaISBN, @NamDich)
	END

EXEC sp_TaoTGD 'DG03','9786045582091',2014
SELECT * FROM THAMGIADICH

----------------SỬA----------------
-----------------------------------
CREATE proc sp_SuaTGD
	@MaDG		VARCHAR(10),
	@MaISBN		VARCHAR(20),
	@NamDich		INT
AS
	BEGIN
		UPDATE	THAMGIADICH
		SET		NamDich = @NamDich
		WHERE	MaDG = @MaDG AND MaISBN = @MaISBN
	END

EXEC sp_SuaTGD 'DG03','9786045582091',2015
SELECT * FROM THAMGIADICH

----------------XÓA----------------
-----------------------------------
--CREATE proc sp_XoaTGD
--	@MaDG		VARCHAR(10),
--	@MaISBN		VARCHAR(20)
--AS
--	BEGIN
--		DELETE FROM	THAMGIADICH
--		WHERE MaDG = @MaDG AND MaISBN = @MaISBN
--	END

--EXEC sp_XoaTGD 'DG03','9786045582091'
--SELECT * FROM THAMGIADICH

----------------XEM----------------
-----------------------------------
CREATE proc  sp_XemThongTinTGD
	@MaDG		VARCHAR(10),
	@MaISBN		VARCHAR(20)
AS
BEGIN
		IF EXISTS (SELECT 1 FROM THAMGIADICH WHERE MaDG = @MaDG AND MaISBN = @MaISBN)
		BEGIN
			SELECT *
			FROM THAMGIADICH
			WHERE MaDG = @MaDG AND MaISBN = @MaISBN
		END
		ELSE
		BEGIN
			PRINT N'Không tồn tại '
			RETURN
		END
END 

EXEC  sp_XemThongTinTGD 'DG03','9786045582091'



--------------------------------------------------------------------------------------Bảng CHUCVU--------------------------------------------------------
----------------TẠO----------------
-----------------------------------
CREATE proc sp_TaoCV
	@MaCV		VARCHAR(10),
	@TenCV		NVARCHAR(50),
	@LoaiCV		NVARCHAR(50)
AS
	BEGIN
		INSERT INTO CHUCVU
		VALUES (@MaCV, @TenCV, @LoaiCV)
	END

EXEC sp_TaoCV 'CV04',N'Nhân viên kho',N'Quản lý'
SELECT * FROM CHUCVU

----------------SỬA----------------
-----------------------------------
CREATE proc sp_SuaCV
	@MaCV		VARCHAR(10),
	@TenCV		NVARCHAR(50),
	@LoaiCV		NVARCHAR(50)
AS
	BEGIN
		UPDATE	CHUCVU
		SET		TenCV = @TenCV, LoaiCV = @LoaiCV
		WHERE	MaCV = @MaCV
	END

EXEC sp_SuaCV 'CV04',N'Nhân viên kho',N'Nhân viên'
SELECT * FROM CHUCVU

----------------XÓA----------------
-----------------------------------
CREATE proc sp_XoaCV
	@MaCV		VARCHAR(10)
AS
	BEGIN
		DELETE FROM	CHUCVU
		WHERE MaCV = @MaCV
	END

EXEC sp_XoaCV 'CV04'
SELECT * FROM CHUCVU

----------------XEM----------------
-----------------------------------
CREATE proc  sp_XemThongTinCV
	@MaCV	VARCHAR(10)
AS
BEGIN
		IF EXISTS (SELECT 1 FROM CHUCVU WHERE MaNCV = @MaCV)
		BEGIN
			SELECT *
			FROM  CHUCVU
			WHERE MaCV = @MaCV
		END
		ELSE
		BEGIN
			PRINT N'Chức vụ không tồn tại '
			RETURN
		END
END 

EXEC  sp_XemThongTinCV 'CV04'

------------------------------------------------------------------------------------------Bảng NHANVIEN---------------------------------------------------
----------------TẠO----------------
-----------------------------------
CREATE proc sp_TaoNV
	@MaNV		VARCHAR(10) ,
	@HoTenNV	NVARCHAR(50),
	@NgaySinhNV	DATE,
	@GioiTinhNV	NVARCHAR(3),
	@SDTNV		VARCHAR(20),
	@MaCV		VARCHAR(10)
AS
	BEGIN
		INSERT INTO NHANVIEN
		VALUES (@HoTenNV, @NgaySinhNV, @GioiTinhNV, @SDTNV, @MaCV)
	END

EXEC sp_TaoNV 'NV05',N'Lê Yến Thơ','2003-11-06',N'Nữ','0893420070','CV02'
SELECT * FROM NHANVIEN

----------------SỬA----------------
-----------------------------------
CREATE proc sp_SuaNV
	@MaNV		VARCHAR(10) ,
	@HoTenNV	NVARCHAR(50),
	@NgaySinhNV	DATE,
	@GioiTinhNV	NVARCHAR(3),
	@SDTNV		VARCHAR(20),
	@MaCV		VARCHAR(10)
AS
	BEGIN
		UPDATE	NHANVIEN
		SET		HoTenNV = @HoTenNV,NgaySinhNV = @NgaySinhNV,GioiTinhNV = @GioiTinhNV,SDTNV = @SDTNV,MaCV = @MaCV
		WHERE	MaNV = @MaNV
	END

EXEC sp_SuaNV 'NV05',N'Lê Yến Thơ','2003-11-06',N'Nữ','0899020070','CV02'
SELECT * FROM NHANVIEN

----------------XÓA----------------
-----------------------------------
--CREATE proc sp_XoaNV
--	@MaNV	VARCHAR(10)
--AS
--	BEGIN
--		DELETE FROM	NHANVIEN
--		WHERE MaNV = @MaNV
--	END

--EXEC sp_XoaNV 'NV05'
--SELECT * FROM NHANVIEN

----------------XEM----------------
-----------------------------------
CREATE proc  sp_XemThongTinNV
	@MaNV	VARCHAR(10)
AS
BEGIN
		IF EXISTS (SELECT 1 FROM NHANVIEN WHERE MaNV = @MaNV)
		BEGIN
			SELECT *
			FROM  NHANVIEN
			WHERE MaNV = @MaNV
		END
		ELSE
		BEGIN
			PRINT N'Nhân viên không tồn tại '
			RETURN
		END
END 

EXEC  sp_XemThongTinNV 'NV05'

--------------------------------------------------------------------------Bảng LOAIKH---------------------------------------------------
----------------TẠO----------------
-----------------------------------
CREATE proc sp_TaoLoaiKH
	@MaLoai		VARCHAR(10),
	@TenLoai 	NVARCHAR(50)
AS
	BEGIN
		INSERT INTO LOAIKH
		VALUES (@MaLoai, @TenLoai)
	END

EXEC sp_TaoLoaiKH 'ML04',N'Kim cương'
SELECT * FROM LOAIKH

----------------SỬA----------------
-----------------------------------
CREATE proc sp_SuaLoaiKH
	@MaLoai		VARCHAR(10),
	@TenLoai 	NVARCHAR(50)
AS
	BEGIN
		UPDATE	LOAIKH
		SET		TenLoai = @TenLoai
		WHERE	MaLoai = @MaLoai
	END

EXEC sp_SuaLoaiKH 'ML04',N'Kim Cương'
SELECT * FROM LOAIKH

----------------XÓA----------------
-----------------------------------
CREATE proc sp_XoaLoaiKH
	@MaLoai		VARCHAR(10)
AS
	BEGIN
		DELETE FROM	LOAIKH
		WHERE MaLoai = @MaLoai
	END

EXEC sp_XoaLoaiKH 'ML04'
SELECT * FROM LOAIKH

----------------XEM----------------
-----------------------------------
CREATE proc  sp_XemThongTinLoaiKH
	@MaLoai		VARCHAR(10)
AS
BEGIN
		IF EXISTS (SELECT 1 FROM LOAIKH WHERE MaLoai = @MaLoai)
		BEGIN
			SELECT *
			FROM  LOAIKH
			WHERE MaLoai = @MaLoai
		END
		ELSE
		BEGIN
			PRINT N'Loại khách hàng không tồn tại '
			RETURN
		END
END 

EXEC  sp_XemThongTinLoaiKH 'ML04'

-------------------------------------------------------------------------------------Bảng KHACHHANG------------------------------------------------------
----------------TẠO----------------
-----------------------------------
CREATE proc sp_TaoKH
	@MaKH				VARCHAR(10),
	@HoTenKH			VARCHAR(50),
	@NgaySinhKH			DATE,
	@GioiTinhKH			NVARCHAR(3),
	@SDTKH				VARCHAR(20),
	@DiaChiKH			NVARCHAR(100),
	@EmailKH			NVARCHAR(50),
	@DiemThuongTichLuy	INT,
	@MaLoai				VARCHAR(10)
AS
	BEGIN
		INSERT INTO KHACHHANG
		VALUES (@MaKH, @HoTenKH,@NgaySinhKH	,@GioiTinhKH,@SDTKH,@DiaChiKH,
				@EmailKH,@DiemThuongTichLuy,@MaLoai	)
	END

EXEC sp_TaoKH 'KH04',N'Nguyễn Hoàng Mỹ','2003/09/17',N'Nam','0917677196',N'Sư Vạn Hạnh Quận 10','my@gmail.com',400,'ML03'
SELECT * FROM KHACHHANG

----------------SỬA----------------
-----------------------------------
CREATE proc sp_SuaKH
	@MaKH				VARCHAR(10),
	@HoTenKH			VARCHAR(50),
	@NgaySinhKH			DATE,
	@GioiTinhKH			NVARCHAR(3),
	@SDTKH				VARCHAR(20),
	@DiaChiKH			NVARCHAR(100),
	@EmailKH			NVARCHAR(50),
	@DiemThuongTichLuy	INT,
	@MaLoai				VARCHAR(10)
AS
	BEGIN
		UPDATE	KHACHHANG
		SET		HoTenKH = @HoTenKH,NgaySinhKH = @NgaySinhKH,GioiTinhKH = @GioiTinhKH,SDTKH = @SDTKH,DiaChiKH = @DiaChiKH,
				EmailKH = @EmailKH,DiemThuongTichLuy = @DiemThuongTichLuy, MaLoai = @MaLoai
		WHERE	MaKH = @MaKH
	END

EXEC sp_SuaKH'KH04',N'Nguyễn Hoàng Mỹ','2003/09/17',N'Nữ','0917677196',N'Sư Vạn Hạnh Quận 10','my@gmail.com',400,'ML03'
SELECT * FROM KHACHHANG

----------------XÓA----------------
-----------------------------------
--CREATE proc sp_XoaKH
--	@MaKH VARCHAR(10)
--AS
--	BEGIN
--		DELETE FROM	KHACHHANG
--		WHERE MaKH = @MaKH
--	END

--EXEC sp_XoaKH 'KH04'
--SELECT * FROM KHACHHANG

----------------XEM----------------
-----------------------------------
CREATE proc  sp_XemThongTinKH
	@MaKH VARCHAR(10)
AS
BEGIN
		IF EXISTS (SELECT 1 FROM KHACHHANG WHERE MaKH = @MaKH)
		BEGIN
			SELECT *
			FROM  KHACHHANG
			WHERE MaKH = @MaKH
		END
		ELSE
		BEGIN
			PRINT N'Khách hàng không tồn tại '
			RETURN
		END
END 

EXEC  sp_XemThongTinKH 'KH04'
------------------------------------------------------------------------------- BINHLUAN ------------------------------------------------------------ 
---- Tạo BL 
create proc sp_TaoBL
			@MaKH		VARCHAR(10),
			@MaISBN		VARCHAR(20),
			@NoiDungBL	NVARCHAR(50),
			@NgayDang	DATE		,
			@SoSao		SMALLINT	
as
begin
	insert into BINHLUAN
	values (@MaKH, @MaISBN,  @NoiDungBL, @NgayDang, @SoSao)
end

exec sp_TaoBL 'KH03','8935212361750',N'Sách hay lắm, nên mua ','2023-8-6',5

select * from BINHLUAN
-- Sửa BL 
create or alter  proc sp_SuaBL
			@MaKH		VARCHAR(10),
			@MaISBN		VARCHAR(20),
			@NoiDungBL	NVARCHAR(50),
			@NgayDang	DATE		,
			@SoSao		SMALLINT	
as
begin
	UPDATE	BINHLUAN
	SET	
			 NoiDungBL = @NoiDungBL , 
			 NgayDang = @NgayDang ,
			 SoSao = @SoSao
	WHERE   @MaKH = MaKH
	and		@MaISBN = MaISBN
end
exec sp_SuaBL 'KH03','8935212361750',N'Sách hay lắm, nên mua ','2023-8-6',4
select * from BINHLUAN 
-- Xem bình luận
create or alter  proc  sp_XemThongTinBL
			 @MaKH		VARCHAR(10)	,
			 @MaISBN		VARCHAR(20)
AS
BEGIN
		if exists (select 1 from BINHLUAN where MaKH = @MaKH AND MaISBN = @MaISBN )
		begin
			select *
			from  BINHLUAN			
			WHERE   @MaKH = MaKH
			AND		@MaISBN = MaISBN
		end
		else
		begin
			print N'Bình luận không tồn tại '
			return
		end
END 

exec  sp_XemThongTinBL 'KH01','8935212361750'
-- Xóa BL 
--create proc sp_XoaBL
--			@MaKH		VARCHAR(10),
--			@MaISBN		VARCHAR(20)
--as
--begin
--	delete from BINHLUAN
--	 WHERE   @MaKH = MaKH
--	and		@MaISBN = MaISBN
--end

--exec sp_XoaBL 'KH03','8935212361750'
-------------------------------------------------------------------- NHACUNGCAP ------------------------------------------------------------
--Tạo Nhà cung cấp
Create proc sp_TaoNCC
			@MaNCC		VARCHAR(10),
			@TenNCC		NVARCHAR(50)	,
			@Email_NCC	NVARCHAR(50)	 ,
			@SDT_NCC		VARCHAR(20)		 ,
			@DiaChi_NCC	NVARCHAR(100)	 		
As
	Begin 
		Insert into NHACUNGCAP
		Values (@MaNCC,@TenNCC,@Email_NCC,@SDT_NCC,@DiaChi_NCC )
	End 
Exec sp_TaoNCC 'NCC04',N'AZ Việt Nam','azvn@gmail.com','0862934696',N'585/2A Sư Vạn Hạnh, phường 13, quận 10, Thành phố Hồ Chí Minh'
select * from NHACUNGCAP

-- Sửa nhà cung cấp
create proc sp_SuaNCC
			@MaNCC		VARCHAR(10),
			@TenNCC		NVARCHAR(50)	,
			@Email_NCC	NVARCHAR(50)	 ,
			@SDT_NCC		VARCHAR(20)		 ,
			@DiaChi_NCC	NVARCHAR(100)	 		
As
	Begin 
		Update	NHACUNGCAP
		Set		TenNCC=@TenNCC , Email_NCC=@Email_NCC,SDT_NCC=@SDT_NCC,DiaChi_NCC=@DiaChi_NCC
		Where	MaNCC=@MaNCC
	End 
Exec sp_SuaNCC 'NCC04',N'Việt Nam','yenn@gmail.com','0962934696',N'583/2A Sư Vạn Hạnh, phường 13, quận 10, Thành phố Hồ Chí Minh'
select * from NHACUNGCAP

-- Xóa nhà cung cấp
create proc sp_XoaNCC
			@MaNCC		VARCHAR(10)
			
As
	Begin 
		Delete	From	NHACUNGCAP
		WHERE			MaNCC=@MaNCC
	End 
Exec sp_XoaNCC 'NCC04'
select * from NHACUNGCAP


-- Xem nhà cung cấp
create proc  sp_XemThongTinNCC
			 @MaNCC		VARCHAR(10)	
AS
BEGIN
		if exists (select 1 from NHACUNGCAP where MaNCC = @MaNCC)
		begin
			select *
			from  NHACUNGCAP
			where MaNCC = @MaNCC
		end
		else
		begin
			print N'Nhà cung cấp không tồn tại '
			return
		end
END 

exec  sp_XemThongTinNCC 'NCC01'
Select * from NHACUNGCAP
----------------------------------------------------------------------------------------Bảng PHIEUNHAP----------------------------------------
--- Tao PN 
create proc sp_TaoPN
			@MaPN varchar(10),
			@NgayNhap		DATE			,
			@TongCongPN		INT				,
			@TongSachNhap	INT				,
			@DVTPN			NVARCHAR(10)	,
			@MaNCC			VARCHAR(10)     ,
			@MaNV			VARCHAR(10)
		as
begin
			insert into PHIEUNHAP
			values		(@MaPN,@NgayNhap, @TongCongPN, @TongSachNhap, @DVTPN, @MaNCC, @MaNV ) 
end 
exec sp_TaoPN 'PN04','2023-7-25',0,0,N'Cuốn','NCC01','NV01'
-- Sửa PN
create proc sp_SuaPN
			@MaPN varchar(10),
			@NgayNhap		DATE			,
			@TongCongPN		INT				,
			@TongSachNhap	INT				,
			@DVTPN			NVARCHAR(10)	,
			@MaNCC			VARCHAR(10)     ,
			@MaNV			VARCHAR(10)
		as
begin
			UPDATE    PHIEUNHAP
			SET		 NgayNhap = @NgayNhap, TongCongPN  =  @TongCongPN, TongSachNhap =  @TongSachNhap, DVTPN = @DVTPN, MaNCC = @MaNCC, MaNV = @MaNV 
			WHERE	 MaPN =  @MaPN 
end 
exec sp_SuaPN 'PN04','2023-7-25',924000,100,N'Cuốn','NCC01','NV02'
select * from PHIEUNHAP 
---- Xóa Pn 
--create proc sp_XoaPN
--			@MaPN varchar(10)
--		as
--begin
--			Delete from    PHIEUNHAP			 
--			WHERE	 MaPN =  @MaPN 
--end 
--exec sp_XoaPN 'PN04'
--select * from PHIEUNHAP 
-- Xem PN
create proc  sp_XemThongTinPN
			 @MaPN	VARCHAR(10)	
AS
BEGIN
		if exists (select 1 from PHIEUNHAP where MaPN= @MaPN)
		begin
			select *
			from  PHIEUNHAP
			where MaPN = @MaPN
		end
		else
		begin
			print N'Phiếu nhập không tồn tại '
			return
		end
END 

exec  sp_XemThongTinPN 'PN01'
----------------------------------------------------------------------	Bảng CHITIETPHIEUNHAP -----------------------------------
-- Thêm CTPN
create proc sp_TaoCTPN
			@MaISBN		VARCHAR(20) ,
			@MaPN		VARCHAR(10) ,
			@SoLuongPN	INT				,
			@DonGiaPN	INT				,
			@PhanTramCK	float			,
			@ThanhTien	INT				
as
begin
			INSERT INTO CHITIETPHIEUNHAP
			VALUES ( @MaISBN		,
			@MaPN		,
			@SoLuongPN  ,
			@DonGiaPN	,
			@PhanTramCK	,
			@ThanhTien	)		
end 

exec sp_TaoCTPN '8935212361750','PN04',10,1000000,0.2,80000
-- Xem TT 
create proc  sp_XemThongTinChiTietPN
			 @MaISBN	VARCHAR(20)	
AS
BEGIN
		if exists (select 1 from CHITIETPHIEUNHAP where MaISBN= @MaISBN)
		begin
			select *
			from  CHITIETPHIEUNHAP
			where MaISBN = @MaISBN
		end
		else
		begin
			print N'Chi tiết Phiếu nhập không tồn tại '
			return
		end
END 

exec  sp_XemThongTinChiTietPN '8935212361750'
-- Sửa CPN 
create proc sp_SuaCTPN
			@MaISBN		VARCHAR(20) ,
			@MaPN		VARCHAR(10) ,
			@SoLuongPN	INT				,
			@DonGiaPN	INT				,
			@PhanTramCK	float			,
			@ThanhTien	INT				
as
begin
			UPDATE  CHITIETPHIEUNHAP
			SET    SoLuongPN = @SoLuongPN  ,
			DonGiaPN = @DonGiaPN	,
			PhanTramCK = @PhanTramCK	,
			ThanhTien = @ThanhTien	
			WHERE   MaISBN =@MaISBN and  MaPN= @MaPN		
					
end 

exec sp_TaoCTPN '9786045629437','PN04',10,1000000,0.2,80000
-- Xem TT 
-- Xóa CTPN 
------------------------------------------------------------------------------------Bảng KHUYENMAI ------------------------------------------
--Tạo Khuyễn mãi
Create proc sp_TaoKM
		
			@MaKM		VARCHAR(10),
			@TenCTKM		NVARCHAR(50) ,
			@PhamTramKM	float ,
			@NgayBatDau	DATE ,
			@NgayKetThuc	DATE		 

As
	Begin 
		Insert into KHUYENMAI
		Values (@MaKM,@TenCTKM,@PhamTramKM,@NgayBatDau,@NgayKetThuc )
	End 
Exec sp_TaoKM 'KM04',N'Tưng bừng khai trường. Rộng ràng niềm vui ','0.3','2023-8-7','2023-8-14'
select * from KHUYENMAI

-- Sửa khuyến mãi
create proc sp_SuaKM
			@MaKM		VARCHAR(10),
			@TenCTKM		NVARCHAR(50) ,
			@PhamTramKM	float ,
			@NgayBatDau	DATE ,
			@NgayKetThuc	DATE			
As
	Begin 
		Update	KHUYENMAI
		Set		TenCTKM=@TenCTKM,NgayBatDau=@NgayBatDau,NgayKetThuc=@NgayKetThuc
		Where	MaKM=@MaKM
	End 
Exec sp_SuaKM 'KM04',N'Tưng bừng quá đi. Rộng ràng niềm vui ','0.3','2023-8-7','2023-8-14'
select * from KHUYENMAI

-- Xóa khuyến mãi
create proc sp_XoaKM
			@MaKM	VARCHAR(10)
			
As
	Begin 
		Delete	From	KHUYENMAI
		WHERE			MaKM=@MaKM
	End 
Exec sp_XoaKM 'KM04'
select * from KHUYENMAI
-- Xem khuyễn mãi
create proc  sp_XemThongTinKM
			 @MaKM	VARCHAR(10)	
AS
BEGIN
		if exists (select 1 from KHUYENMAI where MaKM = @MaKM)
		begin
			select *
			from  KHUYENMAI
			where MaKM= @MaKM
		end
		else
		begin
			print N'Nhà khuyến mãi không tồn tại '
			return
		end
END 

exec  sp_XemThongTinKM 'KM01'
----------------------------------------------------------------------------------------	Bảng BIENDONGGIA -------------------------------------
-- tạo 
CREATE proc sp_TaoBDG
	@MaBienDongGia		VARCHAR(10) , 
	@MaISBN				VARCHAR(20) ,
	@GiaGoc				INT	,
	@GiaBan				INT	,
	@NgayBDG			DATE,
	@MaKM				VARCHAR(10)
AS
	BEGIN
		INSERT INTO BIENDONGGIA
		VALUES (@MaBienDongGia, @MaISBN,@GiaGoc, @GiaBan,@NgayBDG,@MaKM)
	END

EXEC sp_TaoBDG 'BDG31','8935212361750',100000,80000,'2023-7-25','KM01'
SELECT * FROM BIENDONGGIA
----------------SỬA----------------
-----------------------------------
CREATE proc sp_SuaBDG
	@MaBienDongGia	VARCHAR(10),
	@MaISBN			VARCHAR(20),
	@GiaGoc			INT,
	@GiaBan			INT,
	@NgayBDG		DATE,
	@MaKM			VARCHAR(10)
AS
	BEGIN
		UPDATE BIENDONGGIA
		SET GiaGoc = @GiaGoc, GiaBan = @GiaBan, NgayBDG = @NgayBDG
		WHERE MaBienDongGia = @MaBienDongGia
	END

EXEC sp_SuaBDG 'BDG31','8935212361750',100000,80000,'2023-7-26','KM01'
SELECT * FROM BIENDONGGIA

-- xem 
create proc  sp_XemThongTinBienDongGia
			 @MaBienDongGia	VARCHAR(10)	
AS
BEGIN
		if exists (select 1 from BIENDONGGIA where MaBienDongGia = @MaBienDongGia)
		begin
			select *
			from  BIENDONGGIA
			where MaBienDongGia= @MaBienDongGia
		end
		else
		begin
			print N'Biến động giá không tồn tại '
			return
		end
END 

exec  sp_XemThongTinBienDongGia 'BDG01'
----------------------------------------------------------------------------THANHTOAN----------------------------------
--- Tạo thanh toán
Create proc sp_TaoTT
		
			@MaTT		VARCHAR(10) ,
			@PhuongThuc	NVARCHAR(50) 
As
	Begin 
		Insert into THANHTOAN
		Values (@MaTT,@Phuongthuc )
	End 
Exec sp_TaoTT 'TT03',N'Nhận hàng Chuyển khoản'
select * from THANHTOAN
DROP PROCEDURE IF EXISTS sp_TaoKM;
-- Sửa thanh toán
create proc sp_SuaTT
			@MaTT		VARCHAR(10) ,
			@PhuongThuc	NVARCHAR(50) 
As
	Begin 
		Update	THANHTOAN
		Set		PhuongThuc=@PhuongThuc
		Where	MaTT=@MaTT
	End 
Exec sp_SuaTT 'TT03',N'Thanh toán sau'
select * from THANHTOAN
DROP PROCEDURE IF EXISTS sp_SuaTT

-- Xem Thanh toán
create proc  sp_XemThongTinTT
			 @MaTT	VARCHAR(10)	
AS
BEGIN
		if exists (select 1 from THANHTOAN where MaTT = @MaTT)
		begin
			select *
			from  THANHTOAN
			where MaTT= @MaTT
		end
		else
		begin
			print N'Nhà thanh toán không tồn tại '
			return
		end
END 

exec  sp_XemThongTinTT'TT01'
	-------------------------------------------------------------------------------------Bảng HOADON --------------------------------------------------------
	--4.3.4.	Bảng HOADON
----------------TẠO----------------
-----------------------------------
CREATE proc sp_TaoHD
	@MaHD		VARCHAR(10),
	@NgayHD		DATE,
	@TongSachMua	INT,
	@TongTienHD	INT,			
	@MaKH		VARCHAR(10),
	@MaNV		VARCHAR(10) ,
	@MaTT		VARCHAR(10) 
AS
	BEGIN
		INSERT INTO HOADON
		VALUES (@MaHD, @NgayHD, @TongSachMua, @TongTienHD, @MaKH, @MaNV, @MaTT)
	END

EXEC sp_TaoHD 'HD04','2023-7-31',1,254000,'KH03','NV03','TT02'
SELECT * FROM HOADON

----------------SỬA----------------
-----------------------------------
CREATE proc sp_SuaHD
	@MaHD		VARCHAR(10),
	@NgayHD		DATE,
	@TongSachMua	INT,
	@TongTienHD	INT,			
	@MaKH		VARCHAR(10),
	@MaNV		VARCHAR(10) ,
	@MaTT		VARCHAR(10) 
AS
	BEGIN
		UPDATE	HOADON
		SET		TongSachMua = @TongSachMua
		WHERE	MaHD = @MaHD
	END

EXEC sp_SuaHD 'HD04','2023-7-31',1,254000,'KH03','NV03','TT02'
SELECT * FROM HOADON

-- Xem
create proc  sp_XemThongTinHD
			 @MaHD	VARCHAR(10)	
AS
BEGIN
		if exists (select 1 from HOADON where MaHD = @MaHD)
		begin
			select *
			from  HOADON
			where MaHD= @MaHD
		end
		else
		begin
			print N'Hóa đơn không tồn tại '
			return
		end
END 

exec  sp_XemThongTinHD'HD01'
-----------------------------------------------------------------------------------	Bảng CHITIETHOADON --------------------------------------------------
----------------TẠO----------------
-----------------------------------
CREATE proc sp_TaoCTHD
	@MaHD		VARCHAR(10) ,
	@MaISBN		VARCHAR(20) ,
	@SoLuongHD	INT
	
	AS
	BEGIN
		INSERT INTO CHITIETHOADON
		VALUES (@MaHD,@MaISBN, @SoLuongHD)
	END

EXEC sp_TaoCTHD 'HD04','9786045622827',1
SELECT * FROM CHITIETHOADON

----------------SỬA----------------
-----------------------------------
CREATE proc sp_SuaCTHD
	@MaHD		VARCHAR(10) ,
	@MaISBN		VARCHAR(20) ,
	@SoLuongHD	INT

AS
	BEGIN
		UPDATE	CHITIETHOADON
		SET		SoLuongHD = @SoLuongHD	
		WHERE	MaHD = @MaHD AND MaISBN = @MaISBN
	END

EXEC sp_SuaCTHD 'HD04','9786045622827',1
SELECT * FROM CHITIETHOADON


create proc  sp_XemThongTinChiTietHD
			 @MaHD	VARCHAR(10)	
AS
BEGIN
		if exists (select 1 from CHITIETHOADON where MaHD = @MaHD)
		begin
			select *
			from  CHITIETHOADON
			where MaHD= @MaHD
		end
		else
		begin
			print N'Chi tiết hóa đơn không tồn tại '
			return
		end
END 

exec  sp_XemThongTinChiTietHD'HD01'
---------------------------------------------------------------------------------PHIEUGIAOHANG ---------------------------------------------------------
-- Tạo PGH
create proc sp_TaoPGH			
			@MaVanDon	VARCHAR(10) ,
			@DonViVC		NVARCHAR(50)		,
			@TenNVC		NVARCHAR(50)	     ,
			@SDTNVC		VARCHAR(20)			 ,
			@NgayGH		DATE				 ,
			@TienShip	INT					,
			@TrangThai	NVARCHAR(50)		 ,
			@MaHD		VARCHAR(10) 

as
begin
			insert into PhieuGiaoHang
			values		(@MaVanDon,@DonViVC, @TenNVC, @SDTNVC	, @NgayGH, @TienShip, @TrangThai, @MaHD)
end 

exec sp_TaoPGH 'VD04','Viettel Post',N'Nguyễn Chí Tùng ','0709980036','2023-8-1',15000,N'Thành công','HD01'
-- Sửa 
create proc sp_SuaPGH			
			@MaVanDon	VARCHAR(10) ,
			@DonViVC		NVARCHAR(50)		,
			@TenNVC		NVARCHAR(50)	     ,
			@SDTNVC		VARCHAR(20)			 ,
			@NgayGH		DATE				 ,
			@TienShip	INT					,
			@TrangThai	NVARCHAR(50)		 ,
			@MaHD		VARCHAR(10) 

as
begin
			update PhieuGiaoHang
			set	   DonViVC= @DonViVC, TenNVC =  @TenNVC, SDTNVC =  @SDTNVC	, NgayGH = @NgayGH, TienShip=  @TienShip, TrangThai = @TrangThai, MaHD = @MaHD
			where MaVanDon  = @MaVanDon
		
end 

exec sp_SuaPGH 'VD04','Viettel Post',N'Nguyễn Chí Tùng ','0709980036','2023-8-1',15000,N'Thành công','HD01'

-- Xem 
create proc sp_XemPGH			
			@MaVanDon	VARCHAR(10) 
as 
begin
		if exists (select 1 from PHIEUGIAOHANG where MaVanDon =@MaVanDon)
		begin
			select *
			from  PHIEUGIAOHANG 
			where MaVanDon =@MaVanDon
		end
		else
		begin
			print N'Ma VD không tồn tại '
			return
		end
end 

exec sp_XemPGH 'VD01'

------------------------------------------------------------------------------------ Nâng cao ----------------------------------------------------------
-- Nhận tham số đầu vào là NgayHD; trả về tổng số lượng bán và tổng tiền đã bán trong ngày. 
create proc sp_NgayHD_SL_TT
			@ngayhd date,
			@tongtienbantrongngay int OUTPUT,
			@tongsoluongbantrongngay int OUTPUT
as
begin
			select  @tongtienbantrongngay =sum(TongTienHD) , @tongsoluongbantrongngay = sum(TongSachMua) 
			from	HOADON 
			where	NgayHD = @ngayhd 
		
end 
--- 
declare @tongtienbantrongngay1 int, @tongsoluongbantrongngay1 int
exec sp_NgayHD_SL_TT '2023-7-30', @tongtienbantrongngay1 output, @tongsoluongbantrongngay1 output 
print N'Tổng tiền bán trong ngày ' + CAST(@tongtienbantrongngay1  AS VARCHAR)
print N'Tổng số bán trong ngày ' + CAST(@tongsoluongbantrongngay1  AS VARCHAR)
-- Thêm hd để thử 
insert into HOADON 
values('HD04','2023-7-30',0,0,'KH02','NV01','TT01')
insert into CHITIETHOADON
values ('HD04','8935212361750',3)

-- Nhận tham số đầu vào là MaISBN; trả về tổng tiền đã bán.
create proc sp_MaISBN_TT
			@maisbn varchar(20),
			@tongtienbantrongngay int OUTPUT
as
begin
			select  @tongtienbantrongngay =sum(SoLuongHD * GiaBan) 
			from	HOADON h, SACH s, CHITIETHOADON c, BIENDONGGIA b 
			where	c.MaISBN = @maisbn 
			and		h.MaHD = c.MaHD
			and		s.MaISBN = c.MaISBN 
			and		b.MaISBN = c.MaISBN 
		
end 
-----------
declare @tongtienbantrongngay1 int
exec sp_MaISBN_TT '8935212361750', @tongtienbantrongngay1 output
print N'Tổng tiền bán ' + CAST(@tongtienbantrongngay1  AS VARCHAR)

select * from HOADON
SELECT * FROM CHITIETHOADON
SELECT * FROM SACH order by matl 
insert into HOADON 
values('HD05','2023-8-5',0,0,'KH02','NV01','TT01')
insert into CHITIETHOADON
values ('HD05','8935212361750',2)
-- Nhận tham số đầu vào là Ngày và  MaISBN; trả về tổng số lượng sách và tổng số tiền bán trong ngày
create	proc sp_NgayHD_MaISBN_TT_SL
			@ngayhd date,
			@maisbn varchar(20),
			@tongtienban int OUTPUT,
			@tongsoluongban int OUTPUT		
as
begin
			select  @tongtienban =sum(SoLuongHD * GiaBan) , @tongsoluongban = sum(SoLuongHD)			
			from	HOADON h, SACH s, CHITIETHOADON c, BIENDONGGIA b 
			where	c.MaISBN = @maisbn 
			and		NgayHD = @ngayhd 
			and		h.MaHD = c.MaHD
			and		s.MaISBN = c.MaISBN 
			and		b.MaISBN = c.MaISBN 
		
end 
-----
declare @tongtienban1 int, @tongsoluongban1 int
exec sp_NgayHD_MaISBN_TT_SL '2023-7-30', '8935212361750',  @tongtienban1 output,  @tongsoluongban1 output
print N'Tổng số tiền bán trong ngày ' + CAST(@tongtienban1  AS VARCHAR)
print N'Tổng số lượng bán trong ngày ' + CAST(@tongsoluongban1  AS VARCHAR)
-- Nhận tham số đầu vào là Ngày  ; 
-- trả về MaISBN và TuaSach được bán nhiều nhất trong ngày và số lượng bán và số tiền 
create or alter proc sp_NgayHD_MaISBN_TT_SL_NN 
			@ngayhd date,
			@maisbn varchar(20) OUTPUT,
			@tuasach NVARCHAR(100) OUTPUT,
			@tongtienban int OUTPUT,
			@tongsach int OUTPUT	
			 
as
begin		
			SELECT TOP 1 @maisbn = c.MaISBN, @tuasach = s.TuaSach, @tongtienban = c.SoLuongHD * b.GiaBan, @tongsach = SoLuongHD 
			FROM HOADON h
			JOIN CHITIETHOADON c ON h.MaHD = c.MaHD
			JOIN SACH s ON s.MaISBN = c.MaISBN
			JOIN BIENDONGGIA b ON b.MaISBN = c.MaISBN
			WHERE h.NgayHD = @ngayhd
			GROUP BY c.MaISBN, s.TuaSach, c.SoLuongHD, b.GiaBan, SoLuongHD  
			ORDER BY c.SoLuongHD * b.GiaBan DESC
end 
---
declare @maisbn1  varchar(20), @tuasach1 NVARCHAR(100) , @tongtienban1 int, @tongsach1 int 
exec sp_NgayHD_MaISBN_TT_SL_NN '2023-7-30',  @maisbn1 output, @tuasach1 output,  @tongtienban1 output, @tongsach1 output 
print N'Mã sách bán ' +  @maisbn1
print N'Tên tựa sách ' +  @tuasach1
print N'Tổng số tiền ' + CAST(@tongtienban1  AS VARCHAR)
print N'Số lượng ' + CAST(@tongsach1  AS VARCHAR)

-- Nhận tham số đầu vào là Ngày và MaKH; trả về tổng số tiền và tổng số lượng mà khách hàng đã trả trong ngày đó
create or alter proc sp_NgayHD_MaKH_TT_TSL
			@ngayhd date,
			@makh varchar(10),
			@tt int OUTPUT,
			@ts int OUTPUT
as
begin
			
			select	@ts = sum(TongSachMua) , @tt = sum(TongTienHD)
			from	HoaDon h, KHACHHANG K 
			where	h.MaKH = K.MaKH
			and		h.MaKH = @makh
			and		NgayHD = @ngayhd
			
end
-------------
declare @tt1 int, @ts1 int
exec sp_NgayHD_MaKH_TT_TSL '2023-7-30', 'KH02',  @tt1 output,   @ts1 output
print N'Tổng số tiền ' + CAST(@tt1  AS VARCHAR)
print N'Số lượng ' + CAST(@ts1  AS VARCHAR)
select * from HOADON
SELECT * FROM CHITIETHOADON
SELECT * FROM SACH order by matl 
-- Nhận vào tham số là Ngày; 
-- trả về MaKH và TenKh  mua nhiều nhất  trong ngày và tổng số tiền và tổng số lượng 
CREATE OR ALTER PROCEDURE sp_NgayHD_MaKH_TT_TSL_NN
	@ngayhd DATE,
	@makh VARCHAR(10) OUTPUT,
	@tt INT OUTPUT,
	@ts INT OUTPUT
AS
BEGIN
	SELECT TOP 1 @makh = h.MaKH, @ts = SUM(TongSachMua), @tt = SUM(TongTienHD)
	FROM HoaDon h
	JOIN KHACHHANG k ON h.MaKH = k.MaKH
	WHERE h.NgayHD = @ngayhd
	GROUP BY h.MaKH
	ORDER BY SUM(TongSachMua) DESC, SUM(TongTienHD) DESC
END
-------------
declare @makh1 varchar(10), @tt1 int, @ts1 int
exec sp_NgayHD_MaKH_TT_TSL_NN  '2023-7-30', @makh1 output,  @tt1 output,   @ts1 output
print N'Mã khách hàng ' + @makh1
print N'Tổng số tiền ' + CAST(@tt1  AS VARCHAR)
print N'Số lượng ' + CAST(@ts1  AS VARCHAR)
select * from HOADON
SELECT * FROM CHITIETHOADON
SELECT * FROM SACH order by matl 


			
