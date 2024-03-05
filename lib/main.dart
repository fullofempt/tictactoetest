import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tictactoetest/app/routes/app_pages.dart';
import 'package:tictactoetest/app/services/network_services.dart';
import 'package:tictactoetest/app/services/storage_service.dart';

void main() async {
  initServices();
  runApp(
    GetMaterialApp(
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}

Future<void> initServices() async {
  await Get.putAsync(() async => StorageService());
  await Get.putAsync(() async => NetworkServices());
}
