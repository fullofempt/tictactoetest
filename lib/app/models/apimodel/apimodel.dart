// ignore_for_file: non_constant_identifier_names

import 'package:freezed_annotation/freezed_annotation.dart';

part 'apimodel.freezed.dart';
part 'apimodel.g.dart';

@freezed
class ApiModel with _$ApiModel {
  factory ApiModel({@Default('') String private_key, required UserData user}) =
      _ApiModel;

  factory ApiModel.fromJson(Map<String, dynamic> json) =>
      _$ApiModelFromJson(json);
  // factory ApiModel.withUser(UserData newUser) => UserData(user: newUser);
}

@freezed
class PlayerResponse with _$PlayerResponse {
  factory PlayerResponse({
    @Default("") String private_key,
    required UserData player,
  }) = _PlayerResponse;

  factory PlayerResponse.fromJson(Map<String, dynamic> json) =>
      _$PlayerResponseFromJson(json);
  factory PlayerResponse.withUser(UserData newPlayer) => PlayerResponse(player: newPlayer);
}

@freezed
class UserData with _$UserData {
  factory UserData({
    @Default('') String? in_session,
    @Default('') String username,
  }) = _UserData;

  factory UserData.fromJson(Map<String, dynamic> json) =>
      _$UserDataFromJson(json);
}
