import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:heaven_riders_india/view/app.dart';

class CustomBlocProviders extends StatelessWidget {
  const CustomBlocProviders({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: const [],
      child: const App(),
    );
  }
}