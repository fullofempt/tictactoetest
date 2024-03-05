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
  UserData get user => throw _privateConstructorUsedError;

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
  $Res call({String private_key, UserData user});

  $UserDataCopyWith<$Res> get user;
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
    Object? user = null,
  }) {
    return _then(_value.copyWith(
      private_key: null == private_key
          ? _value.private_key
          : private_key // ignore: cast_nullable_to_non_nullable
              as String,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserData,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserDataCopyWith<$Res> get user {
    return $UserDataCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value) as $Val);
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
  $Res call({String private_key, UserData user});

  @override
  $UserDataCopyWith<$Res> get user;
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
    Object? user = null,
  }) {
    return _then(_$ApiModelImpl(
      private_key: null == private_key
          ? _value.private_key
          : private_key // ignore: cast_nullable_to_non_nullable
              as String,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserData,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ApiModelImpl implements _ApiModel {
  _$ApiModelImpl({this.private_key = '', required this.user});

  factory _$ApiModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ApiModelImplFromJson(json);

  @override
  @JsonKey()
  final String private_key;
  @override
  final UserData user;

  @override
  String toString() {
    return 'ApiModel(private_key: $private_key, user: $user)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ApiModelImpl &&
            (identical(other.private_key, private_key) ||
                other.private_key == private_key) &&
            (identical(other.user, user) || other.user == user));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, private_key, user);

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
  factory _ApiModel({final String private_key, required final UserData user}) =
      _$ApiModelImpl;

  factory _ApiModel.fromJson(Map<String, dynamic> json) =
      _$ApiModelImpl.fromJson;

  @override
  String get private_key;
  @override
  UserData get user;
  @override
  @JsonKey(ignore: true)
  _$$ApiModelImplCopyWith<_$ApiModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

UserData _$UserDataFromJson(Map<String, dynamic> json) {
  return _UserData.fromJson(json);
}

/// @nodoc
mixin _$UserData {
  String? get in_session => throw _privateConstructorUsedError;
  String get username => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserDataCopyWith<UserData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserDataCopyWith<$Res> {
  factory $UserDataCopyWith(UserData value, $Res Function(UserData) then) =
      _$UserDataCopyWithImpl<$Res, UserData>;
  @useResult
  $Res call({String? in_session, String username});
}

/// @nodoc
class _$UserDataCopyWithImpl<$Res, $Val extends UserData>
    implements $UserDataCopyWith<$Res> {
  _$UserDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? in_session = freezed,
    Object? username = null,
  }) {
    return _then(_value.copyWith(
      in_session: freezed == in_session
          ? _value.in_session
          : in_session // ignore: cast_nullable_to_non_nullable
              as String?,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserDataImplCopyWith<$Res>
    implements $UserDataCopyWith<$Res> {
  factory _$$UserDataImplCopyWith(
          _$UserDataImpl value, $Res Function(_$UserDataImpl) then) =
      __$$UserDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? in_session, String username});
}

/// @nodoc
class __$$UserDataImplCopyWithImpl<$Res>
    extends _$UserDataCopyWithImpl<$Res, _$UserDataImpl>
    implements _$$UserDataImplCopyWith<$Res> {
  __$$UserDataImplCopyWithImpl(
      _$UserDataImpl _value, $Res Function(_$UserDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? in_session = freezed,
    Object? username = null,
  }) {
    return _then(_$UserDataImpl(
      in_session: freezed == in_session
          ? _value.in_session
          : in_session // ignore: cast_nullable_to_non_nullable
              as String?,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserDataImpl implements _UserData {
  _$UserDataImpl({this.in_session = null, this.username = ''});

  factory _$UserDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserDataImplFromJson(json);

  @override
  @JsonKey()
  final String? in_session;
  @override
  @JsonKey()
  final String username;

  @override
  String toString() {
    return 'UserData(in_session: $in_session, username: $username)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserDataImpl &&
            (identical(other.in_session, in_session) ||
                other.in_session == in_session) &&
            (identical(other.username, username) ||
                other.username == username));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, in_session, username);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserDataImplCopyWith<_$UserDataImpl> get copyWith =>
      __$$UserDataImplCopyWithImpl<_$UserDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserDataImplToJson(
      this,
    );
  }
}

abstract class _UserData implements UserData {
  factory _UserData({final String? in_session, final String username}) =
      _$UserDataImpl;

  factory _UserData.fromJson(Map<String, dynamic> json) =
      _$UserDataImpl.fromJson;

  @override
  String? get in_session;
  @override
  String get username;
  @override
  @JsonKey(ignore: true)
  _$$UserDataImplCopyWith<_$UserDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
