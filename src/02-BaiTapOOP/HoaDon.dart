import 'DienThoai.dart';
import 'dart:core';

class HoaDon {
  // Thuộc tính private
  String _maHoaDon;
  DateTime _ngayBan;
  DienThoai _dienThoai;
  int _soLuongMua;
  double _giaBanThucTe;
  String _tenKhachHang;
  String _soDienThoaiKhach;

  // Constructor
  HoaDon(
    this._maHoaDon,
    this._ngayBan,
    this._dienThoai,
    this._soLuongMua,
    this._giaBanThucTe,
    this._tenKhachHang,
    this._soDienThoaiKhach,
  ) {
    // Validation trong constructor
    _validateMaHoaDon(_maHoaDon);
    _validateNgayBan(_ngayBan);
    _validateSoLuongMua(_soLuongMua, _dienThoai.soLuongTon);
    _validateGiaBan(_giaBanThucTe);
    _validateThongTinKhach(_tenKhachHang, _soDienThoaiKhach);
  }

  // Getter/setter với validation
  String get maHoaDon => _maHoaDon;
  set maHoaDon(String value) {
    _validateMaHoaDon(value);
    _maHoaDon = value;
  }

  DateTime get ngayBan => _ngayBan;
  set ngayBan(DateTime value) {
    _validateNgayBan(value);
    _ngayBan = value;
  }

  DienThoai get dienThoai => _dienThoai;

  int get soLuongMua => _soLuongMua;
  set soLuongMua(int value) {
    _validateSoLuongMua(value, _dienThoai.soLuongTon);
    _soLuongMua = value;
  }

  double get giaBanThucTe => _giaBanThucTe;
  set giaBanThucTe(double value) {
    _validateGiaBan(value);
    _giaBanThucTe = value;
  }

  String get tenKhachHang => _tenKhachHang;
  set tenKhachHang(String value) {
    _validateThongTinKhach(value, _soDienThoaiKhach);
    _tenKhachHang = value;
  }

  String get soDienThoaiKhach => _soDienThoaiKhach;
  set soDienThoaiKhach(String value) {
    _validateThongTinKhach(_tenKhachHang, value);
    _soDienThoaiKhach = value;
  }

  // Validation methods
  void _validateMaHoaDon(String ma) {
    if (ma.isEmpty || !RegExp(r'^HD-\d+$').hasMatch(ma)) {
      throw Exception("Mã hóa đơn không hợp lệ (định dạng: 'HD-XXX').");
    }
  }

  void _validateNgayBan(DateTime ngay) {
    if (ngay.isAfter(DateTime.now())) {
      throw Exception("Ngày bán không được sau ngày hiện tại.");
    }
  }

  void _validateSoLuongMua(int soLuong, int tonKho) {
    if (soLuong <= 0) {
      throw Exception("Số lượng mua phải lớn hơn 0.");
    }
    if (soLuong > tonKho) {
      throw Exception("Số lượng mua không vượt quá tồn kho.");
    }
  }

  void _validateGiaBan(double giaBan) {
    if (giaBan <= 0) {
      throw Exception("Giá bán thực tế không hợp lệ.");
    }
  }

  void _validateThongTinKhach(String ten, String sdt) {
    if (ten.isEmpty || sdt.isEmpty || !RegExp(r'^\d{10,11}$').hasMatch(sdt)) {
      throw Exception("Thông tin khách hàng không hợp lệ.");
    }
  }

  // Phương thức tính tổng tiền
  double tinhTongTien() {
    return _soLuongMua * _giaBanThucTe;
  }

  // Phương thức tính lợi nhuận thực tế
  double tinhLoiNhuanThucTe() {
    return (_giaBanThucTe - _dienThoai.giaNhap) * _soLuongMua;
  }

  // Phương thức hiển thị thông tin hóa đơn
  void hienThiThongTinHoaDon() {
    print("Mã hóa đơn: $_maHoaDon");
    print("Ngày bán: ${_ngayBan.toIso8601String()}");
    print("Điện thoại: ${_dienThoai.tenDienThoai}");
    print("Hãng: ${_dienThoai.hangSanXuat}");
    print("Số lượng mua: $_soLuongMua");
    print("Giá bán thực tế: $_giaBanThucTe");
    print("Tên khách hàng: $_tenKhachHang");
    print("Số điện thoại khách: $_soDienThoaiKhach");
    print("Tổng tiền: ${tinhTongTien()}");
    print("Lợi nhuận thực tế: ${tinhLoiNhuanThucTe()}");
  }
}
