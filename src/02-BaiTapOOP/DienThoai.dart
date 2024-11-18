//BTVN Buoi2 ngày 18/11/2024

class DienThoai {
  String _maDienThoai;
  String _tenDienThoai;
  String _hangSanXuat;
  double _giaNhap;
  double _giaBan;
  int _soLuongTon;
  bool _trangThai = false; // true: còn hàng, false: hết hàng

  DienThoai(this._maDienThoai, this._tenDienThoai, this._hangSanXuat,
      this._giaNhap, this._giaBan, this._soLuongTon, this._trangThai);

  //Getters and setters
  String get maDienThoai => _maDienThoai;
  String get tenDienThoai => _tenDienThoai;
  String get hangSanXuat => _hangSanXuat;
  double get giaNhap => _giaNhap;
  double get giaBan => _giaBan;
  int get soLuongTon => _soLuongTon;
  bool get trangThai => _trangThai;

  set maDienThoai(String value) {
    final regex = RegExp(r'^DT-\d{3}$');
    if (value.isEmpty || !regex.hasMatch(value)) {
      throw Exception(
          "Mã điện thoại không hợp lệ. Định dạng phải là 'DT-XXX'.");
    }
    _maDienThoai = value;
  }

  set tenDienThoai(String value) {
    if (value.isEmpty) {
      throw Exception('Tên điện thoại không được để trống.');
    }
    _tenDienThoai = value;
  }

  set hangSanXuat(String value) {
    if (value.isEmpty) {
      throw Exception('Hãng sản xuất không được để trống.');
    }
    _hangSanXuat = value;
  }

  set giaNhap(double value) {
    if (value <= 0) {
      throw Exception('Giá nhập không được nhỏ hơn 0.');
    }
    _giaNhap = value;
  }

  set giaBan(double value) {
    if (value < _giaNhap) {
      throw Exception('Giá bán không được nhỏ hơn giá nhập.');
    }
    _giaBan = value;
  }

  set soLuongTon(int value) {
    if (value < 0) {
      throw Exception('Tồn kho không được nhỏ hơn 0.');
    }
    _soLuongTon = value;
  }

  set trangThai(bool value) {
    _trangThai = value;
  }

  //tính lợi nhuận
  double tinhLoiNhuan() {
    return _giaBan - _giaNhap;
  }

  void hienThiThongTin() {
    print("Mã điện thoại: $_maDienThoai");
    print("Tên điện thoại: $_tenDienThoai");
    print("Hãng sản xuất: $_hangSanXuat");
    print("Giá nhập: $_giaNhap");
    print("Giá bán: $_giaBan");
    print("Số lượng tồn kho: $_soLuongTon");
    print("Trạng thái kinh doanh: ${_trangThai ? "Còn hàng" : "Hết hàng"}");
    print("Lợi nhuận dự kiến: ${tinhLoiNhuan()}");
  }

  // Phương thức kiểm tra có thể bán không
  bool coTheBan() {
    return _soLuongTon > 0 && _trangThai;
  }
}
