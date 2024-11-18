//Class Sách

class Sach {
  String _maSach;
  String _tenSach;
  String _tacGia;
  bool _trangThai = false; // true: đã mượn, false: chưa mượn

  Sach(this._maSach, this._tenSach, this._tacGia, this._trangThai);

  //Getter and setter
  String get maSach => _maSach;
  String get tenSach => _tenSach;
  String get tacGia => _tacGia;
  bool get trangThai => _trangThai;

  set maSach(String value) {
    if (value.isEmpty) {
      throw Exception('Mã sách không được để trống.');
    }
    _maSach = value;
  }

  set tenSach(String value) {
    if (value.isEmpty) {
      throw Exception('Tên sách không được để trống.');
    }
    _tenSach = value;
  }

  set tacGia(String value) {
    if (value.isEmpty) {
      throw Exception('Tác giả không được để trống.');
    }
    _tacGia = value;
  }

  set trangThai(bool value) {
    _trangThai = value;
  }

  void hienThiSach() {
    print('Mã sách: $_maSach');
    print('Tên sách: $_tenSach');
    print('Tác giả: $_tacGia');
    print('Trạng thái: ${_trangThai ? 'Đã mượn' : 'Chưa mượn'}');
  }
}
