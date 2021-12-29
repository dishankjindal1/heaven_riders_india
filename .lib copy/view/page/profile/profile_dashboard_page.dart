import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:heaven_riders_india/view/page/profile/anonymous/anonymous_page.dart';
import 'package:heaven_riders_india/view_model/app_state_view_modal.dart';
import 'package:provider/provider.dart';

import 'profile/profile_page.dart';

class ProfileDashboardPage extends StatefulWidget {
  const ProfileDashboardPage({Key? key}) : super(key: key);

  @override
  _ProfileDashboardPageState createState() => _ProfileDashboardPageState();
}

class _ProfileDashboardPageState extends State<ProfileDashboardPage> {
  @override
  Widget build(BuildContext context) {
    var app = Provider.of<AppStateViewModal>(context);
    app.app = app;
    return SafeArea(
      child: StreamBuilder(
        stream: app.firebaseAuth.authStateChanges(),
        builder: (context, authSnapshot) {
          return authSnapshot.hasData
              ? const ProfilePage()
              : const AnonymousPage();
        },
      ),
    );
  }
}
