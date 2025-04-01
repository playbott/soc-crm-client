import 'package:client/data/entities/api/request.dart';
import 'package:client/data/entities/api/response.dart';
import 'package:client/data/datasources/remote/role/role.dart';
import 'package:client/data/entities/role/role.dart';
import 'package:client/data/entities/role/role_list_request.dart';
import 'package:client/data/entities/role/role_update_request.dart';

class RoleRepository {
  final RoleRemote _roleRemoteDS;

  RoleRepository._(this._roleRemoteDS);

  factory RoleRepository({RoleRemote? roleRemoteDS}) =>
      RoleRepository._(roleRemoteDS ?? RoleRemote());

  Future<Role?> getById({required int id}) async {
    return await _roleRemoteDS.getById(id: id);
  }

  Future<ApiResponse<List<Role>>?> get({
    required ApiRequest<RoleRequest> request,
  }) async {
    final data = await _roleRemoteDS.get(request: request);

    if (data != null) {
      return data;
    }

    return null;
  }

  Future<bool> update({required RoleUpdateRequest request}) async {
    return await _roleRemoteDS.update(request: request);
  }

  Future<int?> create({required String title}) async {
    return await _roleRemoteDS.create(
      title: title,
    );
  }
}
