import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:heaven_riders_india/custom_bloc_providers.dart';
import 'bloc_observer.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  BlocOverrides.runZoned(
    () => const CustomBlocProviders(),
    blocObserver: AppBlocObserver(),
  );
}
