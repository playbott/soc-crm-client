import 'package:client/data/entities/api/request.dart';
import 'package:client/data/entities/api/response.dart';
import 'package:client/data/entities/page_parameters.dart';
import 'package:client/data/entities/role/role.dart';
import 'package:client/data/entities/role/role_list_request.dart';
import 'package:client/data/entities/role/role_update_request.dart';
import 'package:client/data/repositories/role_repository.dart';
import 'package:client/global.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import '../../../core/error/failure.dart';
import '../bloc.dart';

class RoleBloc extends Bloc<RoleEvent, RoleState> {
  final _roleRepository = RoleRepository();

  RoleBloc() : super(RolesStateNotInitialized()) {
    on<RoleEvent>((event, emit) async {
      if (event is RoleEventGet) {
        if (event.reloadTable) {
          emit(RolesStateLoading());
        }
        try {
          final roles =
              event.filter?.id == null
                  ? await _roleRepository.get(
                    request: ApiRequest(filter: event.filter, page: event.page),
                  )
                  : await _roleRepository.getById(id: event.filter!.id!);
          if (roles != null) {
            if (roles is ApiResponse<List<Role>>) {
              emit(
                RoleStateCompleted(
                  roles: roles.data!,
                  page: roles.page!,
                  reloadTable: event.reloadTable,
                ),
              );
            }

            if (roles is Role) {
              emit(
                RoleStateCompleted(
                  roles: [roles],
                  page: Page(),
                  reloadTable: event.reloadTable,
                ),
              );
            }
          } else {
            emit(
              RolesStateFailed(const ApplicationFailure('couldn\'t get roles')),
            );
          }
        } on Failure catch (e) {
          emit(RolesStateFailed(e));
        } on Exception catch (e) {
          emit(RolesStateFailed(ApplicationFailure(e.toString())));
        }
      }

      if (event is RoleEventUpdate) {
        try {
          final result = await _roleRepository.update(request: event.request);
          if (result) {
            if (event.actionAfterUpdateRole != null) {
              event.actionAfterUpdateRole!();
            }
            globalMessageBloc.add(
              GlobalMessageEventShow(
                title: 'success'.i18n(),
                message: 'Role has upadated'.i18n(),
                retryAction: () {},
                severity: InfoBarSeverity.success,
              ),
            );
          } else {
            emit(
              RolesStateFailed(
                ApplicationFailure(
                  'couldn\'t update role ID:${event.request.id}',
                ),
              ),
            );
          }
        } on Failure catch (e) {
          emit(RolesStateFailed(e));
        } on Exception catch (e) {
          emit(RolesStateFailed(ApplicationFailure(e.toString())));
        }
      }
    }, transformer: sequential());
  }
}

class RoleEventGet extends RoleEvent {
  RoleEventGet({this.filter, this.page, this.reloadTable = false});

  final RoleRequest? filter;
  final Page? page;
  bool reloadTable;
}

class RoleEventUpdate extends RoleEvent {
  RoleEventUpdate({required this.request, this.actionAfterUpdateRole});

  final RoleUpdateRequest request;
  final VoidCallback? actionAfterUpdateRole;
}

class RolesStateNotInitialized extends RoleState {}

class RolesStateLoading extends RoleState {}

class RolesStateFailed extends RoleState {
  Exception exception;

  RolesStateFailed(this.exception);
}

class RoleStateCompleted extends RoleState {
  List<Role> roles;
  Page page;
  bool reloadTable;

  RoleStateCompleted({
    required this.roles,
    required this.page,
    this.reloadTable = false,
  });
}

class RoleEvent {}

class RoleState {}
