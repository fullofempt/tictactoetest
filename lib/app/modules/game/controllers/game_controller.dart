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
  Rx<PlayerResponse> currentPlayer = PlayerResponse(player: UserData()).obs;

  @override
  void onInit() async {
    updateLocalData();
    print(currentSession.value);
    super.onInit();
  }

  Future<void> updateLocalData() async {
    currentSession.value = await storageService.readSessionResponse('session');
    currentPlayer.value =
        (await storageService.readUserResponse('player')) as PlayerResponse;
  }

  void updateGameState() async {
  // currentSession.value = await networkServices.fetchGameSession(sessionId);
  // Обновите необходимые данные с сервера и обновите текущую сессию игры
}

  void onCellTapped(int index) {
    // Проверяем, что игра не завершена и ячейка пуста
    if (currentSession.value.gameState == GameState.Ongoing &&
        getCellValue(index) == "" &&
        isPlayerTurn()) {
      sendMoveRequest(index);
      updateLocalData();  
      // Отправляем запрос на сервер о сделанном ходе
    }
  }

  // Метод для получения значения для отображения в ячейке
  String getCellValue(int index) {
    // Получаем значение из текущего состояния игры
    return currentSession.value.board?[index] ?? "";
  }

  bool isPlayerTurn() {
    // Получаем ID текущего игрока
    String currentPlayerId = currentPlayer.value.player.username ?? "";
    // Получаем ID игрока, чей сейчас ход
    String currentTurnPlayerId = currentSession.value.currentTurnPlayerId ?? "";
  
    // Сравниваем ID текущего игрока с ID игрока, чей сейчас ход
    return currentPlayerId == currentTurnPlayerId;
  }

  void setCurrentTurnPlayerId() {
    // Получаем идентификатор текущего игрока, чей сейчас ход
    String currentTurnPlayerId = getNextPlayerId();
  
    // Обновляем модель Connection с установленным значением текущего игрока
    currentSession.value = currentSession.value.copyWith(
      currentTurnPlayerId: currentTurnPlayerId,
    );
  }

  String getNextPlayerId() {
  // Получаем идентификатор текущего игрока
  String currentPlayerId = currentPlayer.value.player.username ?? "";
  
  // Получаем список всех игроков
  List<String> allPlayerIds = [
    currentSession.value.host_name ?? '', 
    currentSession.value.guest_name ?? ''
  ];
  
  // Ищем индекс текущего игрока в списке всех игроков
  int currentIndex = allPlayerIds.indexOf(currentPlayerId);
  
  // Вычисляем индекс следующего игрока
  int nextIndex = (currentIndex + 1) % allPlayerIds.length;
  
  // Возвращаем идентификатор следующего игрока
  return allPlayerIds[nextIndex];
}
void sendMoveRequest(int index) {
    // Здесь вы можете написать код для отправки запроса на сервер о сделанном ходе
    // Например:
    // networkServices.sendMove(currentSession.value.id, currentPlayer.value.player.id, index);
  }
}
