import 'package:client/data/entities/api/request.dart';
import 'package:client/data/entities/api/response.dart';
import 'package:client/data/entities/page_parameters.dart';
import 'package:client/data/entities/user/user.dart';
import 'package:client/data/entities/user/user_update_request.dart';
import 'package:client/global.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import '../../../core/error/failure.dart';
import '../../data/entities/user/users_list_request.dart';
import '../../data/repositories/user_repository.dart';
import '../bloc.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final _userRepository = UserRepository();

  UserBloc() : super(UsersStateNotInitialized()) {
    on<UserEvent>((event, emit) async {
      if (event is UserEventGet) {
        if (event.reloadUI) {
          emit(UsersStateLoading());
        }
        try {
          final data =
              event.filter.id == null
                  ? await _userRepository.get(
                    request: ApiRequest(filter: event.filter, page: event.page),
                  )
                  : await _userRepository.getById(id: event.filter.id!);
          if (data != null) {
            if (data is ApiResponse<List<User>>) {
              emit(
                UserStateCompleted(
                  users: data.data!,
                  page: data.page!,
                  reloadTable: event.reloadUI,
                ),
              );
            }

            if (data is User) {
              emit(
                UserStateCompleted(
                  users: [data],
                  page: Page(),
                  reloadTable: event.reloadUI,
                ),
              );
            }
          } else {
            emit(
              UsersStateFailed(const ApplicationFailure('couldn\'t get users')),
            );
          }
        } on Failure catch (e) {
          emit(UsersStateFailed(e));
        } on Exception catch (e) {
          emit(UsersStateFailed(ApplicationFailure(e.toString())));
        }
      }

      if (event is UserEventUpdate) {
        try {
          final result = await _userRepository.update(request: event.request);
          if (result) {
            if (event.actionAfterUpdateUser != null) {
              event.actionAfterUpdateUser!();
            }
            globalMessageBloc.add(
              GlobalMessageEventShow(
                title: 'success'.i18n(),
                message: 'User has upadated'.i18n(),
                retryAction: () {},
                severity: InfoBarSeverity.success,
              ),
            );
          } else {
            emit(
              UsersStateFailed(
                ApplicationFailure(
                  'couldn\'t update user ID:${event.request.id}',
                ),
              ),
            );
          }
        } on Failure catch (e) {
          emit(UsersStateFailed(e));
        } on Exception catch (e) {
          emit(UsersStateFailed(ApplicationFailure(e.toString())));
        }
      }
    }, transformer: sequential());
  }
}

class UserEventGet extends UserEvent {
  UserEventGet({
    required this.filter,
    required this.page,
    this.reloadUI = false,
  });

  final UserRequest filter;
  final Page page;
  bool reloadUI;
}

class UserEventUpdate extends UserEvent {
  UserEventUpdate({required this.request, this.actionAfterUpdateUser});

  final UserUpdateRequest request;
  final VoidCallback? actionAfterUpdateUser;
}

class UsersStateNotInitialized extends UserState {}

class UsersStateLoading extends UserState {}

class UsersStateFailed extends UserState {
  Exception exception;

  UsersStateFailed(this.exception);
}

class UserStateCompleted extends UserState {
  List<User> users;
  Page page;
  bool reloadTable;

  UserStateCompleted({
    required this.users,
    required this.page,
    this.reloadTable = false,
  });
}

class UserEvent {}

class UserState {}
