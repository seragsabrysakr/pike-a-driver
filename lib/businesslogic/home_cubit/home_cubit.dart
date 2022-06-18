import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import '../../presentaion/screens/main_screen/main_screen_navigators.dart/myorder_navigator.dart';
import '../../presentaion/screens/main_screen/main_screen_navigators.dart/inbox_navigator.dart';
import '../../presentaion/screens/main_screen/main_screen_navigators.dart/setting_navigator.dart';
import '../../presentaion/screens/main_screen/main_screen_navigators.dart/notify_navigator.dart';
import '../../presentaion/screens/main_screen/main_screen_navigators.dart/profile_navigator.dart';
part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(AppInitial());
  static HomeCubit get(context) => BlocProvider.of(context);

  //position
  int selectedPosition = 4;

  List<GlobalKey<NavigatorState>> navigatorKeys = [
    menuNavigatorKey,
    offersNavigatorKey,
    profileNavigatorKey,
    moreNavigatorKey,
    homeNavigatorKey,
  ];

//navbar screens
  List<Widget> screens = [
    const MenuNavigator(),
    const NotificationNavigator(),
    const ProfileNavigator(),
    const SettingNavigator(),
    const HomeNavigator(),
  ];

//navbar icons
  List<Widget> iconslist = [
    const Icon(Icons.menu, size: 30),
    const Icon(Icons.local_offer_outlined, size: 30),
    const Icon(
      Icons.home,
      size: 30,
      color: Colors.purple,
    ),
    const Icon(Icons.person, size: 30),
    const Icon(Icons.more, size: 30),
  ];

  //navbar titles

//change index
  void changeindex(int i) {
    selectedPosition = i;

    emit(AppChangeNavScreen());
  }
}
