import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:heaven_riders_india/view_model/app_state_view_modal.dart';
import 'package:provider/provider.dart';

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
                    onChanged: (data) {
                      _formKey.currentState!.validate();
                    },
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
            if (_formKey.currentState!.saveAndValidate()) {
              String value =
                  _formKey.currentState!.fields['form_phonenumber']!.value;
              app.phoneSignIn('+91' + value);
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
