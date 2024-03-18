class AppException implements Exception {
  final String? _message, _prefix;

  AppException([this._message, this._prefix]);

  @override
  String toString() {
    if (_message == null) {
      return '$_prefix';
    } else {
      return '$_prefix $_message';
    }
  }
}

class FetchDataException extends AppException {
  FetchDataException([String? message])
      : super(message, 'Error During Communication');
}

class BadRequestException extends AppException {
  BadRequestException([String? message]) : super(message, 'Invalid Request');
}

class UnauthorizedException extends AppException {
  UnauthorizedException([String? message])
      : super(message, 'Unauthorized Request');
}

class InvalidInputException extends AppException {
  InvalidInputException([String? message]) : super(message, 'Invalid Input');
}

class NoInternetException extends AppException {
  NoInternetException([String? message])
      : super(message, 'No Internet Connection');
}
