#QUẢN LÍ KÍ TÚC XÁ 


    Thông tin sinh viên 
   + Họ tên: Đặng Phương Nam
   + MSSV: k215480106036

3 MÔ TẢ BÀI TOÁN 
3.1 Các chức năng 
+ quản lí sinh viên(thêm, sửa, xóa thông tin sinh viên và liệt kê tất cả các sinh viên trong bảng SinhVien bằng cursor)
+ quản lý hóa đơn(thêm 1 cột, sửa, xóa hóa đơn, tính tổng hóa đơn)
3.2 Báo cáo
 + Báo cáo về tình trạng phòng trống và đã thuê.
 + Báo cáo về tình trạng sinh viên (số lượng, thông tin cá nhân).
3.3 Gồm các bảng
 + SinhVien (#MaSinhVien, HoTen, NgaySinh, GioiTinh, SoCMND, SoDienThoai, LopKhoa)
   ![image](https://github.com/Dang-Nam/Dang-Nam/assets/168844237/c94b4974-d20b-46eb-8bd0-cbcaf8baefa4)
 + NhanVien (#MaNhanVien, HoTen, NgaySinh, GioiTinh, DiaChi, ChucVu, SoDienThoai)
   
 + Phong (#SoPhong, #KhuNha, @MaNhanVien, SoLuongSinhVien, TinhTrangPhong, MoTaKhac)
 + HopDong (#MaHopDong, @MaSinhVien, @MaNhanVien, @SoPhong, KhuNha, NgayLap, NgayBatDau, NgayKetThuc)
 + HoaDon (#SoHoaDon, @MaNhanVien, @SoPhong, @KhuNha, NgayLap, MaCongToDien, ChiSoDienDau, ChiSoDienCuoi, MaCongToNuoc, ChiSoNuocDau, ChiSoNuocCuoi, ThangGhiSo)

TIẾN ĐỘ 
NGÀY 16/6/2024 TẠO CƠ SỞ DỮ LIỆU






  
