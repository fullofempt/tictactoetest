import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/lobby_controller.dart';

class LobbyView extends GetView<LobbyController> {
  const LobbyView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LobbyView'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: controller.lobbynameController,
              decoration: InputDecoration(labelText: 'Создать: Введите название лобби'),
            ),
            SizedBox(
              height: 45,
            ),
            ElevatedButton(
                onPressed: () => controller.lobby(), child: Text('Войти')),
          ],
        ),
      ),
    );
  }
}
