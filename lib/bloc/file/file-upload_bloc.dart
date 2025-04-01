
import 'dart:async';
import 'dart:typed_data';

import 'package:client/bloc/bloc.dart';
import 'package:client/core/error/failure.dart';
import 'package:client/data/repositories/file_upload_repository.dart';
import 'package:client/global.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';

class FileUploadBloc extends Bloc<FileUploadEvent, FileUploadState> {
  final _fileRepository = FileRepository();

  FileUploadBloc() : super(FileUploadsStateNotInitialized()) {
    on<FileUploadEvent>((event, emit) async {
      if (event is FileUploadEventDo) {
        emit(FileUploadsStateIsUploading());
        bool result = false;
        try {
          if (event.rawByteData != null) {
            result = await _fileRepository.uploadBytes(
              id: event.id,
              rawByteData: event.rawByteData!,
              type: event.type,
              progressStreamController: event.progressStreamController,
            );
          }
          if (event.filePath != null) {
            result = await _fileRepository.uploadFile(
              id: event.id,
              filePath: event.filePath!,
              type: event.type,
              progressStreamController: event.progressStreamController,
            );
          }
          if (result) {
            globalMessageBloc.add(GlobalMessageEventShow(
              title: 'success'.i18n(),
              message: 'FileUpload has upadated'.i18n(),
              retryAction: () {},
              severity: InfoBarSeverity.success,
            ));
            emit(FileUploadStateCompleted(event.id));
          }
        } on Failure {
          emit(FileUploadsStateFailed());
        } on Exception {
          emit(FileUploadsStateFailed());
        }
      }
    }, transformer: sequential());
  }
}

class FileUploadEventDo extends FileUploadEvent {
  FileUploadEventDo({
    required this.id,
    required this.progressStreamController,
    this.filePath,
    this.rawByteData,
    required this.type,
  });

  final int id;
  final String? filePath;
  final Uint8List? rawByteData;
  final String type;
  final StreamController<double> progressStreamController;
}

class FileUploadEventGet extends FileUploadEvent {
  FileUploadEventGet({
    required this.progressStreamController,
    required this.filePath,
    required this.type,
  });

  final String filePath;
  final String type;
  final StreamController<double> progressStreamController;
}

class FileUploadsStateNotInitialized extends FileUploadState {}

class FileUploadsStateIsUploading extends FileUploadState {}

class FileUploadsStateFailed extends FileUploadState {}

class FileUploadStateCompleted extends FileUploadState {
  FileUploadStateCompleted(this.id);

  final int id;
}

class FileUploadEvent {}

class FileUploadState {}
