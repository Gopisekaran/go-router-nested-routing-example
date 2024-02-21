import 'package:flutter/material.dart';
import 'package:navpoc/router/router_config.dart';
import 'package:navpoc/states/app_state.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_strategy/url_strategy.dart';

void main() async {
  setPathUrlStrategy();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool isLoggedIn = prefs.getBool("login") ?? false;
  bool isCompanySelected = prefs.getBool("company") ?? false;
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (_) => AppStates(isLoggedIn, isCompanySelected))
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({
    super.key,
  });

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: RouterHelper.routeConfig(
          context.watch<AppStates>().getLoginStatus,
          context.watch<AppStates>().getCompanyStatus),
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
    );
  }
}
