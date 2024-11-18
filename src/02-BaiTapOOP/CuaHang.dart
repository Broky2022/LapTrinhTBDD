import 'DienThoai.dart';
import 'HoaDon.dart';
import 'dart:core';

class CuaHang {
  // Thuộc tính private
  String _tenCuaHang;
  String _diaChi;
  List<DienThoai> _danhSachDienThoai = [];
  List<HoaDon> _danhSachHoaDon = [];

  // Constructor
  CuaHang(this._tenCuaHang, this._diaChi) {
    if (_tenCuaHang.isEmpty || _diaChi.isEmpty) {
      throw Exception("Tên cửa hàng và địa chỉ không được để trống.");
    }
  }

  // Getter/setter
  String get tenCuaHang => _tenCuaHang;
  String get diaChi => _diaChi;
  List<DienThoai> get danhSachDienThoai => _danhSachDienThoai;
  List<HoaDon> get danhSachHoaDon => _danhSachHoaDon;

  // Phương thức quản lý điện thoại
  void themDienThoai(DienThoai dienThoai) {
    _danhSachDienThoai.add(dienThoai);
  }

  void capNhatDienThoai(String maDienThoai, DienThoai dienThoaiMoi) {
    final index =
        _danhSachDienThoai.indexWhere((dt) => dt.maDienThoai == maDienThoai);
    if (index == -1) {
      throw Exception("Không tìm thấy điện thoại với mã: $maDienThoai");
    }
    _danhSachDienThoai[index] = dienThoaiMoi;
  }

  void ngungKinhDoanh(String maDienThoai) {
    final dienThoai = _danhSachDienThoai.firstWhere(
      (dt) => dt.maDienThoai == maDienThoai,
      orElse: () =>
          throw Exception("Không tìm thấy điện thoại với mã: $maDienThoai"),
    );
    dienThoai.trangThai = false;
  }

  // Phương thức quản lý hóa đơn
  void taoHoaDon(HoaDon hoaDon) {
    // Kiểm tra tồn kho
    if (hoaDon.soLuongMua > hoaDon.dienThoai.soLuongTon) {
      throw Exception("Số lượng mua vượt quá tồn kho.");
    }

    // Cập nhật tồn kho
    hoaDon.dienThoai.soLuongTon -= hoaDon.soLuongMua;

    // Thêm hóa đơn vào danh sách
    _danhSachHoaDon.add(hoaDon);
  }

  void hienThiDanhSachDienThoai() {
    if (_danhSachDienThoai.isEmpty) {
      print("Không có điện thoại nào.");
    } else {
      for (var dt in _danhSachDienThoai) {
        print('\n<---------------------------->');
        dt.hienThiThongTin();
      }
    }
  }

  void hienThiDanhSachHoaDon() {
    if (_danhSachHoaDon.isEmpty) {
      print("Không có hóa đơn nào.");
    } else {
      for (var hoaDon in _danhSachHoaDon) {
        print('<---------------------------->');
        hoaDon.hienThiThongTinHoaDon();
      }
    }
  }

  // Thống kê
  double tinhTongDoanhThu(DateTime tuNgay, DateTime denNgay) {
    return _danhSachHoaDon
        .where(
            (hd) => hd.ngayBan.isAfter(tuNgay) && hd.ngayBan.isBefore(denNgay))
        .fold(0, (tong, hd) => tong + hd.tinhTongTien());
  }

  double tinhTongLoiNhuan(DateTime tuNgay, DateTime denNgay) {
    return _danhSachHoaDon
        .where(
            (hd) => hd.ngayBan.isAfter(tuNgay) && hd.ngayBan.isBefore(denNgay))
        .fold(0, (tong, hd) => tong + hd.tinhLoiNhuanThucTe());
  }
}
