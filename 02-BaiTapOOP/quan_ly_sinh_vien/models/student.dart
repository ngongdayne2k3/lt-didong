class Student {
  String _hoTen;
  int _tuoi;
  String _maSV;
  double _diemTB;

  //constuctor
  Student(this._hoTen, this._tuoi, this._diemTB, this._maSV);

  //getters
  String get hoTen => _hoTen;
  int get tuoi => _tuoi;
  String get maSV => _maSV;
  double get diemTB => _diemTB;

  //setters
  set hoTen(String hoTen) {
    if (hoTen.isNotEmpty) {
      _hoTen = hoTen;
    }
  }

  set tuoi(int tuoi) {
    if (tuoi > 0) {
      _tuoi = tuoi;
    }
  }

  set maSV(String maSV) {
    if (maSV.isNotEmpty) {
      _maSV = maSV;
    }
  }

  set diemTB(double diemTB) {
    if (diemTB >= 0 && diemTB <= 10) {
      _diemTB = diemTB;
    }
  }

  void hienThiThongTin() {
    print('Họ tên: $hoTen');
    print('Tuổi: $tuoi');
    print('Mã SV: $maSV');
    print('Điểm TB: $diemTB');
  }

  String xepLoai() {
    if (_diemTB >= 8.0) return 'Giỏi';
    if (_diemTB >= 6.5) return 'Khá';
    if (_diemTB >= 5.0) return 'Trung Bình';
    return 'Yếu';
  }
}
