import 'package:client/bloc/auth/auth_base.dart';
import 'package:client/data/entities/user/otp_send_data.dart';
import 'package:client/data/entities/user/sign_in_phone_data.dart';

final class PhoneAuthEventSignInWithOTPCode extends AuthEvent {
  PhoneAuthEventSignInWithOTPCode({required this.signInData});

  final SignInPhoneRequestData signInData;
}

final class PhoneAuthEventSendOTPCode extends AuthEvent {
  PhoneAuthEventSendOTPCode({required this.otpSendData});

  final OTPSendData otpSendData;
}

final class PhoneAuthStateOTPSent extends AuthState {}

final class PhoneAuthStateFailedSignIn extends AuthStateFailed {
  PhoneAuthStateFailedSignIn(super.failure);
}

final class PhoneAuthStateFailedOTPSend extends AuthStateFailed {
  PhoneAuthStateFailedOTPSend(super.failure);
}
