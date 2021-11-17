import 'package:auto_route/auto_route.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:heaven_riders_india/modal/utils/app_state.dart';
import 'package:heaven_riders_india/router/app_router.gr.dart';
import 'package:heaven_riders_india/view/screen/advert_overlay_banner_widget.dart';
import 'package:heaven_riders_india/view_model/app_state_view_modal.dart';
import 'package:line_icons/line_icons.dart';
import 'package:provider/provider.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

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
        if (app.viewState == Status.initial)
          Scaffold(
            body: advertOverlayBannerWidget(app),
          ),
        if (app.viewState == Status.loading)
          Scaffold(
            backgroundColor:
                Color(Theme.of(context).primaryColor.value).withOpacity(0.9),
            body: const Center(
              child: CircularProgressIndicator(),
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
    return AutoTabsRouter(
      routes: [
        const HomeRoute(),
        LoginRoute(),
        const SettingRoute(),
        const ProfileDashboardRoute()
      ],
      builder: (context, child, animation) {
        var tabsRouter = AutoTabsRouter.of(context);
        tabsRouter.setActiveIndex(2);
        return Scaffold(
          body: SafeArea(
            child: FadeTransition(
              opacity: animation,
              child: child,
            ),
          ),
          bottomNavigationBar: ConvexAppBar(
            elevation: 10,
            color: Theme.of(context).selectedRowColor,
            activeColor: Theme.of(context).secondaryHeaderColor,
            backgroundColor: Theme.of(context).bottomAppBarColor,
            initialActiveIndex: tabsRouter.activeIndex,
            onTap: (index) => tabsRouter.setActiveIndex(index),
            items: [
              const TabItem(
                title: 'Dashboard',
                icon: Icon(Icons.home),
              ),
              const TabItem(
                title: 'Login',
                icon: Icon(Icons.login),
              ),
              const TabItem(
                title: 'Settings',
                icon: Icon(Icons.settings),
              ),
              TabItem(
                title: tabsRouter.activeIndex == 3 ? 'Dishank' : 'Profile',
                icon: tabsRouter.activeIndex == 3
                    ? const CircleAvatar(
                        backgroundImage: NetworkImage(
                            'https://tinyjpg.com/images/social/website.jpg'),
                      )
                    : const Icon(LineIcons.user),
              ),
            ],
          ),
        );
      },
    );
  }
}
