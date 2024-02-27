import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';
import 'package:tictactoetest/app/routes/app_pages.dart';

class Home extends GetView<HomeController> {
  const Home({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeView'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Добро Пожаловать в Крестики Нолики"),
            Container(
              child: ElevatedButton(
                onPressed: () => Get.toNamed(Routes.LOGIN),
                child: Text('Логин'),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              child: ElevatedButton(
                  onPressed: () => Get.toNamed(Routes.LOBBY),
                  child: Text('Лобби')),
            ),
          ],
        ),
      ),
    );
  }
}
