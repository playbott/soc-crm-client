import 'package:client/data/entities/api/request.dart';
import 'package:client/data/entities/api/response.dart';
import 'package:client/data/entities/user/users_list_request.dart';
import 'package:client/data/entities/user/user.dart';

import '../datasources/remote/user/user_remote.dart';
import '../entities/user/user_update_request.dart';

class UserRepository {
  final UserRemote _userRemoteDS;

  UserRepository._(this._userRemoteDS);

  factory UserRepository({UserRemote? userRemoteDS}) =>
      UserRepository._(userRemoteDS ?? UserRemote());

  Future<ApiResponse<List<User>>?> get({
    required ApiRequest<UserRequest> request,
  }) async {
    final data = await _userRemoteDS.get(request: request);

    if (data != null) {
      return data;
    }

    return null;
  }

  Future<User?> getById({required int id}) async {
    return await _userRemoteDS.getById(id: id);
  }

  Future<bool> update({required UserUpdateRequest request}) async {
    return await _userRemoteDS.update(request: request);
  }
}
