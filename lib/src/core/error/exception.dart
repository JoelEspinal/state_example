import 'failure.dart';

class ServerException implements Exception {}

class NoInternetErrorException implements Exception {}

class TimeOutException implements Exception {}

class UnknownNetworkException implements Exception {}

class NotDataException implements Exception {}

class BadResponseException implements Exception {}

class WtfException implements Exception {}

extension MapperToFailureException on Exception {
  Failure toFailure() => Failure.exceptionToFailure(this);
}
