import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tictactoetest/app/modules/game/controllers/game_controller.dart';
import 'package:tictactoetest/app/modules/game/xofield/xofield_controller.dart';
import 'package:tictactoetest/app/modules/game/xofield/xofield_veiw.dart';

// var fields = [];

class GameView extends GetView<GameController> {
  const GameView({super.key});

  @override
  Widget build(BuildContext context) {
    var notEmpty = controller.fields.isNotEmpty;
    return Scaffold(
      appBar: AppBar(
        title: Obx(() => Text(
            "${controller.currentSession.value.host_name} Против ${controller.currentSession.value.guest_name}")),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          children: [
              Center(
                child: SizedBox(
                  height: Get.width * .8,
                  width: Get.width * .8,
                  child: GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 9,
                    itemBuilder: (BuildContext context, int index) {
                      return Obx(() => XOFieldView(
                            index,
                            controller.playerMove.value,
                            () => controller.changePlayerMove(),
                            controller.fields[index],
                          ));
                    },
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3),
                  ),
                ),
              ),
            const Flexible(child: Center()),
            ElevatedButton(
              onPressed: () {
                if (controller.currentSession.value.host_name ==
                    controller.currentUser.value.user.username) {
                  controller.leaveSession(1);
                } else {
                  controller.leaveSession(2);
                }
              },
              child: Text("Выйти"),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
