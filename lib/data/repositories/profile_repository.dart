import '../datasources/remote/auth/auth_remote.dart';

class ProfileRepository {
  final AuthRemote _authRemoteDS;

  ProfileRepository._(this._authRemoteDS);

  factory ProfileRepository({AuthRemote? authRemoteDS}) =>
      ProfileRepository._(authRemoteDS ?? AuthRemote());
}
