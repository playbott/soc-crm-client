import 'package:client/data/entities/country/country.dart';

import '/data/entities/country/country_list_request.dart';
import '/data/entities/country/country_list_response.dart';

import '../datasources/remote/country/country.dart';

class CountryRepository {
  final CountryRemote _countryRemoteDS;

  CountryRepository._(this._countryRemoteDS);

  factory CountryRepository({CountryRemote? countryRemoteDS}) =>
      CountryRepository._(countryRemoteDS ?? CountryRemote());

  Future<Country?> getById({required int id}) async {
    return await _countryRemoteDS.getById(id: id);
  }

  Future<CountryListResponse?> getList(
      {required CountryListRequest request}) async {
    return await _countryRemoteDS.getList(
      request: request,
    );
  }

  Future<bool> update({required Country country}) async {
    return await _countryRemoteDS.update(
      country: country,
    );
  }

  Future<int?> create({required String title}) async {
    return await _countryRemoteDS.create(
      title: title,
    );
  }
}
