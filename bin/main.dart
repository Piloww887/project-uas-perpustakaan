import 'dart:io';

import '../lib/models/buku.dart';
import '../lib/models/majalah.dart';
import '../lib/controllers/manager.dart';
import '../lib/exceptions/data_tidak_valid_exception.dart';

final Manager manager = Manager();
int _autoId = 1;

Future<void> main() async {
  // Data contoh awal supaya menu "Lihat Semua Data" tidak kosong
  _isiDataContoh();

  bool jalan = true;
  while (jalan) {
    _tampilkanMenu();
    stdout.write('Pilih menu (1-6): ');
    final pilihan = stdin.readLineSync();

    try {
      switch (pilihan) {
        case '1':
          _tambahData();
          break;
        case '2':
          _lihatSemuaData();
          break;
        case '3':
          _cariData();
          break;
        case '4':
          _hitungTotal();
          break;
        case '5':
          await manager.simpanData();
          break;
        case '6':
          jalan = false;
          print('Terima kasih telah menggunakan aplikasi perpustakaan.');
          break;
        default:
          throw DataTidakValidException('Pilihan menu tidak dikenali');
      }
    } on DataTidakValidException catch (e) {
      print(e);
    } catch (e) {
      print('Terjadi kesalahan: $e');
    }
    print('');
  }
}

void _tampilkanMenu() {
  print('===== MENU PERPUSTAKAAN =====');
  print('1. Tambah Data');
  print('2. Lihat Semua Data');
  print('3. Cari Data');
  print('4. Hitung Total');
  print('5. Simpan Data');
  print('6. Keluar');
}

void _tambahData() {
  stdout.write('Jenis item (1=Buku, 2=Majalah): ');
  final jenis = stdin.readLineSync();

  stdout.write('Nama: ');
  final nama = stdin.readLineSync() ?? '';

  stdout.write('Harga: ');
  final hargaInput = stdin.readLineSync() ?? '';
  final harga = double.tryParse(hargaInput);
  if (harga == null) {
    throw DataTidakValidException('Harga harus berupa angka');
  }

  final id = 'ITM${(_autoId++).toString().padLeft(3, '0')}';

  if (jenis == '1') {
    stdout.write('Penulis: ');
    final penulis = stdin.readLineSync() ?? '';
    manager.tambah(Buku(id, nama, harga, penulis));
    print('Buku berhasil ditambahkan dengan id $id.');
  } else if (jenis == '2') {
    stdout.write('Edisi: ');
    final edisiInput = stdin.readLineSync() ?? '';
    final edisi = int.tryParse(edisiInput);
    if (edisi == null) {
      throw DataTidakValidException('Edisi harus berupa angka bulat');
    }
    manager.tambah(Majalah(id, nama, harga, edisi));
    print('Majalah berhasil ditambahkan dengan id $id.');
  } else {
    throw DataTidakValidException('Jenis item tidak dikenali');
  }
}

void _lihatSemuaData() {
  manager.tampilkanSemua();
  final ringkasan = manager.jumlahPerKategori();
  if (ringkasan.isNotEmpty) {
    print('--- Ringkasan kategori: $ringkasan ---');
  }
}

void _cariData() {
  stdout.write('Kata kunci nama: ');
  final keyword = stdin.readLineSync() ?? '';
  final hasil = manager.cari(keyword);
  if (hasil.isEmpty) {
    print('Tidak ada item yang cocok dengan "$keyword".');
  } else {
    for (var item in hasil) {
      item.tampilkanInfo();
    }
  }
}

void _hitungTotal() {
  final total = manager.hitungTotal();
  print('Total harga seluruh item: Rp${total.toStringAsFixed(0)}');
  print('Ada item di atas Rp50.000? ${manager.adaItemLebihMahalDari(50000)}');
}

void _isiDataContoh() {
  manager.tambah(Buku('ITM${(_autoId++).toString().padLeft(3, '0')}',
      'Pemrograman Dart Dasar', 75000, 'Andi Wijaya'));
  manager.tambah(Majalah(
      'ITM${(_autoId++).toString().padLeft(3, '0')}', 'Teknologi Masa Kini', 25000, 12));
}
