import 'dart:io';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:tictactoetest/app/models/apimodel/apimodel.dart';
import 'package:tictactoetest/app/models/connection/connection.dart';
import 'package:tictactoetest/app/models/testSession/testSession.dart';
import 'package:tictactoetest/app/services/services.dart';
import 'package:tictactoetest/app/services/storage_service.dart';



class NetworkServices extends GetxController {
  var httpClient = Dio();
  var baseUrl = "https://ttt.bulbaman.me";
  var storageService = StorageService();

  Future<bool> addUser(String nickname) async {
    try {
      var response = await httpClient.post('$baseUrl/user/add/$nickname');
      if (response.statusCode == 200) {
        var currentUser = ApiModel.fromJson(response.data);
        await storageService.writeUserResponse("user", currentUser);
        getBaseAuth(currentUser);
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> deleteUser() async {
    try {
      var response = await httpClient.delete('$baseUrl/user/delete',
          data: await storageService.readUserResponse('user'),
          options: Options(headers: <String, String>{
            'authorization': await storageService.read('baseAuth') ?? '',
          }));
      if (response.statusCode == 200) {
        return true;
      } else {
        print(response.statusCode);
        return true;
      }
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<List<TestSession>?> getSessions() async {
    try {
      var response = await httpClient.get('$baseUrl/session/get_all');
      if (response.statusCode == 200) {
        List<Map<String, dynamic>> sessionsData = List.castFrom(response.data);
        List<TestSession> sessionsList =
            sessionsData.map((data) => TestSession.fromJson(data)).toList();

        return sessionsList;
      } else {
        return null;
      }
    } catch (e) {
      print("Ошибка: $e");
      return null;
    }
  }

  Future<Connection?> getSessionById(sessionId) async {
    try {
      var response = await httpClient.get('$baseUrl/session/get/$sessionId');
      if (response.statusCode == 200) {
        var currentSession = Connection.fromJson(response.data);
        await storageService.writeSessionResponse("session", currentSession);
        return currentSession;
      } else {
        print(response.statusCode);
        return null;
      }
    } catch (erorr) {
      print(erorr);
      return null;
    }
  }

  Future<bool> createSession(String sessionName) async {
    try {
      var response =
          await httpClient.post('$baseUrl/session/create/$sessionName',
              options: Options(headers: <String, String>{
                'authorization': await storageService.read('baseAuth') ?? '',
              }));
      if (response.statusCode == 200) {
        var responseSession = ApiModel.fromJson(response.data);
        await storageService.writeSessionResponse(
            "session", responseSession as Connection);
        var data = await storageService.readUserResponse("user");
        var updateUserResponse = ApiModel(
            user: UserData(
                in_session: responseSession.private_key,
                username: data.user.username));
        await storageService.writeUserResponse(
            "user", updateUserResponse);
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> joinSession(String sessionId) async {
    var response = await httpClient.patch('$baseUrl/session/join/$sessionId',
        options: Options(headers: <String, String>{
          'authorization': await storageService.read('baseAuth') ?? '',
        }));
    if (response.statusCode == 200) {
      await storageService.writeSessionResponse(
          'session', Connection.fromJson(response.data));
      var data = await storageService.readUserResponse("user");
      var updateUserResponse = ApiModel(
          user: UserData(in_session: sessionId, username: data.user.username));
      await storageService.writeUserResponse(
          "user", updateUserResponse);
      return true;
    } else {
      print("Не удалось подключиться");
      return false;
    }
  }

  Future<bool> leaveSession(who) async {
    try {
      var response = await httpClient.delete('$baseUrl/user/update',
          options: Options(headers: <String, String>{
            'authorization': await storageService.read('baseAuth') ?? '',
          }));
      if (response.statusCode == 200) {
        if (who == 1) {
          await storageService.delete('session');
        }
        var data = await storageService.readUserResponse('user');
        var updateUser = ApiModel(
            private_key: data.private_key,
            user: UserData(in_session: null, username: data.user.username));
        await storageService.writeUserResponse(
            'user', updateUser);
        return true;
      } else {
        print("Код ошибки: ${response.statusCode}");
        return false;
      }
    } catch (e) {
      print("Ошибка: $e");
      return false;
    }
  }

  Future<bool> startSession(String sessionId) async {
    var response = await httpClient.patch('$baseUrl/session/start/$sessionId',
        options: Options(headers: <String, String>{
          'authorization': await storageService.read('baseAuth') ?? '',
        }));
    if (response.statusCode == 200) {
      await storageService.writeSessionResponse(
          'session', Connection.fromJson(response.data));
      return true;
    } else {
      print("Не удалось запустить игру");
      return false;
    }
  }
}
