import 'package:firebase_auth/firebase_auth.dart';
import 'package:heaven_riders_india/modal/apis/custom_exceptions.dart';
import 'package:heaven_riders_india/modal/service/authentication/base_class/auth_service.dart';
import 'package:heaven_riders_india/modal/utils/app_state.dart';
import 'package:heaven_riders_india/view_model/app_state_view_modal.dart';

class PhoneAuth extends AuthService {
  PhoneAuth(AppStateViewModal app) : super(app);

  signInWithPhone(String phoneNumber) async {
    await firebaseAuth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: (phoneAuthCredential) async {
        await signin(phoneAuthCredential);
        app.setViewState(Status.completed);
      },
      verificationFailed: (verificationFailed) {
        PhoneAuthException(verificationFailed.code);
        app.setViewState(Status.completed);
      },
      codeSent: (verificationId, forceResendingToken) async {
        String smsCode = '111111';
        var credential = PhoneAuthProvider.credential(
            verificationId: verificationId, smsCode: smsCode);
        await signin(credential);
        app.setViewState(Status.completed);
      },
      codeAutoRetrievalTimeout: (verificationId) {
        // Please enter OTP Manually
        app.setViewState(Status.completed);
      },
    );
  }

  signOutFromPhone() async {
    await signout();
    app.setViewState(Status.completed);
  }
}
