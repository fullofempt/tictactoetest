import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tictactoetest/app/core/constants.dart';

part 'connection.freezed.dart';
part 'connection.g.dart';

@freezed
class Connection with _$Connection {
  factory Connection([
    Map<String, dynamic>? board,
    @Default(GameState.NotStarted)
    @JsonKey(name: 'game_state')
    GameState gameState,
    String? guest_name,
    @Default([]) List<String> history,
    @Default("") String host_name,
    @Default("") String id,
    @Default("") String name,
    String? currentTurnPlayerId,
  ]) = _Connection;

  factory Connection.fromJson(Map<String, dynamic> json) =>
      _$ConnectionFromJson(json);
}
