import '../models/doc_gia.dart';
import '../models/sach.dart';

class ThuVien {
  List<Sach> _dsSach = [];
  List<DocGia> _dsDocGia = [];
//constuctor
  ThuVien();
//getters
  List<Sach> get dsSach => _dsSach;
  List<DocGia> get dsDocGia => _dsDocGia;
//hiển thị sách
  void hienThiSach() {
    print('\n----------------------------------------------');
    print('\nDanh sách ở thư viện:');
    for (var sach in _dsSach) {
      print('\n----------------------------------------------');
      sach.hienThiThongTin();
      print('\nTrạng thái: ${sach.hienThiMuonSach()}');
    }
  }

//thêm sách
  void themSach(Sach sach) {
    _dsSach.add(sach);
  }

//thêm độc giả
  void themDocGia(DocGia docgia) {
    _dsDocGia.add(docgia);
  }
}
