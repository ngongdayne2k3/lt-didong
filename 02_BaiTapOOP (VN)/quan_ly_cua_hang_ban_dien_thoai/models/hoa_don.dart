import 'dien_thoai.dart';

class HoaDon {
  // Thuộc tính private
  String _maHoaDon;
  DateTime _ngayBan;
  DienThoai _dienThoai;
  int _soLuongMua;
  double _giaBanThucTe;
  String _tenKhachHang;
  String _soDienThoaiKhach;

  // Constructor đầy đủ tham số
  HoaDon(this._maHoaDon, this._ngayBan, this._dienThoai, this._soLuongMua,
      this._giaBanThucTe, this._tenKhachHang, this._soDienThoaiKhach) {
    // Validation
    if (!_isValidMaHoaDon(_maHoaDon)) {
      throw Exception('Mã hóa đơn không hợp lệ (định dạng: HD-XXX)');
    }
    if (_ngayBan.isAfter(DateTime.now())) {
      throw Exception('Ngày bán không được sau ngày hiện tại');
    }
    if (_soLuongMua <= 0 || _soLuongMua > _dienThoai.soLuongTon) {
      throw Exception(
          'Số lượng mua phải lớn hơn 0 và không vượt quá số lượng tồn kho');
    }
    if (_giaBanThucTe <= 0) {
      throw Exception('Giá bán thực tế phải lớn hơn 0');
    }
    if (_tenKhachHang.isEmpty) {
      throw Exception('Tên khách hàng không được rỗng');
    }
    if (!_isValidSoDienThoai(_soDienThoaiKhach)) {
      throw Exception('Số điện thoại khách không hợp lệ');
    }
  }

  // Getter và Setter
  String get maHoaDon => _maHoaDon;
  set maHoaDon(String value) {
    if (!_isValidMaHoaDon(value)) {
      throw Exception('Mã hóa đơn không hợp lệ (định dạng: HD-XXX)');
    }
    _maHoaDon = value;
  }

  DateTime get ngayBan => _ngayBan;
  set ngayBan(DateTime value) {
    if (value.isAfter(DateTime.now())) {
      throw Exception('Ngày bán không được sau ngày hiện tại');
    }
    _ngayBan = value;
  }

  DienThoai get dienThoai => _dienThoai;
  set dienThoai(DienThoai value) {
    _dienThoai = value;
  }

  int get soLuongMua => _soLuongMua;
  set soLuongMua(int value) {
    if (value <= 0 || value > _dienThoai.soLuongTon) {
      throw Exception(
          'Số lượng mua phải lớn hơn 0 và không vượt quá số lượng tồn kho');
    }
    _soLuongMua = value;
  }

  double get giaBanThucTe => _giaBanThucTe;
  set giaBanThucTe(double value) {
    if (value <= 0) {
      throw Exception('Giá bán thực tế phải lớn hơn 0');
    }
    _giaBanThucTe = value;
  }

  String get tenKhachHang => _tenKhachHang;
  set tenKhachHang(String value) {
    if (value.isEmpty) {
      throw Exception('Tên khách hàng không được rỗng');
    }
    _tenKhachHang = value;
  }

  String get soDienThoaiKhach => _soDienThoaiKhach;
  set soDienThoaiKhach(String value) {
    if (!_isValidSoDienThoai(value)) {
      throw Exception('Số điện thoại khách không hợp lệ');
    }
    _soDienThoaiKhach = value;
  }

  // Phương thức tính tổng tiền
  double tinhTongTien() {
    return _giaBanThucTe * _soLuongMua;
  }

  // Phương thức tính lợi nhuận thực tế
  double tinhLoiNhuanThucTe() {
    return (_dienThoai.giaBan - _dienThoai.giaNhap) * _soLuongMua;
  }

  // Phương thức hiển thị thông tin hóa đơn
  void hienThiThongTinHoaDon() {
    print('Mã hóa đơn: $_maHoaDon');
    print('Ngày bán: $_ngayBan');
    print('Điện thoại: ${_dienThoai.tenDienThoai}');
    print('Số lượng mua: $_soLuongMua');
    print('Giá bán thực tế: $_giaBanThucTe');
    print('Tên khách hàng: $_tenKhachHang');
    print('Số điện thoại khách: $_soDienThoaiKhach');
  }

  // Phương thức kiểm tra định dạng số điện thoại
  bool _isValidSoDienThoai(String soDienThoai) {
    return RegExp(r'^0\d{9}$').hasMatch(soDienThoai);
  }

// Phương thức kiểm tra định dạng mã hóa đơn
  bool _isValidMaHoaDon(String maHoaDon) {
    return RegExp(r'^HD-\d{3}$').hasMatch(maHoaDon);
  }
}
