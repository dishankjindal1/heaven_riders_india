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
      Provider.of<AppStateViewModal>(context, listen: false).checkAuthState();
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

class AutoTabsRouterWidget extends StatefulWidget {
  const AutoTabsRouterWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<AutoTabsRouterWidget> createState() => _AutoTabsRouterWidgetState();
}

class _AutoTabsRouterWidgetState extends State<AutoTabsRouterWidget> {
  late TabsRouter tabsRouter;
  bool _isAdmin = false;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      if (Provider.of<AppStateViewModal>(context, listen: false).isAdmin) {
        _isAdmin = true;
        tabsRouter.setActiveIndex(0);
        setState(() {});
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var app = Provider.of<AppStateViewModal>(context);
    app.app = app;

    return AutoTabsRouter(
      routes: [
        const HomeDashboardRoute(),
        if (_isAdmin) const AdminAddDashboardRoute(),
        const ProfileDashboardRoute(),
      ],
      builder: (context, child, animation) {
        tabsRouter = AutoTabsRouter.of(context);
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
                  const AssetImage('assets/app_icons/playstore.png'),
                  color: Theme.of(context).primaryColorLight,
                ),
              ),
              if (_isAdmin)
                TabItem(
                  title: 'Add post',
                  icon: Icon(Icons.add,
                      color: Theme.of(context).primaryColorLight),
                ),
              TabItem(
                title: app.isLoggedStatus ? app.getCurrentUserName() : 'Profile',
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
