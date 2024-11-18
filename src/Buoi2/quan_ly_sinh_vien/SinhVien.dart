//Lớp sinh viên

class Sinhvien {
  String _hoTen;
  int _tuoi;
  String _maSV;
  double _diemTB;

  //constructor
  Sinhvien(this._hoTen, this._tuoi, this._maSV, this._diemTB);

  //Getters
  String get hoTen => _hoTen;
  int get tuoi => _tuoi;
  String get maSV => _maSV;
  double get diemTB => _diemTB;

  //Setters
  set hoTen(String hoTen) {
    if (hoTen.isEmpty) {
      throw Exception('Tên không được để trống.');
    }
    _hoTen = hoTen;
  }

  set tuoi(int t) {
    if (t <= 0) {
      throw Exception('Tuổi phải lớn hơn 0.');
    }
    _tuoi = t;

    //ví dụ khác:
    //_tuoi = (tuoi > 0) tuoi ? _tuoi;
  }

  set maSinhVien(String MSV) {
    if (MSV.isEmpty) {
      throw Exception('Mã sinh viên không được rỗng.');
    }
    _maSV = MSV;
  }

  set diemTrungBinh(double DTB) {
    if (DTB < 0 || DTB > 10) {
      throw Exception('Điểm trung bình phải từ 0 đến 10.');
    }
    _diemTB = DTB;
  }

  void hienThiThongTin() {
    print('- Họ tên: $_hoTen');
    print('- Tuổi: $_tuoi');
    print('- Mã sinh viên: $_maSV');
    print('- Điểm trung bình: $_diemTB');
  }

  String xepLoai() {
    if (_diemTB >= 8.0) return 'Giỏi';
    if (_diemTB >= 6.5) return 'Khá';
    if (_diemTB >= 5.0) return 'Trung bình';
    return 'Yếu';
  }
}
