import 'package:flutter/material.dart';
import 'package:navpoc/router/routes.dart';

class SettingsShell extends StatelessWidget {
  final Widget child;
  const SettingsShell({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.secondary,
      ),
      body: Row(
        children: [
          Container(
            decoration: const BoxDecoration(
                boxShadow: [], border: Border(right: BorderSide())),
            width: 280,
            child: Column(children: [
              ListTile(
                title: const Text("Profile Settings"),
                onTap: () {
                  SettingsShellRoutes.profileSettings.go(context);
                },
              ),
              ListTile(
                title: const Text("General"),
                onTap: () {
                  SettingsShellRoutes.general.go(context);
                },
              ),
              ListTile(
                title: const Text("Theme"),
                onTap: () {
                  SettingsShellRoutes.theme.go(context);
                },
              ),
              ListTile(
                title: const Text("Others"),
                onTap: () {
                  SettingsShellRoutes.others.go(context);
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
