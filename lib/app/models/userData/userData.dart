import 'package:freezed_annotation/freezed_annotation.dart';

part 'userData.freezed.dart';
part 'userData.g.dart';

@freezed
class UserData with _$UserData {

  factory UserData({
    required String id_session,
    required String username,
  }) = _UserData;

  factory UserData.fromJson(Map<String, dynamic> json) => _$UserDataFromJson(json);
}