use DBQuanLyNhaSach
go

-- Khi thêm, sửa, xóa dữ liệu bảng CTHD, TongSachMua và TongTienHD trong bảng HD giảm hoặc tăng
																			--	Thêm dl 
CREATE TRIGGER trg_ThemCTHD_SLVT
ON CHITIETHOADON
FOR INSERT
AS
BEGIN
	-- DL VỪA THÊM VÀO SẼ LƯU TRONG BẢNG INSERTED
	DECLARE @mahdT VARCHAR(10), @maisbnT VARCHAR(20), @soluonghdT int, @tiensachT int 
	SELECT	@mahdT = i.MaHD, @maisbnT  = i.MaISBN, @soluonghdT = SoLuongHD, @tiensachT = GiaBan
	FROM	INSERTED i, SACH s, BIENDONGGIA b, HOADON h 
	WHERE	i.MaISBN = s.MaISBN
	AND		s.MaISBN = b.MaISBN
	AND		i.MaHD = H.MaHD

	-- TÍNH TỔNG TIỀN HD VỪA THÊM VÀO DỰA BẢNG INSERTED
	DECLARE @tongtienhd int 
	SET	    @tongtienhd = @tiensachT * @soluonghdT

	-- CẬP NHẬT SỐ LƯỢNG SÁCH VÀ TỔNG TIỀN HD, TĂNG SỐ LƯỢNG SÁCH VÀ TỔNG TIỀN LÊN 
	UPDATE	HOADON 
	SET		TongSachMua =	TongSachMua + @soluonghdT, 
			TongTienHD =	TongTienHD +  @tongtienhd
	WHERE	MAHD = @mahdT
END

																		--	Xóa dl
CREATE TRIGGER trg_XoaCTHD_SLVT
ON CHITIETHOADON
FOR DELETE
AS
BEGIN
	-- DL VỪA THÊM VÀO SẼ LƯU TRONG BẢNG DELETED
	DECLARE	@mahdX VARCHAR(10), @maisbnX VARCHAR(20), @soluonghdX int, @tiensachX int 
	SELECT	@mahdX = d.MaHD, @maisbnX  = d.MaISBN, @soluonghdX = SoLuongHD, @tiensachX = GiaBan
	FROM	deleted d, SACH s, BIENDONGGIA b, HOADON h 
	WHERE	d.MaISBN = s.MaISBN
	AND		s.MaISBN = b.MaISBN
	AND		d.MaHD = H.MaHD

	-- TÍNH TỔNG TIỀN HD 
	DECLARE @tongtienhdX int 
	SET		@tongtienhdX = @tiensachX * @soluonghdX

	-- CẬP NHẬT SỐ LƯỢNG SÁCH VÀ TỔNG TIỀN HD, GIẢM SỐ LƯỢNG SÁCH VÀ TỔNG TIỀN 
	UPDATE	HOADON 
	SET		TongSachMua =	TongSachMua - @soluonghdX, 
			TongTienHD =	TongTienHD - @tongtienhdX
	WHERE	MAHD = @mahdX
END

																

																	--	Cập nhật dl 
CREATE TRIGGER trg_CapNhatCTHD_SLVT
ON CHITIETHOADON
FOR UPDATE 
AS
BEGIN
	
	-- DL VỪA THÊM VÀO SẼ LƯU TRONG BẢNG INSERTED
	DECLARE @mahdT VARCHAR(10), @maisbnT VARCHAR(20), @soluonghdT int, @tiensachT int 
	SELECT	@mahdT = i.MaHD, @maisbnT  = i.MaISBN, @soluonghdT = SoLuongHD, @tiensachT = GiaBan
	FROM	INSERTED i, SACH s, BIENDONGGIA b, HOADON h 
	WHERE	i.MaISBN = s.MaISBN
	AND		s.MaISBN = b.MaISBN
	AND		i.MaHD = H.MaHD

	-- TÍNH TỔNG TIỀN HD
	DECLARE @tongtienhdT int 
	SET		@tongtienhdT = @tiensachT * @soluonghdT

	-- DÒNG DL CŨ VỪA XÓA SẼ LƯU TRONG BẢNG DELETED
	DECLARE	@mahdX VARCHAR(10), @maisbnX VARCHAR(20), @soluonghdX int, @tiensachX int 
	SELECT	@mahdX = d.MaHD, @maisbnX  = d.MaISBN, @soluonghdX = SoLuongHD, @tiensachX = GiaBan
	FROM	deleted d, SACH s, BIENDONGGIA b, HOADON h 
	WHERE	d.MaISBN = s.MaISBN
	AND		s.MaISBN = b.MaISBN
	AND		d.MaHD = H.MaHD

	-- TÍNH TỔNG TIỀN HD 
	DECLARE @tongtienhdX int 
	SET		@tongtienhdX = @tiensachX * @soluonghdX

	-- CẬP NHẬT SỐ LƯỢNG SÁCH VÀ TỔNG TIỀN 
	UPDATE	HOADON 
	SET		TongSachMua =	TongSachMua - @soluonghdX + @soluonghdT,
			TongTienHD =	TongTienHD -  @tongtienhdX + @tongtienhdT
	WHERE	MAHD = @mahdT
END
----------------------------------------------------------------------------------------------------------------------------
-- Khi thêm, sửa, xóa dữ liệu bảng CTHD, DaBan và SoLuong trong bảng SACH giảm hoặc tăng
																			--	Thêm dl 
CREATE TRIGGER trg_ThemCTHD_SLDB
ON CHITIETHOADON
FOR INSERT
AS
BEGIN
	-- DL VỪA THÊM VÀO SẼ LƯU TRONG BẢNG INSERTED
	DECLARE @mahdT VARCHAR(10), @maisbnT VARCHAR(20), @soluonghdT int
	SELECT	@mahdT = i.MaHD, @maisbnT  = i.MaISBN, @soluonghdT = SoLuongHD
	FROM	INSERTED i, SACH s, HOADON h 
	WHERE	i.MaISBN = s.MaISBN
	AND		i.MaHD = H.MaHD

	-- CẬP NHẬT SOLUONG VA DABAN CUA BANG SACH 
	UPDATE	SACH
	SET  	SoLuong =	SoLuong - @soluonghdT, 
			DaBan   =	DaBan +  @soluonghdT
	WHERE	MaISBN = @maisbnT
END
																	--	Xóa dl
CREATE TRIGGER trg_XoaCTHD_SLDB
ON CHITIETHOADON
FOR DELETE
AS
BEGIN

	-- DL XOA VÀO SẼ LƯU TRONG BẢNG DELETED
	DECLARE @mahdX VARCHAR(10), @maisbnX VARCHAR(20), @soluonghdX int
	SELECT	@mahdX = d.MaHD, @maisbnX  = d.MaISBN, @soluonghdX = SoLuongHD
	FROM	DELETED d, SACH s, HOADON h 
	WHERE	d.MaISBN = s.MaISBN
	AND		d.MaHD = H.MaHD

	-- CẬP NHẬT SOLUONG VA DABAN CUA BANG SACH 
	UPDATE	SACH
	SET  	SoLuong =	SoLuong + @soluonghdX, 
			DaBan   =	DaBan -  @soluonghdX
	WHERE	MaISBN =	@maisbnX
END														

																	--	Cập nhật dl 
create TRIGGER trg_CapNhatCTHDSLDB
ON CHITIETHOADON
FOR UPDATE 
AS
BEGIN
	
	-- DL VỪA THÊM VÀO SẼ LƯU TRONG BẢNG INSERTED
	DECLARE @mahdT VARCHAR(10), @maisbnT VARCHAR(20), @soluonghdT int
	SELECT	@mahdT = i.MaHD, @maisbnT  = i.MaISBN, @soluonghdT = SoLuongHD
	FROM	INSERTED i, SACH s, HOADON h 
	WHERE	i.MaISBN = s.MaISBN
	AND		i.MaHD = H.MaHD

	-- DL XOA VÀO SẼ LƯU TRONG BẢNG DELETED
	DECLARE @mahdX VARCHAR(10), @maisbnX VARCHAR(20), @soluonghdX int
	SELECT	@mahdX = d.MaHD, @maisbnX  = d.MaISBN, @soluonghdX = SoLuongHD
	FROM	DELETED d, SACH s, HOADON h 
	WHERE	d.MaISBN = s.MaISBN
	AND		d.MaHD = H.MaHD

	-- CẬP NHẬT SỐ LƯỢNG SÁCH VÀ TỔNG TIỀN 
	UPDATE	SACH
	SET		SoLuong =	SoLuong + @soluonghdX - @soluonghdT,
			DaBan   =	DaBan	-  @soluonghdX + @soluonghdT
	WHERE	MaISBN =	@maisbnX
END

----- KIỂM TRA THỬ khi thêm CTHD THÌ TỔNG SÁCH MUA VÀ TỔNG TIỀN BÁN CỦA BẢNG HOADON TỰ ĐỘNG
----- SỐ LƯỢNG VÀ ĐÃ BÁN CỦA BẢNG SÁCH TỰ ĐỘNG 

--delete FROM CHITIETHOADON WHERE MaHD = 'HD04'
--delete FROM HOADON WHERE MaHD = 'HD04' 
-- THÊM HOADON 
insert into HOADON 
values	('HD04','2023-8-4',0,0,'KH01','NV01','TT01')
-- THÊM CHI TIẾT HOADON 
insert into CHITIETHOADON
values ('HD04','8935212361750',6)
insert into CHITIETHOADON
values ('HD04','9786045635506',1)

select * from CHITIETHOADON
select * from HOADON
select * from SACH ORDER BY MaTL 

-- Xóa CTHD 
DELETE FROM CHITIETHOADON 
WHERE		MAHD = 'HD04' 

-- Cập nhật 
UPDATE	CHITIETHOADON
SET		SoLuongHD = 8
WHERE	MAHD = 'HD04'
AND		MAISBN='8935212361750'
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Khi thêm, sửa, xóa dữ liệu bảng CTPN, SoLuong trong bảng SACH giảm hoặc tăng
																	--	Thêm dl 
CREATE TRIGGER trg_ThemCTPN_SL
ON CHITIETPHIEUNHAP
FOR INSERT
AS
BEGIN
	-- DL VỪA THÊM VÀO SẼ LƯU TRONG BẢNG INSERTED
	DECLARE @mapnT VARCHAR(10), @maisbnT VARCHAR(20), @soluongpnT int
	SELECT	@mapnT = i.MaPN, @maisbnT  = i.MaISBN, @soluongpnT = SoLuongPN
	FROM	INSERTED i, SACH s, PHIEUNHAP n
	WHERE	i.MaISBN = s.MaISBN
	AND		i.MaPN = n.MaPN

	-- CẬP NHẬT SOLUONG CUA BANG SACH 
	UPDATE	SACH
	SET  	SoLuong = SoLuong + @soluongpnT
	WHERE	MaISBN =  @maisbnT
END

																	--	Xóa dl
create TRIGGER trg_XoaCTPN_SL
ON CHITIETPHIEUNHAP
FOR DELETE
AS
BEGIN

	-- DL VỪA THÊM VÀO SẼ LƯU TRONG BẢNG deleted 
	DECLARE @mapnx VARCHAR(10), @maisbnX VARCHAR(20), @soluongpnX int
	SELECT	@mapnx = d.MaPN, @maisbnX  = d.MaISBN, @soluongpnX = SoLuongPN
	FROM	deleted d, SACH s, PHIEUNHAP n
	WHERE	d.MaISBN = s.MaISBN
	AND		d.MaPN = n.MaPN

	-- CẬP NHẬT SOLUONG CUA BANG SACH 
	UPDATE	SACH
	SET  	SoLuong = SoLuong - @soluongpnX
	WHERE	MaISBN =  @maisbnX
END														

																	--	Cập nhật dl 
create TRIGGER trg_CapNhatCTPN_SL
ON  CHITIETPHIEUNHAP
FOR UPDATE 
AS
BEGIN
	
	--- DL VỪA THÊM VÀO SẼ LƯU TRONG BẢNG INSERTED
	DECLARE @mapnT VARCHAR(10), @maisbnT VARCHAR(20), @soluongpnT int
	SELECT	@mapnT = i.MaPN, @maisbnT  = i.MaISBN, @soluongpnT = SoLuongPN
	FROM	INSERTED i, SACH s, PHIEUNHAP n
	WHERE	i.MaISBN = s.MaISBN
	AND		i.MaPN = n.MaPN

	-- DL VỪA THÊM VÀO SẼ LƯU TRONG BẢNG deleted 
	DECLARE @mapnx VARCHAR(10), @maisbnX VARCHAR(20), @soluongpnX int
	SELECT	@mapnx = d.MaPN, @maisbnX  = d.MaISBN, @soluongpnX = SoLuongPN
	FROM	deleted d, SACH s, PHIEUNHAP n
	WHERE	d.MaISBN = s.MaISBN
	AND		d.MaPN = n.MaPN

	-- CẬP NHẬT SOLUONG CUA BANG SACH 
	UPDATE	SACH
	SET		SoLuong =	SoLuong - @soluongpnX + @soluongpnT
	WHERE	MaISBN =	@maisbnX
END


-- Khi thêm, sửa, xóa dữ liệu bảng CTPN, tongcongpn và tongsachpn trong bảng PN giảm hoặc tăng
																		--	Thêm dl 
create  TRIGGER trg_ThemCTPN_SLVT
ON CHITIETPHIEUNHAP
FOR INSERT
AS
BEGIN
	--- DL VỪA THÊM VÀO SẼ LƯU TRONG BẢNG INSERTED
	DECLARE @mapnT VARCHAR(10), @maisbnT VARCHAR(20), @soluongpnT int, @thanhtien int 
	SELECT	@mapnT = i.MaPN, @maisbnT  = i.MaISBN, @soluongpnT = SoLuongPN, @thanhtien = ThanhTien
	FROM	INSERTED i, SACH s, PHIEUNHAP n
	WHERE	i.MaISBN = s.MaISBN
	AND		i.MaPN = n.MaPN
	-- TÍNH TỔNG TIỀN PN
	DECLARE @tongtienpnT int 
	SET	    @tongtienpnT = @soluongpnT * @thanhtien

	-- CẬP NHẬT TỔNG SÁCH VÀ TIỀN PN
	UPDATE	PHIEUNHAP
	SET		TongCongPN =	TongCongPN +    @tongtienpnT, 
			TongSachNhap =	TongSachNhap +  @soluongpnT
	WHERE	MaPN =	@mapnT
END
																		--	Xóa dl
CREATE TRIGGER trg_XoaCTPN_SLVT
ON CHITIETPHIEUNHAP 
FOR DELETE
AS
BEGIN
	--- DL VỪA THÊM VÀO SẼ LƯU TRONG BẢNG deleted
	DECLARE @mapnX VARCHAR(10), @maisbnX VARCHAR(20), @soluongpnX int, @thanhtien int 
	SELECT	@mapnX = d.MaPN, @maisbnX  = d.MaISBN, @soluongpnX = SoLuongPN, @thanhtien = ThanhTien
	FROM	deleted d, SACH s, PHIEUNHAP n
	WHERE	d.MaISBN = s.MaISBN
	AND		d.MaPN = n.MaPN
	-- TÍNH TỔNG TIỀN PN
	DECLARE @tongtienpnX int 
	SET		@tongtienpnX = @soluongpnX * @thanhtien

	-- CẬP NHẬT TỔNG SÁCH VÀ TIỀN PN
	UPDATE	PHIEUNHAP
	SET		TongCongPN =	TongCongPN  -    @tongtienpnX, 
			TongSachNhap =	TongSachNhap -   @soluongpnX
	WHERE	MaPN =	@mapnX
END
															

																	--	Cập nhật dl 
create   TRIGGER trg_CapNhatCTPN_SLVT
ON CHITIETPHIEUNHAP 
FOR UPDATE 
AS
BEGIN

	--- DL VỪA THÊM VÀO SẼ LƯU TRONG BẢNG INSERTED
	DECLARE @mapnX VARCHAR(10), @maisbnX VARCHAR(20), @soluongpnX int, @thanhtienX int 
	SELECT	@mapnX = d.MaPN, @maisbnX  = d.MaISBN, @soluongpnX = d.SoLuongPN, @thanhtienX = d.ThanhTien
	FROM	deleted d, SACH s, PHIEUNHAP n
	WHERE	d.MaISBN = s.MaISBN
	AND		d.MaPN = n.MaPN
	-- TÍNH TỔNG TIỀN PN
	DECLARE @tongtienpnX int 
	SET 	@tongtienpnX = @soluongpnX * @thanhtienX 
	

	--- DL VỪA THÊM VÀO SẼ LƯU TRONG BẢNG INSERTED
	DECLARE @mapnT VARCHAR(10), @maisbnT VARCHAR(20), @soluongpnT int, @thanhtienT int 
	SELECT	@mapnT = i.MaPN, @maisbnT  = i.MaISBN, @soluongpnT = i.SoLuongPN, @thanhtienT = i.ThanhTien
	FROM	INSERTED i, SACH s, PHIEUNHAP n
	WHERE	i.MaISBN = s.MaISBN
	AND		i.MaPN = n.MaPN
	-- TÍNH TỔNG TIỀN PN
	DECLARE @tongtienpnT int 
	SET		@tongtienpnT = @soluongpnT * @thanhtienT


	-- CẬP NHẬT TỔNG SÁCH VÀ TIỀN PN
	UPDATE	PHIEUNHAP
	SET		TongCongPN   =	TongCongPN   -  @tongtienpnX  + @tongtienpnT,
			TongSachNhap =	TongSachNhap -  @soluongpnX + @soluongpnT
	WHERE	MaPN =	@mapnT
END
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
---- KIỂM TRA THỬ khi thêm CTPN THÌ tongcongpn và tongsachpn trong bảng PN TỰ ĐỘNG
----- SỐ LƯỢNG CỦA BẢNG SÁCH TỰ ĐỘNG 

-- THÊM PHIEUNHAP  
insert into PHIEUNHAP
values	('PN04','2023-8-5',0,0,N'Cuốn','NCC01','NV01')
-- THÊM CHI TIẾT PN
insert into CHITIETPHIEUNHAP
values	('8935212361750','PN04',10,100000,0.2,80000)
insert into CHITIETPHIEUNHAP
values	('9786045616543','PN04',10,148000,0.2,118000)

select * from CHITIETPHIEUNHAP
select * from PHIEUNHAP
select * from SACH ORDER BY MaTL 

---- Xóa CTHD 
--delete from CHITIETPHIEUNHAP WHERE MaPN = 'PN04' 
-- Cập nhật 
update	CHITIETPHIEUNHAP
SET		SoLuongPN = 21
where	MaISBN = '8935212361750'
AND		MaPN = 'PN04'

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Trigger kiểm tra khi thêm hoặc sửa dữ liệu trong bảng CTHD thì số lượng <= 1 thì thông báo là nhập thêm sách vào kho 
CREATE OR ALTER TRIGGER trg_ThemSuaCTHD_SLK
ON CHITIETHOADON
FOR INSERT, UPDATE
AS
BEGIN
    -- KIỂM TRA SỐ LƯỢNG CỦA CÁC SÁCH
    IF EXISTS (
        SELECT 1
        FROM inserted i
        INNER JOIN SACH s ON i.MaISBN = s.MaISBN
        WHERE s.SoLuong < 1  
    )
    BEGIN
        RAISERROR(N'Nhập thêm sách vào kho, số lượng trong kho chỉ còn 1 cuốn sách ', 16, 1)
        ROLLBACK TRANSACTION
        RETURN;
    END
END
-------------------------------------------------------------------------------------------------------------------------------------
-- KHi thêm, sửa, giá gốc thì giá bán tự động cập nhật
create or alter trigger trg_SGD
ON BIENDONGGIA
FOR INSERT, Update 
as
begin
		declare @mabdg varchar(10) , @giagoc int, @giaban int, @MaKM VARCHAR(10)
		select  @mabdg = MaBienDongGia, @giagoc = GiaGoc, @giaban = GiaBan, @MaKM = MaKM 
		from	INSERTED i 
		
		declare @giabancc int 
		if @MaKM is null 
		begin
			 set @giabancc = @giagoc 
		end
		else
		begin			
			 select @giabancc =  @giagoc - @giagoc * PhanTramKM 
			  from	 BIENDONGGIA b, KHUYENMAI k 
			  where	 b.MaKM = k.MaKM
			  and  b.MaBienDongGia = @mabdg
		end 

		Update BIENDONGGIA
		SET	   GiaBan = @giabancc
		where  MaBienDongGia = @mabdg
end 
	
--- Them sach moi 
insert into SACH
values ('8935212361770',N'Cố lên','21x17 cm',43,N'Bìa mềm',null
		,1,2022,N'Từ 0-2 tuổi',9,'TL01','XB01')
-- Them bdg 
insert into BIENDONGGIA 
values	('BDG31','8935212361770',100000,0,'2023-8-6','KM01')

select * from BIENDONGGIA
--delete from BIENDONGGIA WHERE MaBienDongGia ='BDG31'

UPDATE BIENDONGGIA 
SET		MaKM = null 
WHERE MaBienDongGia ='BDG31'
---------------------------------------------------------------