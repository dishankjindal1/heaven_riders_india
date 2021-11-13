// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i6;
import 'package:flutter/cupertino.dart' as _i8;
import 'package:flutter/material.dart' as _i7;

import '../../view/page/dashboard_page.dart' as _i1;
import '../../view/page/home/home_page.dart' as _i3;
import '../../view/page/login_page.dart' as _i4;
import '../../view/page/not_found_page.dart' as _i2;
import '../../view/page/setting_page.dart' as _i5;

class AppRouter extends _i6.RootStackRouter {
  AppRouter([_i7.GlobalKey<_i7.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i6.PageFactory> pagesMap = {
    DashboardRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.DashboardPage());
    },
    NotFoundRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.NotFoundPage());
    },
    HomeRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.HomePage());
    },
    LoginRoute.name: (routeData) {
      final args = routeData.argsAs<LoginRouteArgs>(
          orElse: () => const LoginRouteArgs());
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData, child: _i4.LoginPage(key: args.key));
    },
    SettingRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i5.SettingPage());
    }
  };

  @override
  List<_i6.RouteConfig> get routes => [
        _i6.RouteConfig(DashboardRoute.name, path: '/', children: [
          _i6.RouteConfig(HomeRoute.name,
              path: 'home-page', parent: DashboardRoute.name),
          _i6.RouteConfig(LoginRoute.name,
              path: 'login-page', parent: DashboardRoute.name),
          _i6.RouteConfig(SettingRoute.name,
              path: 'setting-page', parent: DashboardRoute.name)
        ]),
        _i6.RouteConfig(NotFoundRoute.name, path: '/not-found-page')
      ];
}

/// generated route for [_i1.DashboardPage]
class DashboardRoute extends _i6.PageRouteInfo<void> {
  const DashboardRoute({List<_i6.PageRouteInfo>? children})
      : super(name, path: '/', initialChildren: children);

  static const String name = 'DashboardRoute';
}

/// generated route for [_i2.NotFoundPage]
class NotFoundRoute extends _i6.PageRouteInfo<void> {
  const NotFoundRoute() : super(name, path: '/not-found-page');

  static const String name = 'NotFoundRoute';
}

/// generated route for [_i3.HomePage]
class HomeRoute extends _i6.PageRouteInfo<void> {
  const HomeRoute() : super(name, path: 'home-page');

  static const String name = 'HomeRoute';
}

/// generated route for [_i4.LoginPage]
class LoginRoute extends _i6.PageRouteInfo<LoginRouteArgs> {
  LoginRoute({_i8.Key? key})
      : super(name, path: 'login-page', args: LoginRouteArgs(key: key));

  static const String name = 'LoginRoute';
}

class LoginRouteArgs {
  const LoginRouteArgs({this.key});

  final _i8.Key? key;
}

/// generated route for [_i5.SettingPage]
class SettingRoute extends _i6.PageRouteInfo<void> {
  const SettingRoute() : super(name, path: 'setting-page');

  static const String name = 'SettingRoute';
}
