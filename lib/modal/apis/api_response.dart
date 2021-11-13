import 'package:heaven_riders_india/modal/utils/app_state.dart';

class ApiResponse {
  String message;
  dynamic data;
  Status status;

  ApiResponse.initial({this.message = 'App Starting...'})
      : status = Status.initial;

  ApiResponse.loading({this.message = 'Loading....'}) : status = Status.loading;

  ApiResponse.completed({this.message = 'Task Done...', this.data = ''})
      : status = Status.completed;

  ApiResponse.error({this.message = 'App Error... '}) : status = Status.error;

  @override
  String toString() {
    return "Message : $message \nData : $data\nStatus : $status";
  }
}
