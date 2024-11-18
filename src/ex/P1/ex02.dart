import 'dart:io';

void main() {
  //khai báo biến cơ bản
  var ten = 'Tung'; //tự suy luận
  int tuoi = 25;

  //sử dụng null safety
  String? tenNullable;
  tenNullable = null;

  //sử dụng biến late
  late String moTa;
  moTa = 'Lập trình dart';

  //Sử dụng final và const
  final String quocGia = 'VietNam';
  const int nam = 2024;

  //In giá trị biến
  print('Tên: $ten');
  print('Tuổi: $tuoi');
  print('Mô tả: $moTa');
  print('Quốc Gia: $quocGia');
  print('Năm: $nam');

  //ktra biến nullable
  int? soLuong;
  assert(soLuong == null);
}
