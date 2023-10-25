import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:navpoc/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CompanySelection extends StatelessWidget {
  const CompanySelection({super.key});

  _onSelect(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool("company", true);
    if (context.mounted) {
      context.go(Uri(
        path: '/',
      ).toString());
    }
  }

  _onLogout(BuildContext context) {
    StatesDetails.onLogout();
    context.go(Uri(
      path: '/login',
    ).toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        children: [
          ElevatedButton(
              onPressed: () {
                _onLogout(context);
              },
              child: const Text('logOut')),
          ElevatedButton(
              onPressed: () {
                _onSelect(context);
              },
              child: const Text('select Company')),
        ],
      )),
    );
  }
}
