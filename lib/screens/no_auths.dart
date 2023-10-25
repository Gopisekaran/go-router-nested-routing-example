import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  _onLogin(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool("login", true);
    prefs.setBool("company", false);
    if (context.mounted) {
      context.go(Uri(
        path: '/companySelection',
      ).toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        children: [
          ElevatedButton(
              onPressed: () {
                _onLogin(context);
              },
              child: const Text('Login')),
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

class Register extends StatelessWidget {
  const Register({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Register"),
      ),
    );
  }
}

class SR1 extends StatelessWidget {
  const SR1({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("SR1"),
      ),
    );
  }
}

class SR2 extends StatelessWidget {
  const SR2({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("SR2"),
      ),
    );
  }
}

class SR3 extends StatelessWidget {
  const SR3({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("SR3"),
      ),
    );
  }
}

class SR4 extends StatelessWidget {
  const SR4({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("SR4"),
      ),
    );
  }
}

class Settings1 extends StatelessWidget {
  const Settings1({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Settings1"),
      ),
    );
  }
}

class Settings2 extends StatelessWidget {
  const Settings2({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Settings2"),
      ),
    );
  }
}

class Settings3 extends StatelessWidget {
  const Settings3({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Settings3"),
      ),
    );
  }
}

class Settings4 extends StatelessWidget {
  const Settings4({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Settings4"),
      ),
    );
  }
}

class Unknown extends StatelessWidget {
  const Unknown({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Unknown"),
      ),
    );
  }
}
