import '../models/item.dart';
import '../exceptions/data_tidak_valid_exception.dart';

/// Mengelola seluruh data item perpustakaan.
/// Menunjukkan penggunaan Collection (List, Set, Map),
/// Higher Order Function, Exception, dan Async/Await.
class Manager {
  // Collection: List menyimpan seluruh item (menampung objek turunan -> polymorphism)
  final List<Item> _items = [];

  // Collection: Set menyimpan daftar kategori unik yang pernah ditambahkan
  final Set<String> _kategoriTersedia = {};

  // Collection: Map mengindeks item berdasarkan id agar pencarian id cepat
  final Map<String, Item> _indeksById = {};

  void tambah(Item item) {
    if (_indeksById.containsKey(item.id)) {
      throw DataTidakValidException('ID "${item.id}" sudah digunakan');
    }
    _items.add(item);
    _indeksById[item.id] = item;
    _kategoriTersedia.add(item.kategori);
  }

  List<Item> get semuaItem => List.unmodifiable(_items);
  Set<String> get kategoriTersedia => Set.unmodifiable(_kategoriTersedia);

  void tampilkanSemua() {
    if (_items.isEmpty) {
      print('Belum ada data. Silakan tambah data terlebih dahulu.');
      return;
    }
    for (var item in _items) {
      item.tampilkanInfo();
    }
  }

  // Higher Order Function: where()
  List<Item> cari(String keyword) {
    return _items
        .where((i) => i.nama.toLowerCase().contains(keyword.toLowerCase()))
        .toList();
  }

  // Higher Order Function: fold()
  double hitungTotal() {
    return _items.fold(0.0, (total, item) => total + item.harga);
  }

  // Higher Order Function: any() dan every()
  bool adaItemLebihMahalDari(double batas) =>
      _items.any((i) => i.harga > batas);
  bool semuaHargaValid() => _items.every((i) => i.harga >= 0);

  // Higher Order Function: map()
  List<String> daftarNamaItem() {
    return _items.map((i) => i.nama).toList();
  }

  // Memakai Map untuk merangkum jumlah item per kategori
  Map<String, int> jumlahPerKategori() {
    final Map<String, int> hasil = {};
    for (var item in _items) {
      hasil.update(item.kategori, (v) => v + 1, ifAbsent: () => 1);
    }
    return hasil;
  }

  // Async/Await: simulasi penyimpanan data
  Future<void> simpanData() async {
    print('Menyimpan data...');
    await Future.delayed(Duration(seconds: 2));
    print('Data berhasil disimpan (${_items.length} item tersimpan).');
  }
}
