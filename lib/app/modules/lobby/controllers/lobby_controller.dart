import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tictactoetest/app/models/apimodel/apimodel.dart';
import 'package:tictactoetest/app/models/connection/connection.dart';
import 'package:tictactoetest/app/models/testSession/testSession.dart';
import 'package:tictactoetest/app/routes/app_pages.dart';
import 'package:tictactoetest/app/services/network_services.dart';
import 'package:tictactoetest/app/services/storage_service.dart';

class LobbyController extends GetxController {
  RxList<TestSession> testSession = <TestSession>[].obs;
  StorageService storageService = StorageService();
  NetworkServices networkServices = NetworkServices();
  Rx<Connection> currentSession = Connection().obs;
  final newUserNicknameController = TextEditingController();
  final sessionnameController = TextEditingController();
  Rx<ApiModel> currentUser = ApiModel(user: UserData()).obs;

  @override
  void onInit() {
    updateLocalData();
    getSessions();
    super.onInit();
  }

  Future<void> updateLocalData() async {
    currentUser.value = await storageService.readUserResponse('user');
    currentSession.value = await storageService.readSessionResponse('session');
    await getSessions();
  }

  Future<void> createSession(String sessionName) async {
    if (await networkServices.createSession(sessionName)) {
      updateLocalData();
      Get.back();
    } else {
      Get.snackbar("Ошибка", "Не удалось создать сессию",
          backgroundColor: Colors.red);
    }
  }

  Future<void> startSession(String sessionId) async {
    if (await networkServices.startSession(sessionId)) {
      updateLocalData();
      Get.offAndToNamed(Routes.GAME);
    } else {
      Get.snackbar("Ошибка", "Не удалось запустить игру",
          backgroundColor: Colors.red);
    }
  }

  Future<void> getSessions() async {
    testSession.assignAll(await networkServices.getSessions() ?? []);
    if (testSession.isEmpty) {
      Get.snackbar("Ошибка", "Нет Сессии", backgroundColor: Colors.red);
    }
  }

  Future<void> getSessionById(String sessions) async {
    var data = await networkServices.getSessionById(sessions);
    if (data != null) {
      currentSession.value = data;
    } else {
      Get.snackbar("Ошибка", "Нет ответа о сессии",
          backgroundColor: Colors.red);
    }
  }

  Future<void> joinSession(String sessionId) async {
    if (await networkServices.joinSession(sessionId)) {
      updateLocalData();
      Get.offAndToNamed(Routes.GAME);
    } else {
      Get.snackbar("Ошибка", "Не удалось подключиться",
          backgroundColor: Colors.red);
    }
  }

  Future<void> logout() async {
    if (await networkServices.deleteUser()) {
      await storageService.delete("user");
      await storageService.delete("baseAuth");
      Get.offAllNamed(Routes.LOGIN);
    } else {
      Get.snackbar("Ошибка", "Не удается сменить пользователя",
          backgroundColor: Colors.red);
    }
  }
}
