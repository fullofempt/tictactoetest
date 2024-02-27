// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'apimodel.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ApiModel _$ApiModelFromJson(Map<String, dynamic> json) {
  return _ApiModel.fromJson(json);
}

/// @nodoc
mixin _$ApiModel {
  String get private_key => throw _privateConstructorUsedError;
  UserData get User => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ApiModelCopyWith<ApiModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ApiModelCopyWith<$Res> {
  factory $ApiModelCopyWith(ApiModel value, $Res Function(ApiModel) then) =
      _$ApiModelCopyWithImpl<$Res, ApiModel>;
  @useResult
  $Res call({String private_key, UserData User});

  $UserDataCopyWith<$Res> get User;
}

/// @nodoc
class _$ApiModelCopyWithImpl<$Res, $Val extends ApiModel>
    implements $ApiModelCopyWith<$Res> {
  _$ApiModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? private_key = null,
    Object? User = null,
  }) {
    return _then(_value.copyWith(
      private_key: null == private_key
          ? _value.private_key
          : private_key // ignore: cast_nullable_to_non_nullable
              as String,
      User: null == User
          ? _value.User
          : User // ignore: cast_nullable_to_non_nullable
              as UserData,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserDataCopyWith<$Res> get User {
    return $UserDataCopyWith<$Res>(_value.User, (value) {
      return _then(_value.copyWith(User: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ApiModelImplCopyWith<$Res>
    implements $ApiModelCopyWith<$Res> {
  factory _$$ApiModelImplCopyWith(
          _$ApiModelImpl value, $Res Function(_$ApiModelImpl) then) =
      __$$ApiModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String private_key, UserData User});

  @override
  $UserDataCopyWith<$Res> get User;
}

/// @nodoc
class __$$ApiModelImplCopyWithImpl<$Res>
    extends _$ApiModelCopyWithImpl<$Res, _$ApiModelImpl>
    implements _$$ApiModelImplCopyWith<$Res> {
  __$$ApiModelImplCopyWithImpl(
      _$ApiModelImpl _value, $Res Function(_$ApiModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? private_key = null,
    Object? User = null,
  }) {
    return _then(_$ApiModelImpl(
      private_key: null == private_key
          ? _value.private_key
          : private_key // ignore: cast_nullable_to_non_nullable
              as String,
      User: null == User
          ? _value.User
          : User // ignore: cast_nullable_to_non_nullable
              as UserData,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ApiModelImpl implements _ApiModel {
  _$ApiModelImpl({required this.private_key, required this.User});

  factory _$ApiModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ApiModelImplFromJson(json);

  @override
  final String private_key;
  @override
  final UserData User;

  @override
  String toString() {
    return 'ApiModel(private_key: $private_key, User: $User)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ApiModelImpl &&
            (identical(other.private_key, private_key) ||
                other.private_key == private_key) &&
            (identical(other.User, User) || other.User == User));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, private_key, User);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ApiModelImplCopyWith<_$ApiModelImpl> get copyWith =>
      __$$ApiModelImplCopyWithImpl<_$ApiModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ApiModelImplToJson(
      this,
    );
  }
}

abstract class _ApiModel implements ApiModel {
  factory _ApiModel(
      {required final String private_key,
      required final UserData User}) = _$ApiModelImpl;

  factory _ApiModel.fromJson(Map<String, dynamic> json) =
      _$ApiModelImpl.fromJson;

  @override
  String get private_key;
  @override
  UserData get User;
  @override
  @JsonKey(ignore: true)
  _$$ApiModelImplCopyWith<_$ApiModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
