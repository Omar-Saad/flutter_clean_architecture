import 'package:dio/dio.dart';
import 'package:flutter_clean_architecture/data/network/failure.dart';

class ErrorHandler implements Exception {
  late Failure failure;

  ErrorHandler.handle(dynamic error) {
    if (error is DioError) {
      // return failure associated with dio error
      failure = _handleError(error);
    } else {
      // default error
      failure = DataSource.UNKNOWN_ERROR.getFailure();
    }
  }

  Failure _handleError(DioError error) {
    switch (error.type) {
      case DioErrorType.connectTimeout:
        return DataSource.CONNECTION_TIMEOUT.getFailure();
      case DioErrorType.sendTimeout:
        return DataSource.SEND_TIMEOUT.getFailure();
      case DioErrorType.receiveTimeout:
        return DataSource.RECEIVE_TIMEOUT.getFailure();
      case DioErrorType.response:
        if (error.response != null &&
            error.response?.statusCode != null &&
            error.response?.statusMessage != null) {
          return Failure(error.response?.statusCode ?? 0,
              error.response?.statusMessage ?? "");
        } else {
          return DataSource.UNKNOWN_ERROR.getFailure();
        }

      case DioErrorType.cancel:
        return DataSource.CANCELLED.getFailure();
      case DioErrorType.other:
        return DataSource.UNKNOWN_ERROR.getFailure();
    }
  }
}

enum DataSource {
  SUCCESS,
  NOT_FOUND,
  NO_CONTENT,
  BAD_REQUEST,
  UNAUTHORIZED,
  FORBIDDEN,
  INTERNAL_SERVER_ERROR,
  CONNECTION_TIMEOUT,
  CANCELLED,
  RECEIVE_TIMEOUT,
  SEND_TIMEOUT,
  CACHE_ERROR,
  NO_INTERNET_CONNECTION,
  UNKNOWN_ERROR,
}

extension DataSourceExtension on DataSource {
  // return error based on enum value
  Failure getFailure() {
    switch (this) {
      case DataSource.SUCCESS:
        return Failure(ResponseCode.SUCCESS, ResponseMessage.SUCCESS);
      case DataSource.NOT_FOUND:
        return Failure(ResponseCode.NOT_FOUND, ResponseMessage.NOT_FOUND);
      case DataSource.NO_CONTENT:
        return Failure(ResponseCode.NO_CONTENT, ResponseMessage.NO_CONTENT);
      case DataSource.BAD_REQUEST:
        return Failure(ResponseCode.BAD_REQUEST, ResponseMessage.BAD_REQUEST);
      case DataSource.UNAUTHORIZED:
        return Failure(ResponseCode.UNAUTHORIZED, ResponseMessage.UNAUTHORIZED);
      case DataSource.FORBIDDEN:
        return Failure(ResponseCode.FORBIDDEN, ResponseMessage.FORBIDDEN);
      case DataSource.INTERNAL_SERVER_ERROR:
        return Failure(ResponseCode.INTERNAL_SERVER_ERROR,
            ResponseMessage.INTERNAL_SERVER_ERROR);
      case DataSource.CONNECTION_TIMEOUT:
        return Failure(ResponseCode.CONNECTION_TIMEOUT,
            ResponseMessage.CONNECTION_TIMEOUT);
      case DataSource.CANCELLED:
        return Failure(ResponseCode.CANCELLED, ResponseMessage.CANCELLED);
      case DataSource.RECEIVE_TIMEOUT:
        return Failure(
            ResponseCode.RECEIVE_TIMEOUT, ResponseMessage.RECEIVE_TIMEOUT);
      case DataSource.SEND_TIMEOUT:
        return Failure(ResponseCode.SEND_TIMEOUT, ResponseMessage.SEND_TIMEOUT);
      case DataSource.CACHE_ERROR:
        return Failure(ResponseCode.CACHE_ERROR, ResponseMessage.CACHE_ERROR);
      case DataSource.NO_INTERNET_CONNECTION:
        return Failure(ResponseCode.NO_INTERNET_CONNECTION,
            ResponseMessage.NO_INTERNET_CONNECTION);
      case DataSource.UNKNOWN_ERROR:
        return Failure(
            ResponseCode.UNKNOWN_ERROR, ResponseMessage.UNKNOWN_ERROR);
      default:
        return Failure(
            ResponseCode.UNKNOWN_ERROR, ResponseMessage.UNKNOWN_ERROR);
    }
  }
}

class ResponseCode {
  /// api response code
  static const int SUCCESS = 200; // OK
  static const int NOT_FOUND = 404; // Not Found
  static const int NO_CONTENT = 204; // No Content
  static const int BAD_REQUEST = 400; // Bad Request
  static const int UNAUTHORIZED = 401; // Unauthorized
  static const int FORBIDDEN = 403; // Forbidden
  static const int INTERNAL_SERVER_ERROR = 500; // Internal Server Error

  /// Local response code
  static const int CONNECTION_TIMEOUT = -1; // Connection Timeout
  static const int CANCELLED = -2; // Cancelled
  static const int RECEIVE_TIMEOUT = -3; // Receive Timeout
  static const int SEND_TIMEOUT = -4; // Send Timeout
  static const int CACHE_ERROR = -5; // Cache Error
  static const int NO_INTERNET_CONNECTION = -6; // No Internet Connection
  static const int UNKNOWN_ERROR = -7; // Unknown Error

}

class ResponseMessage {
  /// api response code
  static const String SUCCESS = "Success"; // OK
  static const String NOT_FOUND = "Not found, Please try again."; // Not Found
  static const String NO_CONTENT = "Success"; // No Content
  static const String BAD_REQUEST =
      "Bad request, Please try again."; // Bad Request
  static const String UNAUTHORIZED = "Unauthorized user."; // Unauthorized
  static const String FORBIDDEN = "Forbidden"; // Forbidden
  static const String INTERNAL_SERVER_ERROR =
      "Something went wrong, Please try again later."; // Internal Server Error

  /// Local response code
  static const String CONNECTION_TIMEOUT =
      "Connection timeout, Please try again later."; // Connection Timeout
  static const String CANCELLED =
      "Request cancelled, Please try again later."; // Cancelled
  static const String RECEIVE_TIMEOUT =
      "Receive timeout, Please try again later."; // Receive Timeout
  static const String SEND_TIMEOUT =
      "Send timeout, Please try again later."; // Send Timeout
  static const String CACHE_ERROR =
      "Cache error, Please try again later."; // Cache Error
  static const String NO_INTERNET_CONNECTION =
      "Please check your internet connection"; // No Internet Connection
  static const String UNKNOWN_ERROR =
      "Something went wrong, Please try again later."; // Unknown Error

}

class ApiInternalStatus {
  static const int SUCCESS = 1;
  static const int FAILURE = 0;
}
