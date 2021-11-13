import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:heaven_riders_india/view_model/app_state_view_modal.dart';
import 'package:provider/provider.dart';
import 'modal/router/app_router.gr.dart';
import './theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AppStateViewModal()),
      ],
      builder: (context, child) {
        return MyApp();
      },
    ),
  );
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final AppRouter _appRouter = AppRouter();
  final Future<FirebaseApp> _init = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _init,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            title: 'Heaven Riders India',
            routeInformationParser: _appRouter.defaultRouteParser(),
            routerDelegate: _appRouter.delegate(),
            routeInformationProvider: _appRouter.routeInfoProvider(),
            theme: myAppThemeLight(),
            darkTheme: myAppThemeDark(),
            themeMode: ThemeMode.system,
          );
        }
        return const MaterialApp(
          home: Scaffold(
            body: Center(child: CircularProgressIndicator()),
          ),
        );
      },
    );
  }
}
