class BelanjaModel {
  BelanjaModel({
    required this.status,
    required this.message,
    required this.data,
  });
  late final String status;
  late final String message;
  late final Data data;

  BelanjaModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = Data.fromJson(json['data']);
  }

  Map<String, dynamic> toJson() {
    final dataTemp = <String, dynamic>{};
    dataTemp['status'] = status;
    dataTemp['message'] = message;
    dataTemp['data'] = data.toJson();
    return dataTemp;
  }
}

class Data {
  Data({
    required this.nama,
    required this.tanggal,
    required this.jumlah,
    required this.pembayaran,
    required this.userId,
    required this.kategori,
  });
  late final String nama;
  late final String tanggal;
  late final int jumlah;
  late final String pembayaran;
  late final int userId;
  late final String kategori;

  Data.fromJson(Map<String, dynamic> json) {
    nama = json['nama'];
    tanggal = json['tanggal'];
    jumlah = json['jumlah'];
    pembayaran = json['pembayaran'];
    userId = json['user_id'];
    kategori = json['kategori'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['nama'] = nama;
    data['tanggal'] = tanggal;
    data['jumlah'] = jumlah;
    data['pembayaran'] = pembayaran;
    data['user_id'] = userId;
    data['kategori'] = kategori;
    return data;
  }
}
