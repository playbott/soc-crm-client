import 'package:client/global.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';

import '../../bloc.dart';

GlobalMessageBloc globalMessageBloc = GlobalMessageBloc();

class GlobalMessageBloc extends Bloc<GlobalMessageEvent, GlobalMessageState> {
  GlobalMessageBloc() : super(GlobalMessageStateNoMessage()) {
    on<GlobalMessageEvent>(
      (event, emit) async {
        if (state is GlobalMessageEventShow) {
          if (event is GlobalMessageEventHide) {
            emit(GlobalMessageStateNoMessage());
          }
        } else {
          if (event is GlobalMessageEventShow) {
            emit(GlobalMessageStateMessage(
              title: event.title,
              message: event.message,
              retryAction: () {},
              severity: event.severity,
            ));
          }
        }
      },
      transformer: restartable(),
    );
  }
}

final class GlobalMessageEventHide extends GlobalMessageEvent {}

final class GlobalMessageEventShow extends GlobalMessageEvent {
  GlobalMessageEventShow({
    required this.title,
    required this.message,
    this.retryAction,
    required this.severity,
  });

  final String title;
  final String message;
  final VoidCallback? retryAction;
  final InfoBarSeverity severity;
}

final class GlobalMessageEvent {}

final class GlobalMessageStateNoMessage extends GlobalMessageState {}

final class GlobalMessageStateMessage extends GlobalMessageState {
  GlobalMessageStateMessage({
    required this.title,
    required this.message,
    required this.retryAction,
    required this.severity,
  });

  final String title;
  final String message;
  final VoidCallback retryAction;
  final InfoBarSeverity severity;
}

final class GlobalMessageState {}
