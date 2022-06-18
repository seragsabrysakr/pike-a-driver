import 'package:delivery/presentaion/screens/main_screen/setting/ourpolicy/our_policy_screen.dart';

import '../setting/credit/credit_screen.dart';
import '../setting/setting_screen.dart';
import '../../../../../presentaion/screens/main_screen/setting/payment/payment_screen.dart';
import '../../../../../presentaion/screens/maps/track_order_map.dart';
import 'package:flutter/material.dart';

class SettingNavigator extends StatefulWidget {
  const SettingNavigator({Key? key}) : super(key: key);

  @override
  _SettingNavigatorState createState() => _SettingNavigatorState();
}

GlobalKey<NavigatorState> moreNavigatorKey = GlobalKey<NavigatorState>();

class _SettingNavigatorState extends State<SettingNavigator> {
  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: moreNavigatorKey,
      onGenerateRoute: (RouteSettings settings) {
        return MaterialPageRoute(
            settings: settings,
            builder: (BuildContext context) {
              switch (settings.name) {
                case SettingScreen.id:
                  return const SettingScreen();
                case OurPolicy.id:
                  return const OurPolicy();

                case PaymentScreen.id:
                  return const PaymentScreen();
                case TrackOrderMap.id:
                  return TrackOrderMap();
                case CreditScreen.id:
                  return const CreditScreen();

                default:
                  return const SettingScreen();
              }
            });
      },
    );
  }
}
