import 'package:freezed_annotation/freezed_annotation.dart';

part 'apimodel.freezed.dart';
part 'apimodel.g.dart';

@freezed
class ApiModel with _$ApiModel {
  factory ApiModel({
    required String private_key, 
    required User User
  }) = _ApiModel;

  factory ApiModel.fromJson(Map<String, dynamic> json) =>
      _$ApiModelFromJson(json);
}

@freezed
class User with _$User {
  factory User({
    required String id_session,
    required String username,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}