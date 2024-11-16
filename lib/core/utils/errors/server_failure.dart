import 'package:dio/dio.dart';
import 'package:payment_app/core/utils/errors/failure.dart';

class ServerFailure extends Failure {
  ServerFailure({required super.errMess});

  factory ServerFailure.dioException(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure(errMess: "connection Timeout ");
      case DioExceptionType.sendTimeout:
        return ServerFailure(errMess: "connection Timeout ");
      case DioExceptionType.receiveTimeout:
        return ServerFailure(errMess: "connection Timeout ");
      case DioExceptionType.badCertificate:
        return ServerFailure(errMess: "connection Timeout ");
      case DioExceptionType.badResponse:
        return ServerFailure.badResponse(e.response!);
      case DioExceptionType.cancel:
        return ServerFailure(errMess: "connection Timeout ");
      case DioExceptionType.connectionError:
        return ServerFailure(errMess: "connection Timeout ");
      case DioExceptionType.unknown:
        return ServerFailure(errMess: "connection Timeout ");
    }
  }

  factory ServerFailure.badResponse(Response response) {
    if (response.statusCode == 404) {
      return ServerFailure(errMess: "Page not found");
    } else if (response.statusCode == 500) {
      return ServerFailure(errMess: "problem with server");
    } else if (response.statusCode == 401 ||
        response.statusCode == 400 ||
        response.statusCode == 403) {
      return ServerFailure(errMess: "bad Authentication");
    } else {
      return ServerFailure(errMess: "Something went wrong, try later");
    }
  }
}
