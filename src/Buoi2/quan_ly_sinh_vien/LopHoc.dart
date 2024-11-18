import 'SinhVien.dart';

// Class LopHoc
class LopHoc {
  String _tenLop;
  List<Sinhvien> _danhSachSinhVien = [];

  LopHoc(this._tenLop);

  //Getter
  String get tenLop => _tenLop;
  List<Sinhvien> get dsSinhVien => _danhSachSinhVien;

  //Setter
  // set tenLop(String tenLop) {
  //   if (tenLop.isEmpty) {
  //     throw Exception('Tên lớp không được để trống.');
  //   }
  //   _tenLop = tenLop;
  // }

  set tenLop(String tenLop) => (tenLop.isNotEmpty)
      ? _tenLop = tenLop
      : throw Exception('Tên lớp không được để trống.');

  //Thêm sinh viên
  void themSinhVien(Sinhvien sv) => _danhSachSinhVien.add(sv);

  void hienThiDS() {
    print('Danh sách sinh viên lớp $_tenLop ');
    for (var sv in _danhSachSinhVien) {
      print('\n----------------------------------------------');
      sv.hienThiThongTin();
      print('=> Xếp loại: ${sv.xepLoai()}');
    }
  }
}
