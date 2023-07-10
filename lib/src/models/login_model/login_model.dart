import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'login_data.dart';

part 'login_model.g.dart';

@JsonSerializable()
class LoginModel extends Equatable {
  final String? status;
  final String? token;
  final LoginData? data;

  const LoginModel({this.status, this.token, this.data});

  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return _$LoginModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$LoginModelToJson(this);

  LoginModel copyWith({
    String? status,
    String? token,
    LoginData? data,
  }) {
    return LoginModel(
      status: status ?? this.status,
      token: token ?? this.token,
      data: data ?? this.data,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [status, token, data];
}
