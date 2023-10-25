import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:navpoc/states/app_state.dart';
import 'package:provider/provider.dart';

class CompanySelection extends StatelessWidget {
  const CompanySelection({super.key});

  _onSelect(BuildContext context) async {
    context.read<AppStates>().onSelectCompany();
    if (context.mounted) {
      context.go(Uri(
        path: '/',
      ).toString());
    }
  }

  _onLogout(BuildContext context) {
    context.read<AppStates>().onLogOut();
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
