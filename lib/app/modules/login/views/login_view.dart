import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tictactoetest/app/routes/app_pages.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LoginView'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: controller.usernameController,
              decoration: InputDecoration(labelText: 'Никнейм'),
            ),
            SizedBox(
              height: 45,
            ),
            ElevatedButton(
                onPressed: () => controller.login(), child: Text('Войти')),
          ],
        ),
      ),
    );
  }
}