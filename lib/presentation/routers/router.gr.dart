// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i2;
import 'package:flutter/material.dart' as _i3;

import '../screens/presentation.dart' as _i1;

class AppRouter extends _i2.RootStackRouter {
  AppRouter([_i3.GlobalKey<_i3.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i2.PageFactory> pagesMap = {
    SingUpScreen.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.SingUpScreen());
    },
    SingInScreen.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.SingInScreen());
    },
    HomeScreen.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.HomeScreen());
    }
  };

  @override
  List<_i2.RouteConfig> get routes => [
        _i2.RouteConfig(SingUpScreen.name, path: '/'),
        _i2.RouteConfig(SingInScreen.name, path: '/sing-in-screen'),
        _i2.RouteConfig(HomeScreen.name, path: '/home-screen')
      ];
}

/// generated route for
/// [_i1.SingUpScreen]
class SingUpScreen extends _i2.PageRouteInfo<void> {
  const SingUpScreen() : super(SingUpScreen.name, path: '/');

  static const String name = 'SingUpScreen';
}

/// generated route for
/// [_i1.SingInScreen]
class SingInScreen extends _i2.PageRouteInfo<void> {
  const SingInScreen() : super(SingInScreen.name, path: '/sing-in-screen');

  static const String name = 'SingInScreen';
}

/// generated route for
/// [_i1.HomeScreen]
class HomeScreen extends _i2.PageRouteInfo<void> {
  const HomeScreen() : super(HomeScreen.name, path: '/home-screen');

  static const String name = 'HomeScreen';
}
