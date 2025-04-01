import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DataLoadingScreenBloc
    extends Bloc<DataLoadingScreenEvent, DataLoadingScreenState> {
  DataLoadingScreenBloc() : super(DataLoadingScreenStateLoading()) {
    on<DataLoadingScreenEvent>((event, emit) async {
      emit(DataLoadingScreenStateLoading());
      await Future.delayed(const Duration(seconds: 1), () {
        emit(DataLoadingScreenStateCompleted());
      });
    });
  }
}

final class DataLoadingScreenEventLoad extends DataLoadingScreenEvent {
  DataLoadingScreenEventLoad(this.locale);

  final Locale? locale;
}

final class DataLoadingScreenEvent {}

final class DataLoadingScreenStateLoading extends DataLoadingScreenState {}

final class DataLoadingScreenStateCompleted extends DataLoadingScreenState {}

final class DataLoadingScreenState {}
