import 'dien_thoai.dart';
import 'hoa_don.dart';

class CuaHang {
  // Thuộc tính private
  String _tenCuaHang;
  String _diaChi;
  List<DienThoai> _danhSachDienThoai = [];
  List<HoaDon> _danhSachHoaDon = [];

  // Constructor
  CuaHang(this._tenCuaHang, this._diaChi) {}

  // Getter
  String get tenCuaHang => _tenCuaHang;
  String get diaChi => _diaChi;
  List<DienThoai> get danhSachDienThoai => _danhSachDienThoai;
  List<HoaDon> get danhSachHoaDon => _danhSachHoaDon;

  // Phương thức quản lý điện thoại

  // Thêm điện thoại mới
  void themDienThoai(DienThoai dienThoai) {
    // Kiểm tra trùng mã
    if (_danhSachDienThoai
        .any((dt) => dt.maDienThoai == dienThoai.maDienThoai)) {
      throw Exception('Mã điện thoại đã tồn tại');
    }
    _danhSachDienThoai.add(dienThoai);
  }

  // Cập nhật thông tin điện thoại
  void capNhatDienThoai(String maDienThoai, DienThoai dienThoaiMoi) {
    int index =
        _danhSachDienThoai.indexWhere((dt) => dt.maDienThoai == maDienThoai);
    if (index != -1) {
      _danhSachDienThoai[index] = dienThoaiMoi;
    } else {
      throw Exception('Không tìm thấy điện thoại');
    }
  }

  // Ngừng kinh doanh điện thoại
  void ngungKinhDoanhDienThoai(String maDienThoai) {
    int index =
        _danhSachDienThoai.indexWhere((dt) => dt.maDienThoai == maDienThoai);
    if (index != -1) {
      _danhSachDienThoai[index].trangThai = false;
    } else {
      throw Exception('Không tìm thấy điện thoại');
    }
  }

  // Tìm kiếm điện thoại theo mã
  DienThoai? timDienThoaiTheoMa(String maDienThoai) {
    try {
      return _danhSachDienThoai
          .firstWhere((dt) => dt.maDienThoai == maDienThoai);
    } catch (e) {
      return null;
    }
  }

  // Tìm kiếm điện thoại theo tên
  List<DienThoai> timDienThoaiTheoTen(String tenDienThoai) {
    return _danhSachDienThoai
        .where((dt) =>
            dt.tenDienThoai.toLowerCase().contains(tenDienThoai.toLowerCase()))
        .toList();
  }

  // Tìm kiếm điện thoại theo hãng
  List<DienThoai> timDienThoaiTheoHang(String hangSanXuat) {
    return _danhSachDienThoai
        .where(
            (dt) => dt.hangSanXuat.toLowerCase() == hangSanXuat.toLowerCase())
        .toList();
  }

  // Hiển thị danh sách điện thoại
  void hienThiDanhSachDienThoai() {
    _danhSachDienThoai.forEach((dt) => dt.hienThiThongTin());
  }

  // Phương thức quản lý hóa đơn

  // Tạo hóa đơn mới (tự động cập nhật tồn kho)
  void taoHoaDon(HoaDon hoaDon) {
    // Kiểm tra trùng mã
    if (_danhSachHoaDon.any((hd) => hd.maHoaDon == hoaDon.maHoaDon)) {
      throw Exception('Mã hóa đơn đã tồn tại');
    }

    // Cập nhật số lượng tồn kho
    DienThoai dienThoai = hoaDon.dienThoai;
    if (dienThoai.soLuongTon < hoaDon.soLuongMua) {
      throw Exception('Số lượng tồn kho không đủ');
    }

    dienThoai.soLuongTon -= hoaDon.soLuongMua;
    _danhSachHoaDon.add(hoaDon);
  }

  // Tìm kiếm hóa đơn theo mã
  HoaDon? timHoaDonTheoMa(String maHoaDon) {
    try {
      return _danhSachHoaDon.firstWhere((hd) => hd.maHoaDon == maHoaDon);
    } catch (e) {
      return null;
    }
  }

  // Tìm kiếm hóa đơn theo ngày
  List<HoaDon> timHoaDonTheoNgay(DateTime ngayBan) {
    return _danhSachHoaDon
        .where((hd) =>
            hd.ngayBan.year == ngayBan.year &&
            hd.ngayBan.month == ngayBan.month &&
            hd.ngayBan.day == ngayBan.day)
        .toList();
  }

  // Tìm kiếm hóa đơn theo tên khách hàng
  List<HoaDon> timHoaDonTheoKhachHang(String tenKhachHang) {
    return _danhSachHoaDon
        .where((hd) =>
            hd.tenKhachHang.toLowerCase().contains(tenKhachHang.toLowerCase()))
        .toList();
  }

  // Hiển thị danh sách hóa đơn
  void hienThiDanhSachHoaDon() {
    _danhSachHoaDon.forEach((hd) => hd.hienThiThongTinHoaDon());
  }

  // Phương thức thống kê

  // Tính tổng doanh thu theo khoảng thời gian
  double tinhTongDoanhThu(DateTime tuNgay, DateTime denNgay) {
    return _danhSachHoaDon
        .where(
            (hd) => hd.ngayBan.isAfter(tuNgay) && hd.ngayBan.isBefore(denNgay))
        .map((hd) => hd.tinhTongTien())
        .reduce((a, b) => a + b);
  }

  // Tính tổng lợi nhuận theo khoảng thời gian
  double tinhTongLoiNhuan(DateTime tuNgay, DateTime denNgay) {
    return _danhSachHoaDon
        .where(
            (hd) => hd.ngayBan.isAfter(tuNgay) && hd.ngayBan.isBefore(denNgay))
        .map((hd) => hd.tinhLoiNhuanThucTe())
        .reduce((a, b) => a + b);
  }

  // Thống kê top điện thoại bán chạy
  List<DienThoai> thongKeTopDienThoaiBanChay(int topN) {
    Map<DienThoai, int> soLuongBan = {};
    for (var hd in _danhSachHoaDon) {
      if (soLuongBan.containsKey(hd.dienThoai)) {
        soLuongBan[hd.dienThoai] = soLuongBan[hd.dienThoai]! + hd.soLuongMua;
      } else {
        soLuongBan[hd.dienThoai] = hd.soLuongMua;
      }
    }
    var sortedList = soLuongBan.entries.toList()
      ..sort((a, b) => b.value.compareTo(a.value));
    return sortedList.take(topN).map((e) => e.key).toList();
  }

  // Thống kê tồn kho
  int thongKeTonKho() {
    return _danhSachDienThoai.fold(0, (sum, dt) => sum + dt.soLuongTon);
  }
}
