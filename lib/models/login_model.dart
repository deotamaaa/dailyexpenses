class LoginModel {
  LoginModel({
    required this.status,
    required this.token,
    required this.data,
  });
  late final String status;
  late final String token;
  late final Data data;

  LoginModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    token = json['token'];
    data = Data.fromJson(json['data']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> dataTemp = <String, dynamic>{};
    dataTemp['status'] = status;
    dataTemp['token'] = token;
    dataTemp['data'] = data.toJson();
    return dataTemp;
  }
}

class Data {
  Data({
    required this.id,
    required this.nama,
  });
  late final int id;
  late final String nama;

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nama = json['nama'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['nama'] = nama;
    return data;
  }
}
