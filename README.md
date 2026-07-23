# Aplikasi Manajemen Perpustakaan (CLI)

Nama: Muhamad Aditiya Nugraha
NIM: 251240001616

## Tema Aplikasi
Aplikasi manajemen sederhana berbasis terminal (CLI) dengan tema **perpustakaan**.
Program mengelola dua jenis item pustaka, yaitu **Buku** dan **Majalah**, yang
merupakan turunan dari class induk `Item`.

## Konsep OOP yang Digunakan
- **Class & Object**: `Item` (induk), `Buku` dan `Majalah` (turunan).
- **Encapsulation**: seluruh field bertipe private (`_nama`, `_harga`, `_penulis`,
  `_edisi`) dengan getter/setter yang memvalidasi input (nama tidak boleh kosong,
  harga tidak boleh negatif, penulis tidak boleh kosong, edisi harus > 0).
- **Inheritance**: `Buku` dan `Majalah` mewarisi `Item`.
- **Polymorphism**: method `tampilkanInfo()` di-override oleh tiap class turunan,
  lalu dipanggil lewat `List<Item>` tanpa perlu tahu tipe konkretnya.
- **Collection**: `List<Item>` untuk menyimpan seluruh data, `Set<String>` untuk
  daftar kategori unik, `Map<String, Item>` untuk indeks berdasarkan id.
- **Higher Order Function**: `where()`, `map()`, `fold()`, `any()`, `every()`
  digunakan di `Manager` untuk pencarian, penjumlahan total harga, dan pengecekan.
- **Exception Handling**: `DataTidakValidException` (custom exception) dilempar
  saat id duplikat atau input tidak valid, ditangkap dengan try-catch di `main.dart`.
- **Async/Await**: `Manager.simpanData()` mensimulasikan proses penyimpanan data
  dengan jeda menggunakan `Future.delayed`.

## Struktur Folder
```
project_uas/
├── bin/
│   └── main.dart
├── lib/
│   ├── models/
│   │   ├── item.dart
│   │   ├── buku.dart
│   │   └── majalah.dart
│   ├── controllers/
│   │   └── manager.dart
│   └── exceptions/
│       └── data_tidak_valid_exception.dart
├── pubspec.yaml
└── README.md
```

## Fitur Program
```
===== MENU PERPUSTAKAAN =====
1. Tambah Data
2. Lihat Semua Data
3. Cari Data
4. Hitung Total
5. Simpan Data
6. Keluar
```
- **Tambah Data**: menambahkan Buku atau Majalah baru dengan validasi input.
- **Lihat Semua Data**: menampilkan seluruh item beserta ringkasan jumlah per kategori.
- **Cari Data**: mencari item berdasarkan kata kunci nama.
- **Hitung Total**: menghitung total harga seluruh item.
- **Simpan Data**: mensimulasikan penyimpanan data secara asynchronous.
- **Keluar**: mengakhiri program.

## Cara Menjalankan Program
1. Pastikan Dart SDK sudah terpasang (cek dengan `dart --version`).
2. Masuk ke folder proyek:
   ```
   cd project_uas
   ```
3. Jalankan program:
   ```
   dart run bin/main.dart
   ```
4. Ikuti instruksi menu yang muncul di terminal.
