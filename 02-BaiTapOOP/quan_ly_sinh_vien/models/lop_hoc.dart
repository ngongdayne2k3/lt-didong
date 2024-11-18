import '../models/student.dart';

//Lop Hoc
class LopHoc {
  String _tenLop;
  List<Student> _listStudent = [];

  LopHoc(this._tenLop);

  //getters
  String get tenLop => _tenLop;
  List<Student> get listStudent => _listStudent;

  //setters
  set tenLop(String tenLop) {
    if (tenLop.isNotEmpty) {
      _tenLop = tenLop;
    }
  }

  //Thêm sinh viên
  void addStudent(Student sv) => _listStudent.add(sv);
  void showListStudent() {
    print('\n------------------------------------------');
    print('\n------------------------------------------');
    print('\nDanh sách sinh viên lớp $tenLop');
    for (var sv in _listStudent) {
      print('\n------------------------------------------');
      sv.hienThiThongTin();
      print('\nXếp loại: ${sv.xepLoai()}');
    }
  }
}
