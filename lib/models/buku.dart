import 'item.dart';

/// Class turunan dari Item, merepresentasikan buku di perpustakaan.
class Buku extends Item {
  String _penulis;

  Buku(String id, String nama, double harga, String penulis)
      : _penulis = _validasiPenulis(penulis),
        super(id, nama, harga);

  String get penulis => _penulis;

  set penulis(String value) {
    _penulis = _validasiPenulis(value);
  }

  static String _validasiPenulis(String value) {
    if (value.trim().isEmpty) {
      throw Exception('Penulis tidak boleh kosong');
    }
    return value;
  }

  @override
  String get kategori => 'Buku';

  @override
  void tampilkanInfo() {
    print('[$id] Buku       : $nama - Rp${harga.toStringAsFixed(0)} - Penulis: $_penulis');
  }
}
