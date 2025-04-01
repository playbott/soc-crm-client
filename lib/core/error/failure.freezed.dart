// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'failure.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$FailureImpl {
  String get message => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) authFailure,
    required TResult Function(String message) applicationFailure,
    required TResult Function(String message) clientFailure,
    required TResult Function(String message) serverFailure,
    required TResult Function(String message) notFoundFailure,
    required TResult Function(String message) sharedPrefsFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? authFailure,
    TResult? Function(String message)? applicationFailure,
    TResult? Function(String message)? clientFailure,
    TResult? Function(String message)? serverFailure,
    TResult? Function(String message)? notFoundFailure,
    TResult? Function(String message)? sharedPrefsFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? authFailure,
    TResult Function(String message)? applicationFailure,
    TResult Function(String message)? clientFailure,
    TResult Function(String message)? serverFailure,
    TResult Function(String message)? notFoundFailure,
    TResult Function(String message)? sharedPrefsFailure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthFailure value) authFailure,
    required TResult Function(ApplicationFailure value) applicationFailure,
    required TResult Function(ClientFailure value) clientFailure,
    required TResult Function(ServerFailure value) serverFailure,
    required TResult Function(NotFoundFailure value) notFoundFailure,
    required TResult Function(SharedPrefsFailure value) sharedPrefsFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AuthFailure value)? authFailure,
    TResult? Function(ApplicationFailure value)? applicationFailure,
    TResult? Function(ClientFailure value)? clientFailure,
    TResult? Function(ServerFailure value)? serverFailure,
    TResult? Function(NotFoundFailure value)? notFoundFailure,
    TResult? Function(SharedPrefsFailure value)? sharedPrefsFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthFailure value)? authFailure,
    TResult Function(ApplicationFailure value)? applicationFailure,
    TResult Function(ClientFailure value)? clientFailure,
    TResult Function(ServerFailure value)? serverFailure,
    TResult Function(NotFoundFailure value)? notFoundFailure,
    TResult Function(SharedPrefsFailure value)? sharedPrefsFailure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FailureImplCopyWith<FailureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FailureImplCopyWith<$Res> {
  factory $FailureImplCopyWith(
          FailureImpl value, $Res Function(FailureImpl) then) =
      _$FailureImplCopyWithImpl<$Res, FailureImpl>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class _$FailureImplCopyWithImpl<$Res, $Val extends FailureImpl>
    implements $FailureImplCopyWith<$Res> {
  _$FailureImplCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_value.copyWith(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AuthFailureImplCopyWith<$Res>
    implements $FailureImplCopyWith<$Res> {
  factory _$$AuthFailureImplCopyWith(
          _$AuthFailureImpl value, $Res Function(_$AuthFailureImpl) then) =
      __$$AuthFailureImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$AuthFailureImplCopyWithImpl<$Res>
    extends _$FailureImplCopyWithImpl<$Res, _$AuthFailureImpl>
    implements _$$AuthFailureImplCopyWith<$Res> {
  __$$AuthFailureImplCopyWithImpl(
      _$AuthFailureImpl _value, $Res Function(_$AuthFailureImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$AuthFailureImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$AuthFailureImpl implements AuthFailure {
  const _$AuthFailureImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'FailureImpl.authFailure(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthFailureImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthFailureImplCopyWith<_$AuthFailureImpl> get copyWith =>
      __$$AuthFailureImplCopyWithImpl<_$AuthFailureImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) authFailure,
    required TResult Function(String message) applicationFailure,
    required TResult Function(String message) clientFailure,
    required TResult Function(String message) serverFailure,
    required TResult Function(String message) notFoundFailure,
    required TResult Function(String message) sharedPrefsFailure,
  }) {
    return authFailure(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? authFailure,
    TResult? Function(String message)? applicationFailure,
    TResult? Function(String message)? clientFailure,
    TResult? Function(String message)? serverFailure,
    TResult? Function(String message)? notFoundFailure,
    TResult? Function(String message)? sharedPrefsFailure,
  }) {
    return authFailure?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? authFailure,
    TResult Function(String message)? applicationFailure,
    TResult Function(String message)? clientFailure,
    TResult Function(String message)? serverFailure,
    TResult Function(String message)? notFoundFailure,
    TResult Function(String message)? sharedPrefsFailure,
    required TResult orElse(),
  }) {
    if (authFailure != null) {
      return authFailure(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthFailure value) authFailure,
    required TResult Function(ApplicationFailure value) applicationFailure,
    required TResult Function(ClientFailure value) clientFailure,
    required TResult Function(ServerFailure value) serverFailure,
    required TResult Function(NotFoundFailure value) notFoundFailure,
    required TResult Function(SharedPrefsFailure value) sharedPrefsFailure,
  }) {
    return authFailure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AuthFailure value)? authFailure,
    TResult? Function(ApplicationFailure value)? applicationFailure,
    TResult? Function(ClientFailure value)? clientFailure,
    TResult? Function(ServerFailure value)? serverFailure,
    TResult? Function(NotFoundFailure value)? notFoundFailure,
    TResult? Function(SharedPrefsFailure value)? sharedPrefsFailure,
  }) {
    return authFailure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthFailure value)? authFailure,
    TResult Function(ApplicationFailure value)? applicationFailure,
    TResult Function(ClientFailure value)? clientFailure,
    TResult Function(ServerFailure value)? serverFailure,
    TResult Function(NotFoundFailure value)? notFoundFailure,
    TResult Function(SharedPrefsFailure value)? sharedPrefsFailure,
    required TResult orElse(),
  }) {
    if (authFailure != null) {
      return authFailure(this);
    }
    return orElse();
  }
}

abstract class AuthFailure implements FailureImpl, Failure {
  const factory AuthFailure(final String message) = _$AuthFailureImpl;

  @override
  String get message;
  @override
  @JsonKey(ignore: true)
  _$$AuthFailureImplCopyWith<_$AuthFailureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ApplicationFailureImplCopyWith<$Res>
    implements $FailureImplCopyWith<$Res> {
  factory _$$ApplicationFailureImplCopyWith(_$ApplicationFailureImpl value,
          $Res Function(_$ApplicationFailureImpl) then) =
      __$$ApplicationFailureImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$ApplicationFailureImplCopyWithImpl<$Res>
    extends _$FailureImplCopyWithImpl<$Res, _$ApplicationFailureImpl>
    implements _$$ApplicationFailureImplCopyWith<$Res> {
  __$$ApplicationFailureImplCopyWithImpl(_$ApplicationFailureImpl _value,
      $Res Function(_$ApplicationFailureImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$ApplicationFailureImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ApplicationFailureImpl implements ApplicationFailure {
  const _$ApplicationFailureImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'FailureImpl.applicationFailure(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ApplicationFailureImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ApplicationFailureImplCopyWith<_$ApplicationFailureImpl> get copyWith =>
      __$$ApplicationFailureImplCopyWithImpl<_$ApplicationFailureImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) authFailure,
    required TResult Function(String message) applicationFailure,
    required TResult Function(String message) clientFailure,
    required TResult Function(String message) serverFailure,
    required TResult Function(String message) notFoundFailure,
    required TResult Function(String message) sharedPrefsFailure,
  }) {
    return applicationFailure(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? authFailure,
    TResult? Function(String message)? applicationFailure,
    TResult? Function(String message)? clientFailure,
    TResult? Function(String message)? serverFailure,
    TResult? Function(String message)? notFoundFailure,
    TResult? Function(String message)? sharedPrefsFailure,
  }) {
    return applicationFailure?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? authFailure,
    TResult Function(String message)? applicationFailure,
    TResult Function(String message)? clientFailure,
    TResult Function(String message)? serverFailure,
    TResult Function(String message)? notFoundFailure,
    TResult Function(String message)? sharedPrefsFailure,
    required TResult orElse(),
  }) {
    if (applicationFailure != null) {
      return applicationFailure(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthFailure value) authFailure,
    required TResult Function(ApplicationFailure value) applicationFailure,
    required TResult Function(ClientFailure value) clientFailure,
    required TResult Function(ServerFailure value) serverFailure,
    required TResult Function(NotFoundFailure value) notFoundFailure,
    required TResult Function(SharedPrefsFailure value) sharedPrefsFailure,
  }) {
    return applicationFailure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AuthFailure value)? authFailure,
    TResult? Function(ApplicationFailure value)? applicationFailure,
    TResult? Function(ClientFailure value)? clientFailure,
    TResult? Function(ServerFailure value)? serverFailure,
    TResult? Function(NotFoundFailure value)? notFoundFailure,
    TResult? Function(SharedPrefsFailure value)? sharedPrefsFailure,
  }) {
    return applicationFailure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthFailure value)? authFailure,
    TResult Function(ApplicationFailure value)? applicationFailure,
    TResult Function(ClientFailure value)? clientFailure,
    TResult Function(ServerFailure value)? serverFailure,
    TResult Function(NotFoundFailure value)? notFoundFailure,
    TResult Function(SharedPrefsFailure value)? sharedPrefsFailure,
    required TResult orElse(),
  }) {
    if (applicationFailure != null) {
      return applicationFailure(this);
    }
    return orElse();
  }
}

abstract class ApplicationFailure implements FailureImpl, Failure {
  const factory ApplicationFailure(final String message) =
      _$ApplicationFailureImpl;

  @override
  String get message;
  @override
  @JsonKey(ignore: true)
  _$$ApplicationFailureImplCopyWith<_$ApplicationFailureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ClientFailureImplCopyWith<$Res>
    implements $FailureImplCopyWith<$Res> {
  factory _$$ClientFailureImplCopyWith(
          _$ClientFailureImpl value, $Res Function(_$ClientFailureImpl) then) =
      __$$ClientFailureImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$ClientFailureImplCopyWithImpl<$Res>
    extends _$FailureImplCopyWithImpl<$Res, _$ClientFailureImpl>
    implements _$$ClientFailureImplCopyWith<$Res> {
  __$$ClientFailureImplCopyWithImpl(
      _$ClientFailureImpl _value, $Res Function(_$ClientFailureImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$ClientFailureImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ClientFailureImpl implements ClientFailure {
  const _$ClientFailureImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'FailureImpl.clientFailure(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ClientFailureImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ClientFailureImplCopyWith<_$ClientFailureImpl> get copyWith =>
      __$$ClientFailureImplCopyWithImpl<_$ClientFailureImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) authFailure,
    required TResult Function(String message) applicationFailure,
    required TResult Function(String message) clientFailure,
    required TResult Function(String message) serverFailure,
    required TResult Function(String message) notFoundFailure,
    required TResult Function(String message) sharedPrefsFailure,
  }) {
    return clientFailure(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? authFailure,
    TResult? Function(String message)? applicationFailure,
    TResult? Function(String message)? clientFailure,
    TResult? Function(String message)? serverFailure,
    TResult? Function(String message)? notFoundFailure,
    TResult? Function(String message)? sharedPrefsFailure,
  }) {
    return clientFailure?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? authFailure,
    TResult Function(String message)? applicationFailure,
    TResult Function(String message)? clientFailure,
    TResult Function(String message)? serverFailure,
    TResult Function(String message)? notFoundFailure,
    TResult Function(String message)? sharedPrefsFailure,
    required TResult orElse(),
  }) {
    if (clientFailure != null) {
      return clientFailure(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthFailure value) authFailure,
    required TResult Function(ApplicationFailure value) applicationFailure,
    required TResult Function(ClientFailure value) clientFailure,
    required TResult Function(ServerFailure value) serverFailure,
    required TResult Function(NotFoundFailure value) notFoundFailure,
    required TResult Function(SharedPrefsFailure value) sharedPrefsFailure,
  }) {
    return clientFailure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AuthFailure value)? authFailure,
    TResult? Function(ApplicationFailure value)? applicationFailure,
    TResult? Function(ClientFailure value)? clientFailure,
    TResult? Function(ServerFailure value)? serverFailure,
    TResult? Function(NotFoundFailure value)? notFoundFailure,
    TResult? Function(SharedPrefsFailure value)? sharedPrefsFailure,
  }) {
    return clientFailure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthFailure value)? authFailure,
    TResult Function(ApplicationFailure value)? applicationFailure,
    TResult Function(ClientFailure value)? clientFailure,
    TResult Function(ServerFailure value)? serverFailure,
    TResult Function(NotFoundFailure value)? notFoundFailure,
    TResult Function(SharedPrefsFailure value)? sharedPrefsFailure,
    required TResult orElse(),
  }) {
    if (clientFailure != null) {
      return clientFailure(this);
    }
    return orElse();
  }
}

abstract class ClientFailure implements FailureImpl, Failure {
  const factory ClientFailure(final String message) = _$ClientFailureImpl;

  @override
  String get message;
  @override
  @JsonKey(ignore: true)
  _$$ClientFailureImplCopyWith<_$ClientFailureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ServerFailureImplCopyWith<$Res>
    implements $FailureImplCopyWith<$Res> {
  factory _$$ServerFailureImplCopyWith(
          _$ServerFailureImpl value, $Res Function(_$ServerFailureImpl) then) =
      __$$ServerFailureImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$ServerFailureImplCopyWithImpl<$Res>
    extends _$FailureImplCopyWithImpl<$Res, _$ServerFailureImpl>
    implements _$$ServerFailureImplCopyWith<$Res> {
  __$$ServerFailureImplCopyWithImpl(
      _$ServerFailureImpl _value, $Res Function(_$ServerFailureImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$ServerFailureImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ServerFailureImpl implements ServerFailure {
  const _$ServerFailureImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'FailureImpl.serverFailure(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ServerFailureImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ServerFailureImplCopyWith<_$ServerFailureImpl> get copyWith =>
      __$$ServerFailureImplCopyWithImpl<_$ServerFailureImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) authFailure,
    required TResult Function(String message) applicationFailure,
    required TResult Function(String message) clientFailure,
    required TResult Function(String message) serverFailure,
    required TResult Function(String message) notFoundFailure,
    required TResult Function(String message) sharedPrefsFailure,
  }) {
    return serverFailure(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? authFailure,
    TResult? Function(String message)? applicationFailure,
    TResult? Function(String message)? clientFailure,
    TResult? Function(String message)? serverFailure,
    TResult? Function(String message)? notFoundFailure,
    TResult? Function(String message)? sharedPrefsFailure,
  }) {
    return serverFailure?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? authFailure,
    TResult Function(String message)? applicationFailure,
    TResult Function(String message)? clientFailure,
    TResult Function(String message)? serverFailure,
    TResult Function(String message)? notFoundFailure,
    TResult Function(String message)? sharedPrefsFailure,
    required TResult orElse(),
  }) {
    if (serverFailure != null) {
      return serverFailure(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthFailure value) authFailure,
    required TResult Function(ApplicationFailure value) applicationFailure,
    required TResult Function(ClientFailure value) clientFailure,
    required TResult Function(ServerFailure value) serverFailure,
    required TResult Function(NotFoundFailure value) notFoundFailure,
    required TResult Function(SharedPrefsFailure value) sharedPrefsFailure,
  }) {
    return serverFailure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AuthFailure value)? authFailure,
    TResult? Function(ApplicationFailure value)? applicationFailure,
    TResult? Function(ClientFailure value)? clientFailure,
    TResult? Function(ServerFailure value)? serverFailure,
    TResult? Function(NotFoundFailure value)? notFoundFailure,
    TResult? Function(SharedPrefsFailure value)? sharedPrefsFailure,
  }) {
    return serverFailure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthFailure value)? authFailure,
    TResult Function(ApplicationFailure value)? applicationFailure,
    TResult Function(ClientFailure value)? clientFailure,
    TResult Function(ServerFailure value)? serverFailure,
    TResult Function(NotFoundFailure value)? notFoundFailure,
    TResult Function(SharedPrefsFailure value)? sharedPrefsFailure,
    required TResult orElse(),
  }) {
    if (serverFailure != null) {
      return serverFailure(this);
    }
    return orElse();
  }
}

abstract class ServerFailure implements FailureImpl, Failure {
  const factory ServerFailure(final String message) = _$ServerFailureImpl;

  @override
  String get message;
  @override
  @JsonKey(ignore: true)
  _$$ServerFailureImplCopyWith<_$ServerFailureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$NotFoundFailureImplCopyWith<$Res>
    implements $FailureImplCopyWith<$Res> {
  factory _$$NotFoundFailureImplCopyWith(_$NotFoundFailureImpl value,
          $Res Function(_$NotFoundFailureImpl) then) =
      __$$NotFoundFailureImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$NotFoundFailureImplCopyWithImpl<$Res>
    extends _$FailureImplCopyWithImpl<$Res, _$NotFoundFailureImpl>
    implements _$$NotFoundFailureImplCopyWith<$Res> {
  __$$NotFoundFailureImplCopyWithImpl(
      _$NotFoundFailureImpl _value, $Res Function(_$NotFoundFailureImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$NotFoundFailureImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$NotFoundFailureImpl implements NotFoundFailure {
  const _$NotFoundFailureImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'FailureImpl.notFoundFailure(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NotFoundFailureImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NotFoundFailureImplCopyWith<_$NotFoundFailureImpl> get copyWith =>
      __$$NotFoundFailureImplCopyWithImpl<_$NotFoundFailureImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) authFailure,
    required TResult Function(String message) applicationFailure,
    required TResult Function(String message) clientFailure,
    required TResult Function(String message) serverFailure,
    required TResult Function(String message) notFoundFailure,
    required TResult Function(String message) sharedPrefsFailure,
  }) {
    return notFoundFailure(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? authFailure,
    TResult? Function(String message)? applicationFailure,
    TResult? Function(String message)? clientFailure,
    TResult? Function(String message)? serverFailure,
    TResult? Function(String message)? notFoundFailure,
    TResult? Function(String message)? sharedPrefsFailure,
  }) {
    return notFoundFailure?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? authFailure,
    TResult Function(String message)? applicationFailure,
    TResult Function(String message)? clientFailure,
    TResult Function(String message)? serverFailure,
    TResult Function(String message)? notFoundFailure,
    TResult Function(String message)? sharedPrefsFailure,
    required TResult orElse(),
  }) {
    if (notFoundFailure != null) {
      return notFoundFailure(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthFailure value) authFailure,
    required TResult Function(ApplicationFailure value) applicationFailure,
    required TResult Function(ClientFailure value) clientFailure,
    required TResult Function(ServerFailure value) serverFailure,
    required TResult Function(NotFoundFailure value) notFoundFailure,
    required TResult Function(SharedPrefsFailure value) sharedPrefsFailure,
  }) {
    return notFoundFailure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AuthFailure value)? authFailure,
    TResult? Function(ApplicationFailure value)? applicationFailure,
    TResult? Function(ClientFailure value)? clientFailure,
    TResult? Function(ServerFailure value)? serverFailure,
    TResult? Function(NotFoundFailure value)? notFoundFailure,
    TResult? Function(SharedPrefsFailure value)? sharedPrefsFailure,
  }) {
    return notFoundFailure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthFailure value)? authFailure,
    TResult Function(ApplicationFailure value)? applicationFailure,
    TResult Function(ClientFailure value)? clientFailure,
    TResult Function(ServerFailure value)? serverFailure,
    TResult Function(NotFoundFailure value)? notFoundFailure,
    TResult Function(SharedPrefsFailure value)? sharedPrefsFailure,
    required TResult orElse(),
  }) {
    if (notFoundFailure != null) {
      return notFoundFailure(this);
    }
    return orElse();
  }
}

abstract class NotFoundFailure implements FailureImpl, Failure {
  const factory NotFoundFailure(final String message) = _$NotFoundFailureImpl;

  @override
  String get message;
  @override
  @JsonKey(ignore: true)
  _$$NotFoundFailureImplCopyWith<_$NotFoundFailureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SharedPrefsFailureImplCopyWith<$Res>
    implements $FailureImplCopyWith<$Res> {
  factory _$$SharedPrefsFailureImplCopyWith(_$SharedPrefsFailureImpl value,
          $Res Function(_$SharedPrefsFailureImpl) then) =
      __$$SharedPrefsFailureImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$SharedPrefsFailureImplCopyWithImpl<$Res>
    extends _$FailureImplCopyWithImpl<$Res, _$SharedPrefsFailureImpl>
    implements _$$SharedPrefsFailureImplCopyWith<$Res> {
  __$$SharedPrefsFailureImplCopyWithImpl(_$SharedPrefsFailureImpl _value,
      $Res Function(_$SharedPrefsFailureImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$SharedPrefsFailureImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SharedPrefsFailureImpl implements SharedPrefsFailure {
  const _$SharedPrefsFailureImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'FailureImpl.sharedPrefsFailure(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SharedPrefsFailureImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SharedPrefsFailureImplCopyWith<_$SharedPrefsFailureImpl> get copyWith =>
      __$$SharedPrefsFailureImplCopyWithImpl<_$SharedPrefsFailureImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) authFailure,
    required TResult Function(String message) applicationFailure,
    required TResult Function(String message) clientFailure,
    required TResult Function(String message) serverFailure,
    required TResult Function(String message) notFoundFailure,
    required TResult Function(String message) sharedPrefsFailure,
  }) {
    return sharedPrefsFailure(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? authFailure,
    TResult? Function(String message)? applicationFailure,
    TResult? Function(String message)? clientFailure,
    TResult? Function(String message)? serverFailure,
    TResult? Function(String message)? notFoundFailure,
    TResult? Function(String message)? sharedPrefsFailure,
  }) {
    return sharedPrefsFailure?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? authFailure,
    TResult Function(String message)? applicationFailure,
    TResult Function(String message)? clientFailure,
    TResult Function(String message)? serverFailure,
    TResult Function(String message)? notFoundFailure,
    TResult Function(String message)? sharedPrefsFailure,
    required TResult orElse(),
  }) {
    if (sharedPrefsFailure != null) {
      return sharedPrefsFailure(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthFailure value) authFailure,
    required TResult Function(ApplicationFailure value) applicationFailure,
    required TResult Function(ClientFailure value) clientFailure,
    required TResult Function(ServerFailure value) serverFailure,
    required TResult Function(NotFoundFailure value) notFoundFailure,
    required TResult Function(SharedPrefsFailure value) sharedPrefsFailure,
  }) {
    return sharedPrefsFailure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AuthFailure value)? authFailure,
    TResult? Function(ApplicationFailure value)? applicationFailure,
    TResult? Function(ClientFailure value)? clientFailure,
    TResult? Function(ServerFailure value)? serverFailure,
    TResult? Function(NotFoundFailure value)? notFoundFailure,
    TResult? Function(SharedPrefsFailure value)? sharedPrefsFailure,
  }) {
    return sharedPrefsFailure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthFailure value)? authFailure,
    TResult Function(ApplicationFailure value)? applicationFailure,
    TResult Function(ClientFailure value)? clientFailure,
    TResult Function(ServerFailure value)? serverFailure,
    TResult Function(NotFoundFailure value)? notFoundFailure,
    TResult Function(SharedPrefsFailure value)? sharedPrefsFailure,
    required TResult orElse(),
  }) {
    if (sharedPrefsFailure != null) {
      return sharedPrefsFailure(this);
    }
    return orElse();
  }
}

abstract class SharedPrefsFailure implements FailureImpl, Failure {
  const factory SharedPrefsFailure(final String message) =
      _$SharedPrefsFailureImpl;

  @override
  String get message;
  @override
  @JsonKey(ignore: true)
  _$$SharedPrefsFailureImplCopyWith<_$SharedPrefsFailureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
