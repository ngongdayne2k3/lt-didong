/* BaiTap02.dart
Hãy làm hàm tính PT bậc 2 : ax^2+bx+c=0 */

import 'dart:io';
import 'dart:math';

void main() {
  double a, b, c;

  // Nhập dữ liệu cho hệ số a, b, c
  a = input('a (a != 0): ');
  b = input('b: ');
  c = input('c: ');

  // Giải phương trình bậc 2
  giaiPTBac2(a, b, c);
}

double input(String prompt) {
  double? coefficient;
  do {
    print('Nhập hệ số $prompt');
    String? input = stdin.readLineSync();

    // Kiểm tra tính hợp lệ của dữ liệu nhập vào
    if (input == null || double.tryParse(input) == null) {
      print('Giá trị không hợp lệ. Vui lòng nhập lại!');
      continue;
    }

    coefficient = double.parse(input);

    // Kiểm tra điều kiện cho hệ số a
    if (prompt.startsWith('a') && coefficient == 0) {
      print('Hệ số a không được bằng 0. Vui lòng nhập lại!');
      coefficient = null; // Đặt lại để yêu cầu nhập lại
    }
  } while (coefficient == null);

  return coefficient;
}

void giaiPTBac2(double a, double b, double c) {
  double delta = b * b - 4 * a * c;

  if (delta > 0) {
    double x1 = (-b + sqrt(delta)) / (2 * a);
    double x2 = (-b - sqrt(delta)) / (2 * a);
    print('Phương trình có delta = $delta');
    print('Phương trình có 2 nghiệm phân biệt: x1 = $x1, x2 = $x2');
  } else if (delta == 0) {
    double x = -b / (2 * a);
    print('Phương trình có delta = $delta');
    print('Phương trình có nghiệm kép: x = $x');
  } else {
    print('Phương trình có delta = $delta');
    print('Phương trình vô nghiệm.');
  }
}
