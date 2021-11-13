import 'package:heaven_riders_india/modal/service/config/base_config.dart';

class AuthService extends BaseConfig {
  Future<void> createNewUser(String email, String password) async {
    await firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);
  }

  Future<void> signin(String email, String password) async {
    await firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
  }

  Future<void> signout() async {
    await firebaseAuth.signOut();
  }

  Future<void> update(Function callback, String data) async {
    await callback(data);
  }
}
