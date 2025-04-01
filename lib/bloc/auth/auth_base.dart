import 'package:client/core/error/failure.dart';

class AuthEvent {}

class AuthEventGet extends AuthEvent {}

class AuthEventSignOut extends AuthEvent {
  AuthEventSignOut({this.delayDuration = Duration.zero, this.reload = false});

  final Duration delayDuration;
  final bool reload;
}

class AuthEventSignIn extends AuthEvent {}

class AuthEventEmitNotAuthorized extends AuthEvent {}

class AuthState {}

class AuthStateNotInitialized extends AuthState {}

class AuthStateWaiting extends AuthState {}

class AuthStateNotAuthorized extends AuthState {
  AuthStateNotAuthorized({this.reload = false});

  final bool reload;
}

class AuthStateAuthorized<T> extends AuthState {
  AuthStateAuthorized(this.data);

  final T? data;
}

class AuthStateFailed extends AuthState {
  AuthStateFailed(this.failure);

  final Failure failure;
}
