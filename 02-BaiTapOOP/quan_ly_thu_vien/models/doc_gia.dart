import '../models/sach.dart';

class DocGia {
  String _maDocGia;
  String _hoTen;
  List<Sach> _dsSachDangMuon = [];

//constuctor
  DocGia(this._hoTen, this._maDocGia);

//getters
  String get maDocGia => _maDocGia;
  String get hoTen => _hoTen;
  List<Sach> get dsSachDangMuon => _dsSachDangMuon;
//setters
  set maDocGia(String maDocGia) {
    if (maDocGia.isNotEmpty) {
      _maDocGia = maDocGia;
    }
  }

  set hoTen(String hoTen) {
    if (hoTen.isNotEmpty) {
      _hoTen = hoTen;
    }
  }

  //mượn sách
  void muonSach(Sach sach) {
    if (sach.trangThaiMuon == false) {
      dsSachDangMuon.add(sach);
      sach.trangThaiMuon = true;
    }
  }

  //trả sách
  void traSach(Sach sach) {
    dsSachDangMuon.remove(sach);
    sach.trangThaiMuon = false;
  }
}
