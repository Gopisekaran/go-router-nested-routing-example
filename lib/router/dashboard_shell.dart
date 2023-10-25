import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:navpoc/states/app_state.dart';
import 'package:provider/provider.dart';

class DashBoardShell extends StatelessWidget {
  final Widget child;
  const DashBoardShell({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          SizedBox(
            width: 280,
            child: Column(children: [
              ListTile(
                title: const Text("Logout"),
                onTap: () async {
                  context.read<AppStates>().onLogOut();
                  if (context.mounted) {
                    context.go(Uri(
                      path: '/login',
                    ).toString());
                  }
                },
              ),
              ListTile(
                title: const Text("subroute1"),
                onTap: () {
                  context.go(Uri(
                    path: '/',
                  ).toString());
                },
              ),
              ListTile(
                title: const Text("subroute2"),
                onTap: () {
                  context.go(Uri(
                    path: '/sr2',
                  ).toString());
                },
              ),
              ListTile(
                title: const Text("subroute3"),
                onTap: () {
                  context.go(Uri(
                    path: '/sr3',
                  ).toString());
                },
              ),
              ListTile(
                title: const Text("subroute4"),
                onTap: () {
                  context.go(Uri(
                    path: '/sr4',
                  ).toString());
                },
              ),
              ListTile(
                title: const Text("Settings"),
                onTap: () {
                  context.go(Uri(
                    path: '/settings',
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
