import '../../../../../../presentaion/widget/customtext.dart';
import '../../../../../../shared/colors.dart';
import '../../../../../../shared/functions.dart';
import '../../../../../../shared/resurces.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

import '../../../../../main.dart';

class CreditScreen extends StatelessWidget {
  const CreditScreen({Key? key}) : super(key: key);
  static const String id = 'CreditScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            navigateback(context: context);
          },
          child: const Icon(Icons.arrow_back_ios),
        ),
        title: CustomText(
          data: App.tr.creditTitle,
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
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _logo(),
            _totalOrders(),
            _yourCredit(),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _orderPoints(),
                _rewardes()
              ],
            )
          ],
        ),
      ),
    );
  }

   Widget _rewardes() {
    return Container(
                height: 12.h,
                width: 44.2.w,
                decoration: BoxDecoration(
                    color: MyColors.cardColors,
                    borderRadius: BorderRadius.circular(3.h)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomText(
                      data: App.tr.rewards,
                      weight: FontWeight.w400,
                      size: 13.sp,
                      color: MyColors.placeHolderColor,
                    ),
                    CustomText(
                      data: '15 USD',
                      weight: FontWeight.w800,
                      size: 24.sp,
                      color: MyColors.placeHolderColor,
                    ),
                  ],
                ),
              );
  }

  Widget _orderPoints() {
    return Container(
                height: 12.h,
                width: 44.2.w,
                decoration: BoxDecoration(
                    color: MyColors.cardColors,
                    borderRadius: BorderRadius.circular(3.h)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomText(
                      data: App.tr.orderPoints,
                      weight: FontWeight.w400,
                      size: 13.sp,
                      color: MyColors.placeHolderColor,
                    ),
                    CustomText(
                      data: '500',
                      weight: FontWeight.w800,
                      size: 24.sp,
                      color: MyColors.placeHolderColor,
                    ),
                  ],
                ),
              );
  }

  Widget _yourCredit() {
    return Column(
            children: [
              Container(
                height: 16.h,
                width: 88.2.w,
                decoration: BoxDecoration(
                    color: MyColors.cardColors,
                    borderRadius: BorderRadius.circular(7.h)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomText(
                      data: App.tr.yourCredit,
                      weight: FontWeight.w400,
                      size: 28.sp,
                      color: MyColors.primarColor,
                    ),
                    CustomText(
                      data: '3.4K',
                      weight: FontWeight.w800,
                      size: 45.sp,
                      color: MyColors.goldColor,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 5.h,
              ),
            ],
          );
  }

  Widget _totalOrders() {
    return Column(
            children: [
              SizedBox(
                height: 1.h,
              ),
              CustomText(
                data: App.tr.totalOrders,
                weight: FontWeight.w400,
                size: 12.sp,
                color: MyColors.placeHolderColor,
              ),
              CustomText(
                data: '100',
                weight: FontWeight.w800,
                size: 26.sp,
                color: MyColors.placeHolderColor,
              ),
              SizedBox(
                height: 5.5.h,
              ),
            ],
          );
  }

  Widget _logo() {
    return Stack(
            children: [
              Center(child: SvgPicture.asset(Resurces.credit)),
              Align(
                alignment: Alignment.bottomCenter,
                child: Column(
                  children: [
                    SizedBox(
                      height: 7.h,
                    ),
                    CustomText(
                      data: 'VIP',
                      weight: FontWeight.w400,
                      size: 35.sp,
                      color: Colors.white,
                    ),
                    CustomText(
                      data: 'Member',
                      weight: FontWeight.w700,
                      size: 12.sp,
                      color: Colors.white,
                    ),
                  ],
                ),
              )
            ],
          );
  }
}
