/// Custom exception yang dilempar saat data yang dimasukkan
/// pengguna tidak valid (misalnya ID duplikat, input kosong, dll).
class DataTidakValidException implements Exception {
  final String pesan;
  DataTidakValidException(this.pesan);

  @override
  String toString() => 'Error: $pesan';
}
