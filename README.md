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

3.3 Các bảng 
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


3.4 
QUẢN LÝ BẢNG SINH VIÊN 
+ Thêm thông tin sinh viên


  Tạo một Stored Procedure để thêm thông tin sinh viên vào bảng SinhVien.Stored Procedure này bao gồm các tham số đầu vào như mã sinh viên, họ tên, ngày sinh, giới tính, số chứng minh nhân dân, số điện thoại và lớp khoa. Khi thực thi, nó sẽ chèn một bản ghi mới vào bảng SinhVien với các giá trị tương ứng.
  
![image](https://github.com/Dang-Nam/Dang-Nam/assets/168844237/9052e658-6465-411d-a23c-c4bf5a2834f3)

![image](https://github.com/Dang-Nam/Dang-Nam/assets/168844237/45f40fd7-9f04-47a2-a9ad-87998ccc443b)



+ Sửa thông tin sinh viên

  ![image](https://github.com/Dang-Nam/Dang-Nam/assets/168844237/b3052cae-0ef5-41be-af32-11456b9f34f5)


+ Thông tin SV003 đã được sửa
  

  ![image](https://github.com/Dang-Nam/Dang-Nam/assets/168844237/37a57a80-fa40-420b-a898-7d8878529de4)


+ Xóa thông tin sinh viên

 ![image](https://github.com/Dang-Nam/Dang-Nam/assets/168844237/1e5775c3-fed2-4654-8c3d-08e34c5f62fe)

+ thông tin SV003 đã được xóa

  ![image](https://github.com/Dang-Nam/Dang-Nam/assets/168844237/b73a2a7e-9b0d-41e3-bbe6-383580f1212c)

TIẾN ĐỘ 
NGÀY 16/6/2024 TẠO CƠ SỞ DỮ LIỆU






  
