import '../../../../main.dart';
import '../../../../presentaion/widget/customtext.dart';
import '../../../../shared/colors.dart';
import '../../../../shared/resurces.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class RestaurantItem extends StatelessWidget {
  const RestaurantItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: MediaQuery.of(context).size.width * .9,
            height: MediaQuery.of(context).size.height * .3,
            decoration: BoxDecoration(
                image: const DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(
                      Resurces.restaurantsImg,
                    )),
                borderRadius: BorderRadius.circular(3.h)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: 3.h,
                    ),
                    CustomText(
                      data: App.tr.foodname,
                      size: 16.sp,
                      color: MyColors.whiteColor,
                      weight: FontWeight.bold,
                    )
                  ],
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 3.h,
                    ),
                    Icon(
                      Icons.star,
                      color: MyColors.goldColor,
                      size: 14.sp,
                    ),
                    CustomText(
                      data: '4.9',
                      size: 12.sp,
                      color: MyColors.goldColor,
                    ),
                    SizedBox(
                      width: 2.w,
                    ),
                    SizedBox(
                      width: 1.w,
                    ),
                    CustomText(
                      data: App.tr.resturanttybe,
                      size: 12.sp,
                      color: MyColors.whiteColor,
                    ),
                    CustomText(
                      data: '.',
                      size: 15.sp,
                      color: MyColors.goldColor,
                    ),
                    CustomText(
                      data: App.tr.foodtybe,
                      size: 12.sp,
                      color: MyColors.whiteColor,
                    ),
                  ],
                ),
                SizedBox(
                  height: 3.h,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 2.h,
          ),
        ],
      ),
    );
  }
}
