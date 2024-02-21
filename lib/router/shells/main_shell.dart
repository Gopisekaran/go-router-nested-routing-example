import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:navpoc/router/routes.dart';
import 'package:navpoc/states/app_state.dart';

class DashBoardShell extends StatefulWidget {
  final Widget child;
  const DashBoardShell({super.key, required this.child});

  @override
  State<DashBoardShell> createState() => _DashBoardShellState();
}

class _DashBoardShellState extends State<DashBoardShell> {
  int selectedIndex = 0;

  _onSelectMenu(int index) {
    menuItems[index].routeDetails.go(context);
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('MainSHell'),
          backgroundColor: Theme.of(context).primaryColor.withOpacity(0.2),
        ),
        bottomNavigationBar: MediaQuery.of(context).size.width >= 1100
            ? null
            : BottomNavigationBar(
                currentIndex: selectedIndex,
                onTap: (index) {
                  _onSelectMenu(index);
                },
                selectedItemColor: Colors.green,
                unselectedItemColor: Colors.green[100],
                items: [
                    ...List.generate(
                      menuItems.length,
                      (index) => BottomNavigationBarItem(
                        icon: Icon(menuItems[index].iconData),
                        tooltip: menuItems[index].title,
                        label: menuItems[index].title,
                      ),
                    ),
                  ]),
        body: MediaQuery.of(context).size.width >= 1100
            ? Row(
                children: [
                  Container(
                    decoration: const BoxDecoration(
                        border: Border(right: BorderSide())),
                    width: 280,
                    child: Column(children: [
                      ...List.generate(
                        menuItems.length,
                        (index) => ListTile(
                          leading: Icon(menuItems[index].iconData),
                          title: Text(menuItems[index].title),
                          onTap: () {
                            _onSelectMenu(index);
                          },
                        ),
                      ),
                      ListTile(
                        title: const Text("Logout"),
                        onTap: () async {
                          context.read<AppStates>().onLogOut();
                          if (context.mounted) {
                            NoAuthRoutes.login.go(context);
                          }
                        },
                      ),
                    ]),
                  ),
                  Expanded(child: widget.child)
                ],
              )
            : widget.child);
  }
}

class MenuItemData {
  MainShellRoutes routeDetails;
  IconData iconData;
  String title;

  MenuItemData({
    required this.routeDetails,
    required this.iconData,
    this.title = '',
  });
}

final List<MenuItemData> menuItems = [
  MenuItemData(
      iconData: Icons.home, title: 'Home', routeDetails: MainShellRoutes.home),
  MenuItemData(
      iconData: Icons.settings,
      title: 'Settings',
      routeDetails: MainShellRoutes.settings),
  MenuItemData(
      iconData: Icons.person,
      title: 'Profile',
      routeDetails: MainShellRoutes.profile),
  MenuItemData(
      iconData: Icons.notifications,
      title: 'Notification',
      routeDetails: MainShellRoutes.notifications)
];
