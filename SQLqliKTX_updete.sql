-- Tạo cơ sở dữ liệu qliKTX
CREATE DATABASE qliKTX;

-- Sử dụng cơ sở dữ liệu qliKTX
USE qliKTX;

-- Bảng Sinh viên
CREATE TABLE SinhVien (
    MaSinhVien CHAR(10) PRIMARY KEY,
    HoTen NVARCHAR(100),
    NgaySinh DATE,
    GioiTinh NVARCHAR(10),
    SoCMND CHAR(12),
    SoDienThoai CHAR(10),
    LopKhoa NVARCHAR(50)
);

-- Bảng Nhân viên
CREATE TABLE NhanVien (
    MaNhanVien CHAR(10) PRIMARY KEY,
    HoTen NVARCHAR(100),
    NgaySinh DATE,
    GioiTinh NVARCHAR(10),
    DiaChi NVARCHAR(200),
    ChucVu NVARCHAR(50),
    SoDienThoai CHAR(10)
);

-- Bảng Phòng
CREATE TABLE Phong (
    SoPhong CHAR(10),
    KhuNha NVARCHAR(50),
    MaNhanVien CHAR(10),
    SoLuongSinhVien INT,
    TinhTrangPhong NVARCHAR(50),
    MoTaKhac NVARCHAR(255),
    PRIMARY KEY (SoPhong, KhuNha),
    FOREIGN KEY (MaNhanVien) REFERENCES NhanVien(MaNhanVien)
);

-- Bảng Hợp đồng
CREATE TABLE HopDong (
    MaHopDong CHAR(10) PRIMARY KEY,
    MaSinhVien CHAR(10),
    MaNhanVien CHAR(10),
    SoPhong CHAR(10),
    KhuNha NVARCHAR(50),
    NgayLap DATE,
    NgayBatDau DATE,
    NgayKetThuc DATE,
    FOREIGN KEY (MaSinhVien) REFERENCES SinhVien(MaSinhVien),
    FOREIGN KEY (MaNhanVien) REFERENCES NhanVien(MaNhanVien),
    FOREIGN KEY (SoPhong, KhuNha) REFERENCES Phong(SoPhong, KhuNha)
);

-- Bảng Hóa đơn
CREATE TABLE HoaDon (
    SoHoaDon CHAR(10) PRIMARY KEY,
    MaNhanVien CHAR(10),
    SoPhong CHAR(10),
    KhuNha NVARCHAR(50),
    NgayLap DATE,
    MaCongToDien CHAR(10),
    ChiSoDienDau INT,
    ChiSoDienCuoi INT,
    MaCongToNuoc CHAR(10),
    ChiSoNuocDau INT,
    ChiSoNuocCuoi INT,
    ThangGhiSo NVARCHAR(20),
    FOREIGN KEY (MaNhanVien) REFERENCES NhanVien(MaNhanVien),
    FOREIGN KEY (SoPhong, KhuNha) REFERENCES Phong(SoPhong, KhuNha)
);

-- Nhập thông tin vào bảng Sinh viên
INSERT INTO SinhVien (MaSinhVien, HoTen, NgaySinh, GioiTinh, SoCMND, SoDienThoai, LopKhoa)
VALUES
('SV001', N'Đặng Phương Nam', '2003-12-17', N'Nam', '123456789012', '0905123456', N'57KMT'),
('SV002', N'Nông Thị C', '2001-02-20', N'Nữ', '123456789013', '0905123457', N'57QLCN');

-- Nhập thông tin vào bảng Nhân viên
INSERT INTO NhanVien (MaNhanVien, HoTen, NgaySinh, GioiTinh, DiaChi, ChucVu, SoDienThoai)
VALUES
('NV001', N'Trần Dư Hiếu', '1985-03-10', N'Nam', N'123 Đường ABC, TP.TN', N'Quản lý', '0905123458'),
('NV002', N'Nguyễn Thị Thảo', '1990-04-25', N'Nữ', N'456 Đường DEF, TP.TN', N'Thủ quỹ', '0905123459');

-- Nhập thông tin vào bảng Phòng
INSERT INTO Phong (SoPhong, KhuNha, MaNhanVien, SoLuongSinhVien, TinhTrangPhong, MoTaKhac)
VALUES
('P414', N'K4', 'NV001', 4, N'Đang sử dụng', N'Phòng nam'),
('P102', N'A1', 'NV002', 3, N'Đang sử dụng', N'Phòng nữ');

-- Nhập thông tin vào bảng Hợp đồng
INSERT INTO HopDong (MaHopDong, MaSinhVien, MaNhanVien, SoPhong, KhuNha, NgayLap, NgayBatDau, NgayKetThuc)
VALUES
('HD001', 'SV001', 'NV001', 'P414', N'K4', '2024-01-01', '2024-01-15', '2025-01-15'),
('HD002', 'SV002', 'NV002', 'P102', N'A1', '2024-01-02', '2024-01-16', '2025-01-16');

-- Nhập thông tin vào bảng Hóa đơn
INSERT INTO HoaDon (SoHoaDon, MaNhanVien, SoPhong, KhuNha, NgayLap, MaCongToDien, ChiSoDienDau, ChiSoDienCuoi, MaCongToNuoc, ChiSoNuocDau, ChiSoNuocCuoi, ThangGhiSo)
VALUES
('HDN001', 'NV001', 'P414', N'K4', '2024-02-01','CTD001', 100, 150, 'CTN001', 50, 70, N'Tháng 1/2024'),
('HDN002', 'NV002', 'P102', N'A1', '2024-02-02','CTD002', 200, 250, 'CTN002', 60, 85, N'Tháng 1/2024');

--Đặng Phương Nam 
SELECT *
FROM SinhVien;
-----------------------------------------------------
----------------QUẢN LÝ SINH VIÊN--------------------
--Đặng Phương Nam
-- tạo stored procedures để thêm thongotin
CREATE PROCEDURE AddSinhVien
    @MaSinhVien CHAR(10),
    @HoTen NVARCHAR(100),
    @NgaySinh DATE,
    @GioiTinh NVARCHAR(10),
    @SoCMND CHAR(12),
    @SoDienThoai CHAR(10),
    @LopKhoa NVARCHAR(50)
AS
BEGIN
    INSERT INTO SinhVien (MaSinhVien, HoTen, NgaySinh, GioiTinh, SoCMND, SoDienThoai, LopKhoa)
    VALUES (@MaSinhVien, @HoTen, @NgaySinh, @GioiTinh, @SoCMND, @SoDienThoai, @LopKhoa);
END;
-- Gọi stored procedure để thêm sinh viên
EXEC AddSinhVien 'SV003', N'Nguyễn Văn A', '2002-05-15', N'Nam', '123456789014', '0905123460', N'57CNTT';


--Đặng Phương Nam 
--Sửa thông tin sinh viên
CREATE PROCEDURE UpdateSinhVien
    @MaSinhVien CHAR(10),
    @HoTen NVARCHAR(100),
    @NgaySinh DATE,
    @GioiTinh NVARCHAR(10),
    @SoCMND CHAR(12),
    @SoDienThoai CHAR(10),
    @LopKhoa NVARCHAR(50)
AS
BEGIN
    UPDATE SinhVien
    SET HoTen = @HoTen, 
        NgaySinh = @NgaySinh, 
        GioiTinh = @GioiTinh, 
        SoCMND = @SoCMND, 
        SoDienThoai = @SoDienThoai, 
        LopKhoa = @LopKhoa
    WHERE MaSinhVien = @MaSinhVien;
END;

-- Gọi stored procedure để sửa thông tin sinh viên
EXEC UpdateSinhVien 'SV003', N'Nguyễn Văn B', '2002-06-16', N'Nam', '123456789015', '0905123461', N'58CNTT';

--Đặng Phương Nam 
-- tạo Stored Procedure  xóa vĩnh viễn thong tin sinh viên 
CREATE PROCEDURE DeleteSinhVien
    @MaSinhVien CHAR(10)
AS
BEGIN
    DELETE FROM SinhVien
    WHERE MaSinhVien = @MaSinhVien;
END;
-- Gọi stored procedure để xóa sinh viên
EXEC DeleteSinhVien 'SV003';


--Đặng PHƯƠNG NAM
-- Khai báo biến cho CURSOR
DECLARE @MaSinhVien CHAR(10);
DECLARE @HoTen NVARCHAR(100);
DECLARE @NgaySinh DATE;
DECLARE @GioiTinh NVARCHAR(10);
DECLARE @SoCMND CHAR(12);
DECLARE @SoDienThoai CHAR(10);
DECLARE @LopKhoa NVARCHAR(50);

-- Khởi tạo CURSOR
DECLARE student_cursor CURSOR FOR 
    SELECT MaSinhVien, HoTen, NgaySinh, GioiTinh, SoCMND, SoDienThoai, LopKhoa
    FROM SinhVien;

-- Mở CURSOR
OPEN student_cursor;

-- Lấy dòng đầu tiên từ CURSOR
FETCH NEXT FROM student_cursor INTO @MaSinhVien, @HoTen, @NgaySinh, @GioiTinh, @SoCMND, @SoDienThoai, @LopKhoa;

-- Lặp và in từng sinh viên
WHILE @@FETCH_STATUS = 0
BEGIN
    PRINT 'MaSinhVien: ' + @MaSinhVien + ', HoTen: ' + @HoTen + ', NgaySinh: ' + CONVERT(NVARCHAR(20), @NgaySinh, 103)
         + ', GioiTinh: ' + @GioiTinh + ', SoCMND: ' + @SoCMND + ', SoDienThoai: ' + @SoDienThoai + ', LopKhoa: ' + @LopKhoa;

    -- Lấy dòng tiếp theo từ CURSOR
    FETCH NEXT FROM student_cursor INTO @MaSinhVien, @HoTen, @NgaySinh, @GioiTinh, @SoCMND, @SoDienThoai, @LopKhoa;
END
-- Đóng CURSOR
CLOSE student_cursor;
DEALLOCATE student_cursor;

-------------------------------------------------------------------------------------------------
-----------------QUẢN LÍ BẢNG HÓA ĐƠN -----------------------------------------------------------


--Đặng Phương Nam 
--tạo sp để thêm hóa đơn mới
CREATE PROCEDURE sp_InsertHoaDon
    @SoHoaDon CHAR(10),
    @MaNhanVien CHAR(10),
    @SoPhong CHAR(10),
    @KhuNha NVARCHAR(50),
    @NgayLap DATE,
    @TongTien DECIMAL(18, 2),
    @MaCongToDien CHAR(10),
    @ChiSoDienDau INT,
    @ChiSoDienCuoi INT,
    @MaCongToNuoc CHAR(10),
    @ChiSoNuocDau INT,
    @ChiSoNuocCuoi INT,
    @ThangGhiSo NVARCHAR(20)
AS
BEGIN
    INSERT INTO HoaDon (SoHoaDon, MaNhanVien, SoPhong, KhuNha, NgayLap, TongTien, MaCongToDien, ChiSoDienDau, ChiSoDienCuoi, MaCongToNuoc, ChiSoNuocDau, ChiSoNuocCuoi, ThangGhiSo)
    VALUES (@SoHoaDon, @MaNhanVien, @SoPhong, @KhuNha, @NgayLap, @TongTien, @MaCongToDien, @ChiSoDienDau, @ChiSoDienCuoi, @MaCongToNuoc, @ChiSoNuocDau, @ChiSoNuocCuoi, @ThangGhiSo);
END
GO
--gọi sp để thêm hóa đơn mới 
EXEC sp_InsertHoaDon
    @SoHoaDon = 'HD003',
    @MaNhanVien = 'NV001',
    @SoPhong = 'P414',
    @KhuNha = N'K4',
    @NgayLap = '2024-06-19',
    @TongTien = 550000,
    @MaCongToDien = 'CTD003',
    @ChiSoDienDau = 200,
    @ChiSoDienCuoi = 250,
    @MaCongToNuoc = 'CTN003',
    @ChiSoNuocDau = 70,
    @ChiSoNuocCuoi = 90,
    @ThangGhiSo = N'Tháng 6/2024';





--Đặng Phương Nam 
-- sửa thông tin hóa đơn
CREATE PROCEDURE sp_UpdateHoaDon
    @SoHoaDon CHAR(10),
    @MaNhanVien CHAR(10),
    @SoPhong CHAR(10),
    @KhuNha NVARCHAR(50),
    @NgayLap DATE,
    @TongTien DECIMAL(18, 2),
    @MaCongToDien CHAR(10),
    @ChiSoDienDau INT,
    @ChiSoDienCuoi INT,
    @MaCongToNuoc CHAR(10),
    @ChiSoNuocDau INT,
    @ChiSoNuocCuoi INT,
    @ThangGhiSo NVARCHAR(20)
AS
BEGIN
    UPDATE HoaDon
    SET MaNhanVien = @MaNhanVien,
        SoPhong = @SoPhong,
        KhuNha = @KhuNha,
        NgayLap = @NgayLap,
        TongTien = @TongTien,
        MaCongToDien = @MaCongToDien,
        ChiSoDienDau = @ChiSoDienDau,
        ChiSoDienCuoi = @ChiSoDienCuoi,
        MaCongToNuoc = @MaCongToNuoc,
        ChiSoNuocDau = @ChiSoNuocDau,
        ChiSoNuocCuoi = @ChiSoNuocCuoi,
        ThangGhiSo = @ThangGhiSo
    WHERE SoHoaDon = @SoHoaDon;
END
GO
-- gọi sp để sửa 

EXEC sp_UpdateHoaDon
    @SoHoaDon = 'HD003',
    @MaNhanVien = 'NV002',
    @SoPhong = 'P102',
    @KhuNha = N'A1',
    @NgayLap = '2024-06-19',
    @TongTien = 500000,
    @MaCongToDien = 'CTD002',
    @ChiSoDienDau = 210,
    @ChiSoDienCuoi = 260,
    @MaCongToNuoc = 'CTN002',
    @ChiSoNuocDau = 65,
    @ChiSoNuocCuoi = 95,
    @ThangGhiSo = N'Tháng 6/2024';

-- đặng Phương Nam 
--xóa hóa đơn 
CREATE PROCEDURE sp_DeleteHoaDon
    @SoHoaDon CHAR(10)
AS
BEGIN
    DELETE FROM HoaDon
    WHERE SoHoaDon = @SoHoaDon;
END
GO
--gọi sp để xóa 
EXEC sp_DeleteHoaDon @SoHoaDon = 'HD003';











-- Đặng Phương Nam
--Tạo Stored Procedure để tính toán tổng số tiền
CREATE PROCEDURE CalculateTotalAmount
    @SoHoaDon CHAR(10)
AS
BEGIN
    DECLARE @ChiSoDienDau INT, @ChiSoDienCuoi INT, @ChiSoNuocDau INT, @ChiSoNuocCuoi INT, @TongTien DECIMAL(18, 2);
    DECLARE @DonGiaDien DECIMAL(18, 2) = 3000.00;  -- Đơn giá điện mỗi kWh
    DECLARE @DonGiaNuoc DECIMAL(18, 2) = 15000.00; -- Đơn giá nước mỗi m³

    -- Lấy các chỉ số điện và nước từ bảng HoaDon
    SELECT 
        @ChiSoDienDau = ChiSoDienDau,
        @ChiSoDienCuoi = ChiSoDienCuoi,
        @ChiSoNuocDau = ChiSoNuocDau,
        @ChiSoNuocCuoi = ChiSoNuocCuoi
    FROM 
        HoaDon
    WHERE 
        SoHoaDon = @SoHoaDon;

    -- Tính tổng tiền
    SET @TongTien = (@ChiSoDienCuoi - @ChiSoDienDau) * @DonGiaDien + (@ChiSoNuocCuoi - @ChiSoNuocDau) * @DonGiaNuoc;

    -- Cập nhật tổng tiền vào bảng HoaDon
    UPDATE HoaDon
    SET 
        TongTien = @TongTien
    WHERE 
        SoHoaDon = @SoHoaDon;
END;
--gọi Stored Procedure để tính toán tổng số tiền của hóa đơn HDN001 VÀ HDN002
EXEC CalculateTotalAmount 'HDN001';
EXEC CalculateTotalAmount 'HDN002';

-------------------------------------------------------------------------------
---------QUẢN LÝ HỢP ĐỒNG ------------------------------------

---THÊM HỢP ĐỒNG 
CREATE PROCEDURE ThemHopDong
    @MaHopDong CHAR(10),
    @MaSinhVien CHAR(10),
    @MaNhanVien CHAR(10),
    @SoPhong CHAR(10),
    @KhuNha NVARCHAR(50),
    @NgayLap DATE,
    @NgayBatDau DATE,
    @NgayKetThuc DATE
AS
BEGIN
    INSERT INTO HopDong (MaHopDong, MaSinhVien, MaNhanVien, SoPhong, KhuNha, NgayLap, NgayBatDau, NgayKetThuc)
    VALUES (@MaHopDong, @MaSinhVien, @MaNhanVien, @SoPhong, @KhuNha, @NgayLap, @NgayBatDau, @NgayKetThuc);
END;

-- Gọi stored procedure để thêm hợp đồng mới
EXEC ThemHopDong 'HD003', 'SV001', 'NV001', 'P001', 'Khu A', '2024-06-19', '2024-06-20', '2024-12-31';


--cập nhật thông tin ngày kết thúc 
CREATE PROCEDURE CapNhatNgayKetThucHopDong
    @MaHopDong CHAR(10),
    @NgayKetThuc DATE
AS
BEGIN
    UPDATE HopDong
    SET NgayKetThuc = @NgayKetThuc
    WHERE MaHopDong = @MaHopDong;
END;

-- xóa hợp đồng 
CREATE PROCEDURE XoaHopDong
    @MaHopDong CHAR(10)
AS
BEGIN
    DELETE FROM HopDong
    WHERE MaHopDong = @MaHopDong;
END;

-- Gọi stored procedure để xóa hợp đồng
EXEC XoaHopDong 'HD001';




---- Đặng Phương Nam -------
-- Báo cáo số điẹn
CREATE PROCEDURE BaoCaoChiSoDien
AS
BEGIN
    SET NOCOUNT ON; -- Tắt thông báo số bản ghi ảnh hưởng

    DECLARE @TongChiSoDien INT;

    -- Tính tổng chỉ số điện tiêu thụ
    SELECT @TongChiSoDien = SUM(ChiSoDienCuoi - ChiSoDienDau)
    FROM HoaDon;

    -- Trả về kết quả
    SELECT @TongChiSoDien AS TongChiSoDien;
END;
-- gọi sp để báo cáo số điện đã dùng 
EXEC BaoCaoChiSoDien;

--Báo cáo số phòng đang sử dụng 
CREATE PROCEDURE BaoCaoSoLuongPhongDangSuDung
AS
BEGIN
    SET NOCOUNT ON; -- Tắt thông báo số bản ghi ảnh hưởng

    SELECT COUNT(*) AS SoLuongPhongDangSuDung
    FROM Phong
    WHERE TinhTrangPhong = N'Đang sử dụng';
END;
--gọi sp để báo cáo số phòng dg sư dụng 
EXEC BaoCaoSoLuongPhongDangSuDung;


--báo cáo tình trạng sinh viên 
CREATE PROCEDURE BaoCaoTinhTrangSinhVien
AS
BEGIN
    SET NOCOUNT ON; -- Tắt thông báo số bản ghi ảnh hưởng

    SELECT LopKhoa AS Lop,
           COUNT(*) AS SoLuongSinhVien
    FROM SinhVien
    GROUP BY LopKhoa;
END;
-- gọi sp để báo cáo về các lớp mà sv ktx đg học và có bao nhiêu sinh viên học lớp đó
EXEC BaoCaoTinhTrangSinhVien;


---Dùng Fn để quản lý hợp đồng thuê 
CREATE FUNCTION FN_QuanLyHopDongThue
(
    @MaSinhVien CHAR(10) = NULL,
    @MaHopDong CHAR(10) = NULL
)
RETURNS TABLE
AS
RETURN
(
    SELECT HD.MaHopDong,
           SV.MaSinhVien,
           SV.HoTen AS HoTenSinhVien,
           NV.MaNhanVien,
           NV.HoTen AS HoTenNhanVien,
           P.SoPhong,
           P.KhuNha,
           HD.NgayLap,
           HD.NgayBatDau,
           HD.NgayKetThuc
    FROM HopDong HD
    INNER JOIN SinhVien SV ON HD.MaSinhVien = SV.MaSinhVien
    INNER JOIN NhanVien NV ON HD.MaNhanVien = NV.MaNhanVien
    INNER JOIN Phong P ON HD.SoPhong = P.SoPhong AND HD.KhuNha = P.KhuNha
    WHERE (@MaSinhVien IS NULL OR HD.MaSinhVien = @MaSinhVien)
      AND (@MaHopDong IS NULL OR HD.MaHopDong = @MaHopDong)
);
-- Lấy thông tin tất cả các hợp đồng
SELECT * FROM FN_QuanLyHopDongThue(NULL, NULL);

-- Lấy thông tin hợp đồng của một sinh viên cụ thể
SELECT * FROM FN_QuanLyHopDongThue('SV001', NULL);

-- Lấy thông tin một hợp đồng cụ thể
SELECT * FROM FN_QuanLyHopDongThue(NULL, 'HD001');
