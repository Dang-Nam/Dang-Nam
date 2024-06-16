-- T?o cõ s? d? li?u qliKTX
CREATE DATABASE qliKTX;

-- S? d?ng cõ s? d? li?u qliKTX
USE qliKTX;

-- B?ng Sinh viên
CREATE TABLE SinhVien (
    MaSinhVien CHAR(10) PRIMARY KEY,
    HoTen NVARCHAR(100),
    NgaySinh DATE,
    GioiTinh NVARCHAR(10),
    SoCMND CHAR(12),
    SoDienThoai CHAR(10),
    LopKhoa NVARCHAR(50)
);

-- B?ng Nhân viên
CREATE TABLE NhanVien (
    MaNhanVien CHAR(10) PRIMARY KEY,
    HoTen NVARCHAR(100),
    NgaySinh DATE,
    GioiTinh NVARCHAR(10),
    DiaChi NVARCHAR(200),
    ChucVu NVARCHAR(50),
    SoDienThoai CHAR(10)
);

-- B?ng Ph?ng
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

-- B?ng H?p ð?ng
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

-- B?ng Hóa ðõn
CREATE TABLE HoaDon (
    SoHoaDon CHAR(10) PRIMARY KEY,
    MaNhanVien CHAR(10),
    SoPhong CHAR(10),
    KhuNha NVARCHAR(50),
    NgayLap DATE,
    TongTien DECIMAL(18, 2),
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

