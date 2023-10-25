import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:navpoc/screens/auth_screen.dart';
import 'package:navpoc/screens/no_auths.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_strategy/url_strategy.dart';

void main() {
  setPathUrlStrategy();
  // String initialRoute = await StatesDetails.getInitialRoute();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({
    super.key,
  });

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
      // backButtonDispatcher: RootBackButtonDispatcher(),
      // routeInformationParser: RoutesInformationParser(),
      // routerDelegate: AppRouterDelegate(initialRoute: widget.initialRoute),
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
    );
  }
}

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorKey = GlobalKey<NavigatorState>();
final _settingsShellNavKey = GlobalKey<NavigatorState>();

// GoRouter configuration
final _router = GoRouter(
  redirect: (context, state) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isLoggedIn = prefs.getBool("login") ?? false;
    bool isCompanySelected = prefs.getBool("company") ?? false;

    if (isLoggedIn) {
      if (state.uri.path == '/register' || state.uri.path == '/login') {
        if (isCompanySelected) {
          if (state.uri.path == '/companySelection') {
            return '/';
          }
        } else {
          return '/companySelection';
        }
      }
      if (isCompanySelected) {
        if (state.uri.path == '/companySelection') {
          return '/';
        }
      } else {
        return '/companySelection';
      }
    } else if (state.uri.path != '/register') {
      return '/login';
    }
    return null;
  },
  navigatorKey: _rootNavigatorKey,
  initialLocation: '/',
  routes: [
    ShellRoute(
        navigatorKey: _shellNavigatorKey,
        builder: (context, state, child) {
          return MainScreen(child: child);
        },
        routes: [
          GoRoute(
            parentNavigatorKey: _shellNavigatorKey,
            path: '/',
            builder: (context, state) => const SR1(),
          ),
          GoRoute(
            parentNavigatorKey: _shellNavigatorKey,
            path: '/sr2',
            builder: (context, state) => const SR2(),
          ),
          GoRoute(
            parentNavigatorKey: _shellNavigatorKey,
            path: '/sr3',
            builder: (context, state) => const SR3(),
          ),
          GoRoute(
            parentNavigatorKey: _shellNavigatorKey,
            path: '/sr4',
            builder: (context, state) => const SR4(),
          ),
          ShellRoute(
              parentNavigatorKey: _shellNavigatorKey,
              navigatorKey: _settingsShellNavKey,
              builder: (context, state, child) {
                return SettingsWrapper(child: child);
              },
              routes: [
                GoRoute(
                    parentNavigatorKey: _settingsShellNavKey,
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
      parentNavigatorKey: _rootNavigatorKey,
      path: '/login',
      builder: (context, state) => const Login(),
    ),
    GoRoute(
      parentNavigatorKey: _rootNavigatorKey,
      path: '/companySelection',
      builder: (context, state) => const CompanySelection(),
    ),
    GoRoute(
      parentNavigatorKey: _rootNavigatorKey,
      path: '/register',
      builder: (context, state) => const Register(),
    ),
  ],
);

class StatesDetails {
  static onLogout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool("login", false);
  }

  static onRemoveCompany() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool("company", false);
  }

  /// to obtain the initial route.
  static Future<String> getInitialRoute() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isLoggedIn = prefs.getBool("login") ?? false;
    bool isCompanySelected = prefs.getBool("company") ?? false;
    if (!isLoggedIn) {
      // companyState.clearClientCompany();
      return '/login';
    }
    return '/';
  }
}

class CustomNavigationKeys {
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  static final GlobalKey<ScaffoldState> homeScaffoldKey = GlobalKey();
}

class MainScreen extends StatelessWidget {
  final Widget child;
  const MainScreen({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Container(
            width: 280,
            child: Column(children: [
              ListTile(
                title: const Text("Logout"),
                onTap: () async {
                  SharedPreferences prefs =
                      await SharedPreferences.getInstance();
                  prefs.setBool('login', false);
                  if (context.mounted) {
                    context.go(Uri(
                      path: '/login',
                    ).toString());
                  }
                },
              ),
              ListTile(
                title: const Text("subroute1"),
                onTap: () {
                  context.go(Uri(
                    path: '/',
                  ).toString());
                },
              ),
              ListTile(
                title: const Text("subroute2"),
                onTap: () {
                  context.go(Uri(
                    path: '/sr2',
                  ).toString());
                },
              ),
              ListTile(
                title: const Text("subroute3"),
                onTap: () {
                  context.go(Uri(
                    path: '/sr3',
                  ).toString());
                },
              ),
              ListTile(
                title: const Text("subroute4"),
                onTap: () {
                  context.go(Uri(
                    path: '/sr4',
                  ).toString());
                },
              ),
              ListTile(
                title: const Text("Settings"),
                onTap: () {
                  context.go(Uri(
                    path: '/settings',
                  ).toString());
                },
              ),
            ]),
          ),
          Expanded(child: child)
        ],
      ),
    );
  }
}

class SettingsWrapper extends StatelessWidget {
  final Widget child;
  const SettingsWrapper({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Container(
            width: 280,
            child: Column(children: [
              ListTile(
                title: const Text("settings1"),
                onTap: () {
                  context.go(Uri(
                    path: '/settings',
                  ).toString());
                },
              ),
              ListTile(
                title: const Text("settings2"),
                onTap: () {
                  context.go(Uri(
                    path: '/settings/settings2',
                  ).toString());
                },
              ),
              ListTile(
                title: const Text("settings3"),
                onTap: () {
                  context.go(Uri(
                    path: '/settings/settings3',
                  ).toString());
                },
              ),
              ListTile(
                title: const Text("settings4"),
                onTap: () {
                  context.go(Uri(
                    path: '/settings/settings4',
                  ).toString());
                },
              ),
            ]),
          ),
          Expanded(child: child)
        ],
      ),
    );
  }
}
