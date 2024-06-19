##QUẢN LÍ KÍ TÚC XÁ 


 #TÁC GIẢ

 
   + Họ tên: Đặng Phương Nam
   + MSSV: k215480106036


#MÔ TẢ BÀI TOÁN 
+ Bài toán quản lý  kí túc xá.
+ Hệ thống sẽ lưu trữ các thông tin như: Sinh viên, Nhân viên, Phòng, Hóa đơn, Hợp đồng.
+ Kiểm soát các thông tin về tình trạng phòng, sinh viên , nhân viên.

1 Các chức năng 
+ Quản lý sinh viên:
  - Thêm thông tin
  - Sửa thông tin
  - Xóa thông tin sinh viên
  - Liệt kê tất cả các sinh viên trong bảng SinhVien(cursor).
+ Quản lý hóa đơn:
  - Thêm hóa đơn
  - Sửa sửa hóa đơn
  - Xóa hóa đơn
  - Tính tổng hóa đơn.
+ Quản lý hợp đồng:
  - Thêm hợp đồng mới
  - Sửa 'ngày kết thúc hợp đồng'
  - Xóa hợp 

  
2 Báo cáo

 + Báo cáo số phòng đang trong tình trạng ' đang sử dụng '
 + Báo cáo về lớp sinh viên và số lượng sinh viên trong ktx đang học lớp đó
 + Báo cáo số điện đã dùng

   
3 Các bảng 


Bảng Sinh viên (SinhVien):


 + MaSV: Mã sinh viên là trường duy nhất để định danh từng sinh viên; kiểu dữ kiệu Char(10);  PK:Đây là khóa chính của bảng vì nó xác định từng bản ghi một; FK: Có, là khóa ngoại,liên kết với bảng HopDong để xác định hợp đồng của từng sinh viên; Not null: vì không thể để trống, mỗi sinh viên có 1 mã sinh viên duy nhất.
   
 + HoTen: Họ và tên của sinh viên.Kiểu dữ liệu: Nvarchar(50).Not Null: vì cần phải có họ tên sinh viên
   
 + NgaySinh:Mô tả: Ngày sinh của sinh viên.Kiểu dữ liệu DATE. NOT NULL Mỗi sinh viên phải có ngày sinh.

 + GioiTinh: Giới tính của sinh viên. Kiểu dữ liệu NVARCHAR(10). NOT NULL vì thông tin giới tính là bắt buộc.
   
 + SoCMND: Số CMND của sinh viên. Kiểu dữ liệu :CHAR(12). Có thể NULL vì không phải tất cả sinh viên đều có số CMND.

 + SoDienThoai: Số điện thoại của sinh viên.Kiểu dữ liệu CHAR(10). Có thể NULL vì không phải tất cả sinh viên đều có số điện thoại.
   
 + LopKhoa: Lớp và khóa học mà sinh viên đang học.Kiểu dữ liệu NVARCHAR(50). Có thể NULL vì có thể không có thông tin về lớp khóa học.

   
![image](https://github.com/Dang-Nam/Dang-Nam/assets/168844237/ffde3fd3-4465-405c-8286-a6311b0c477a)



Bảng Nhân viên (NhanVien):


 + MaNV: Mã nhân viên là trường duy nhất để định danh từng nhân viên trong ban quản lý. Kiểu dữ liệu CHAR(10); Mô tả: Mã số nhân viên.;
   PK:là khóa chính.Định danh duy nhất cho mỗi nhân viên;FK:là khóa ngoại. Được tham chiếu trong bảng HopDong để xác định người lập hợp đồng;
   NOT NULL vì ỗi nhân viên phải có mã số nhân viên.
   
 + HoTen: Họ và tên của nhân viên; Kiểu dữ liệu NVARCHAR(100);NOT NULL vì mỗi nhân viên phải có tên.
   
 + NgaySinh: Ngày sinh của nhân viên; Kiểu dữ liệu DATE; NOT NULL vì mỗi nhân viên phải có ngày sinh.
   
 + GioiTinh: Giới tính của nhân viên; Kiểu dữ liệu NVARCHAR(10); NOT NULL vì thông tin giới tính là bắt buộc.
   
 + DiaChi: Địa chỉ của nhân viên; Kiểu dữ liệu NVARCHAR(200); Có thể NULL vì không phải tất cả nhân viên đều có địa chỉ.
   
 + ChucVu: Chức vụ của nhân viên trong ban quản lý; Kiểu dữ liệu NVARCHAR(50); Có thể NULL vì có thể không có thông tin về chức vụ của nhân viên.
   
 + SoDienThoai: Số điện thoại của nhân viên kí túc xá;  Kiểu dữ liệu CHAR(10); Có thể NULL vì không phải tất cả nhân viên đều có số điện thoại.


![image](https://github.com/Dang-Nam/Dang-Nam/assets/168844237/8dd798dc-0094-4438-ad1c-3acb96a52a6f)



Bảng Phòng (Phong):


 + SoPhong: Số phòng là trường duy nhất để định danh từng phòng; Kiểu dữ liệu CHAR(10); PK: là phần của khóa chính cùng với KhuNha. Định danh duy nhất cho mỗi phòng trong từng khu nhà;
FK: là phần của khóa ngoại. Được tham chiếu trong bảng HopDong và HoaDon để xác định phòng đã được thuê hoặc thanh toán; NOT NULL vì mỗi phòng phải có số phòng.
   
 + KhuNha: Khu nhà mà phòng đó thuộc về; Kiểu dữ liệu NVARCHAR(50);
PK: là phần của khóa chính cùng với SoPhong. Định danh duy nhất cho mỗi phòng trong từng khu nhà.
NOT NULL vì mỗi phòng phải thuộc vào một khu nhà.

 + MaNV: Mã nhân viên quản lý phòng đó; Kiểu dữ liệu CHAR(10); 
FK: là khóa ngoại. Liên kết với bảng NhanVien để chỉ định nhân viên phụ trách phòng; 
Có thể NULL vì không phải tất cả các phòng đều có nhân viên phụ trách.

 + SoLuongSinhVien: Số lượng sinh viên đang ở trong phòng; Kiểu dữ liệu INT;
Có thể NULL vì không phải tất cả các phòng đều có thông tin về số lượng sinh viên.
   
 + TinhTrangPhong: Tình trạng hiện tại của phòng (trống, đã thuê, đang sửa chữa, ...); Kiểu dữ liệu NVARCHAR(50)
Có thể NULL vì không phải tất cả các phòng đều có tình trạng cụ thể.
   
 + MoTaKhac: Các mô tả khác về phòng (ví dụ: diện tích, tiện nghi,...); Kiểu dữ liệu NVARCHAR(255);
Có thể NULL vì có thể không có mô tả khác.

   
   ![image](https://github.com/Dang-Nam/Dang-Nam/assets/168844237/88c42a42-856b-4d3f-ba8d-9825ebbde0b2)


 Bảng Hợp đồng (HopDong):

 
 + MaHopDong: Mã số hợp đồng; Kiểu dữ liệu CHAR(10);
PK: là khóa chính. Định danh duy nhất cho mỗi hợp đồng; NOT NULL vì mỗi hợp đồng phải có mã số hợp đồng
   
 + MaSinhVien: Mã số sinh viên liên quan đến hợp đồng ; Kiểu dữ liệu CHAR(10);FK: là khóa ngoại. Liên kết với bảng SinhVien
để xác định sinh viên ký hợp đồng; NOT NULL vì mỗi hợp đồng phải có thông tin về sinh viên.
   
 + MaNhanVien: Mã số nhân viên lập hợp đồng; Kiểu dữ liệu CHAR(10);FK: là khóa ngoại. Liên kết với bảng NhanVien
để xác định nhân viên lập hợp đồng; NOT NULL vì mỗi hợp đồng phải có thông tin về nhân viên lập hợp đồng.

 + SoPhong: Số phòng liên quan đến hợp đồng; ;Kiểu dữ liệu CHAR(10);FK: là khóa ngoại. Liên kết với
 bảng Phong để xác định phòng thuê; NOT NULL vì mỗi hợp đồng phải có thông tin về
   
 + KhuNha: Khu nhà của phòng liên quan đến hợp đồng; Kiểu dữ liệu NVARCHAR(50);FK: là khóa ngoại (phần của khóa ngoại SoPhong, KhuNha).
Liên kết với bảng Phong để xác định phòng thuê; Có thể NULL vì một hợp đồng có thể chưa có thông tin về khu nhà.

 + NgayLap: Ngày lập hợp đồng; Kiểu dữ liệu DATE; NOT NULL vì phải có ngày lập hợp đồng
   
 + NgayBatDau: Ngày bắt đầu hiệu lực của hợp đồng; Kiểu dữ liệu DATE; NOT NULL vì phải có ngày bắt đầu.

 + NgayKetThuc: Ngày kết thúc hiệu lực của hợp đồng; Kiểu dữ liệu DATE;Có thể NULL vì có thể hợp đồng
 chưa có ngày kết thúc (ví dụ: hợp đồng vẫn còn hiệu lực).


![image](https://github.com/Dang-Nam/Dang-Nam/assets/168844237/9f914a96-bd2d-4ab3-aced-1d325a24ec0f)


   Bảng Hóa đơn (HoaDon):
   
 + SoHoaDon: Số hóa đơn là trường duy nhất để định danh từng hóa đơn; Kiểu dữ liệu CHAR(10);PK: là khóa chính. Định danh duy nhất cho mỗi hóa đơn;
FK: Không. Là trường chính trong bảng HoaDon; NOT NULL vì mỗi hóa đơn phải có số hóa đơn.

 + MaNhanVien: Mã nhân viên lập hóa đơn; Kiểu dữ liệu CHAR(10);FK: Có, là khóa ngoại. Liên kết với bảng
 NhanVien để xác định nhân viên lập hóa đơn;Có thể NULL vì một hóa đơn có thể chưa có mã nhân viên lập hóa đơn (ví dụ: hóa đơn chưa được lập).

 + SoPhong:Số phòng liên quan đến hóa đơn; Kiểu dữ liệu CHAR(10); FK: Có, là khóa ngoại. Liên kết với bảng Phong
để xác định phòng liên quan đến hóa đơn; Có thể NULL vì một hóa đơn có thể chưa có thông tin về số phòng.
   
 + KhuNha:Khu nhà của phòng liên quan đến hóa đơn; Kiểu dữ liệu NVARCHAR(50); FK: Có, là khóa ngoại (phần của khóa ngoại SoPhong, KhuNha).
Liên kết với bảng Phong để xác định phòng liên quan đến hóa đơn; Có thể NULL vì một hóa đơn có thể chưa có thông tin về khu nhà.

 + NgayLap: Ngày lập hóa đơn; Kiểu dữ liệu DATE; NOT NULL vì phải có ngày lập hóa đơn.

 + MaCongToDien: Mã công tơ điện liên quan đến hóa đơn; Kiểu dữ liệu CHAR(10);Có thể NULL vì có thể hóa đơn không có thông tin về mã công tơ điện.
   
 + ChiSoDienDau:Chỉ số điện đầu kỳ; Kiểu dữ liệu INT; Có thể NULL vì có thể hóa đơn không có thông tin về chỉ số điện đầu kỳ.

 + ChiSoDienCuoi: Chỉ số điện cuối; Kiểu dữ liệu INT;Có thể NULL vì có thể hóa đơn không có thông tin về chỉ số điện cuối kỳ.
   
 + MaCongToNuoc: Mã công tơ nước; Kiểu dữ liệu CHAR(10); Có thể NULL vì có thể hóa đơn không có thông tin về mã công tơ nước.

 + ChiSoNuocDau: Chỉ số nước ban đầu; Kiểu dữ liệu INT; Có thể NULL vì có thể hóa đơn không có thông tin về chỉ số nước đầu kỳ.

 + ChiSoNuocCuoi: Chỉ số nước cuối; Kiểu dữ liệu INT; Có thể NULL vì có thể hóa đơn không có thông tin về chỉ số nước cuối kỳ.

 + ThangGhiSo: Tháng ghi sổ hóa đơn; Kiểu dữ liệu NVARCHAR(20); Có thể NULL vì có thể hóa đơn không có thông tin về tháng ghi số.
   
 + TongTien:Tổng số tiền của hóa đơn; Kiểu dữ liệu DECIMAL(18, 2); Có thể NULL vì có thể hóa đơn chưa được tính tổng tiền.

   
![image](https://github.com/Dang-Nam/Dang-Nam/assets/168844237/2c0e5bb3-51ab-4eef-9844-6d2c2a1da6e0)

+ Mối quan hệ giữa các bảng 
![image](https://github.com/Dang-Nam/Dang-Nam/assets/168844237/1fda6e74-d030-4b44-8f16-7f2f86e2bd72)



3 Chức năng 


+ thêm thông tin sinh viên


  ![image](https://github.com/Dang-Nam/Dang-Nam/assets/168844237/afe53195-2d51-44f6-8cfe-da045ccf1b61)
  
  ![image](https://github.com/Dang-Nam/Dang-Nam/assets/168844237/17c1e014-3a50-409f-86bf-b247e9f85857)
  
+ sửa thông tin sinh viên
  
  
![image](https://github.com/Dang-Nam/Dang-Nam/assets/168844237/764ac561-534f-486f-b76d-a6279df6b482)

![image](https://github.com/Dang-Nam/Dang-Nam/assets/168844237/c33a9e9b-31d7-4fcc-8396-3cbea2da18c1)


+ Xóa thông tin sinh viên


  ![image](https://github.com/Dang-Nam/Dang-Nam/assets/168844237/ff83fdd7-1451-4a66-ac17-6da4b13e56b5)

  ![image](https://github.com/Dang-Nam/Dang-Nam/assets/168844237/b73a2a7e-9b0d-41e3-bbe6-383580f1212c)


+ Liệt kê tất cả các sinh viên trong bảng SinhVien bằng cursor

  
  ![image](https://github.com/Dang-Nam/Dang-Nam/assets/168844237/6a670c6c-065d-43cb-9252-41bcb4ae2522)

  ![image](https://github.com/Dang-Nam/Dang-Nam/assets/168844237/342584a3-fae0-442b-8278-223b0a70774a)


QUẢN LÝ BẢNG HÓA ĐƠN 
+ Thêm 1 hóa đơn mới


![image](https://github.com/Dang-Nam/Dang-Nam/assets/168844237/59f05b99-bd25-439e-b335-f0fda3b56327)

![image](https://github.com/Dang-Nam/Dang-Nam/assets/168844237/1dc8bd84-bc1f-4d0d-88b6-0fa6da1ab8e1)


+ Sửa thông tin hóa đơn


   ![image](https://github.com/Dang-Nam/Dang-Nam/assets/168844237/69f9247a-2875-4513-b870-2911fae8851e)

![image](https://github.com/Dang-Nam/Dang-Nam/assets/168844237/16677d12-5f10-4d7a-9868-b459e518e07e)


  +Xóa hóa đơn

 
![image](https://github.com/Dang-Nam/Dang-Nam/assets/168844237/5c2d6622-f2f9-4309-883d-837d6444de75)

![image](https://github.com/Dang-Nam/Dang-Nam/assets/168844237/aebd8e7a-574b-407f-811e-b5c8a1f1ab6c)


 + Tính tổng hóa đơn


   ![image](https://github.com/Dang-Nam/Dang-Nam/assets/168844237/3c3ca906-1c14-48a2-8a38-9a18b6b09e52)

  + Kết quả


    ![image](https://github.com/Dang-Nam/Dang-Nam/assets/168844237/66eecbfc-15e2-45ac-b66b-3e40a3152402)

 *QUẢN LÝ HỢP ĐỒNG 

 +Thêm hợp đồng

 ![image](https://github.com/Dang-Nam/Dang-Nam/assets/168844237/8af11830-9e0a-463f-817a-917f695c8fca)

  - Gọi sp: EXEC ThemHopDong 'HD003', 'SV001', 'NV001', 'P001', 'Khu A', '2024-06-19', '2024-06-20', '2024-12-31'; để thêm hợp đồng mới

+ CCập nhât thông tin '  ngày kết thúc '

![image](https://github.com/Dang-Nam/Dang-Nam/assets/168844237/a61bdb24-cf09-4c4d-9aa9-e32844975b27)


  - Gọi sp: EXEC CapNhatNgayKetThucHopDong 'HD001', '2024-12-31'; để cập nhật thông tin ngày kết thúc của hợp đồng HD001

+ Xóa hợp đồng


![image](https://github.com/Dang-Nam/Dang-Nam/assets/168844237/38d4d36f-350f-4ac3-89ad-87050acefdcf)

  - Gọi sp: EXEC XoaHopDong 'HD001'; để xóa hợp đồng HD001


3.4 Báo cáo 

+ Báo cáo số phòng đang trong tình trạng ' đang sử dụng '

  - Tính số lượng phòng đang được sử dụng từ bảng Phong trong cơ sở dữ liệu
    
  ![image](https://github.com/Dang-Nam/Dang-Nam/assets/168844237/88907991-a4bd-4d0e-b7f1-5db6734a82d1)

  - KKết quả

    ![image](https://github.com/Dang-Nam/Dang-Nam/assets/168844237/eb856425-26ee-4c39-9279-582e39fe2fe3)
    
+ Báo cáo số điện đã dùng

  - Tính tổng lượng điện tiêu thụ bằng cách lấy SUM(ChiSoDienCuoi - ChiSoDienDau) từ bảng HoaDon.
    
  ![image](https://github.com/Dang-Nam/Dang-Nam/assets/168844237/8bd0b61f-450e-4bd3-9b11-4c8abfdca46b)

  - Kết quả

    ![image](https://github.com/Dang-Nam/Dang-Nam/assets/168844237/84106a6c-a92f-4b31-a4f7-2191e8d5c58f)


+ Báo cáo về lớp và số lượng sinh viên ktx đang học lớp đó

    - Tạo sp để báo cáo về các lớp mà sv ktx đg học và có bao nhiêu sinh viên học lớp đó
 
      ![image](https://github.com/Dang-Nam/Dang-Nam/assets/168844237/21d65b02-6ca6-4bf2-a342-cf28a2dc5977)

    - Kết quả

      ![image](https://github.com/Dang-Nam/Dang-Nam/assets/168844237/1e20d67e-d851-4692-b5f5-767be8f104d0)

4 Function để quản lý hợp đồng thuê 

+ Sử dụng FN để quản lý hợp đồng thuê

  ![image](https://github.com/Dang-Nam/Dang-Nam/assets/168844237/b7f39e7b-5e3a-408f-b516-d89458540ad3)

+ KKết quả

  ![image](https://github.com/Dang-Nam/Dang-Nam/assets/168844237/17c0205a-6a84-4836-a744-061c6772a835)



  
