import 'DocGia.dart';
import 'Sach.dart';

class ThuVien {
  // Thuộc tính
  List<Sach> _danhSachSach = [];
  List<DocGia> _danhSachDocGia = [];

  // Getter cho danh sách sách và độc giả
  List<Sach> get danhSachSach => _danhSachSach;
  List<DocGia> get danhSachDocGia => _danhSachDocGia;

  // Phương thức thêm sách
  void themSach(Sach sach) {
    _danhSachSach.add(sach);
    print("-> Đã thêm sách '${sach.tenSach}' vào thư viện.");
  }

  // Phương thức thêm độc giả
  void themDocGia(DocGia docGia) {
    _danhSachDocGia.add(docGia);
    print("-> Đã thêm độc giả '${docGia.maDocGia}' vào thư viện.");
  }

  // Phương thức hiển thị danh sách sách
  void hienThiDanhSachSach() {
    print('\n<=================================================>');
    print('=> Danh sách sách trong thư viện:\n');
    if (_danhSachSach.isEmpty) {
      print("Không có sách nào.");
    } else {
      for (var sach in _danhSachSach) {
        sach.hienThiSach();
        print("-----------------");
      }
    }
  }

  void hienThiDanhSachDG() {
    print('\n<=================================================>');
    print('=> Danh sách độc giả trong thư viện:\n');
    if (_danhSachDocGia.isEmpty) {
      print("Không có ai.");
    } else {
      for (var DG in _danhSachDocGia) {
        DG.hienThiThongTin();
        print("-----------------");
      }
    }
  }
}
