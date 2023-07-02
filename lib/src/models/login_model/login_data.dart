import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'login_data.g.dart';

@JsonSerializable()
class LoginData extends Equatable {
  final int? id;
  final String? nama;

  const LoginData({this.id, this.nama});

  factory LoginData.fromJson(Map<String, dynamic> json) =>
      _$LoginDataFromJson(json);

  Map<String, dynamic> toJson() => _$LoginDataToJson(this);

  LoginData copyWith({
    int? id,
    String? nama,
  }) {
    return LoginData(
      id: id ?? this.id,
      nama: nama ?? this.nama,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [id, nama];
}
