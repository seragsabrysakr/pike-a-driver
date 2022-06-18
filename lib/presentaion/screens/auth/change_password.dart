import '../../../../../../presentaion/screens/mainscreen.dart';

import '../../../../../../main.dart';

import '../../../../../../presentaion/widget/custombutton.dart';
import '../../../../../../presentaion/widget/customline.dart';
import '../../../../../../presentaion/widget/customtext.dart';
import '../../../../../../presentaion/widget/customtextformfield.dart';
import '../../../../../../shared/colors.dart';
import '../../../../../../shared/functions.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({Key? key}) : super(key: key);
  static const String id = 'ChangePassword';

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  var passController = TextEditingController();
  var confirmpasscontroller = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  FocusNode focusNode = FocusNode();
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
            _changePassHeader(),
            _changePassForm(),
            const Spacer(
              flex: 1,
            ),
            _changePassFooter(),
          ],
        ),
      ),
    );
  }

  _changePassHeader() {
    return Column(
      children: [
        SizedBox(
          height: 8.h,
          width: double.infinity,
        ),
        CustomText(
          data: App.tr.newpasshint,
          weight: FontWeight.w800,
          color: MyColors.primarColor,
          size: 25.sp,
        ),
        SizedBox(
          height: 2.h,
        ),
        //worng
        CustomText(
          data: App.tr.resetpasswordheader1,
          weight: FontWeight.w500,
          color: MyColors.secondryColor,
          size: 13.sp,
        ),
        SizedBox(
          height: .7.h,
        ),
        CustomText(
          data: App.tr.resetpasswordheader2,
          weight: FontWeight.w500,
          color: MyColors.primarColor,
          size: 13.sp,
        ),
        SizedBox(
          height: 5.5.h,
        ),
      ],
    );
  }

  _changePassForm() {
    return Column(
      children: [
        //email form
        CustomTextField(
            width: 75.w,
            hi: 7.1,
            controller: passController,
            type: TextInputType.number,
            action: TextInputAction.next,
            radius: 20.h,
            hint: App.tr.newpasshint,
            validator: (String? value) {
              if (value!.isEmpty) {
                return App.tr.passsempty;
              }
              return null;
            }),
        SizedBox(
          height: 1.7.h,
        ), //email form
        CustomTextField(
            width: 75.w,
            hi: 7.1,
            controller: confirmpasscontroller,
            type: TextInputType.number,
            action: TextInputAction.done,
            focusNode: focusNode,
            radius: 20.h,
            hint: App.tr.confirmpasshint,
            validator: (String? value) {
              if (value!.isEmpty) {
                return App.tr.confirmempty;
              }
              return null;
            }),
        SizedBox(
          height: 1.7.h,
        ),
//next button
        CustomButton(
          width: 75.w,
          height: 7.1.h,
          butcolor: Colors.white,
          fontweight: FontWeight.w600,
          txtcolor: MyColors.goldColor,
          ontap: () {
            focusNode.unfocus();
            navigateto(context: context, screen: MainScreen.id);
          },
          fontsize: 15.sp,
          text: App.tr.next,
        ),
      ],
    );
  }

  _changePassFooter() {
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
