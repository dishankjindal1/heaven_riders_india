// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:heaven_riders_india/modal/utils/app_state.dart';
import 'package:heaven_riders_india/view_model/app_state_view_modal.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    CollectionReference items = FirebaseFirestore.instance.collection('items');

    items
        .add({'title': 'Kedarkantha', 'company': 'hri', 'age': '26'})
        .then((value) => print("User Added"))
        .catchError((onError) => print("Failed to add user: $onError"));

    AppStateViewModal appStateViewModal =
        Provider.of<AppStateViewModal>(context);
    return Center(
      child: appStateViewModal.authState.status == Status.initial
          ? const CircularProgressIndicator()
          : updateUserFormWidget(context, appStateViewModal),
    );
  }

  void _onChanged(String? data) {
    _formKey.currentState!.validate();
  }

  Column updateUserFormWidget(
          BuildContext context, AppStateViewModal appStateViewModal) =>
      Column(
        children: [
          FormBuilder(
            key: _formKey,
            child: Column(
              children: [
                FormBuilderTextField(
                  name: 'Name',
                  decoration:
                      const InputDecoration(labelText: 'Enter Full Name ....'),
                  onChanged: _onChanged,
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.match(context, '@',
                        errorText: 'Please enter input valid name...'),
                    FormBuilderValidators.maxLength(context, 100,
                        errorText: 'name is too big....'),
                  ]),
                ),
              ],
            ),
          ),
        ],
      );
}
