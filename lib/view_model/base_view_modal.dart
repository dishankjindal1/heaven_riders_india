import 'package:flutter/foundation.dart';
import 'package:heaven_riders_india/modal/apis/api_response.dart';
import 'package:heaven_riders_india/modal/utils/app_state.dart';

class BaseViewModal with ChangeNotifier {
  final ApiResponse _viewState = ApiResponse.initial();

  ApiResponse get viewState => _viewState;

  setviewState(Status status) {
    _viewState.status = status;
    notifyListeners();
  }

  final ApiResponse _authState = ApiResponse.initial();

  ApiResponse get authState => _authState;

  setauthState(Status status) {
    _authState.status = status;
    notifyListeners();
  }
}
