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
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ElevatedButton(
              onPressed: () {
                _onSelect(context);
              },
              child: const Text('select User')),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
              onPressed: () {
                _onLogout(context);
              },
              child: const Text('logOut')),
        ],
      )),
    );
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Home"),
      ),
    );
  }
}

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Profile"),
      ),
    );
  }
}

class Notifications extends StatelessWidget {
  const Notifications({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Notifications"),
      ),
    );
  }
}

class ProfileSettings extends StatelessWidget {
  const ProfileSettings({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("ProfileSettings"),
      ),
    );
  }
}

class General extends StatelessWidget {
  const General({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("General"),
      ),
    );
  }
}

class ThemeSettings extends StatelessWidget {
  const ThemeSettings({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("ThemeSettings"),
      ),
    );
  }
}

class OthersSettings extends StatelessWidget {
  const OthersSettings({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("OthersSettings"),
      ),
    );
  }
}
