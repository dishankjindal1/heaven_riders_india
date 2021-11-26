// ignore_for_file: prefer_function_declarations_over_variables

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:heaven_riders_india/main.dart';
import 'package:heaven_riders_india/modal/utils/app_state.dart';
import 'package:heaven_riders_india/view_model/app_state_view_modal.dart';
import 'package:provider/provider.dart';
import 'package:sms_autofill/sms_autofill.dart';

class AnonymousPage extends StatefulWidget {
  const AnonymousPage({Key? key}) : super(key: key);

  @override
  _AnonymousPageState createState() => _AnonymousPageState();
}

class _AnonymousPageState extends State<AnonymousPage> {
  final _formKey = GlobalKey<FormBuilderState>();
  @override
  Widget build(BuildContext context) {
    var app = Provider.of<AppStateViewModal>(context);
    app.app = app;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        FormBuilder(
          key: _formKey,
          child: Container(
            margin: const EdgeInsets.all(8),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: FormBuilderTextField(
                    name: 'form_phonenumber',
                    style: Theme.of(context).textTheme.button,
                    keyboardType: TextInputType.number,
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(context),
                      FormBuilderValidators.maxLength(context, 10,
                          errorText: 'Invalid Number'),
                      FormBuilderValidators.minLength(context, 10,
                          errorText: 'Invalid Number'),
                      FormBuilderValidators.numeric(context),
                    ]),
                    decoration: InputDecoration(
                      prefixText: '+91',
                      prefixStyle: Theme.of(context).textTheme.button,
                      labelText: 'Enter 10 Digit phone number',
                      border: InputBorder.none,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        InkWell(
          onTap: () {
            Function(String, int?) codeSent = (data, val) {
              app.setViewState(Status.ideal);
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => OtpScreen(data)));
            };

            if (_formKey.currentState!.saveAndValidate()) {
              String value =
                  _formKey.currentState!.fields['form_phonenumber']!.value;
              app.phoneSignIn('+91$value', codeSent);
              _formKey.currentState!.reset();
            }
          },
          child: Container(
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width,
            height: 100,
            child: StreamBuilder(
              stream: app.firebaseAuth.authStateChanges(),
              builder: (context, snapshot) => !snapshot.hasData
                  ? Text(
                      "Submit".toUpperCase(),
                      style: Theme.of(context).textTheme.button,
                    )
                  : const CircularProgressIndicator(),
            ),
          ),
        ),
      ],
    );
  }
}

class OtpScreen extends StatefulWidget {
  const OtpScreen(this.data, {Key? key}) : super(key: key);
  final String data;
  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> with CodeAutoFill {
  String? appSignature;
  String? otpCode;

  @override
  void codeUpdated() {
    setState(() {
      otpCode = code!;
    });
  }

  @override
  void initState() {
    super.initState();
    listenForCode(smsCodeRegexPattern: '\\d{6}');
    // SmsAutoFill()
    //     .getAppSignature
    //     .then((value) => print('Signature : ' + value));
  }

  @override
  void dispose() {
    super.dispose();
    cancel();
    unregisterListener();
  }

  @override
  Widget build(BuildContext context) {
    var app = Provider.of<AppStateViewModal>(context);
    app.app = app;
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            PinFieldAutoFill(
              currentCode: otpCode,
              onCodeChanged: (value) {
                otpCode = value;
              },
            ),
            InkWell(
              onTap: () async {
                var credential = PhoneAuthProvider.credential(
                    verificationId: widget.data, smsCode: otpCode!);
                await app.firebaseAuth.signInWithCredential(credential);
                RestartWidget.refreshApp(context);
                Navigator.pop(context);
              },
              child: Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width,
                height: 100,
                child: StreamBuilder(
                  stream: app.firebaseAuth.authStateChanges(),
                  builder: (context, snapshot) => !snapshot.hasData
                      ? Text(
                          "Submit".toUpperCase(),
                          style: Theme.of(context).textTheme.button,
                        )
                      : const CircularProgressIndicator(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
