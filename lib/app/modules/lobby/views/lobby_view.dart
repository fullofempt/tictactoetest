// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tictactoetest/app/modules/lobby/controllers/lobby_controller.dart';
import '../controllers/lobby_controller.dart';

class LobbyView extends GetView<LobbyController> {
  LobbyView({super.key});

  final LobbyController lobbyController = Get.put(LobbyController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Obx(
                () => ListView.builder(
                  shrinkWrap: true,
                  physics: ClampingScrollPhysics(),
                  itemCount: lobbyController.testSession.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.symmetric(vertical: 2),
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(169, 169, 169, 1),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: ListTile(
                        title: Text(
                          "Игра № ${index + 1}: ${lobbyController.testSession[index].name}",
                          style: TextStyle(
                            color: Color.fromARGB(255, 0, 0, 0),
                          ),
                        ),
                        subtitle: Text(
                          "Создатель: ${lobbyController.testSession[index].host_name}",
                          style: TextStyle(
                            color: Color.fromARGB(255, 15, 15, 15),
                          ),
                        ),
                        onTap: () async {
                          await lobbyController.getSessionById(
                              lobbyController.testSession[index].id);
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text("О сессии"),
                                actions: [
                                  Center(
                                    child: Column(
                                      children: [
                                        Obx(() {
                                          if (lobbyController.currentSession
                                                  .value.host_name ==
                                              lobbyController.currentUser.value
                                                  .user.username) {
                                            return ElevatedButton(
                                              onPressed: () {
                                                if (lobbyController
                                                        .currentSession
                                                        .value
                                                        .guest_name !=
                                                    null) {
                                                  lobbyController.startSession(
                                                      lobbyController
                                                          .currentSession
                                                          .value
                                                          .id);
                                                } else {
                                                  Get.snackbar(
                                                      "Ошибка", "Нет второго");
                                                }
                                              },
                                              child: Text("Играть"),
                                            );
                                          } else {
                                            return ElevatedButton(
                                              onPressed: () {
                                                if (lobbyController
                                                            .currentSession
                                                            .value
                                                            .guest_name ==
                                                        null ||
                                                    lobbyController
                                                            .currentSession
                                                            .value
                                                            .guest_name ==
                                                        lobbyController
                                                            .currentUser
                                                            .value
                                                            .user
                                                            .username) {
                                                  lobbyController.joinSession(
                                                      lobbyController
                                                          .currentSession
                                                          .value
                                                          .id);
                                                } else {
                                                  Get.snackbar(
                                                      "Ошибка", "Лобби занято");
                                                }
                                              },
                                              child: Text("Подключиться"),
                                            );
                                          }
                                        }),
                                      ],
                                    ),
                                  ),
                                ],
                              );
                            },
                          );
                        },
                      ),
                    );
                  },
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 50),
              child: ElevatedButton(
                
                onPressed: () async {
                  await showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text("Создать сессию"),
                        content: TextFormField(
                          controller: lobbyController.sessionnameController,
                          decoration:
                              InputDecoration(labelText: "Название сессии"),
                        ),
                        actions: [
                          ElevatedButton(
                            onPressed: () {
                              Get.back();
                            },
                            child: Text("Отмена"),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              lobbyController.createSession(
                                  lobbyController.sessionnameController.text);
                            },
                            child: Text("Создать"),
                          ),
                        ],
                      );
                    },
                  );
                },
                child: Text("Создать сессию"),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Obx(() => Text(
                          "${lobbyController.currentUser.value.user.username}",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        )),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
