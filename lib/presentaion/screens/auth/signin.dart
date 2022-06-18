import '../../../../../../businesslogic/Auth_cubit/auth_cubit.dart';
import '../../../../../../presentaion/screens/auth/forget_password.dart';
import '../../../../../../presentaion/widget/custombutton.dart';
import '../../../../../../presentaion/widget/customline.dart';
import '../../../../../../presentaion/widget/customtext.dart';
import '../../../../../../presentaion/widget/customtextformfield.dart';
import '../../../../../../shared/colors.dart';
import '../../../../../../shared/functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../../../main.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);
  static const String id = 'login screen';

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  bool showPassword = true;

  var emailController = TextEditingController();

  var passController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            resizeToAvoidBottomInset: false,
            body: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _signInHeader(),
                  _signInForm(context),
                  const Spacer(
                    flex: 1,
                  ),
                  _signInFooter(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  _signInHeader() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: 19.h,
          width: double.infinity,
        ),
        CustomText(
          data: App.tr.login,
          weight: FontWeight.w800,
          color: MyColors.primarColor,
          size: 28.sp,
        ),
        SizedBox(
          height: 2.h,
        ),
        CustomText(
          data: App.tr.loginheader,
          weight: FontWeight.w500,
          color: MyColors.secondryColor,
          size: 14.sp,
        ),
        SizedBox(
          height: 8.h,
        ),
      ],
    );
  }

  _signInForm(context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        //email form
        CustomTextField(
            hi: 7.1,
            type: TextInputType.emailAddress,
            action: TextInputAction.next,
            radius: 30,
            hint: App.tr.emailhint,
            validator: (String? value) {
              if (value!.isEmpty) {
                return App.tr.emailempty;
              }
              return null;
            }),
        SizedBox(
          height: 2.h,
        ),
        //password form
        CustomTextField(
            hi: 7.1,
            obscure: showPassword,
            visiblpass: () {
              setState(() {
                showPassword = !showPassword;
              });
            },
            suffix:showPassword
                ? const Icon(Icons.visibility)
                : const Icon(Icons.visibility_off),
            type: TextInputType.number,
            action: TextInputAction.done,
            radius: 30,
            hint: App.tr.passhint,
            validator: (String? value) {
              if (value!.isEmpty) {
                return App.tr.passsempty;
              }
              return null;
            }),
        SizedBox(
          height: 2.h,
        ),
        //login button
        CustomButton(
          height: 7.1.h,
          width: 80.w,
          fontsize: 15.sp,
          fontweight: FontWeight.w600,
          butcolor: Colors.white,
          txtcolor: MyColors.goldColor,
          ontap: () {
            navigateto(context: context, screen: ForgetPassword.id);
          },
          text: App.tr.login,
        ),
        SizedBox(
          height: .3.h,
        ),
        //forget password
        TextButton(
          onPressed: () {
            navigateto(context: context, screen: ForgetPassword.id);
          },
          child: CustomText(
            data: App.tr.loginforgetpass,
            weight: FontWeight.w500,
            color: MyColors.secondryColor,
            size: 12.sp,
          ),
        ),
      ],
    );
  }
  _signInFooter() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const CustomLine(),
        SizedBox(
          height: 3.h,
        )
      ],
    );
  }
}
