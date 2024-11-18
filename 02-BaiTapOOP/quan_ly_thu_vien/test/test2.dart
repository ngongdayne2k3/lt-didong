import '../models/doc_gia.dart';
import '../models/sach.dart';
import '../models/thu_vien.dart';

void main() {
  var thuVien = ThuVien();
  thuVien.themSach(Sach('001', 'Lập trình di động', 'Nguyen Van A', false));
  thuVien.themSach(Sach('002', 'Cơ sở dữ liệu', 'Nguyen Van B', false));
  thuVien.themSach(Sach('003', 'Lập trình mạng', 'Nguyen Van C', false));
  thuVien.hienThiSach();

  var docGia = DocGia('DG001', 'Nguyen Van A');
  docGia.muonSach(thuVien.dsSach[0]);
  docGia.muonSach(thuVien.dsSach[2]);
  thuVien.hienThiSach();

  docGia.traSach(docGia.dsSachDangMuon[0]);
  thuVien.hienThiSach();
}
