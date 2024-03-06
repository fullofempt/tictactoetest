import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tictactoetest/app/core/constants.dart';
import 'package:tictactoetest/app/models/apimodel/apimodel.dart';
import 'package:tictactoetest/app/models/connection/connection.dart';
import 'package:tictactoetest/app/modules/game/xofield/xofield_controller.dart';
import 'package:tictactoetest/app/modules/game/xofield/xofield_veiw.dart';
import 'package:tictactoetest/app/routes/app_pages.dart';
import 'package:tictactoetest/app/services/network_services.dart';
import 'package:tictactoetest/app/services/storage_service.dart';

class GameController extends GetxController {
  StorageService get storageService => Get.find<StorageService>();
  NetworkServices get networkServices => Get.find<NetworkServices>();
  Rx<Connection> currentSession = Connection().obs;
  Rx<ApiModel> currentUser = ApiModel(user: UserData()).obs;


  var playerMove = XOState.x.obs;
  var playerSide = XOState.x.obs;
  var gameIsEnd = false.obs;
  var count = 0.obs;
  var fields = RxList<XOFieldController>.empty();
  var gameText = 'Ход Х'.obs;

  @override
  void onInit()  {
    updateLocalData();
    print(currentSession.value);
    initFields();
    print('init');
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
      Get.snackbar("Ошибка", "Не удалось выйти", backgroundColor: Colors.red);
    }
  }

  void onCellTapped(int index) {
    if (currentSession.value.gameState == GameState.Ongoing &&
        getCellValue(index) == "") {}
  }

  String getCellValue(int index) {
    return currentSession.value.board?[index] ?? "";
  }

  void changePlayerMove() {
    gameIsEnd.value = checkGameEnd();
    if (gameIsEnd.value) return;

    playerMove.value = playerMove.value == XOState.x ? XOState.o : XOState.x;
    gameText.value = "Ход ${playerMove.value}";
    count.value++;
  }

  void initFields() {
    fields.value = List.generate(9, (index) {
      return Get.put(XOFieldController(num: index),
          tag: "$controllerTag$index");
    }).obs;
  }

  bool checkGameEnd() {
    if (count.value == 8) {
      gameIsEnd.value = true;
      gameText.value = "Закончились ходы";
      return true;
    }
    return false;
  }
}
