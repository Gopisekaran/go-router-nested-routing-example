import 'package:go_router/go_router.dart';
import 'package:navpoc/router/routes.dart';
import 'package:navpoc/router/shells/main_shell.dart';
import 'package:navpoc/router/shells/sub_shell.dart';

import 'package:navpoc/screens/auth_screen.dart';
import 'package:navpoc/screens/login.dart';
import 'package:navpoc/screens/no_auths.dart';
import 'package:navpoc/screens/register.dart';

class RouterHelper {
  static GoRouter routeConfig(bool loginStatus, bool companyStatus) {
    return GoRouter(
      errorBuilder: (context, state) {
        return const Unknown();
      },
      redirect: (context, state) {
        if (!loginStatus && state.uri.path != '/register') {
          return NoAuthRoutes.login.route;
        }
        if (loginStatus && !companyStatus) {
          return MainShellRoutes.selectuser.route;
        }

        return null;
      },
      initialLocation: '/',
      routes: [
        ShellRoute(
            builder: (context, state, child) {
              return DashBoardShell(child: child);
            },
            routes: [
              GoRoute(
                name: MainShellRoutes.home.name,
                path: MainShellRoutes.home.route,
                builder: (context, state) => const Home(),
              ),
              GoRoute(
                name: MainShellRoutes.profile.name,
                path: MainShellRoutes.profile.route,
                builder: (context, state) => const Profile(),
              ),
              GoRoute(
                name: MainShellRoutes.notifications.name,
                path: MainShellRoutes.notifications.route,
                builder: (context, state) => const Notifications(),
              ),
              ShellRoute(
                  builder: (context, state, child) {
                    return SettingsShell(child: child);
                  },
                  routes: [
                    GoRoute(
                        name: MainShellRoutes.settings.name,
                        path: MainShellRoutes.settings.route,
                        builder: (context, state) => const ProfileSettings(),
                        routes: [
                          GoRoute(
                            name: SettingsShellRoutes.general.name,
                            path: SettingsShellRoutes.general.route,
                            builder: (context, state) => const General(),
                          ),
                          GoRoute(
                            name: SettingsShellRoutes.theme.name,
                            path: SettingsShellRoutes.theme.route,
                            builder: (context, state) => const ThemeSettings(),
                          ),
                          GoRoute(
                            name: SettingsShellRoutes.others.name,
                            path: SettingsShellRoutes.others.route,
                            builder: (context, state) => const OthersSettings(),
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
              return MainShellRoutes.selectuser.route;
            }
            return null;
          },
          name: NoAuthRoutes.login.name,
          path: NoAuthRoutes.login.route,
          builder: (context, state) => const Login(),
        ),
        GoRoute(
          redirect: (context, state) {
            if (loginStatus && companyStatus) {
              return '/';
            }
            if (!loginStatus) {
              return NoAuthRoutes.login.route;
            }
            return null;
          },
          name: MainShellRoutes.selectuser.name,
          path: MainShellRoutes.selectuser.route,
          builder: (context, state) => const CompanySelection(),
        ),
        GoRoute(
          redirect: (context, state) {
            if (loginStatus && companyStatus) {
              return '/';
            }
            if (loginStatus && !companyStatus) {
              return MainShellRoutes.selectuser.route;
            }
            return null;
          },
          name: NoAuthRoutes.register.name,
          path: NoAuthRoutes.register.route,
          builder: (context, state) => const Register(),
        ),
      ],
    );
  }
}
