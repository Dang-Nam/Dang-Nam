#QUẢN LÍ KÍ TÚC XÁ 


    Thông tin sinh viên 
   + Họ tên: Đặng Phương Nam
   + MSSV: k215480106036

3 MÔ TẢ BÀI TOÁN 
3.1 Các chức năng \\
+ quản lí sinh viên(thêm, sửa, xóa thông tin sinh viên và liệt kê tất cả các sinh viên trong bảng SinhVien bằng cursor)
+ quản lý hóa đơn(thêm 1 cột, sửa, xóa hóa đơn, tính tổng hóa đơn)
3.2 Báo cáo
 + Báo cáo về tình trạng phòng trống và đã thuê.
 + Báo cáo về tình trạng sinh viên (số lượng, thông tin cá nhân).
3.3 Gồm các bảng\\
 + SinhVien (#MaSinhVien, HoTen, NgaySinh, GioiTinh, SoCMND, SoDienThoai, LopKhoa)
   
   ![image](https://github.com/Dang-Nam/Dang-Nam/assets/168844237/c94b4974-d20b-46eb-8bd0-cbcaf8baefa4)
 + NhanVien (#MaNhanVien, HoTen, NgaySinh, GioiTinh, DiaChi, ChucVu, SoDienThoai)
   
   ![image](https://github.com/Dang-Nam/Dang-Nam/assets/168844237/4866c584-33b4-4054-9127-6e987f5454ff)

 + Phong (#SoPhong, #KhuNha, @MaNhanVien, SoLuongSinhVien, TinhTrangPhong, MoTaKhac)
   
   ![image](https://github.com/Dang-Nam/Dang-Nam/assets/168844237/23fbbac3-d282-449a-8dc2-4c644ec48a0e)

 + HopDong (#MaHopDong, @MaSinhVien, @MaNhanVien, @SoPhong, KhuNha, NgayLap, NgayBatDau, NgayKetThuc)
   
   ![image](https://github.com/Dang-Nam/Dang-Nam/assets/168844237/007b7265-6e95-4d6d-9158-41e78ca6b9e2)

 + HoaDon (#SoHoaDon, @MaNhanVien, @SoPhong, @KhuNha, NgayLap, MaCongToDien, ChiSoDienDau, ChiSoDienCuoi, MaCongToNuoc, ChiSoNuocDau, ChiSoNuocCuoi, ThangGhiSo)
   
   ![image](https://github.com/Dang-Nam/Dang-Nam/assets/168844237/cc7c48c5-28f6-4871-95f6-db2721abdf25)


TIẾN ĐỘ 
NGÀY 16/6/2024 TẠO CƠ SỞ DỮ LIỆU






  
