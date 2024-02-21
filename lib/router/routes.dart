import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

enum NoAuthRoutes {
  /// No auth Routes
  login('/login'),
  register('/register');

  final String route;

  /// commented for future impl
  // final String? title;
  // final String? iconData;

  void go(BuildContext context, {Object? args}) {
    context.go(route, extra: args);
  }

  void goNamed(BuildContext context, {Object? args}) {
    context.goNamed(name, extra: args);
  }

  const NoAuthRoutes(this.route);
}

enum MainShellRoutes {
  /// Auth Route without company
  selectuser('/selectUser'),
  home('/'),
  profile('/profile'),
  notifications('/notifications'),
  settings('/settings'),
  ;

  final String route;

  String get getPath => route;

  void go(BuildContext context, {Object? args}) {
    context.go(getPath, extra: args);
  }

  void goNamed(BuildContext context, {Object? args}) {
    return context.goNamed(name, extra: args);
  }

  /// commented for future impl
  // final String? title;
  // final String? iconData;

  const MainShellRoutes(this.route);
}

enum SettingsShellRoutes {
  /// Settings

  /// user settings will be the default screen on select settings
  profileSettings('/settings'),

  /// if doesn't startes with '/' refers shell route
  general('general'),
  theme('theme'),
  others('others'),
  ;

  final String route;

  /// commented for future impl
  // final String? title;
  // final String? iconData;

  String getPath() {
    return route == '/settings' ? route : '/settings/$route';
  }

  void go(BuildContext context, {Object? args}) {
    context.go(getPath(), extra: args);
  }

  void goNamed(BuildContext context, {Object? args}) {
    context.goNamed(name, extra: args);
  }

  const SettingsShellRoutes(this.route);
}
