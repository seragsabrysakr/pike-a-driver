import '../../../../main.dart';
import '../../../../presentaion/widget/custombutton.dart';
import '../../../../presentaion/widget/customtext.dart';
import '../../../../presentaion/widget/customtextformfield.dart';
import '../../../../shared/colors.dart';
import '../../../../shared/resurces.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);
  static const String id = 'Profile screen';

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
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
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leadingWidth: 6.w,
        leading: Container(),
        titleSpacing: 0,
        title: CustomText(
          data: App.tr.profile,
          size: 19.sp,
          weight: FontWeight.w800,
        ),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.shopping_cart)),
          SizedBox(
            width: 1.h,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: SizedBox(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _profileHeader(),
                _profileForm(),
                _profileFooter(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _profileHeader() {
    return Column(
      children: [
        SizedBox(
          height: 2.h,
        ),
        CircleAvatar(
          backgroundImage: const AssetImage(Resurces.usereimg),
          radius: 12.w,
        ),
        SizedBox(
          height: 2.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.edit,
              color: MyColors.goldColor,
              size: 12.sp,
            ),
            SizedBox(
              width: 2.w,
            ),
            CustomText(
              weight: FontWeight.w500,
              size: 10.sp,
              data: App.tr.editProfile,
              color: MyColors.goldColor,
            )
          ],
        ),
        SizedBox(
          height: 2.h,
        ),
        CustomText(
          data: 'Hi Serag',
          color: MyColors.primarColor,
          weight: FontWeight.w800,
          size: 16.sp,
        ),
        SizedBox(
          height: .5.h,
        ),
        GestureDetector(
            onTap: () {},
            child: CustomText(
              data: App.tr.signout,
              color: MyColors.secondryColor,
              weight: FontWeight.w500,
              size: 10.sp,
            )),
        SizedBox(
          height: 8.h,
        ),
      ],
    );
  }

  _profileForm() {
    return Column(
      children: [
        CustomTextField(
            width: 74.5.w,
            controller: namecontroller,
            type: TextInputType.name,
            action: TextInputAction.next,
            radius: 30,
            hint: App.tr.namehint,
            validator: (String? value) {
              if (value!.isEmpty) {
                return App.tr.nameempty;
              }
              return null;
            }),
        SizedBox(
          height: 1.5.h,
        ),
        //email form
        CustomTextField(
            width: 74.5.w,
            controller: emailcontroller,
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
        //Mobile No form
        SizedBox(
          height: 1.5.h,
        ),
        CustomTextField(
            width: 74.5.w,
            controller: phonecontroller,
            type: TextInputType.phone,
            action: TextInputAction.next,
            radius: 30,
            hint: App.tr.mobilehint,
            validator: (String? value) {
              if (value!.isEmpty) {
                return App.tr.mobileempty;
              }
              return null;
            }),
        //Address form
        SizedBox(
          height: 1.5.h,
        ),
        CustomTextField(
            width: 74.5.w,
            controller: adresscontroller,
            type: TextInputType.emailAddress,
            action: TextInputAction.next,
            radius: 30,
            hint: App.tr.addresshint,
            validator: (String? value) {
              if (value!.isEmpty) {
                return App.tr.adressEmpty;
              }
              return null;
            }),

        //password form
        SizedBox(
          height: 1.5.h,
        ),
        CustomTextField(
            width: 74.5.w,
            controller: passcontroller,
            obscure: showPassword,
            visiblpass: () {
              setState(() {
                showPassword = !showPassword;
              });
            },
            suffix: showPassword
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
            width: 74.5.w,
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
            hint: App.tr.confirmpasshint,
            validator: (String? value) {
              if (value == null || value != passcontroller.text) {
                return App.tr.confirmempty;
              }
              return null;
            }),
        SizedBox(
          height: 2.h,
        ),
      ],
    );
  }

  _profileFooter() {
    return Column(
      children: [
        SizedBox(
          height: 2.h,
        ),
        CustomButton(
          height: 5.17.h,
          width: 53.8.w,
          butcolor: Colors.white,
          fontweight: FontWeight.w600,
          txtcolor: MyColors.goldColor,
          ontap: () {},
          fontsize: 15.sp,
          text: App.tr.save,
        ),
        SizedBox(
          height: 20.h,
        ),
      ],
    );
  }
}
