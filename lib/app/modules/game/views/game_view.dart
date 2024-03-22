import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tictactoetest/styles/styles.dart';
import 'package:tictactoetest/app/modules/game/controllers/game_controller.dart';

void main() {
  runApp(const GameView());
}

class GameView extends StatelessWidget {
  const GameView({Key? key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: GameViewPage(title: 'achelo'),
    );
  }
}

class GameViewPage extends StatefulWidget {
  const GameViewPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<GameViewPage> createState() => _GameViewPageState();
}

class _GameViewPageState extends State<GameViewPage> {
  bool isTurn = true;
  int oScore = 0;
  int xScore = 0;
  int count = 0;

  List<String> changeXO = List.filled(9, '');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(25.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          'Игрок Х',
                          style: txtStyle,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          xScore.toString(),
                          style: txtStyle,
                        ),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          'Игрок О',
                          style: txtStyle,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          oScore.toString(),
                          style: txtStyle,
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: GridView.builder(
              itemCount: changeXO.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3),
              itemBuilder: (BuildContext ctx, int index) {
                return GestureDetector(
                  onTap: () => _setXorO(index),
                  child: Container(
                    decoration: BoxDecoration(
                        border:
                            Border.all(color: Color.fromARGB(255, 20, 1, 88))),
                    child: Center(
                      child: Text(
                        changeXO[index],
                        style: xoStyle,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          SizedBox(
            child: TextButton(
              onPressed: () => Get.back(),
              child: Text('Выйти'),
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                Get.find<GameController>()
                    .updateGameState(); // Вызываем метод обновления состояния игры из контроллера
              },
              child: Text('Обновить состояние игры'),
            ),
          ),
        ],
      ),
    );
  }

  void _setXorO(int i) {
    if (isTurn && changeXO[i] == '') {
      setState(() {
        changeXO[i] = '⭕';
        isTurn = !isTurn;
      });
    } else if (!isTurn && changeXO[i] == '') {
      setState(() {
        changeXO[i] = '✖️';
        isTurn = !isTurn;
      });
    }

    count++;
    _checkWinner();
  }

  void _checkWinner() {
    if (changeXO[0] == changeXO[1] &&
        changeXO[0] == changeXO[2] &&
        changeXO[0] != '') {
      _showDialog(winner: changeXO[0]);
    }
    if (changeXO[3] == changeXO[4] &&
        changeXO[3] == changeXO[5] &&
        changeXO[3] != '') {
      _showDialog(winner: changeXO[3]);
    }
    if (changeXO[6] == changeXO[7] &&
        changeXO[6] == changeXO[8] &&
        changeXO[6] != '') {
      _showDialog(winner: changeXO[6]);
    }
    if (changeXO[0] == changeXO[3] &&
        changeXO[0] == changeXO[6] &&
        changeXO[0] != '') {
      _showDialog(winner: changeXO[0]);
    }
    if (changeXO[1] == changeXO[4] &&
        changeXO[1] == changeXO[7] &&
        changeXO[1] != '') {
      _showDialog(winner: changeXO[1]);
    }
    if (changeXO[2] == changeXO[5] &&
        changeXO[2] == changeXO[8] &&
        changeXO[2] != '') {
      _showDialog(winner: changeXO[2]);
    }
    if (changeXO[0] == changeXO[4] &&
        changeXO[0] == changeXO[8] &&
        changeXO[0] != '') {
      _showDialog(winner: changeXO[0]);
    }
    if (changeXO[2] == changeXO[4] &&
        changeXO[2] == changeXO[6] &&
        changeXO[2] != '') {
      _showDialog(winner: changeXO[2]);
    }

    if (count == 9) {
      _showDialog(winnerExist: false);
      _clearBoard();
    }
  }

  void _showDialog({String winner = '', bool winnerExist = true}) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(winnerExist ? 'Победитель: $winner' : 'Ничья'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                _clearBoard();
              },
              child: const Text('Играть ещё раз!'),
            ),
          ],
        );
      },
    );

    if (winner == '⭕') {
      setState(() {
        oScore++;
      });
    } else if (winner == '✖️') {
      setState(() {
        xScore++;
      });
    }
  }

  void _clearBoard() {
    setState(() {
      for (int i = 0; i < 9; i++) {
        changeXO[i] = '';
      }
      count = 0;
    });
  }
}
