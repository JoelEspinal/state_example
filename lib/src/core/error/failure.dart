import 'dart:io';

import 'exception.dart';

abstract class Failure {
  final String? title;
  final String? message;

  final String? _originalException;
  Failure({this.title, this.message, String? exception})
      : _originalException = exception;

  String? get exceptionInfo => _originalException;

  factory Failure.exceptionToFailure(exception) {
    switch (exception.runtimeType) {
      case SocketException:
        return ServerFailure(exception: exception.toString());
      case NoInternetErrorException:
        return NoInternetFailure(exception: exception.toString());
      case ServerException:
        return ServerFailure(exception: exception.toString());
      case TimeOutException:
        return ServerTimeOutFailure(exception: exception.toString());
      case UnknownNetworkException:
        return WtfFailure(exception: exception.toString());

      case NotDataException:
      default:
        return WtfFailure(exception: exception.toString());
    }
  }
}

class ServerFailure extends Failure {
  ServerFailure({super.title, super.message, super.exception});
}

class CacheFailure extends Failure {
  CacheFailure({super.title, super.message, super.exception});
}

class NotConnectionFailure extends Failure {
  NotConnectionFailure({super.title, super.message, super.exception});
}

class NoInternetFailure extends Failure {
  NoInternetFailure({super.title, super.message, super.exception});
}

class WtfFailure extends Failure {
  WtfFailure({super.title, super.message, super.exception});
}

class ServerTimeOutFailure extends Failure {
  ServerTimeOutFailure({super.title, super.message, super.exception});
}

class SendTimeOutFailure extends Failure {
  SendTimeOutFailure({super.title, super.message, super.exception});
}
