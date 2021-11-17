import 'package:firebase_auth/firebase_auth.dart';
import 'package:heaven_riders_india/modal/service/config/base_config.dart';
import 'package:heaven_riders_india/view_model/app_state_view_modal.dart';

class AuthService extends BaseConfig {
  AppStateViewModal app;
  AuthService(this.app);

  createNewUser(String email, String password) async {
    await firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);
  }

  signin(AuthCredential authCredential) async {
    await firebaseAuth.signInWithCredential(authCredential);
  }

  signout() async {
    await firebaseAuth.signOut();
  }

  update(Function callback, String data) async {
    await callback(data);
  }
}
