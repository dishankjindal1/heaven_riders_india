import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:heaven_riders_india/modal/router/app_router.gr.dart';
import 'package:heaven_riders_india/modal/utils/app_state.dart';
import 'package:heaven_riders_india/view/screen/advert_overlay_banner_widget.dart';
import 'package:heaven_riders_india/view/screen/drawer.dart';
import 'package:heaven_riders_india/view_model/app_state_view_modal.dart';
import 'package:provider/provider.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    final appStateViewModal = Provider.of<AppStateViewModal>(context);
    return Stack(
      children: [
        const AutoTabsRouterWidget(),
        if (appStateViewModal.viewState.status == Status.initial)
          Scaffold(
            body: advertOverlayBannerWidget(appStateViewModal),
          ),
        if (appStateViewModal.viewState.status == Status.loading)
          Scaffold(
            backgroundColor:
                Color(Theme.of(context).primaryColor.value).withOpacity(0.5),
            body: const Center(child: CircularProgressIndicator()),
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
      ],
      builder: (context, child, animation) {
        final tabsRouter = AutoTabsRouter.of(context);
        final appStateViewModal = Provider.of<AppStateViewModal>(context);

        return Scaffold(
          appBar: AppBar(),
          drawer: appStateViewModal.authState.status == Status.initial
              ? appDrawerLoggedOut(context, appStateViewModal)
              : appDrawerLoggedIn(context, appStateViewModal),
          body: FadeTransition(
            opacity: animation,
            child: child,
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: tabsRouter.activeIndex,
            onTap: (index) {
              tabsRouter.setActiveIndex(index);
            },
            items: const [
              BottomNavigationBarItem(
                label: 'Dashboard',
                icon: Icon(Icons.home),
              ),
              BottomNavigationBarItem(
                label: 'Login',
                icon: Icon(Icons.login),
              ),
              BottomNavigationBarItem(
                label: 'Settings',
                icon: Icon(Icons.settings),
              ),
            ],
          ),
        );
      },
    );
  }
}
