/// Class induk untuk seluruh item di perpustakaan.
/// Menerapkan encapsulation (field private + getter/setter + validasi)
/// dan menjadi basis polymorphism lewat method tampilkanInfo().
abstract class Item {
  final String _id;
  String _nama;
  double _harga;

  Item(String id, String nama, double harga)
      : _id = id,
        _nama = _validasiNama(nama),
        _harga = _validasiHarga(harga);

  // ----- Getter -----
  String get id => _id;
  String get nama => _nama;
  double get harga => _harga;

  // Setiap turunan wajib punya kategori sendiri (dipakai untuk Map/Set)
  String get kategori;

  // ----- Setter dengan validasi -----
  set nama(String value) {
    _nama = _validasiNama(value);
  }

  set harga(double value) {
    _harga = _validasiHarga(value);
  }

  static String _validasiNama(String value) {
    if (value.trim().isEmpty) {
      throw Exception('Nama tidak boleh kosong');
    }
    return value;
  }

  static double _validasiHarga(double value) {
    if (value < 0) {
      throw Exception('Harga tidak boleh negatif');
    }
    return value;
  }

  /// Method yang di-override tiap turunan (polymorphism).
  void tampilkanInfo();
}
