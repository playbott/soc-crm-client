import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RouterBloc extends Bloc<RouterEvent, RouterState> {
  RouterBloc() : super(RouterState(route: '/main')) {
    on<RouterEvent>((event, emit) async {
      print('RouterBloc.event.route: ${event.route}');
      emit(RouterState(route: event.route));
    }, transformer: restartable());
  }
}

class RouterEvent {
  RouterEvent(this.route);

  final String route;
}

final class RouterState {
  RouterState({required this.route});

  final String route;
}
