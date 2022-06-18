import 'package:delivery/presentaion/screens/main_screen/myorders/mymorder_screen.dart';
import 'package:delivery/presentaion/screens/main_screen/setting/payment/payment_screen.dart';
import '../../../../presentaion/screens/auth/change_password.dart';
import '../../../../presentaion/screens/auth/confirm_code.dart';
import '../../../../presentaion/screens/auth/forget_password.dart';
import '../../../../presentaion/screens/auth/signin.dart';
import '../../../../presentaion/screens/auth/signup.dart';
import '../../../../presentaion/screens/intro/intro.dart';
import '../../../../presentaion/screens/mainscreen.dart';
import '../../../../presentaion/screens/maps/change_adress_map.dart';
import '../../../../presentaion/screens/maps/track_order_map.dart';
import 'package:flutter/material.dart';
import 'presentaion/screens/main_screen/myorders/end_order_screen.dart';

class AppRoutes {
  static Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case IntroOnce.id:
        return MaterialPageRoute(builder: (context) => const IntroOnce());
      case MainScreen.id:
        return MaterialPageRoute(builder: (context) => const MainScreen());
      case SignIn.id:
        return MaterialPageRoute(builder: (context) => const SignIn());
      case SignUp.id:
        return MaterialPageRoute(builder: (context) => const SignUp());
      case ForgetPassword.id:
        return MaterialPageRoute(builder: (context) => const ForgetPassword());
      case ConfirmCode.id:
        return MaterialPageRoute(builder: (context) => const ConfirmCode());
      case ChangePassword.id:
        return MaterialPageRoute(builder: (context) => const ChangePassword());
     
      case MyOrderScreen.id:
        return MaterialPageRoute(builder: (context) => const MyOrderScreen());
      case PaymentScreen.id:
        return MaterialPageRoute(builder: (context) => const PaymentScreen());
      case EndOrder.id:
        return MaterialPageRoute(builder: (context) => const EndOrder());
      
      case ChangeAdressMap.id:
        return MaterialPageRoute(builder: (context) => const ChangeAdressMap());
      case TrackOrderMap.id:
        return MaterialPageRoute(builder: (context) => TrackOrderMap());
      
      default:
        return undefineRout();
    }
  }

  static Route<dynamic> undefineRout() {
    return MaterialPageRoute(builder: (context) => const IntroOnce());
  }
}
