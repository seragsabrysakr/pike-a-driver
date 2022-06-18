import 'package:delivery/presentaion/screens/main_screen/notification/notification_screen.dart';
import 'package:flutter/material.dart';

class NotificationNavigator extends StatefulWidget {
  const NotificationNavigator({Key? key}) : super(key: key);

  @override
  _NotificationNavigatorState createState() => _NotificationNavigatorState();
}

GlobalKey<NavigatorState> offersNavigatorKey = GlobalKey<NavigatorState>();

class _NotificationNavigatorState extends State<NotificationNavigator> {
  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: offersNavigatorKey,
      onGenerateRoute: (RouteSettings settings) {
        return MaterialPageRoute(
            settings: settings,
            builder: (BuildContext context) {
              switch (settings.name) {
                case NotificationScreen.id:
                  return const NotificationScreen();
                default:
                  return const NotificationScreen();
              }
            });
      },
    );
  }
}
