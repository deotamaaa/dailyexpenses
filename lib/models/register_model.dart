class RegisterModel {
  RegisterModel({
    required this.message,
    required this.token,
    required this.data,
  });
  late final String message;
  late final String token;
  late final Data data;

  RegisterModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    token = json['token'];
    data = Data.fromJson(json['data']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['message'] = message;
    _data['token'] = token;
    _data['data'] = data.toJson();
    return _data;
  }
}

class Data {
  Data({
    required this.id,
  });
  late final int id;

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    return _data;
  }
}
