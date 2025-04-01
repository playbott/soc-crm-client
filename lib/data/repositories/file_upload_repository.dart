import 'dart:async';
import 'dart:typed_data';

import 'package:flutter/foundation.dart';

import '../datasources/remote/file/file_remote.dart';

class FileRepository {
  final FileRemote _fileRemoteDS;

  FileRepository._(this._fileRemoteDS);

  factory FileRepository({FileRemote? fileRemoteDS}) =>
      FileRepository._(fileRemoteDS ?? FileRemote());

  Future<bool> uploadFile({
    required String filePath,
    required String type,
    required int id,
    StreamController<double>? progressStreamController,
  }) async {
    return await _fileRemoteDS.uploadFile(
        filePath: filePath, type: type, id: id);
  }

  Future<bool> uploadBytes({
    required Uint8List rawByteData,
    required String type,
    required int id,
    StreamController<double>? progressStreamController,
  }) async {
    return await _fileRemoteDS.uploadBytes(
        bytes: rawByteData,
        type: type,
        id: id,
        progressStreamController: progressStreamController);
  }

  Future<Uint8List?> download(
      {required String filePath, required String type}) async {
    return await _fileRemoteDS.downloadFile(filePath: filePath, type: type);
  }
}
