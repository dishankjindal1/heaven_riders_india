import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:heaven_riders_india/modal/utils/app_state.dart';

class BaseViewModal with ChangeNotifier {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  Status _viewState = Status.ideal;
  Status get viewState => _viewState;

  setViewState(Status status) {
    _viewState = status;
    notifyListeners();
  }

  Status _authState = Status.ideal;
  Status get authState => _authState;

  setAuthState(Status status) {
    _authState = status;
    notifyListeners();
  }
}
