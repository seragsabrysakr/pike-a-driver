import 'package:delivery/presentaion/screens/main_screen/myorders/end_order_screen.dart';
import 'package:delivery/presentaion/screens/main_screen/myorders/mymorder_screen.dart';
import 'package:flutter/material.dart';

class HomeNavigator extends StatefulWidget {
  const HomeNavigator({Key? key}) : super(key: key);

  @override
  _HomeNavigatorState createState() => _HomeNavigatorState();
}

GlobalKey<NavigatorState> homeNavigatorKey = GlobalKey<NavigatorState>();

class _HomeNavigatorState extends State<HomeNavigator> {
  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: homeNavigatorKey,
      onGenerateRoute: (RouteSettings settings) {
        return MaterialPageRoute(
            settings: settings,
            builder: (BuildContext context) {
              switch (settings.name) {
                case MyOrderScreen.id:
                  return const MyOrderScreen();
                case EndOrder.id:
                  return const EndOrder();

                default:
                  return const MyOrderScreen();
              }
            });
      },
    );
  }
}
