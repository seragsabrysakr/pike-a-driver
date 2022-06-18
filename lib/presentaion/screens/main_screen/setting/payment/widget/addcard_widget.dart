import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';

import '../../../../../../main.dart';
import '../../../../../../shared/colors.dart';
import '../../../../../../shared/functions.dart';
import '../../../../../../shared/resurces.dart';
import '../../../../../widget/customline.dart';
import '../../../../../widget/customtext.dart';
import '../../../../../widget/customtextformfield.dart';

// ignore: must_be_immutable
class AddCard extends StatefulWidget {
  const AddCard({Key? key}) : super(key: key);

  @override
  State<AddCard> createState() => _AddCardState();
}

class _AddCardState extends State<AddCard> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final _cardNumController = TextEditingController();

  final _mmController = TextEditingController();

  final _yyController = TextEditingController();

  final _codeController = TextEditingController();

  final _firstNameController = TextEditingController();

  final _lastNameController = TextEditingController();

  bool switshed = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Align(
        alignment: Alignment.bottomCenter,
        child: ClipRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(5.h),
                  topRight: Radius.circular(5.h)),
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: Container(
                height: MediaQuery.of(context).size.height * .79,
                decoration: BoxDecoration(
                  backgroundBlendMode: BlendMode.clear,
                  color: Colors.white.withOpacity(0.2),
                  gradient: LinearGradient(colors: [
                    Colors.white.withOpacity(0.2),
                    Colors.white.withOpacity(0.05)
                  ], begin: Alignment.topLeft, end: Alignment.bottomRight),
                  border: Border.all(color: Colors.white.withOpacity(0.7)),
                ),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
                  child: Container(
                    color: Colors.white.withOpacity(0.7),
                    height: MediaQuery.of(context).size.height * .79,
                    child: Form(
                      key: _formKey,
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        // top: MediaQuery.of(context).size.height * .3,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 5.w, vertical: 1.5.h),
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                _addcardheader(context),
                                //cardform

                                _cardform(),
                                //cardprocess
                                _cardprocess(context),

                                //footer
                                _addcardFooter()
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  _addcardFooter() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: 4.h,
        ),
        const CustomLine(),
      ],
    );
  }

  _addcardheader(context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            InkWell(
              onTap: () {
                navigateback(context: context);
              },
              child: SvgPicture.asset(
                Resurces.canel,
                cacheColorFilter: true,
                height: 10.sp,
              ),
            ),
          ],
        ),
        Container(
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(color: Colors.grey.shade200),
            ),
          ),
          height: MediaQuery.of(context).size.height * .04,
          width: double.infinity,
          child: CustomText(
            data: App.tr.addcardcash,
            color: MyColors.primarColor,
            weight: FontWeight.w700,
            size: 12.sp,
          ),
        ),
        SizedBox(
          height: 2.h,
        ),
      ],
    );
  }

  _cardform() {
    return Column(
      children: [
        CustomTextField(
            controller: _cardNumController,
            type: TextInputType.number,
            width: 90.w,
            action: TextInputAction.next,
            radius: 30,
            hint: App.tr.cardnumplace,
            validator: (String? value) {
              if (value!.isEmpty) {
                return App.tr.nameempty;
              }
              return null;
            }),
        SizedBox(
          height: 2.h,
        ),
        //expiredate
        Row(
          children: [
            CustomText(
              data: App.tr.expie,
              weight: FontWeight.bold,
            ),
            const Spacer(
              flex: 1,
            ),
            Container(
              decoration: BoxDecoration(
                  color: MyColors.textFormColor,
                  borderRadius: BorderRadius.circular(10.h)),
              width: 30.w,
              height: 6.h,
              child: TextField(
                style: TextStyle(
                  color: MyColors.placeHolderColor,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w400,
                ),
                textAlign: TextAlign.center,
                textAlignVertical: TextAlignVertical.center,
                keyboardType: TextInputType.number,
                controller: _mmController,
                cursorColor: MyColors.placeHolderColor,
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: const BorderSide(color: Colors.transparent),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: const BorderSide(color: Colors.transparent),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: const BorderSide(color: Colors.transparent),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: const BorderSide(color: Colors.red),
                    ),
                    hintText: AppLocalizations.of(context)!.cardexpmonthplace,
                    hintStyle: TextStyle(
                        color: MyColors.placeHolderColor,
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w400)),
              ),
            ),
            SizedBox(
              width: 4.w,
            ),
            Container(
              decoration: BoxDecoration(
                  color: MyColors.textFormColor,
                  borderRadius: BorderRadius.circular(10.h)),
              width: 30.w,
              height: 6.h,
              child: TextField(
                style: TextStyle(
                  color: MyColors.placeHolderColor,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w400,
                ),
                textAlign: TextAlign.center,
                textAlignVertical: TextAlignVertical.center,
                keyboardType: TextInputType.number,
                controller: _yyController,
                cursorColor: MyColors.placeHolderColor,
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: const BorderSide(color: Colors.transparent),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: const BorderSide(color: Colors.transparent),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: const BorderSide(color: Colors.transparent),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: const BorderSide(color: Colors.red),
                    ),
                    hintText: AppLocalizations.of(context)!.cardexpyearplace,
                    hintStyle: TextStyle(
                        color: MyColors.placeHolderColor,
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w400)),
              ),
            ),
            SizedBox(
              width: 4.w,
            ),
          ],
        ),
        //code
        SizedBox(
          height: 2.h,
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
          ),
          child: CustomTextField(
              controller: _codeController,
              type: TextInputType.number,
              width: 90.w,
              action: TextInputAction.next,
              radius: 30,
              hint: App.tr
                  .securitycodeplacesecuritycodeplace,
              validator: (String? value) {
                if (value!.isEmpty) {
                  return App.tr.nameempty;
                }
                return null;
              }),
        ),

        //firstname
        SizedBox(
          height: 2.h,
        ),
        CustomTextField(
            controller: _firstNameController,
            type: TextInputType.name,
            width: 90.w,
            action: TextInputAction.next,
            radius: 30,
            hint: App.tr.firstnameplace,
            validator: (String? value) {
              if (value!.isEmpty) {
                return App.tr.nameempty;
              }
              return null;
            }),

        //lasttname
        SizedBox(
          height: 2.h,
        ),
        CustomTextField(
            controller: _lastNameController,
            type: TextInputType.name,
            width: 90.w,
            action: TextInputAction.next,
            radius: 30,
            hint: App.tr.lastnameplace,
            validator: (String? value) {
              if (value!.isEmpty) {
                return App.tr.nameempty;
              }
              return null;
            }),
        SizedBox(
          height: 2.h,
        ),
      ],
    );
  }

  _cardprocess(context) {
    return Column(
      children: [
        SizedBox(
          height: 2.h,
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * .05,
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomText(
                data: App.tr.removecardplace,
                color: MyColors.primarColor,
                weight: FontWeight.w500,
                size: 13.sp,
              ),
              Switch(
                onChanged: (val) {
                  switshed = !switshed;
                },
                value: !switshed,
                activeColor: MyColors.primarColor,
                activeTrackColor: MyColors.goldColor,
                inactiveThumbColor: Colors.grey,
                inactiveTrackColor: Colors.grey.shade400,
              )
            ],
          ),
        ),
        SizedBox(
          height: 6.h,
        ),
        Container(
          width: 70.w,
          height: 5.17.h,
          decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(50)),
          child: ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                  primary: const Color(0xffDADADA),
                  shape: RoundedRectangleBorder(
                      side: const BorderSide(color: MyColors.goldColor),
                      borderRadius: BorderRadius.circular(50))),
              onPressed: () {},
              icon: Row(
                children: [
                  const Icon(
                    Icons.add,
                    color: MyColors.placeHolderColor,
                  ),
                  SizedBox(
                    width: 3.w,
                  ),
                ],
              ),
              label: CustomText(
                data: App.tr.addcard,
                color: MyColors.placeHolderColor,
              )),
        ),
      ],
    );
  }
}
