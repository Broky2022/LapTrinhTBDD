//Giải phương trình bậc 2: ax^2+bx+c=0

import 'dart:io';
import 'dart:math';

void main() {
  double? a, b, c;

  do {
    stdout.write("Nhập a (a != 0): ");
    a = double.parse(stdin.readLineSync()!);
    if (a == null || a == 0) {
      print("<!> Giá trị nhập không hợp lệ hoặc a bằng 0. Vui lòng nhập lại.");
    }
  } while (a == null || a == 0);

  do {
    stdout.write("Nhập b: ");
    b = double.parse(stdin.readLineSync()!);
    if (b == null) {
      print("<!> Giá trị nhập không hợp lệ. Vui lòng nhập lại.");
    }
  } while (b == null);

  do {
    stdout.write("Nhập c: ");
    c = double.parse(stdin.readLineSync()!);
    if (c == null) {
      print("<!> Giá trị nhập không hợp lệ. Vui lòng nhập lại.");
    }
  } while (c == null);

  solveQuadraticEquation(a, b, c);
}

double? parseDouble(String? input) {
  try {
    return double.parse(input!);
  } catch (e) {
    return null;
  }
}

void solveQuadraticEquation(double a, double b, double c) {
  double delta = b * b - 4 * a * c;

  print("\nPhương trình: ${a}x² + ${b}x + ${c} = 0");
  if (delta < 0) {
    print("=> Phương trình vô nghiệm.");
  } else if (delta == 0) {
    double x = -b / (2 * a);
    print("=> Phương trình có nghiệm kép: x = $x");
  } else {
    double x1 = (-b + sqrt(delta)) / (2 * a);
    double x2 = (-b - sqrt(delta)) / (2 * a);
    print("=> Phương trình có hai nghiệm phân biệt:");
    print("x1 = $x1");
    print("x2 = $x2");
  }
}
