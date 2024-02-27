import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tictactoetest/app/models/userData/userData.dart';

part 'apimodel.freezed.dart';
part 'apimodel.g.dart';

@freezed
class ApiModel with _$ApiModel {
  factory ApiModel({
    required String private_key, 
    required UserData User
  }) = _ApiModel;

  factory ApiModel.fromJson(Map<String, dynamic> json) =>
      _$ApiModelFromJson(json);
}

