import 'NhanVien.dart';

class NhanVienBanHang extends NhanVien {
  // Thuộc tính bổ sung
  double _doanhSo = 0.0;
  double _tyLeHoaHong = 0.0;

  NhanVienBanHang(String maNV, String hoTen, double luongCoBan, this._doanhSo,
      this._tyLeHoaHong)
      : super(maNV, hoTen, luongCoBan);

  // Getter và Setter cho doanh số
  double get doanhSo => _doanhSo;
  set doanhSo(double value) {
    if (value < 0) {
      throw Exception('Doanh số không được âm.');
    }
    _doanhSo = value;
  }

  // Getter và Setter cho tỷ lệ hoa hồng
  double get tyLeHoaHong => _tyLeHoaHong;
  set tyLeHoaHong(double value) {
    if (value < 0 || value > 1) {
      throw Exception('Tỷ lệ hoa hồng phải từ 0 đến 1.');
    }
    _tyLeHoaHong = value;
  }

  // Override phương thức tính lương
  @override
  double tinhLuong() {
    return luongCoBan + (_doanhSo * _tyLeHoaHong);
  }

  // Override phương thức hiển thị thông tin
  @override
  void hienThiThongTin() {
    super.hienThiThongTin();
    print('Doanh số: $_doanhSo');
    print('Tỷ lệ hoa hồng: ${_tyLeHoaHong * 100} %');
    print('=> Tổng lương: ${tinhLuong()}');
  }
}
