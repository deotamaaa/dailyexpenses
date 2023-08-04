class SaldoModel {
  SaldoModel({
    required this.status,
    required this.message,
    required this.data,
  });
  late final String status;
  late final String message;
  late final Data data;

  SaldoModel.fromJson(Map<String, dynamic> json) {
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
    required this.userId,
    required this.uangGopay,
    required this.uangCash,
    required this.uangRekening,
  });
  late final int userId;
  late final int uangGopay;
  late final int uangCash;
  late final int uangRekening;

  Data.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'] ?? 0;
    uangGopay = json['uang_gopay'] ?? 0;
    uangCash = json['uang_cash'] ?? 0;
    uangRekening = json['uang_rekening'] ?? 0;
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['user_id'] = userId;
    _data['uang_gopay'] = uangGopay;
    _data['uang_cash'] = uangCash;
    _data['uang_rekening'] = uangRekening;
    return _data;
  }
}
