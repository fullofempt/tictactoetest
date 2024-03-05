import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tictactoetest/app/core/constants.dart';
import 'package:tictactoetest/app/models/apimodel/apimodel.dart';
import 'package:tictactoetest/app/models/connection/connection.dart';
import 'package:tictactoetest/app/routes/app_pages.dart';
import 'package:tictactoetest/app/services/network_services.dart';
import 'package:tictactoetest/app/services/storage_service.dart';


class GameController extends GetxController {
  StorageService get storageService => Get.find<StorageService>();
  NetworkServices get networkServices => Get.find<NetworkServices>();
  Rx<Connection> currentSession = Connection().obs;
  Rx<ApiModel> currentUser = ApiModel(user: UserData()).obs;

  @override
  void onInit() async {
    updateLocalData();
    print(currentSession.value);
    super.onInit();
  }

  Future<void> updateLocalData() async {
    currentSession.value = await storageService.readSessionResponse('session');
    currentUser.value = await storageService.readUserResponse('user');
  }

  Future<void> leaveSession(int who) async {
    if (await networkServices.leaveSession(who)) {
      updateLocalData();
      Get.offAndToNamed(Routes.LOBBY);
    } else {
      Get.snackbar("Ошибка", "Не удалось сменить никнейм",
          backgroundColor: Colors.red);
    }
  }
  void onCellTapped(int index) {
    if (currentSession.value.gameState == GameState.Ongoing &&
        getCellValue(index) == "") {
    }
  }

  String getCellValue(int index) {
    return currentSession.value.board?[index] ?? "";
  }

}