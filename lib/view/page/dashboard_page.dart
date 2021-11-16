import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:heaven_riders_india/modal/utils/app_state.dart';
import 'package:heaven_riders_india/router/app_router.gr.dart';
import 'package:heaven_riders_india/view/screen/advert_overlay_banner_widget.dart';
import 'package:heaven_riders_india/view/screen/drawer.dart';
import 'package:heaven_riders_india/view_model/app_state_view_modal.dart';
import 'package:heaven_riders_india/view_model/setting_state_view_modal.dart';
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
    var asvm = Provider.of<AppStateViewModal>(context);
    return Stack(
      children: [
        const AutoTabsRouterWidget(),
        if (asvm.viewState.status == Status.initial)
          Scaffold(
            body: advertOverlayBannerWidget(asvm),
          ),
        if (asvm.viewState.status == Status.loading)
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
    var appStateViewModal = Provider.of<AppStateViewModal>(context);
    var ssvm = Provider.of<SettingStateViewModal>(context);

    return AutoTabsRouter(
      routes: [
        const HomeRoute(),
        LoginRoute(),
        const SettingRoute(),
      ],
      builder: (context, child, animation) {
        var tabsRouter = AutoTabsRouter.of(context);

        return Scaffold(
          appBar: AppBar(actions: [
            tabsRouter.activeIndex == 0
                ? IconButton(
                    onPressed: () {
                      ssvm.setGridViewCount();
                    },
                    icon: ssvm.gridViewCount
                        ? const Icon(FontAwesomeIcons.box)
                        : const Icon(FontAwesomeIcons.borderAll),
                  )
                : tabsRouter.activeIndex == 1
                    ? IconButton(
                        onPressed: () {
                          ssvm.setGridViewCount();
                        },
                        icon: const Icon(Icons.home))
                    : IconButton(
                        onPressed: () {
                          ssvm.setGridViewCount();
                        },
                        icon: const Icon(Icons.home)),
          ]),
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
