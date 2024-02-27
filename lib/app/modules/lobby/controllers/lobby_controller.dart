import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tictactoetest/app/models/apimodel/apimodel.dart';
import 'package:tictactoetest/app/models/connection/connection.dart';
import 'package:tictactoetest/app/routes/app_pages.dart';
import 'package:tictactoetest/app/services/services.dart';
import 'package:tictactoetest/app/services/storage_service.dart';

class LobbyController extends GetxController {
  //TODO: Implement LobbyController
  StorageService storageService = StorageService();
  final lobbynameController = TextEditingController();
  var httpClient = Dio();
  late Connection connection;

  @override
  void onInit() {
    super.onInit();
  }

  void lobby() async {
    try {
      print('https://ttt.bulbaman.me/session/create/:${lobbynameController.text}');
      var response = await httpClient.post(
          'https://ttt.bulbaman.me/session/create/:${lobbynameController.text}');
      if (response.statusCode == 200) {
        connection = Connection.fromJson(response.data);
        storageService.write("id", connection as ApiModel);
        getBaseAuth(connection as ApiModel);
        Get.offAndToNamed(Routes.LOBBY);
      } else {
        Exception("Не удалось войти");
      }
    } catch (error) {
      print('Ошибка входа: $error');
    }
  }
}
