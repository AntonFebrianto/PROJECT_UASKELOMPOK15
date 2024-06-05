class Booking {
  String nama;
  String nomorHp;
  String tempat;
  String tanggal;
  String jamAwal;
  String jamAkhir;
  String status;
  String? gambar;
  int harga;

  Booking({
    required this.nama,
    required this.nomorHp,
    required this.tempat,
    required this.tanggal,
    required this.jamAkhir,
    required this.jamAwal,
    required this.status,
    this.gambar,
    required this.harga,
  });

  factory Booking.fromJson(Map<String, dynamic> json) {
    return Booking(
      nama: json['nama'],
      nomorHp: json['nomorHp'],
      tempat: json['tempat'],
      tanggal: json['tanggal'],
      jamAwal: json['jamAwal'],
      jamAkhir: json['jamAkhir'],
      status: json['status'],
      gambar: json['gambar'],
      harga: int.parse(json['harga']),
    );
  }
}
