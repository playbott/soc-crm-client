import 'package:client/data/entities/user/sign_in_password_data.dart';

import '../datasources/remote/auth/auth_remote.dart';

import '../entities/user/auth_data.dart';
import '../entities/user/otp_send_data.dart';
import '../entities/user/sign_in_phone_data.dart';

class AuthRepository {
  final AuthRemote _authRemoteDS;

  AuthRepository._(this._authRemoteDS);

  factory AuthRepository({AuthRemote? authRemoteDS}) =>
      AuthRepository._(authRemoteDS ?? AuthRemote());

  Future<OTPSendDataResponse?> sendOTPCode({required OTPSendData data}) async {
    final result = await _authRemoteDS.sendOTPCode(otpSendData: data);

    if (result != null) {
      return result;
    }

    return null;
  }

  Future<UserAuthorizedData?> confirmPhoneNumber(
      {required SignInPhoneRequestData data}) async {
    final result = await _authRemoteDS.confirmPhoneNumber(signInData: data);

    if (result != null) {
      return result;
    }

    return null;
  }

  Future<UserAuthorizedData?> signInWithPassword(
      {required SignInPasswordRequestData data}) async {
    final result = await _authRemoteDS.signInWithPassword(signInData: data);

    if (result != null) {
      return result.data;
    }

    return null;
  }

  Future<bool> logOut() async {
    return await _authRemoteDS.logOut();
  }
}
