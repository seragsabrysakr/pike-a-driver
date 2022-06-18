import '../../../../../../presentaion/screens/auth/change_password.dart';
import '../../../../../../presentaion/screens/auth/signin.dart';
import '../../../../../../presentaion/widget/custombutton.dart';
import '../../../../../../presentaion/widget/customline.dart';
import '../../../../../../presentaion/widget/customotp.dart';
import '../../../../../../presentaion/widget/customtext.dart';
import '../../../../../../shared/colors.dart';
import '../../../../../../shared/functions.dart';
import '../../../../../../shared/resurces.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';

import '../../../main.dart';

class ConfirmCode extends StatefulWidget {
  const ConfirmCode({Key? key}) : super(key: key);
  static const String id = 'confirm code';

  @override
  State<ConfirmCode> createState() => _ConfirmCodeState();
}

class _ConfirmCodeState extends State<ConfirmCode> {
  // 4 text editing controllers that associate with the 4 input fields
  final TextEditingController _fieldOne = TextEditingController();
  final TextEditingController _fieldTwo = TextEditingController();
  final TextEditingController _fieldThree = TextEditingController();
  final TextEditingController _fieldFour = TextEditingController();

  // This is the entered code
  // It will be displayed in a Text widget
  // ignore: unused_field
  String? _otp;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            _otpHeader(),
            _otprow(),
            SizedBox(
              height: 6.h,
            ),
            _otpProcess(),
            const Spacer(
              flex: 1,
            ),
            _otpFooter(),
          ],
        ),
      ),
    );
  }

  _otpHeader() {
    return Column(
      children: [
        SizedBox(
          height: 6.h,
        ),
        CustomText(
          data: App.tr.conirmcodeheader1,
          weight: FontWeight.w800,
          color: MyColors.primarColor,
          size: 20.sp,
        ),
        SizedBox(
          height: .3.h,
        ),
        CustomText(
          data: App.tr.conirmcodeheader2,
          weight: FontWeight.w800,
          color: MyColors.secondryColor,
          size: 20.sp,
        ),
        SizedBox(
          height: 2.h,
        ),
        CustomText(
          data: App.tr.conirmcodeheader3,
          weight: FontWeight.w500,
          color: MyColors.primarColor,
          size: 11.sp,
        ),
        SizedBox(
          height: .3.h,
        ),
        CustomText(
          data: App.tr.conirmcodeheader4,
          weight: FontWeight.w500,
          color: MyColors.secondryColor,
          size: 11.sp,
        ),
        SizedBox(
          height: 6.h,
        ),
      ],
    );
  }

  _otprow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        OtpInput(_fieldOne, true),
        SizedBox(width: 6.w),
        OtpInput(_fieldTwo, false),
        SizedBox(width: 6.w),
        OtpInput(_fieldThree, false),
        SizedBox(width: 6.w),
        OtpInput(_fieldFour, false)
      ],
    );
  }

  _otpProcess() {
    return Column(
      children: [
        //signup button
        CustomButton(
          height: 7.1.h,
          width: 59.w,
          butcolor: Colors.white,
          fontweight: FontWeight.w600,
          txtcolor: MyColors.goldColor,
          ontap: () {
            setState(() {
              _otp = _fieldOne.text +
                  _fieldTwo.text +
                  _fieldThree.text +
                  _fieldFour.text;
            });
            navigateto(context: context, screen: ChangePassword.id);
          },
          fontsize: 15.sp,
          text: AppLocalizations.of(context)!.next,
        ),
        SizedBox(
          height: 4.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomText(
              data: App.tr.otpnotrecieve,
              weight: FontWeight.w500,
              color: MyColors.secondryColor,
              family: Resurces.mainfont,
              size: 12.sp,
            ),
            SizedBox(
              width: .3.h,
            ),
            GestureDetector(
              onTap: () {
                navigateandreplace(context: context, screen: SignIn.id);
              },
              child: CustomText(
                data: App.tr.clickhere,
                weight: FontWeight.w700,
                color: MyColors.goldColor,
                size: 12.sp,
              ),
            ),
          ],
        ),
      ],
    );
  }

  _otpFooter() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const CustomLine(),
        SizedBox(
          height: 1.h,
        ),
      ],
    );
  }
}
