import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:navpoc/router/dashboard_shell.dart';
import 'package:navpoc/router/settings_shell.dart';
import 'package:navpoc/screens/auth_screen.dart';
import 'package:navpoc/screens/no_auths.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorKey = GlobalKey<NavigatorState>();
final _settingsShellNavKey = GlobalKey<NavigatorState>();

class RouterHelper {
  static GoRouter router(bool loginStatus, bool companyStatus) {
    return GoRouter(
      errorBuilder: (context, state) {
        return const Unknown();
      },
      redirect: (context, state) {
        if (!loginStatus && state.uri.path != '/register') {
          return '/login';
        }
        if (loginStatus && !companyStatus) {
          return '/companySelection';
        }

        return null;
      },
      navigatorKey: _rootNavigatorKey,
      initialLocation: '/',
      routes: [
        ShellRoute(
            navigatorKey: _shellNavigatorKey,
            builder: (context, state, child) {
              return DashBoardShell(child: child);
            },
            routes: [
              GoRoute(
                path: '/',
                builder: (context, state) => const SR1(),
              ),
              GoRoute(
                path: '/sr2',
                builder: (context, state) => const SR2(),
              ),
              GoRoute(
                path: '/sr3',
                builder: (context, state) => const SR3(),
              ),
              GoRoute(
                path: '/sr4',
                builder: (context, state) => const SR4(),
              ),
              ShellRoute(
                  navigatorKey: _settingsShellNavKey,
                  builder: (context, state, child) {
                    return SettingsShell(child: child);
                  },
                  routes: [
                    GoRoute(
                        path: '/settings',
                        builder: (context, state) => const Settings1(),
                        routes: [
                          GoRoute(
                            path: 'settings2',
                            builder: (context, state) => const Settings2(),
                          ),
                          GoRoute(
                            path: 'settings3',
                            builder: (context, state) => const Settings3(),
                          ),
                          GoRoute(
                            path: 'settings4',
                            builder: (context, state) => const Settings4(),
                          ),
                        ]),
                  ])
            ]),
        GoRoute(
          redirect: (context, state) {
            if (loginStatus && companyStatus) {
              return '/';
            }
            if (loginStatus && !companyStatus) {
              return '/companySelection';
            }
            return null;
          },
          path: '/login',
          builder: (context, state) => const Login(),
        ),
        GoRoute(
          redirect: (context, state) {
            if (loginStatus && companyStatus) {
              return '/';
            }
            if (!loginStatus) {
              return '/login';
            }
            return null;
          },
          path: '/companySelection',
          builder: (context, state) => const CompanySelection(),
        ),
        GoRoute(
          redirect: (context, state) {
            if (loginStatus && companyStatus) {
              return '/';
            }
            if (loginStatus && !companyStatus) {
              return '/companySelection';
            }
            return null;
          },
          path: '/register',
          builder: (context, state) => const Register(),
        ),
      ],
    );
  }
}
