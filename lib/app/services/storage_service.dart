import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:tictactoetest/app/models/apimodel/apimodel.dart';
import 'package:tictactoetest/app/models/connection/connection.dart';

class StorageService extends GetxService {
  final FlutterSecureStorage storage = const FlutterSecureStorage();

  Future<String?> read(String key) async {
    return await storage.read(key: key);
  }

  Future<ApiModel> readUserResponse(String key) async {
    String? data = await storage.read(key: key);
    if (data != null) {
      return ApiModel.fromJson(jsonDecode(data));
    } else {
      return ApiModel(user: UserData());
    }
  }

  Future<void> writeUserResponse(String key, ApiModel user) async {
    await storage.write(key: key, value: jsonEncode(user.toJson()));
  }

  Future<void> writeSessionResponse(String key, Connection session) async {
    await storage.write(key: key, value: jsonEncode(session.toJson()));
  }

  Future<Connection> readSessionResponse(String key) async {
    String? data = await storage.read(key: key);
    if (data!=null){
      return Connection.fromJson(jsonDecode(data));
    }
    else {
      return Connection();
    }
  }

  Future<void> writeBaseAuth(String key, String baseAuth) async {
    await storage.write(key: key, value: baseAuth);
  }

  Future<void> delete(String key) async {
    await storage.delete(key: key);
  }
}