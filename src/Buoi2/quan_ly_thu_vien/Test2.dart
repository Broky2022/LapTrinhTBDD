import 'DocGia.dart';
import 'Sach.dart';
import 'ThuVien.dart';

void main() {
  // Tạo thư viện
  ThuVien thuVien = ThuVien();

  // Tạo sách
  Sach sach1 = Sach('S001', 'Lập Trình Dart', 'Tác giả A', false);
  Sach sach2 = Sach('S002', 'Cơ Sở Dữ Liệu', 'Tác giả B', false);

  // Thêm sách vào thư viện
  thuVien.themSach(sach1);
  thuVien.themSach(sach2);

  // Tạo độc giả
  DocGia docGia = DocGia('DG001', 'Người Qua Đường Giáp');
  DocGia docGia2 = DocGia('DG002', 'Người Qua Đường Ất');

  // Thêm độc giả vào thư viện
  thuVien.themDocGia(docGia);
  thuVien.themDocGia(docGia2);

  // Độc giả mượn sách
  docGia.muonSach(sach1);
  docGia.muonSach(sach2);

  // Hiển thị danh sách sách của độc giả
  thuVien.hienThiDanhSachDG();
  // Hiển thị danh sách sách trong thư viện
  thuVien.hienThiDanhSachSach();

  // Độc giả trả sách
  docGia.traSach(sach1);
  docGia2.muonSach(sach1);

  // Hiển thị danh sách sách của độc giả
  thuVien.hienThiDanhSachDG();

  // Hiển thị danh sách sách sau khi trả
  thuVien.hienThiDanhSachSach();
}
