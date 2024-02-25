import 'package:flutter_mvvm_architecture/data/response/status.dart';

class ApiResponse {
  Status? status;
  Object? data;
  String? message;

  ApiResponse(this.status, this.data, this.message);

  ApiResponse.loading() : status = Status.loading;

  ApiResponse.completed() : status = Status.loading;

  ApiResponse.error() : status = Status.error;

  @override
  String toString() {
    return 'Status: $status \n Message: $message \n Data: $data';
  }
}
