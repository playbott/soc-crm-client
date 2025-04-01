import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInFormTypeBloc
    extends Bloc<SignInFormTypeEvent, SignInFormTypeState> {
  SignInFormTypeBloc() : super(SignInFormTypeState(SignInFormType.password)) {
    on<SignInFormTypeEvent>(
      (event, emit) async {
        emit(SignInFormTypeState(event.type));
      },
      transformer: droppable(),
    );
  }
}

enum SignInFormType {
  password,
  phone,
}

final class SignInFormTypeEvent {
  const SignInFormTypeEvent(this.type);

  final SignInFormType type;
}

final class SignInFormTypeState {
  const SignInFormTypeState(this.type);

  final SignInFormType type;
}
