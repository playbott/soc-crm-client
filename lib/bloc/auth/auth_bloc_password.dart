import 'package:client/data/entities/user/sign_in_password_data.dart';
import 'auth_base.dart';

final class PasswordAuthEventSignIn extends AuthEventSignIn {
  PasswordAuthEventSignIn({required this.signInData});

  final SignInPasswordRequestData signInData;
}

final class PasswordAuthStateFailedSignIn extends AuthStateFailed {
  PasswordAuthStateFailedSignIn(super.failure);
}
