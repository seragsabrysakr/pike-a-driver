import '../../../shared/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../businesslogic/Auth_cubit/auth_cubit.dart';
import '../../../shared/functions.dart';
import '../../../shared/resurces.dart';
import '../../widget/custombutton.dart';
import '../../widget/customline.dart';
import '../../widget/customtext.dart';
import '../../widget/customtextformfield.dart';
import 'signin.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);
  static const String id = 'signup screen';

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool showPassword = true;
  bool showconfirmPassword = true;
  var namecontroller = TextEditingController();
  var emailcontroller = TextEditingController();
  var phonecontroller = TextEditingController();
  var adresscontroller = TextEditingController();
  var passcontroller = TextEditingController();
  var confirmpasscontroller = TextEditingController();
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
              child: SingleChildScrollView(
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    _signUpHeader(),
                    _signUpForm(),
                    _signUpProcess(),
                    _signUpFooter(),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  _signUpHeader() {
    return Column(
      children: [
        SizedBox(
          height: 8.h,
        ),
        CustomText(
          data: AppLocalizations.of(context)!.signup,
          weight: FontWeight.bold,
          color: MyColors.primarColor,
          size: 25.sp,
        ),
        SizedBox(
          height: 2.h,
        ),
        CustomText(
          data: AppLocalizations.of(context)!.signupheader,
          weight: FontWeight.normal,
          color: MyColors.secondryColor,
          size: 12.sp,
        ),
        SizedBox(
          height: 3.h,
        ),
      ],
    );
  }

  _signUpForm() {
    return Column(
      children: [
        _profilephoto(context),
        SizedBox(
          height: 1.5.h,
        ),
        CustomTextField(
            controller: namecontroller,
            type: TextInputType.name,
            action: TextInputAction.next,
            radius: 30,
            hint: AppLocalizations.of(context)!.namehint,
            validator: (String? value) {
              if (value!.isEmpty) {
                return AppLocalizations.of(context)!.nameempty;
              }
              return null;
            }),
        SizedBox(
          height: 1.5.h,
        ),
        //email form
        CustomTextField(
            controller: emailcontroller,
            type: TextInputType.emailAddress,
            action: TextInputAction.next,
            radius: 30,
            hint: AppLocalizations.of(context)!.emailhint,
            validator: (String? value) {
              if (value!.isEmpty) {
                return AppLocalizations.of(context)!.emailempty;
              }
              return null;
            }),
        //Mobile No form
        SizedBox(
          height: 1.5.h,
        ),
        CustomTextField(
            controller: phonecontroller,
            type: TextInputType.phone,
            action: TextInputAction.next,
            radius: 30,
            hint: AppLocalizations.of(context)!.mobilehint,
            validator: (String? value) {
              if (value!.isEmpty) {
                return AppLocalizations.of(context)!.mobileempty;
              }
              return null;
            }),
        //Address form
        SizedBox(
          height: 1.5.h,
        ),
        CustomTextField(
            controller: adresscontroller,
            type: TextInputType.emailAddress,
            action: TextInputAction.next,
            radius: 30,
            hint: AppLocalizations.of(context)!.addresshint,
            validator: (String? value) {
              if (value!.isEmpty) {
                return AppLocalizations.of(context)!.adressEmpty;
              }
              return null;
            }),

        //password form
        SizedBox(
          height: 1.5.h,
        ),
        CustomTextField(
            controller: passcontroller,
            obscure: showPassword,
            visiblpass: () {
              setState(() {
                showPassword = !showPassword;
              });
            },
            suffix: showconfirmPassword
                ? const Icon(Icons.visibility)
                : const Icon(Icons.visibility_off),
            type: TextInputType.number,
            action: TextInputAction.next,
            radius: 30,
            hint: AppLocalizations.of(context)!.passhint,
            validator: (String? value) {
              if (value!.isEmpty) {
                return AppLocalizations.of(context)!.passsempty;
              }
              return null;
            }),
        //confirmPassword form
        SizedBox(
          height: 1.5.h,
        ),
        CustomTextField(
            controller: confirmpasscontroller,
            obscure: showconfirmPassword,
            visiblpass: () {
              setState(() {
                showconfirmPassword = !showconfirmPassword;
              });
            },
            suffix: showconfirmPassword
                ? const Icon(Icons.visibility)
                : const Icon(Icons.visibility_off),
            type: TextInputType.number,
            action: TextInputAction.done,
            radius: 30,
            hint: AppLocalizations.of(context)!.confirmpasshint,
            validator: (String? value) {
              if (value == null || value != passcontroller.text) {
                return AppLocalizations.of(context)!.confirmempty;
              }
              return null;
            }),
        SizedBox(
          height: 1.5.h,
        ),
        CustomTextField(
            controller: confirmpasscontroller,
            obscure: showconfirmPassword,
            visiblpass: () {
              setState(() {
                showconfirmPassword = !showconfirmPassword;
              });
            },
            suffix: Padding(
              padding: EdgeInsets.only(right: 1.w),
              child: InkWell(
                onTap: () {
                  selectimage(
                    context,
                    camera: () {
                      AuthCubit.get(context).tackphoto(context).then((image) {
                        AuthCubit.get(context).idimage = image;
                      });
                    },
                    gallary: () {
                      AuthCubit.get(context)
                          .gallaryphoto(context)
                          .then((image) {
                        AuthCubit.get(context).idimage = image;
                      });
                    },
                  );
                },
                child: SvgPicture.asset(
                  Resurces.cameraimg,
                ),
              ),
            ),
            type: TextInputType.number,
            action: TextInputAction.done,
            radius: 30,
            hint: 'ID Photo',
            validator: (value) {
              return;
            }),
        SizedBox(
          height: 2.h,
        ),
      ],
    );
  }

  _signUpProcess() {
    return Column(
      children: [
        //signup button
        CustomButton(
          ontap: () {},
          fontsize: 10.sp,
          text: AppLocalizations.of(context)!.signup,
          height: .95.h,
          width: MediaQuery.of(context).size.width * .67,
        ),
        SizedBox(
          height: 6.9.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomText(
              data: AppLocalizations.of(context)!.signupprocess,
              weight: FontWeight.normal,
              color: MyColors.secondryColor,
              family: Resurces.mainfont,
              size: 12.sp,
            ),
            SizedBox(
              width: 2.h,
            ),
            TextButton(
              onPressed: () {
                navigateandreplace(context: context, screen: SignIn.id);
              },
              child: CustomText(
                data: AppLocalizations.of(context)!.login,
                weight: FontWeight.normal,
                color: MyColors.goldColor,
                size: 12.sp,
              ),
            ),
          ],
        ),
      ],
    );
  }

  _signUpFooter() {
    return Column(
      children: [
        const CustomLine(),
        SizedBox(
          height: 1.h,
        ),
      ],
    );
  }

  _profilephoto(context) {
    return Align(
      alignment: Alignment.center,
      child: Stack(
        children: [
          CircleAvatar(
            radius: 8.h,
            backgroundColor: MyColors.textFormColor,
            child: Container(
              height: MediaQuery.of(context).size.width * .4,
              width: MediaQuery.of(context).size.width * .4,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: MyColors.textFormColor,
              ),
              child: AuthCubit.get(context).profileimage == null
                  ? Container()
                  : CircleAvatar(
                      radius: 8.h,
                      backgroundColor: MyColors.textFormColor,
                      backgroundImage:
                          FileImage(AuthCubit.get(context).profileimage!),
                    ),
            ),
          ),
          Positioned(
            bottom: 2.h,
            left: 10,
            right: 10,
            child: InkWell(
              onTap: () {
                selectimage(
                  context,
                  camera: () {
                    AuthCubit.get(context).tackphoto(context).then((image) {
                      AuthCubit.get(context).profileimage = image;
                    });
                  },
                  gallary: () {
                    AuthCubit.get(context).gallaryphoto(context).then((image) {
                      AuthCubit.get(context).profileimage = image;
                    });
                  },
                );
              },
              child: SvgPicture.asset(
                Resurces.cameraimg,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
