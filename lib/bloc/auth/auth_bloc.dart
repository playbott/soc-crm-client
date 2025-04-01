import 'package:client/bloc/app/global_msg_bloc/global_msg_bloc.dart';
import 'package:client/bloc/auth/auth_bloc_password.dart';
import 'package:client/bloc/auth/auth_bloc_phone.dart';
import 'package:client/core/consts.dart';
import 'package:client/core/error/failure.dart';
import 'package:client/data/repositories/auth_repository.dart';
import 'package:client/global.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'auth_base.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {

  AuthBloc() : super(AuthStateNotInitialized()) {
    final authRepository = AuthRepository();
    on<AuthEvent>(
      (event, emit) async {
        if (event is PasswordAuthEventSignIn) {
          emit(AuthStateWaiting());
          try {
            final data =
                await authRepository.signInWithPassword(data: event.signInData);
            if (data == null) {
              throw const ApplicationFailure('couldn\'t get send phone number');
            }

            Prefs.setString(accessTokenKey, data.accessToken);
            Prefs.setString(refreshTokenKey, data.refreshToken);

            emit(AuthStateAuthorized(data));
          } on Failure catch (e) {
            emit(AuthStateFailed(e));
          }
        }

        if (event is AuthEventGet) {
          final accessToken = Prefs.getString(accessTokenKey) ?? '';
          if (accessToken.isNotEmpty) {
            emit(AuthStateAuthorized(null));
          } else {
            emit(AuthStateNotAuthorized());
          }
        }

        if (event is PhoneAuthEventSignInWithOTPCode) {
          emit(AuthStateWaiting());
          try {
            final data =
                await authRepository.confirmPhoneNumber(data: event.signInData);
            if (data == null) {
              throw const ApplicationFailure('couldn\'t sign in with otp code');
            }
            await Prefs.setString(accessTokenKey, data.accessToken);
            await Prefs.setString(refreshTokenKey, data.refreshToken);
            emit(AuthStateAuthorized(data));
          } on Failure catch (e) {
            if (e is AuthFailure) {
              await Prefs.remove(accessTokenKey);
              emit(AuthStateNotAuthorized());
            }
            globalMessageBloc.add(GlobalMessageEventShow(
              title: 'error'.i18n(),
              message: 'requestError'.i18n(),
              retryAction: () {
                add(event);
              },
              severity: InfoBarSeverity.error,
            ));
            emit(PhoneAuthStateFailedSignIn(e));
          } on Exception {
            globalMessageBloc.add(GlobalMessageEventShow(
              title: 'error'.i18n(),
              message: 'requestError'.i18n(),
              retryAction: () {
                add(event);
              },
              severity: InfoBarSeverity.error,
            ));
            emit(PhoneAuthStateFailedSignIn(const ClientFailure('')));
          }
        }

        if (event is PhoneAuthEventSendOTPCode) {
          emit(AuthStateWaiting());
          try {
            final data =
                await authRepository.sendOTPCode(data: event.otpSendData);
            if (data == null) {
              throw const ApplicationFailure('couldn\'t get send phone number');
            }
            await Prefs.setString(phoneNumberKey, data.phoneNumber);
            emit(PhoneAuthStateOTPSent());
          } on Failure catch (e) {
            emit(PhoneAuthStateFailedOTPSend(e));
          }
        }

        if (event is AuthEventEmitNotAuthorized) {
          emit(AuthStateNotAuthorized());
        }

        if (event is AuthEventSignOut) {
          emit(AuthStateWaiting());
          if (await Prefs.remove(accessTokenKey)) {
            await Prefs.remove(phoneNumberKey);
            await Prefs.remove(userIdKey);
            emit(AuthStateNotAuthorized(reload: event.reload));
          } else {
            throw const ApplicationFailure('log out error');
          }
        }
      },
      transformer: droppable(),
    );
  }
  static Future<void> clearAuth() async {
    await Prefs.setString(accessTokenKey, '');
    await Prefs.remove(accessTokenKey);
  }
}
