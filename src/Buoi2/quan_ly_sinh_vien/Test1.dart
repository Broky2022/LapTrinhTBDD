import 'LopHoc.dart';
import 'SinhVien.dart';

//test bài 1
void main() {
  // Tạo đối tượng lớp học
  LopHoc lopHoc = LopHoc('21DTHD5');

  // Gán giá trị cho tên lớp
  try {
    // Tạo sinh viên và thêm vào lớp
    Sinhvien sv1 = Sinhvien('Nguyễn Văn A', 20, 'SV001', 8.5);
    Sinhvien sv2 = Sinhvien('Trần Thị B', 19, 'SV002', 7.0);
    Sinhvien sv3 = Sinhvien('Bùi Minh C', 21, 'SV003', 6.0);
    Sinhvien sv4 = Sinhvien('Phan Văn D', 31, 'SV004', 5.0);

    lopHoc.themSinhVien(sv1);
    lopHoc.themSinhVien(sv2);
    lopHoc.themSinhVien(sv3);
    lopHoc.themSinhVien(sv4);

    // Hiển thị danh sách sinh viên
    lopHoc.hienThiDS();
  } catch (e) {
    print('Lỗi: $e');
  }
}
