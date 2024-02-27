import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:tictactoetest/app/models/apimodel/apimodel.dart';

class StorageService extends GetxService {
  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  Future<String?> read(String key) async {
    return await _storage.read(key: key);
  }

  Future<void> write(String key, ApiModel user) async {
    await _storage.write(key: key, value: jsonEncode(user.toJson()));
  }

  Future<void> writeBaseAuth(String key, String baseAuth) async {
    await _storage.write(key: key, value: baseAuth);
  }
}

class FlutterSecureStorage {}
