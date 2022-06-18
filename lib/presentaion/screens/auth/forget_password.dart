import '../../../../../../presentaion/screens/auth/confirm_code.dart';
import '../../../../../../presentaion/widget/custombutton.dart';
import '../../../../../../presentaion/widget/customline.dart';
import '../../../../../../presentaion/widget/customtext.dart';
import '../../../../../../presentaion/widget/customtextformfield.dart';
import '../../../../../../shared/colors.dart';
import '../../../../../../shared/functions.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../main.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({Key? key}) : super(key: key);
  static const String id = 'ForgetPassword';

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  var emailcontroller = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Form(
        key: _formKey,
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _forgetPassHeader(),
            _forgetPassForm(),
            const Spacer(
              flex: 1,
            ),
            _forgetPassFooter(),
          ],
        ),
      ),
    );
  }

  _forgetPassHeader() {
    return Column(
      children: [
        SizedBox(
          height: 9.h,
          width: double.infinity,
        ),
        CustomText(
          data: App.tr.resetpassword,
          weight: FontWeight.w800,
          color: MyColors.primarColor,
          size: 25.sp,
        ),
        SizedBox(
          height: 2.h,
        ),
        CustomText(
          data: App.tr.resetpasswordheader1,
          weight: FontWeight.w500,
          color: MyColors.secondryColor,
          size: 12.sp,
        ),
        SizedBox(
          height: 1.h,
        ),
        CustomText(
          data: App.tr.resetpasswordheader2,
          weight: FontWeight.w500,
          color: MyColors.secondryColor,
          size: 12.sp,
        ),
        SizedBox(
          height: 8.h,
        ),
      ],
    );
  }

  _forgetPassForm() {
    return Column(
      children: [
        //email form
        CustomTextField(
            hi: 7.1,
            width: 70.w,
            type: TextInputType.emailAddress,
            action: TextInputAction.done,
            radius: 20.h,
            hint: App.tr.emailhint,
            validator: (String? value) {
              if (value!.isEmpty) {
                return App.tr.emailempty;
              }
              return null;
            }),
        SizedBox(
          height: 3.h,
        ),
//send button
        CustomButton(
          height: 7.1.h,
          width: 70.w,
          butcolor: Colors.white,
          fontweight: FontWeight.w600,
          txtcolor: MyColors.goldColor,
          ontap: () {
            navigateto(context: context, screen: ConfirmCode.id);
          },
          fontsize: 15.sp,
          text: App.tr.send,
        ),
      ],
    );
  }

  _forgetPassFooter() {
    return Column(
      children: [
        const CustomLine(),
        SizedBox(
          height: 1.h,
        ),
      ],
    );
  }
}
