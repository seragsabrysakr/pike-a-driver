import 'package:flutter/material.dart';

import '../../../../../presentaion/screens/main_screen/profile/profile_screen.dart';

class ProfileNavigator extends StatefulWidget {
  const ProfileNavigator({Key? key}) : super(key: key);

  @override
  _ProfileNavigatorState createState() => _ProfileNavigatorState();
}

GlobalKey<NavigatorState> profileNavigatorKey = GlobalKey<NavigatorState>();

class _ProfileNavigatorState extends State<ProfileNavigator> {
  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: profileNavigatorKey,
      onGenerateRoute: (RouteSettings settings) {
        return MaterialPageRoute(
            settings: settings,
            builder: (BuildContext context) {
              switch (settings.name) {
                case ProfileScreen.id:
                  return const ProfileScreen();
                default:
                  return const ProfileScreen();
              }
            });
      },
    );
  }
}
