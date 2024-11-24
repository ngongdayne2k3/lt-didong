class DienThoai {
  // Thuộc tính private
  String _maDienThoai;
  String _tenDienThoai;
  String _hangSanXuat;
  double _giaNhap;
  double _giaBan;
  int _soLuongTon;
  bool _trangThai;

  // Constructor đầy đủ tham số
  DienThoai(this._maDienThoai, this._tenDienThoai, this._hangSanXuat,
      this._giaNhap, this._giaBan, this._soLuongTon, this._trangThai) {
    // Validation
    if (!_isValidMaDienThoai(_maDienThoai)) {
      throw Exception('Mã điện thoại không hợp lệ (định dạng: DT-XXX)');
    }
    if (_tenDienThoai.isEmpty) {
      throw Exception('Tên điện thoại không được rỗng');
    }
    if (_hangSanXuat.isEmpty) {
      throw Exception('Hãng sản xuất không được rỗng');
    }
    if (_giaNhap <= 0) {
      throw Exception('Giá nhập phải lớn hơn 0');
    }
    if (_giaBan <= 0 || _giaBan <= _giaNhap) {
      throw Exception('Giá bán phải lớn hơn giá nhập và lớn hơn 0');
    }
    if (_soLuongTon < 0) {
      throw Exception('Số lượng tồn kho không được âm');
    }
  }

  // Getter và Setter
  String get maDienThoai => _maDienThoai;
  set maDienThoai(String value) {
    if (!_isValidMaDienThoai(value)) {
      throw Exception('Mã điện thoại không hợp lệ (định dạng: DT-XXX)');
    }
    _maDienThoai = value;
  }

  String get tenDienThoai => _tenDienThoai;
  set tenDienThoai(String value) {
    if (value.isEmpty) {
      throw Exception('Tên điện thoại không được rỗng');
    }
    _tenDienThoai = value;
  }

  String get hangSanXuat => _hangSanXuat;
  set hangSanXuat(String value) {
    if (value.isEmpty) {
      throw Exception('Hãng sản xuất không được rỗng');
    }
    _hangSanXuat = value;
  }

  double get giaNhap => _giaNhap;
  set giaNhap(double value) {
    if (value <= 0) {
      throw Exception('Giá nhập phải lớn hơn 0');
    }
    _giaNhap = value;
  }

  double get giaBan => _giaBan;
  set giaBan(double value) {
    if (value <= 0 || value <= _giaNhap) {
      throw Exception('Giá bán phải lớn hơn giá nhập và lớn hơn 0');
    }
    _giaBan = value;
  }

  int get soLuongTon => _soLuongTon;
  set soLuongTon(int value) {
    if (value < 0) {
      throw Exception('Số lượng tồn kho không được âm');
    }
    _soLuongTon = value;
  }

  bool get trangThai => _trangThai;
  set trangThai(bool value) {
    _trangThai = value;
  }

  // Phương thức tính lợi nhuận dự kiến
  double tinhLoiNhuanDuKien() {
    return (_giaBan - _giaNhap) * _soLuongTon;
  }

  // Phương thức hiển thị thông tin
  void hienThiThongTin() {
    print('Mã điện thoại: $_maDienThoai');
    print('Tên điện thoại: $_tenDienThoai');
    print('Hãng sản xuất: $_hangSanXuat');
    print('Giá nhập: $_giaNhap');
    print('Giá bán: $_giaBan');
    print('Số lượng tồn: $_soLuongTon');
    print('Trạng thái: ${_trangThai ? "Còn kinh doanh" : "Ngừng kinh doanh"}');
  }

  // Phương thức kiểm tra có thể bán không
  bool coTheBan() {
    return _soLuongTon > 0 && _trangThai;
  }

  // Phương thức kiểm tra định dạng mã điện thoại
  bool _isValidMaDienThoai(String maDienThoai) {
    return RegExp(r'^DT-\d{3}$').hasMatch(maDienThoai);
  }
}
