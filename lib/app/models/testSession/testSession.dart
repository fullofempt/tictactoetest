import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tictactoetest/app/core/constants.dart';
import 'package:tictactoetest/app/models/connection/connection.dart';

part 'testSession.freezed.dart';
part 'testSession.g.dart';

@freezed
class TestSession with _$TestSession {

  factory TestSession({
    @Default(GameState.NotStarted) GameState gameState,
    String? guest_name,
    required String host_name,
    @Default("") String id,
    @Default("") String name,
  }) = _TestSession;

  factory TestSession.fromJson(Map<String, dynamic> json) => _$TestSessionFromJson(json);

  static void assignAll(List<Connection> list) {}
}