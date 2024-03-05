import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tictactoetest/app/models/apimodel/apimodel.dart';
import 'package:tictactoetest/app/routes/app_pages.dart';
import 'package:tictactoetest/app/services/network_services.dart';
import 'package:tictactoetest/app/services/services.dart';
import 'package:tictactoetest/app/services/storage_service.dart';

var httpClient = Dio();

class LoginController extends GetxController {
  NetworkServices networkServices = NetworkServices();
  final usernameController = TextEditingController();

  void login() async {
    print('https://ttt.bulbaman.me/user/add/${usernameController.text}');
    // var response = await httpClient
    //       .post('https://ttt.bulbaman.me/user/add/${usernameController.text}');
    //   print(response.data);
    if (await networkServices.addUser(usernameController.text)) {
      Get.offAndToNamed(Routes.LOBBY);
    } else {
      Get.snackbar(
        "Ошибка",
        "Не удалось войти",
      );
    }
  }
}
