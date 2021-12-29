import 'package:auto_route/annotations.dart';
import 'package:heaven_riders_india/view/dashboard_page.dart';
import 'package:heaven_riders_india/view/page/add/admin_add_dashboard.dart';
import 'package:heaven_riders_india/view/page/home/detail/detail_page.dart';
import 'package:heaven_riders_india/view/page/home/home_dashboard_page.dart';
import 'package:heaven_riders_india/view/page/profile/profile_dashboard_page.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: DashboardPage, initial: true, children: [
      AutoRoute(page: HomeDashboardPage),
      AutoRoute(page: AdminAddDashboardPage),
      AutoRoute(page: ProfileDashboardPage),
    ]),
    AutoRoute(page: DetailPage),
  ],
)
class $AppRouter {}
