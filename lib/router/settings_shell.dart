import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SettingsShell extends StatelessWidget {
  final Widget child;
  const SettingsShell({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          SizedBox(
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
