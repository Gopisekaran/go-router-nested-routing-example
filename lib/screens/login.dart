import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:navpoc/router/routes.dart';
import 'package:navpoc/states/app_state.dart';
import 'package:provider/provider.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  _onLogin(BuildContext context) async {
    context.read<AppStates>().onLogin();
    if (context.mounted) {
      MainShellRoutes.selectuser.go(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ElevatedButton(
              onPressed: () {
                _onLogin(context);
              },
              child: const Text('Login')),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
              onPressed: () {
                context.go(Uri(
                  path: '/register',
                ).toString());
              },
              child: const Text('Register')),
        ],
      )),
    );
  }
}
