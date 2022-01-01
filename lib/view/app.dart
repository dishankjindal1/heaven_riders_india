import 'package:flutter/material.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:heaven_riders_india/theme/theme.dart';
import 'package:heaven_riders_india/view/home/view/home.view.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      theme: myAppTheme(),
      home: const HomeView(),
      localizationsDelegates: const [
        FormBuilderLocalizations.delegate,
      ],
      debugShowCheckedModeBanner: false,
    );
  }
}
