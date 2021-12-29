import 'package:bloc/bloc.dart';
import 'utils/utils.dart';

class AppBlocObserver implements BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    '$bloc\n$change'.log();
  }

  @override
  void onClose(BlocBase bloc) {
    '$bloc'.log();
  }

  @override
  void onCreate(BlocBase bloc) {
    '$bloc'.log();
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    '$bloc\n$error\n$stackTrace'.log();
  }

  @override
  void onEvent(Bloc bloc, Object? event) {
    '$bloc\n$event'.log();
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    '$bloc\n$transition'.log();
  }
}
