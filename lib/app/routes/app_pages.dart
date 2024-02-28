import 'package:get/get.dart' show GetPage;

import '../modules/game/bindings/game_binding.dart';
import '../modules/game/bindings/game_binding.dart';
import '../modules/game/views/game_view.dart';
import '../modules/game/views/game_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/lobby/bindings/lobby_binding.dart';
import '../modules/lobby/views/lobby_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.LOGIN;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => Home(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.LOBBY,
      page: () => const LobbyView(),
      binding: LobbyBinding(),
    ),
    GetPage(
      name: _Paths.GAME,
      page: () => const GameView(),
      binding: GameBinding(),
      children: [
        GetPage(
          name: _Paths.GAME,
          page: () => const GameView(),
          binding: GameBinding(),
        ),
      ],
    ),
  ];
}
