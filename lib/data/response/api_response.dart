import 'package:flutter_mvvm_architecture/data/response/status.dart';

class ApiResponse<T> {
  Status? status;
  Object? data;
  String? message;

  ApiResponse(this.status, this.data, this.message);

  ApiResponse.loading() : status = Status.loading;

  ApiResponse.completed(this.data) : status = Status.loading;

  ApiResponse.error(this.message) : status = Status.error;

  @override
  String toString() {
    return 'Status: $status \n Message: $message \n Data: $data';
  }
}
