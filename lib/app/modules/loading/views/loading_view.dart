import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tictactoetest/app/modules/loading/controllers/loading_controller.dart';

class LoadingView extends GetView<LoadingController> {
  const LoadingView({super.key});
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Center(
          child:  Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircularProgressIndicator(),
              SizedBox(
                height: 20,
              ),
              Text("Wait!")
            ],
          ),
        ));
  }
}