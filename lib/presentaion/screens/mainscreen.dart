import '../../../../businesslogic/home_cubit/home_cubit.dart';
import '../../../../main.dart';
import 'main_screen/main_screen_navigators.dart/myorder_navigator.dart';
import 'main_screen/main_screen_navigators.dart/inbox_navigator.dart';
import 'main_screen/main_screen_navigators.dart/setting_navigator.dart';
import 'main_screen/main_screen_navigators.dart/notify_navigator.dart';
import 'main_screen/main_screen_navigators.dart/profile_navigator.dart';
import '../../../../presentaion/screens/main_screen/widget/tabitem.dart';
import '../../../../presentaion/widget/customline.dart';
import '../../../../shared/colors.dart';
import '../../../../shared/resurces.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';

class MainScreen extends StatelessWidget {
  static late BuildContext mainContext;
  const MainScreen({Key? key}) : super(key: key);
  static const String id = 'Main screen';

  @override
  Widget build(BuildContext context) {
    mainContext = context;
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        systemNavigationBarColor: Colors.white, // navigation bar color
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.dark // status bar color
        ));
    final bool showFab = MediaQuery.of(context).viewInsets.bottom != 0.0;
    return BlocProvider<HomeCubit>(
      create: (context) => HomeCubit(),
      child: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {},
        builder: (context, state) {
          HomeCubit appcubit = HomeCubit.get(context);

          return WillPopScope(
            onWillPop: () async {
              if (HomeCubit.get(context)
                  .navigatorKeys[HomeCubit.get(context).selectedPosition]
                  .currentState!
                  .canPop()) {
                HomeCubit.get(context)
                    .navigatorKeys[HomeCubit.get(context).selectedPosition]
                    .currentState
                    ?.pop(HomeCubit.get(context)
                        .navigatorKeys[HomeCubit.get(context).selectedPosition]
                        .currentContext);
                return false;
              } else {
                SystemChannels.platform
                    .invokeMethod<void>('SystemNavigator.pop');
                return true;
              }
            },
            child: Scaffold(
              extendBody: true,
              extendBodyBehindAppBar: true,
              floatingActionButton: _floating(context, showFab),
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.centerDocked,
              bottomNavigationBar: _buildBottomTab(context),
              body: IndexedStack(
                index: appcubit.selectedPosition,
                children: const <Widget>[
                  MenuNavigator(),
                  NotificationNavigator(),
                  ProfileNavigator(),
                  SettingNavigator(),
                  HomeNavigator(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  _floating(context, bool showFab) {
    return Visibility(
      visible: !showFab,
      child: FloatingActionButton(
        clipBehavior: Clip.none,
        onPressed: () {
          HomeCubit.get(context).changeindex(4);
        },
        isExtended: true,
        backgroundColor: Colors.transparent,
        child: CircleAvatar(
            radius: 40,
            // ignore: unrelated_type_equality_checks
            backgroundColor: HomeCubit.get(context).selectedPosition == 4
                ? MyColors.goldColor
                : MyColors.placeHolderColor,
            child: SvgPicture.asset(Resurces.homeicon)),
      ),
    );
  }

  _buildBottomTab(context) {
    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      notchMargin: 12,
      child: SizedBox(
        height: MediaQuery.of(context).size.height * .10,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                //menu
                TabItem(
                  text: App.tr.inbox,
                  icon: Resurces.inboxicon,
                  isSelected: HomeCubit.get(context).selectedPosition == 0,
                  onTap: () {
                    HomeCubit.get(context).changeindex(0);
                  },
                ),
                //offers
                TabItem(
                  text: 'Notify',
                  icon: Resurces.notuficationicon,
                  isSelected: HomeCubit.get(context).selectedPosition == 1,
                  onTap: () {
                    HomeCubit.get(context).changeindex(1);
                  },
                ),
                SizedBox(
                  width: 10.w,
                ),
                //profile
                TabItem(
                  text: App.tr.profile,
                  icon: Resurces.profileicon,
                  isSelected: HomeCubit.get(context).selectedPosition == 2,
                  onTap: () {
                    HomeCubit.get(context).changeindex(2);
                  },
                ),
                //more
                TabItem(
                  text: 'Setting',
                  icon: Resurces.settingicon,
                  isSelected: HomeCubit.get(context).selectedPosition == 3,
                  onTap: () {
                    HomeCubit.get(context).changeindex(3);
                  },
                ),
              ],
            ),
            const CustomLine()
          ],
        ),
      ),
    );
  }
}
