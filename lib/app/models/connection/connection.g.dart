// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'connection.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ConnectionImpl _$$ConnectionImplFromJson(Map<String, dynamic> json) =>
    _$ConnectionImpl(
      json['board'] as Map<String, dynamic>?,
      $enumDecodeNullable(_$GameStateEnumMap, json['game_state']) ??
          GameState.NotStarted,
      json['guest_name'] as String?,
      (json['history'] as List<dynamic>?)?.map((e) => e as String).toList() ??
          const [],
      json['host_name'] as String? ?? "",
      json['id'] as String? ?? "",
      json['name'] as String? ?? "",
      json['currentTurnPlayerId'] as String?,
    );

Map<String, dynamic> _$$ConnectionImplToJson(_$ConnectionImpl instance) =>
    <String, dynamic>{
      'board': instance.board,
      'game_state': _$GameStateEnumMap[instance.gameState]!,
      'guest_name': instance.guest_name,
      'history': instance.history,
      'host_name': instance.host_name,
      'id': instance.id,
      'name': instance.name,
      'currentTurnPlayerId': instance.currentTurnPlayerId,
    };

const _$GameStateEnumMap = {
  GameState.NotStarted: 'NotStarted',
  GameState.Ongoing: 'Ongoing',
  GameState.XWon: 'XWon',
  GameState.OWon: 'OWon',
  GameState.Draw: 'Draw',
};
