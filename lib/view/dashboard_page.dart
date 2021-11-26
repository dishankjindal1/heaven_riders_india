import 'dart:ui';

import 'package:auto_route/auto_route.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:heaven_riders_india/modal/utils/app_state.dart';
import 'package:heaven_riders_india/router/app_router.gr.dart';
import 'package:heaven_riders_india/view_model/app_state_view_modal.dart';
import 'package:line_icons/line_icons.dart';
import 'package:provider/provider.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance!.addPostFrameCallback((_) {
      Provider.of<AppStateViewModal>(context, listen: false).getPackages();
    });
  }

  @override
  Widget build(BuildContext context) {
    var app = Provider.of<AppStateViewModal>(context);
    app.app = app;
    return Stack(
      children: [
        const AutoTabsRouterWidget(),
        if (app.viewState == Status.busy)
          Scaffold(
            backgroundColor:
                Color(Theme.of(context).primaryColor.value).withOpacity(0.9),
            body: const Center(
              child: CircularProgressIndicator(),
            ),
          ),
        if (app.viewState == Status.error)
          Scaffold(
            backgroundColor:
                Color(Theme.of(context).primaryColor.value).withOpacity(0.9),
            body: const Center(
              child: Text('Error Page'),
            ),
          ),
        if (app.viewState == Status.advertisnment)
          Scaffold(
            backgroundColor:
                Color(Theme.of(context).primaryColor.value).withOpacity(0.9),
            body: const Center(
              child: Text('Advertisnment Page'),
            ),
          ),
      ],
    );
  }
}

class AutoTabsRouterWidget extends StatelessWidget {
  const AutoTabsRouterWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var app = Provider.of<AppStateViewModal>(context);
    app.app = app;

    return AutoTabsRouter(
      routes: [
        const HomeDashboardRoute(),
        if (app.isAdmin) const AdminAddDashboardRoute(),
        const ProfileDashboardRoute(),
      ],
      builder: (context, child, animation) {
        var tabsRouter = AutoTabsRouter.of(context);
        return Scaffold(
          body: SafeArea(
            child: FadeTransition(
              opacity: animation,
              child: child,
            ),
          ),
          bottomNavigationBar: ConvexAppBar(
            elevation: 10,
            style: TabStyle.titled,
            color: Theme.of(context).selectedRowColor,
            activeColor: Theme.of(context).selectedRowColor,
            backgroundColor: Theme.of(context).bottomAppBarColor,
            initialActiveIndex: tabsRouter.activeIndex,
            onTap: (index) => tabsRouter.setActiveIndex(index),
            items: [
              TabItem(
                title: 'Dashboard',
                icon: ImageIcon(
                  const AssetImage('assets/AppIcons/playstore.png'),
                  color: Theme.of(context).primaryColorLight,
                ),
              ),
              if (app.isAdmin)
                TabItem(
                  title: 'Add post',
                  icon: Icon(Icons.add,
                      color: Theme.of(context).primaryColorLight),
                ),
              TabItem(
                title: tabsRouter.activeIndex == 1 ? 'Dishank' : 'Profile',
                icon: StreamBuilder(
                  stream: app.firebaseAuth.authStateChanges(),
                  builder: (context, snapshot) => snapshot.hasData
                      ? const CircleAvatar(
                          backgroundImage: NetworkImage(
                              'https://tinyjpg.com/images/social/website.jpg'),
                        )
                      : Icon(LineIcons.user,
                          color: Theme.of(context).primaryColorLight),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
