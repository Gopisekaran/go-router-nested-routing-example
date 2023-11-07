import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:navpoc/router/app_router.dart';
import 'package:navpoc/states/app_state.dart';
import 'package:provider/provider.dart';

class DashBoardShell extends StatelessWidget {
  final Widget child;
  const DashBoardShell({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Row(
        children: [
          Container(
            decoration:
                const BoxDecoration(border: Border(right: BorderSide())),
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
                  shellNavigatorKey.currentContext!.go(Uri(
                    path: '/',
                  ).toString());
                },
              ),
              ListTile(
                title: const Text("subroute2"),
                onTap: () {
                  shellNavigatorKey.currentContext!.go(Uri(
                    path: '/sr2',
                  ).toString());
                },
              ),
              ListTile(
                title: const Text("subroute3"),
                onTap: () {
                  shellNavigatorKey.currentContext!.go(Uri(
                    path: '/sr3',
                  ).toString());
                },
              ),
              ListTile(
                title: const Text("subroute4"),
                onTap: () {
                  shellNavigatorKey.currentContext!.go(Uri(
                    path: '/sr4',
                  ).toString());
                },
              ),
              ListTile(
                title: const Text("Settings"),
                onTap: () {
                  shellNavigatorKey.currentContext!.go(Uri(
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
