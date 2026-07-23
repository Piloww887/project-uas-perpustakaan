import 'item.dart';

/// Class turunan dari Item, merepresentasikan majalah di perpustakaan.
class Majalah extends Item {
  int _edisi;

  Majalah(String id, String nama, double harga, int edisi)
      : _edisi = _validasiEdisi(edisi),
        super(id, nama, harga);

  int get edisi => _edisi;

  set edisi(int value) {
    _edisi = _validasiEdisi(value);
  }

  static int _validasiEdisi(int value) {
    if (value <= 0) {
      throw Exception('Edisi harus lebih dari 0');
    }
    return value;
  }

  @override
  String get kategori => 'Majalah';

  @override
  void tampilkanInfo() {
    print('[$id] Majalah    : $nama - Rp${harga.toStringAsFixed(0)} - Edisi: $_edisi');
  }
}
