import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:heaven_riders_india/custom_bloc_providers.dart';
import 'package:heaven_riders_india/firebase_options.dart';
import 'bloc_observer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  try {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  } on FirebaseException {
    await Firebase.initializeApp();
  }

  BlocOverrides.runZoned(
    () => runApp(const CustomBlocProviders()),
    blocObserver: AppBlocObserver(),
  );
}
