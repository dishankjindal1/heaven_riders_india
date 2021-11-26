// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i6;
import 'package:flutter/cupertino.dart' as _i10;
import 'package:flutter/material.dart' as _i7;

import '../modal/data/image.dart' as _i8;
import '../modal/data/package.dart' as _i9;
import '../view/dashboard_page.dart' as _i1;
import '../view/page/add/admin_add_dashboard.dart' as _i4;
import '../view/page/home/detail/detail_page.dart' as _i2;
import '../view/page/home/home_dashboard_page.dart' as _i3;
import '../view/page/profile/profile_dashboard_page.dart' as _i5;

class AppRouter extends _i6.RootStackRouter {
  AppRouter([_i7.GlobalKey<_i7.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i6.PageFactory> pagesMap = {
    DashboardRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.DashboardPage());
    },
    DetailRoute.name: (routeData) {
      final args = routeData.argsAs<DetailRouteArgs>();
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i2.DetailPage(
              imageList: args.imageList,
              packageData: args.packageData,
              key: args.key));
    },
    HomeDashboardRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.HomeDashboardPage());
    },
    AdminAddDashboardRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i4.AdminAddDashboardPage());
    },
    ProfileDashboardRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i5.ProfileDashboardPage());
    }
  };

  @override
  List<_i6.RouteConfig> get routes => [
        _i6.RouteConfig(DashboardRoute.name, path: '/', children: [
          _i6.RouteConfig(HomeDashboardRoute.name,
              path: 'home-dashboard-page', parent: DashboardRoute.name),
          _i6.RouteConfig(AdminAddDashboardRoute.name,
              path: 'admin-add-dashboard-page', parent: DashboardRoute.name),
          _i6.RouteConfig(ProfileDashboardRoute.name,
              path: 'profile-dashboard-page', parent: DashboardRoute.name)
        ]),
        _i6.RouteConfig(DetailRoute.name, path: '/detail-page')
      ];
}

/// generated route for [_i1.DashboardPage]
class DashboardRoute extends _i6.PageRouteInfo<void> {
  const DashboardRoute({List<_i6.PageRouteInfo>? children})
      : super(name, path: '/', initialChildren: children);

  static const String name = 'DashboardRoute';
}

/// generated route for [_i2.DetailPage]
class DetailRoute extends _i6.PageRouteInfo<DetailRouteArgs> {
  DetailRoute(
      {required List<_i8.ImageDataModal> imageList,
      required _i9.PackageDataModal packageData,
      _i10.Key? key})
      : super(name,
            path: '/detail-page',
            args: DetailRouteArgs(
                imageList: imageList, packageData: packageData, key: key));

  static const String name = 'DetailRoute';
}

class DetailRouteArgs {
  const DetailRouteArgs(
      {required this.imageList, required this.packageData, this.key});

  final List<_i8.ImageDataModal> imageList;

  final _i9.PackageDataModal packageData;

  final _i10.Key? key;
}

/// generated route for [_i3.HomeDashboardPage]
class HomeDashboardRoute extends _i6.PageRouteInfo<void> {
  const HomeDashboardRoute() : super(name, path: 'home-dashboard-page');

  static const String name = 'HomeDashboardRoute';
}

/// generated route for [_i4.AdminAddDashboardPage]
class AdminAddDashboardRoute extends _i6.PageRouteInfo<void> {
  const AdminAddDashboardRoute()
      : super(name, path: 'admin-add-dashboard-page');

  static const String name = 'AdminAddDashboardRoute';
}

/// generated route for [_i5.ProfileDashboardPage]
class ProfileDashboardRoute extends _i6.PageRouteInfo<void> {
  const ProfileDashboardRoute() : super(name, path: 'profile-dashboard-page');

  static const String name = 'ProfileDashboardRoute';
}
