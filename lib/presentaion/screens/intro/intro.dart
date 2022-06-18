import '../../../../../../presentaion/screens/auth/signin.dart';
import '../../../../../../presentaion/screens/auth/signup.dart';
import '../../../../../../presentaion/widget/custombutton.dart';
import '../../../../../../presentaion/widget/customline.dart';
import '../../../../../../presentaion/widget/customtext.dart';
import '../../../../../../shared/colors.dart';
import '../../../../../../shared/functions.dart';
import '../../../../../../shared/resurces.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../main.dart';

class IntroOnce extends StatefulWidget {
  const IntroOnce({Key? key}) : super(key: key);
  static const String id = 'intro once';

  @override
  State<IntroOnce> createState() => _IntroOnceState();
}

class _IntroOnceState extends State<IntroOnce> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Positioned(
          top: 26.h,
          left: 5.w,
          right: 5.w,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 7.3.h,
                  width: 52.4.w,
                  child: Image.asset(Resurces.logoimg),
                ),
              ],
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Spacer(
                flex: 1,
              ),
              SizedBox(
                width: 80.w,
                child: Column(
                  children: [
                    CustomText(
                      data: App.tr.img1Header1,
                      weight: FontWeight.w500,
                      color: MyColors.secondryColor,
                      size: 11.sp,
                    ),
                    SizedBox(
                      height: .5.h,
                    ),
                    CustomText(
                      data: App.tr.img1Header2,
                      weight: FontWeight.w500,
                      color: MyColors.secondryColor,
                      size: 11.sp,
                    ),
                    SizedBox(
                      height: .5.h,
                    ),
                    CustomText(
                      data: App.tr.doorstep,
                      weight: FontWeight.w500,
                      color: MyColors.secondryColor,
                      size: 11.sp,
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                  ],
                ),
              ),
              CustomButton(
                ontap: () {
                  navigateto(context: context, screen: SignIn.id);
                },
                fontsize: 12.sp,
                fontweight: FontWeight.w600,
                text: App.tr.login,
                height: 7.1.h,
                width: 65.w,
              ),
              SizedBox(
                height: 1.h,
              ),
              CustomButton(
                ontap: () {
                  navigateto(context: context, screen: SignUp.id);
                },
                // ontap: ,
                text: App.tr.createaccount,
                height: 7.1.h,
                width: 65.w,
                fontsize: 12.sp,
                fontweight: FontWeight.w600,

                txtcolor: MyColors.goldColor,
                butcolor: Colors.white,
              ),
              SizedBox(
                height: 3.h,
              ),
              const CustomLine(),
              SizedBox(
                height: 1.h,
              ),
            ],
          ),
        ),
      ],
    ));
  }
}
