class PengeluaranAll {
  PengeluaranAll({
    required this.status,
    required this.message,
    required this.data,
  });
  late final String status;
  late final String message;
  late final Data data;

  PengeluaranAll.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = Data.fromJson(json['data']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['message'] = message;
    _data['data'] = data.toJson();
    return _data;
  }
}

class Data {
  Data({
    required this.results,
    required this.pengeluaran,
  });
  late final List<Results> results;
  late final Pengeluaran pengeluaran;

  Data.fromJson(Map<String, dynamic> json) {
    results =
        List.from(json['results']).map((e) => Results.fromJson(e)).toList();
    pengeluaran = Pengeluaran.fromJson(json['pengeluaran']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['results'] = results.map((e) => e.toJson()).toList();
    _data['pengeluaran'] = pengeluaran.toJson();
    return _data;
  }
}

class Results {
  Results({
    required this.pengeluaranId,
    required this.nama,
    required this.tanggal,
    required this.jumlah,
    required this.pembayaran,
    required this.userId,
    required this.kategori,
  });
  late final int pengeluaranId;
  late final String nama;
  late final String tanggal;
  late final int jumlah;
  late final String pembayaran;
  late final int userId;
  late final String kategori;

  Results.fromJson(Map<String, dynamic> json) {
    pengeluaranId = json['pengeluaran_id'] ?? 0;
    nama = json['nama'] ?? '';
    tanggal = json['tanggal'] ?? '';
    jumlah = json['jumlah'] ?? 0;
    pembayaran = json['pembayaran'] ?? '';
    userId = json['user_id'] ?? 0;
    kategori = json['kategori'] ?? '';
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['pengeluaran_id'] = pengeluaranId;
    _data['nama'] = nama;
    _data['tanggal'] = tanggal;
    _data['jumlah'] = jumlah;
    _data['pembayaran'] = pembayaran;
    _data['user_id'] = userId;
    _data['kategori'] = kategori;
    return _data;
  }
}

class Pengeluaran {
  Pengeluaran({
    required this.pengeluaranGopay,
    required this.pengeluaranRekening,
    required this.pengeluaranCash,
  });
  late final int pengeluaranGopay;
  late final int pengeluaranRekening;
  late final int pengeluaranCash;

  Pengeluaran.fromJson(Map<String, dynamic> json) {
    pengeluaranGopay = json['pengeluaran_gopay'];
    pengeluaranRekening = json['pengeluaran_rekening'];
    pengeluaranCash = json['pengeluaran_cash'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['pengeluaran_gopay'] = pengeluaranGopay;
    _data['pengeluaran_rekening'] = pengeluaranRekening;
    _data['pengeluaran_cash'] = pengeluaranCash;
    return _data;
  }
}
