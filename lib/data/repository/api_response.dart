import 'server_error.dart';

class ApiResponse<T> {
  T? successData;
  ServerError? errorData;
  bool error;
  String? errorMessage;

  ApiResponse({required this.error, this.errorData, this.errorMessage, this.successData});
}