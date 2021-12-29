import 'package:heaven_riders_india/modal/apis/custom_exceptions.dart';
import 'package:heaven_riders_india/modal/service/authentication/base_class/auth_service.dart';
import 'package:heaven_riders_india/modal/utils/app_state.dart';
import 'package:heaven_riders_india/view_model/app_state_view_modal.dart';

class PhoneAuth extends AuthService {
  PhoneAuth(AppStateViewModal app) : super(app);

  signInWithPhone(String phoneNumber, List<dynamic> data) async {
    await firebaseAuth.verifyPhoneNumber(
      timeout: const Duration(seconds: 60),
      phoneNumber: phoneNumber,
      verificationCompleted: (phoneAuthCredential) async {
        await signin(phoneAuthCredential);
        app.setViewState(Status.ideal);
      },
      verificationFailed: (verificationFailed) {
        PhoneAuthException(verificationFailed.code);
        app.setViewState(Status.ideal);
      },
      codeSent: data[0] as Function(String, int?),
      codeAutoRetrievalTimeout: (verificationId) {
        app.setViewState(Status.ideal);
      },
    );
  }

  signOutFromPhone() async {
    await signout();
    app.setViewState(Status.ideal);
  }
}
