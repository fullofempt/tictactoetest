import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tictactoetest/app/models/apimodel/apimodel.dart';
import 'package:tictactoetest/app/routes/app_pages.dart';
import 'package:tictactoetest/app/services/services.dart';
import 'package:tictactoetest/app/services/storage_service.dart';

class LoginController extends GetxController {

  StorageService storageService = StorageService();
  final usernameController = TextEditingController();
  var httpClient = Dio();
  late ApiModel currentUser;

  @override
  void onInit() {
    super.onInit();
  }

  void login() async {
    try {
      print('https://ttt.bulbaman.me/user/add/:${usernameController.text}');
      var response = await httpClient
          .post('https://ttt.bulbaman.me/user/add/:${usernameController.text}');
      if (response.statusCode == 200) {
        currentUser = ApiModel.fromJson(response.data);
        storageService.write("user", currentUser);
        getBaseAuth(currentUser);
        Get.offAndToNamed(Routes.LOBBY);
      } else {
        Exception("Не удалось войти");
      }
    } catch (error) {
      print('Ошибка входа: $error');
    }
  }
}
