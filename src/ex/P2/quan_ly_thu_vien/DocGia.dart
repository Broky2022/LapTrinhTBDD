import 'Sach.dart';

//class Độc Giả

class DocGia {
  String _maDocGia;
  String _tenDocGia;
  List<Sach> _danhSachSachMuon = [];

  DocGia(this._maDocGia, this._tenDocGia);

  //getter setter
  String get maDocGia => _maDocGia;
  String get tenDocGia => _tenDocGia;

  set maDocGia(String value) {
    if (value.isEmpty) {
      throw Exception('Mã độc giả không được rỗng.');
    }
    _maDocGia = value;
  }

  set hoTen(String value) {
    if (value.isEmpty) {
      throw Exception('Họ tên không được rỗng.');
    }
    _tenDocGia = value;
  }

  List<Sach> get danhSachSachMuon => _danhSachSachMuon;

  //Thêm sách vào danh sách sách mượn
  void muonSach(Sach sach) {
    if (sach.trangThai) {
      print('-> Sách ${sach.tenSach} đã có người mượn.');
    } else {
      _danhSachSachMuon.add(sach);
      sach.trangThai = true;
      print('-> ${sach.tenSach} đã được mượn.');
    }
  }

  // Phương thức trả sách
  void traSach(Sach sach) {
    if (_danhSachSachMuon.remove(sach)) {
      sach.trangThai = false;
      print('-> Sách ${sach.tenSach} đã được trả.');
    } else {
      print('-> Sách ${sach.tenSach} không có trong danh sách sách mượn.');
    }
  }

  // Phương thức hiển thị thông tin độc giả
  void hienThiThongTin() {
    print('\n------------------------');
    print('Mã độc giả: $_maDocGia');
    print('Họ tên: $_tenDocGia');
    print('Danh sách sách đang mượn:');
    if (_danhSachSachMuon.isEmpty) {
      print('Không có sách nào.');
    } else {
      for (var sach in _danhSachSachMuon) {
        print('- ${sach.tenSach}');
      }
    }
  }
}
