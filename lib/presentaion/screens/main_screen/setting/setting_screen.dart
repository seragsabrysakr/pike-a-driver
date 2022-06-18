import 'package:delivery/presentaion/screens/main_screen/setting/ourpolicy/our_policy_screen.dart';

import '../../../../main.dart';
import '../../../../presentaion/screens/main_screen/setting/payment/payment_screen.dart';
import 'widget/setting_tem.dart';
import '../../../../presentaion/widget/customtext.dart';
import '../../../../shared/functions.dart';
import '../../../../shared/resurces.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({Key? key}) : super(key: key);
  static const String id = 'more screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: 13.h,
          ),
          //payment
          SettingItem(
              image: Resurces.paymenticon,
              title: App.tr.paymentDetails,
              ontap: () {
                navigateto(context: context, screen: PaymentScreen.id);
              }),
          SizedBox(
            height: 1.h,
          ),
          // myOrder,
          SettingItem(
              image: Resurces.creditandtranzicon,
              title: 'Credit / Transactions',
              ontap: () {}),
          SizedBox(
            height: 1.h,
          ),
          //history
          SettingItem(
              image: Resurces.historyicon, title: 'History', ontap: () {}),
          SizedBox(
            height: 1.h,
          ),
          //aboutus
          SettingItem(
              image: Resurces.aboutusicon,
              title: 'Our Policy',
              ontap: () {
                navigateto(context: context, screen: OurPolicy.id);
              }),
        ],
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      leadingWidth: 6.w,
      leading: Container(),
      titleSpacing: 0,
      title: CustomText(
        data: App.tr.more,
        size: 19.sp,
        weight: FontWeight.w800,
      ),
      actions: [
        IconButton(onPressed: () {}, icon: const Icon(Icons.shopping_cart)),
        SizedBox(
          width: 1.h,
        ),
      ],
    );
  }
}
