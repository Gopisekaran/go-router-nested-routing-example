import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:navpoc/controllers/controllers.dart';
import 'package:navpoc/states/app_state.dart';
import 'package:provider/provider.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  _onLogin(BuildContext context) async {
    AppStateGetx.instance.onLogin();
    if (context.mounted) {
      context.go(Uri(
        path: '/companySelection',
      ).toString());
    }
  }

  @override
  void initState() {
    Get.put(LoginController());
    super.initState();
  }

  @override
  void dispose() {
    Get.delete<LoginController>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    LoginController ctrl = Get.find<LoginController>();
    return Scaffold(
      body: Obx(() {
        return Center(
            child: Column(
          children: [
            ElevatedButton(
                onPressed: () {
                  _onLogin(context);
                },
                child: const Text('Login')),
            Text(ctrl.textValue.value),
            Text(ctrl.update1.value.toString()),
            ElevatedButton(
                onPressed: () {
                  ctrl.update1.value = ctrl.update1.value + 1;
                },
                child: const Text('plus')),
            ElevatedButton(
                onPressed: () {
                  context.go(Uri(
                    path: '/register',
                  ).toString());
                },
                child: const Text('Register')),
          ],
        ));
      }),
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

abstract class CompanyShellStateFuWidget extends StatefulWidget {
  final String company;

  const CompanyShellStateFuWidget({super.key, required this.company});
}

class SR1 extends CompanyShellStateFuWidget {
  const SR1({super.key, required super.company});

  @override
  State<SR1> createState() => _SR1State();
}

class _SR1State extends State<SR1> {
  @override
  void initState() {
    print("init sr2");
    Get.put(SR1Controller("sr1 happiest"));
    super.initState();
  }

  @override
  void dispose() {
    print("disposed sr2");
    Get.delete<SR1Controller>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SR1Controller ctrl = Get.find<SR1Controller>();
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Text(ctrl.textValue),
            const Text("SR1"),
          ],
        ),
      ),
    );
  }
}

class SR2 extends StatefulWidget {
  const SR2({super.key});

  @override
  State<SR2> createState() => _SR2State();
}

class _SR2State extends State<SR2> {
  _onLogin(BuildContext context) async {
    AppStateGetx.instance.onLogin();
    if (context.mounted) {
      context.go(Uri(
        path: '/companySelection',
      ).toString());
    }
  }

  @override
  void initState() {
    Get.put(SR2Controller("sr2 happiest"));
    super.initState();
  }

  @override
  void dispose() {
    Get.delete<SR2Controller>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SR2Controller ctrl = Get.find<SR2Controller>();
    return Scaffold(
        body: Center(
            child: Column(
      children: [
        Text(ctrl.textValue),
      ],
    )));
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
        child: Text("Page Not found"),
      ),
    );
  }
}
