import 'package:auto_route/annotations.dart';
import 'package:heaven_riders_india/view/page/dashboard_page.dart';
import 'package:heaven_riders_india/view/page/home/home_page.dart';
import 'package:heaven_riders_india/view/page/login_page.dart';
import 'package:heaven_riders_india/view/page/not_found_page.dart';
import 'package:heaven_riders_india/view/page/setting_page.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: DashboardPage, initial: true, children: [
      AutoRoute(page: HomePage),
      AutoRoute(page: LoginPage),
      AutoRoute(page: SettingPage),
    ]),
    AutoRoute(page: NotFoundPage),
  ],
)
class $AppRouter {}
