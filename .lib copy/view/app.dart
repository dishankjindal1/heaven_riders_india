import 'package:flutter/material.dart';
import 'package:heaven_riders_india/view/page/profile/profile_dashboard_page.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'My App',
      home: ProfileDashboardPage(),
    );
  }
}
