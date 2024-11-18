import '../models/lop_hoc.dart';
import '../models/student.dart';

void main() {
  var sv = Student('Nguyen Van A', 20, 8.5, 'SV001');
  print('Test getter: ${sv.hoTen}');
  sv.hoTen = 'Nguyễn Văn B';
  print('Sau khi set: ${sv.hoTen}');
  print('Xep loai: ${sv.xepLoai()}');

  var lop = LopHoc('21DTHD5');
  lop.addStudent(Student('Nguyen Van A', 20, 8.5, 'SV001'));
  lop.addStudent(Student('Nguyen Van B', 21, 6.5, 'SV002'));
  lop.addStudent(Student('Nguyen Van C', 22, 5.5, 'SV003'));
  lop.addStudent(Student('Nguyen Van D', 23, 4, 'SV004'));
  lop.showListStudent();
}
