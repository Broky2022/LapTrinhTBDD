// class Nhân Viên

class NhanVien {
  String _maNhanVien;
  String _hoTen;
  double _luongCoBan;

  NhanVien(this._maNhanVien, this._hoTen, this._luongCoBan);

  //Getter Setter
  String get maNhanVien => _maNhanVien;
  String get hoTen => _hoTen;
  double get luongCoBan => _luongCoBan;

  set maNhanVien(String value) {
    if (value.isEmpty) {
      throw Exception('Mã nhân viên không được null.');
    }
    _maNhanVien = value;
  }

  set hoTen(String value) {
    if (value.isEmpty) {
      throw Exception('Họ tên không được null.');
    }
    _hoTen = value;
  }

  set luongCoBan(double value) {
    if (value <= 0) {
      throw Exception('Lương cơ bản không được nhỏ hơn 0.');
    }
    _luongCoBan = value;
  }

  //tính lương
  double tinhLuong() {
    return _luongCoBan;
  }

  //in thông tin nhân viên
  void hienThiThongTin() {
    print('Mã nhân viên: $_maNhanVien');
    print('Họ tên: $_hoTen');
    print('Lương cơ bản: $_luongCoBan');
    print('Lương: ${tinhLuong()}');
  }
}
