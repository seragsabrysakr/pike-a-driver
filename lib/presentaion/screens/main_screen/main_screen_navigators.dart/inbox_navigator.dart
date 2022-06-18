import 'package:delivery/presentaion/screens/main_screen/inbox/inbox_screen.dart';


import 'package:flutter/material.dart';

class MenuNavigator extends StatefulWidget {
  const MenuNavigator({Key? key}) : super(key: key);

  @override
  _MenuNavigatorState createState() => _MenuNavigatorState();
}

GlobalKey<NavigatorState> menuNavigatorKey = GlobalKey<NavigatorState>();

class _MenuNavigatorState extends State<MenuNavigator> {
  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: menuNavigatorKey,
      onGenerateRoute: (RouteSettings settings) {
        return MaterialPageRoute(
            settings: settings,
            builder: (BuildContext context) {
              switch (settings.name) {
                case InBoxScreen.id:
                  return InBoxScreen();
                
                default:
                  return InBoxScreen();
              }
            });
      },
    );
  }
}
