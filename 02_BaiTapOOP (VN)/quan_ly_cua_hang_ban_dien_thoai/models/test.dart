import 'cua_hang.dart';
import 'dien_thoai.dart';
import 'hoa_don.dart';

void main() {
  try {
    CuaHang cuaHang = CuaHang("Tech Store", "123 Đường ABC");
    // Thêm điện thoại
    cuaHang.themDienThoai(DienThoai(
      "DT-001",
      "iPhone 14",
      "Apple",
      20000000,
      25000000,
      30,
      true,
    ));
    cuaHang.themDienThoai(DienThoai(
      "DT-002",
      "Galaxy S23",
      "Samsung",
      15000000,
      20000000,
      1,
      false,
    ));
    // Hiển thị danh sách điện thoại
    cuaHang.hienThiDanhSachDienThoai();
    // Tạo hóa đơn
    cuaHang.taoHoaDon(HoaDon(
      "HD-001",
      DateTime.now(),
      //điện thoại được bán (ở đây vị trí trong danh sách là 0)
      cuaHang.danhSachDienThoai[0],
      // Số lượng bán
      2,
      // giá bán thực tế cho 1 chiếc 24m
      24000000,
      //thông tin khách hàng
      "Nguyễn Văn A",
      "0987654321",
    ));
    cuaHang.taoHoaDon(HoaDon(
      "HD-002",
      DateTime(2024, 1, 4),
      cuaHang.danhSachDienThoai[1],
      1,
      18000000,
      //thông tin khách hàng
      "Trần Minh B",
      "0867434213",
    ));
    // Hiển thị hóa đơn
    cuaHang.hienThiDanhSachHoaDon();
    // Thống kê
    print("\n=> Doanh thu: ${cuaHang.tinhTongDoanhThu(
      DateTime(2024, 1, 1),
      DateTime.now(),
    )}");
    print("\n=> Lợi nhuận: ${cuaHang.tinhTongLoiNhuan(
      DateTime(2024, 1, 1),
      DateTime.now(),
    )}");
  } catch (e) {
    print("Lỗi: $e");
  }
}
