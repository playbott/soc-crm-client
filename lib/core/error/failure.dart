import 'package:client/bloc/auth/auth_base.dart';
import 'package:client/bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'failure.freezed.dart';

class Failure implements Exception {
  static Failure handle(Response response) {
    switch (response.statusCode) {
      case 404:
        return const ServerFailure('url not found');
      case 403:
        return const AuthFailure('auth failure');
      case 500:
        return const ServerFailure('server failure');
      case 502:
        return const ServerFailure('server failure');
      case 503:
        return const ServerFailure('proxy error');
    }

    return const ApplicationFailure('application error');
  }


  static Failure throwException(Response<dynamic> response) {
    String responseMsg = 'bad response';

    switch (response.statusCode) {
      case 100:
        authBloc.add(AuthEventGet());
        throw const ApplicationFailure('ApplicationFailure');
      case 404:
        throw const ServerFailure("url not found");
      case 403:
        throw const AuthFailure('AuthFailure');
      case 402:
        throw const AuthFailure('AuthFailure');
      case 401:
        AuthBloc.clearAuth();
        authBloc.add(AuthEventSignOut(reload: true));
        throw const AuthFailure('AuthFailure');
      case 400:
        throw const AuthFailure('AuthFailure');
      case 500:
        throw const ServerFailure('ServerFailure');
      case 502:
        throw const ServerFailure('ServerFailure');
      case 503:
        responseMsg = "proxy error";
        throw ServerFailure(responseMsg);
    }

    throw ApplicationFailure(
        "application error.\nDetails: ${response.data != null ? response.data['status'] : ''}");
  }

  String get message {
    return 'couldn\'t get data';
  }

  @override
  String toString() {
    return message;
  }
}

@freezed
class FailureImpl with _$FailureImpl {
  @Implements<Failure>()
  const factory FailureImpl.authFailure(String message) = AuthFailure;

  @Implements<Failure>()
  const factory FailureImpl.applicationFailure(String message) =
      ApplicationFailure;

  @Implements<Failure>()
  const factory FailureImpl.clientFailure(String message) = ClientFailure;

  @Implements<Failure>()
  const factory FailureImpl.serverFailure(String message) = ServerFailure;

  @Implements<Failure>()
  const factory FailureImpl.notFoundFailure(String message) = NotFoundFailure;

  @Implements<Failure>()
  const factory FailureImpl.sharedPrefsFailure(String message) =
      SharedPrefsFailure;
}
