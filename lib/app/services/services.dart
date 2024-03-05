//конвертор пароля и тд
import 'dart:convert';
import 'package:http/http.dart';

import 'package:tictactoetest/app/models/apimodel/apimodel.dart';
import 'package:tictactoetest/app/services/storage_service.dart';

StorageService storageService = StorageService();

void getBaseAuth(ApiModel user) {
  String baseAuth =
      'Basic ${base64.encode(utf8.encode('${user.user.username}:${user.private_key}'))}';
  storageService.writeBaseAuth("baseAuth", baseAuth);
}
