import 'package:client/bloc/bloc.dart';
import 'package:client/core/error/failure.dart';
import 'package:client/data/entities/country/country.dart';
import 'package:client/data/entities/country/country_list_request.dart';
import 'package:client/data/repositories/country_repository.dart';
import 'package:client/global.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';

import '../../../data/entities/country/country_list_response.dart';

late CountryListRequest countryLastRequest;

class CountryBloc extends Bloc<CountryEvent, CountryState> {
  final _countryRepository = CountryRepository();

  CountryBloc() : super(CountrysStateNotInitialized()) {
    on<CountryEvent>((event, emit) async {
      if (event is CountryEventGetList) {
        countryLastRequest = event.request;
        try {
          final countries =
              await _countryRepository.getList(request: event.request);
          if (countries != null) {
            emit(CountryStateCompleted(
              countries: countries,
            ));
          } else {
            emit(CountrysStateFailed(
                const ApplicationFailure('couldn\'t get countries')));
          }
        } on Failure catch (e) {
          emit(CountrysStateFailed(e));
        } on Exception catch (e) {
          emit(CountrysStateFailed(ApplicationFailure(e.toString())));
        }
      }

      if (event is CountryEventNew) {
        try {
          final id = await _countryRepository.create(title: event.title);
          if (id != null) {
            globalMessageBloc.add(GlobalMessageEventShow(
              title: 'success'.i18n(),
              message: 'New country created'.i18n(),
              retryAction: () {},
              severity: InfoBarSeverity.success,
            ));
            await getList(_countryRepository, countryTableBloc, countryLastRequest);

            emit(CountryStateCompletedNew(countryId: id));
          } else {
            globalMessageBloc.add(GlobalMessageEventShow(
              title: 'error'.i18n(),
              message: 'Couldn\'t create new country'.i18n(),
              retryAction: () {},
              severity: InfoBarSeverity.error,
            ));
            emit(CountrysStateFailed(
                const ApplicationFailure('couldn\'t create country')));
          }
        } on Failure catch (e) {
          emit(CountrysStateFailed(e));
        } on Exception catch (e) {
          emit(CountrysStateFailed(ApplicationFailure(e.toString())));
        }
      }

      if (event is CountryEventUpdate) {
        try {
          final result =
              await _countryRepository.update(country: event.country);
          if (result) {
            globalMessageBloc.add(GlobalMessageEventShow(
              title: 'success'.i18n(),
              message: 'Country data upadated'.i18n(),
              retryAction: () {},
              severity: InfoBarSeverity.success,
            ));
            await getList(_countryRepository, countryTableBloc, countryLastRequest);
          } else {
            emit(CountrysStateFailed(
                const ApplicationFailure('couldn\'t update country data')));
          }
        } on Failure catch (e) {
          emit(CountrysStateFailed(e));
        } on Exception catch (e) {
          emit(CountrysStateFailed(ApplicationFailure(e.toString())));
        }
      }

      if (event is CountryEventGetById) {
        emit(CountrysStateLoading());
        try {
          final country = await _countryRepository.getById(id: event.id);
          if (country != null) {
            emit(CountryStateCompletedById(
              country: country,
            ));
          } else {
            emit(CountrysStateFailed(
                const ApplicationFailure('couldn\'t get countries')));
          }
        } on Failure catch (e) {
          emit(CountrysStateFailed(e));
        } on Exception catch (e) {
          emit(CountrysStateFailed(ApplicationFailure(e.toString())));
        }
      }
    }, transformer: concurrent());
  }

  Future<void> getList(CountryRepository countryRepository, Bloc bloc,
      CountryListRequest lastRequest) async {
    try {
      final countries = await countryRepository.getList(
        request: lastRequest,
      );
      if (countries != null) {
        bloc.emit(CountryStateCompleted(
          countries: countries,
        ));
      } else {
        bloc.emit(CountrysStateFailed(
            const ApplicationFailure('couldn\'t get countries')));
      }
    } on Failure catch (e) {
      bloc.emit(CountrysStateFailed(e));
    }
  }
}

final class CountryEventGetById extends CountryEvent {
  CountryEventGetById({
    required this.id,
  });

  final int id;
}

class CountryEventNew extends CountryEvent {
  CountryEventNew({
    required this.title,
  });

  final String title;
}

class CountryEventUpdate extends CountryEvent {
  CountryEventUpdate({
    required this.country,
  });

  final Country country;
}

class CountryEventGetList extends CountryEvent {
  CountryEventGetList({
    required this.request,
  });

  final CountryListRequest request;
}

class CountrysStateNotInitialized extends CountryState {}

class CountrysStateLoading extends CountryState {}

class CountrysStateFailed extends CountryState {
  Exception exception;

  CountrysStateFailed(this.exception);
}

class CountryStateCompletedById extends CountryState {
  final Country country;

  CountryStateCompletedById({required this.country});
}

class CountryStateCompletedNew extends CountryState {
  final int countryId;

  CountryStateCompletedNew({required this.countryId});
}

class CountryStateCompleted extends CountryState {
  CountryListResponse countries;

  CountryStateCompleted({required this.countries});
}

class CountryEvent {}

class CountryState {}
