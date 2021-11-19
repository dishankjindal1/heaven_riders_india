// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i5;
import 'package:flutter/material.dart' as _i6;

import '../modal/data/image.dart' as _i7;
import '../modal/data/package.dart' as _i8;
import '../view/dashboard_page.dart' as _i1;
import '../view/page/home/detail/detail_page.dart' as _i2;
import '../view/page/home/home_dashboard_page.dart' as _i3;
import '../view/page/profile/profile_dashboard_page.dart' as _i4;

class AppRouter extends _i5.RootStackRouter {
  AppRouter([_i6.GlobalKey<_i6.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i5.PageFactory> pagesMap = {
    DashboardRoute.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.DashboardPage());
    },
    DetailRoute.name: (routeData) {
      final args = routeData.argsAs<DetailRouteArgs>();
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i2.DetailPage(
              imageList: args.imageList,
              packageData: args.packageData,
              key: args.key));
    },
    HomeDashboardRoute.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.HomeDashboardPage());
    },
    ProfileDashboardRoute.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i4.ProfileDashboardPage());
    }
  };

  @override
  List<_i5.RouteConfig> get routes => [
        _i5.RouteConfig(DashboardRoute.name, path: '/', children: [
          _i5.RouteConfig(HomeDashboardRoute.name,
              path: 'home-dashboard-page', parent: DashboardRoute.name),
          _i5.RouteConfig(ProfileDashboardRoute.name,
              path: 'profile-dashboard-page', parent: DashboardRoute.name)
        ]),
        _i5.RouteConfig(DetailRoute.name, path: '/detail-page')
      ];
}

/// generated route for [_i1.DashboardPage]
class DashboardRoute extends _i5.PageRouteInfo<void> {
  const DashboardRoute({List<_i5.PageRouteInfo>? children})
      : super(name, path: '/', initialChildren: children);

  static const String name = 'DashboardRoute';
}

/// generated route for [_i2.DetailPage]
class DetailRoute extends _i5.PageRouteInfo<DetailRouteArgs> {
  DetailRoute(
      {required List<_i7.ImageDataModal> imageList,
      required _i8.PackageDataModal packageData,
      _i6.Key? key})
      : super(name,
            path: '/detail-page',
            args: DetailRouteArgs(
                imageList: imageList, packageData: packageData, key: key));

  static const String name = 'DetailRoute';
}

class DetailRouteArgs {
  const DetailRouteArgs(
      {required this.imageList, required this.packageData, this.key});

  final List<_i7.ImageDataModal> imageList;

  final _i8.PackageDataModal packageData;

  final _i6.Key? key;
}

/// generated route for [_i3.HomeDashboardPage]
class HomeDashboardRoute extends _i5.PageRouteInfo<void> {
  const HomeDashboardRoute() : super(name, path: 'home-dashboard-page');

  static const String name = 'HomeDashboardRoute';
}

/// generated route for [_i4.ProfileDashboardPage]
class ProfileDashboardRoute extends _i5.PageRouteInfo<void> {
  const ProfileDashboardRoute() : super(name, path: 'profile-dashboard-page');

  static const String name = 'ProfileDashboardRoute';
}
