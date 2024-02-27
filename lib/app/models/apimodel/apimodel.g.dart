// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'apimodel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ApiModelImpl _$$ApiModelImplFromJson(Map<String, dynamic> json) =>
    _$ApiModelImpl(
      private_key: json['private_key'] as String,
      User: UserData.fromJson(json['User'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ApiModelImplToJson(_$ApiModelImpl instance) =>
    <String, dynamic>{
      'private_key': instance.private_key,
      'User': instance.User,
    };
