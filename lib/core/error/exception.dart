class ServerException implements Exception {
  final String message = 'server error';

  @override
  String toString() {
    return message;
  }
}

class AuthException implements Exception {
  final String message = 'auth error';

  @override
  String toString() {
    return message;
  }
}

class RequestException implements Exception {
  final String message = 'request error';

  @override
  String toString() {
    return message;
  }
}

class ConnectionException implements Exception {
  String message = 'connection error';

  @override
  String toString() {
    return message;
  }
}

class ConnectionCanceled implements Exception {
  final String message = 'connection canceled';

  @override
  String toString() {
    return message;
  }
}

class SharedPrefsException implements Exception {
  final String message = 'shared preference error';

  @override
  String toString() {
    return message;
  }
}

class ApplicationException implements Exception {
  ApplicationException({required this.details}) : super();
  final String message = 'application error';
  final String details;

  @override
  String toString() {
    return message;
  }
}
