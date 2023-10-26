import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:navpoc/states/app_state.dart';
import 'package:provider/provider.dart';

class LoginController extends GetxController {
  var loading = false.obs;
  var textValue = 'hello'.obs;
}

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  _onLogin(BuildContext context) async {
    context.read<AppStates>().onLogin();
    if (context.mounted) {
      context.go(Uri(
        path: '/companySelection',
      ).toString());
    }
  }

  @override
  void initState() {
    print("disposed init");
    Get.put(LoginController());
    super.initState();
  }

  @override
  void dispose() {
    print("disposed login");
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

class SR2Controller extends GetxController {
  var loading = false.obs;
  var textValue = 'hello'.obs;
}

class SR2 extends StatefulWidget {
  const SR2({super.key});

  @override
  State<SR2> createState() => _SR2State();
}

class _SR2State extends State<SR2> {
  _onLogin(BuildContext context) async {
    context.read<AppStates>().onLogin();
    if (context.mounted) {
      context.go(Uri(
        path: '/companySelection',
      ).toString());
    }
  }

  @override
  void initState() {
    print("init sr2");
    Get.put(SR2Controller());
    super.initState();
  }

  @override
  void dispose() {
    print("disposed sr2");
    Get.delete<SR2Controller>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SR2Controller ctrl = Get.find<SR2Controller>();
    return Scaffold(
      body: Obx(() {
        return Center(
            child: Column(
          children: [
            ElevatedButton(
                onPressed: () {
                  ctrl.textValue.value = 'updated';
                },
                child: Text('update text')),
            Text(ctrl.textValue.value),
          ],
        ));
      }),
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
        child: Text("Page Not found"),
      ),
    );
  }
}
