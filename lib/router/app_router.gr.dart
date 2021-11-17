// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i8;
import 'package:flutter/cupertino.dart' as _i12;
import 'package:flutter/material.dart' as _i9;

import '../modal/data/image.dart' as _i10;
import '../modal/data/package.dart' as _i11;
import '../view/page/dashboard_page.dart' as _i1;
import '../view/page/display/display_page.dart' as _i2;
import '../view/page/home/home_page.dart' as _i4;
import '../view/page/login_page.dart' as _i5;
import '../view/page/not_found_page.dart' as _i3;
import '../view/page/profile/profile_dashboard_page.dart' as _i7;
import '../view/page/setting_page.dart' as _i6;

class AppRouter extends _i8.RootStackRouter {
  AppRouter([_i9.GlobalKey<_i9.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i8.PageFactory> pagesMap = {
    DashboardRoute.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.DashboardPage());
    },
    DisplayRoute.name: (routeData) {
      final args = routeData.argsAs<DisplayRouteArgs>();
      return _i8.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i2.DisplayPage(
              imageList: args.imageList,
              packageData: args.packageData,
              key: args.key));
    },
    NotFoundRoute.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.NotFoundPage());
    },
    HomeRoute.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i4.HomePage());
    },
    LoginRoute.name: (routeData) {
      final args = routeData.argsAs<LoginRouteArgs>(
          orElse: () => const LoginRouteArgs());
      return _i8.MaterialPageX<dynamic>(
          routeData: routeData, child: _i5.LoginPage(key: args.key));
    },
    SettingRoute.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i6.SettingPage());
    },
    ProfileDashboardRoute.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i7.ProfileDashboardPage());
    }
  };

  @override
  List<_i8.RouteConfig> get routes => [
        _i8.RouteConfig(DashboardRoute.name, path: '/', children: [
          _i8.RouteConfig(HomeRoute.name,
              path: 'home-page', parent: DashboardRoute.name),
          _i8.RouteConfig(LoginRoute.name,
              path: 'login-page', parent: DashboardRoute.name),
          _i8.RouteConfig(SettingRoute.name,
              path: 'setting-page', parent: DashboardRoute.name),
          _i8.RouteConfig(ProfileDashboardRoute.name,
              path: 'profile-dashboard-page', parent: DashboardRoute.name)
        ]),
        _i8.RouteConfig(DisplayRoute.name, path: '/display-page'),
        _i8.RouteConfig(NotFoundRoute.name, path: '/not-found-page')
      ];
}

/// generated route for [_i1.DashboardPage]
class DashboardRoute extends _i8.PageRouteInfo<void> {
  const DashboardRoute({List<_i8.PageRouteInfo>? children})
      : super(name, path: '/', initialChildren: children);

  static const String name = 'DashboardRoute';
}

/// generated route for [_i2.DisplayPage]
class DisplayRoute extends _i8.PageRouteInfo<DisplayRouteArgs> {
  DisplayRoute(
      {required List<_i10.ImageDataModal> imageList,
      required _i11.PackageDataModal packageData,
      _i12.Key? key})
      : super(name,
            path: '/display-page',
            args: DisplayRouteArgs(
                imageList: imageList, packageData: packageData, key: key));

  static const String name = 'DisplayRoute';
}

class DisplayRouteArgs {
  const DisplayRouteArgs(
      {required this.imageList, required this.packageData, this.key});

  final List<_i10.ImageDataModal> imageList;

  final _i11.PackageDataModal packageData;

  final _i12.Key? key;
}

/// generated route for [_i3.NotFoundPage]
class NotFoundRoute extends _i8.PageRouteInfo<void> {
  const NotFoundRoute() : super(name, path: '/not-found-page');

  static const String name = 'NotFoundRoute';
}

/// generated route for [_i4.HomePage]
class HomeRoute extends _i8.PageRouteInfo<void> {
  const HomeRoute() : super(name, path: 'home-page');

  static const String name = 'HomeRoute';
}

/// generated route for [_i5.LoginPage]
class LoginRoute extends _i8.PageRouteInfo<LoginRouteArgs> {
  LoginRoute({_i12.Key? key})
      : super(name, path: 'login-page', args: LoginRouteArgs(key: key));

  static const String name = 'LoginRoute';
}

class LoginRouteArgs {
  const LoginRouteArgs({this.key});

  final _i12.Key? key;
}

/// generated route for [_i6.SettingPage]
class SettingRoute extends _i8.PageRouteInfo<void> {
  const SettingRoute() : super(name, path: 'setting-page');

  static const String name = 'SettingRoute';
}

/// generated route for [_i7.ProfileDashboardPage]
class ProfileDashboardRoute extends _i8.PageRouteInfo<void> {
  const ProfileDashboardRoute() : super(name, path: 'profile-dashboard-page');

  static const String name = 'ProfileDashboardRoute';
}
