import '../../../../main.dart';
import '../../../../presentaion/widget/customtext.dart';
import '../../../../shared/colors.dart';
import '../../../../shared/resurces.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CustomItem extends StatelessWidget {
  const CustomItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: MediaQuery.of(context).size.width * .9,
            height: MediaQuery.of(context).size.height * .24,
            decoration: BoxDecoration(
                image: const DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(
                      Resurces.offerimg,
                    )),
                borderRadius: BorderRadius.circular(3.5.h)),
          ),
          SizedBox(
            height: 1.5.h,
          ),
          CustomText(
            data: App.tr.foodname,
            size: 12.sp,
            weight: FontWeight.w700,
          ),
          SizedBox(
            height: .5.h,
          ),
          Row(
            children: [
              Icon(
                Icons.star,
                color: MyColors.goldColor,
                size: 12.sp,
              ),
              CustomText(
                data: '4.9',
                size: 10.sp,
                color: MyColors.goldColor,
                weight: FontWeight.w500,
              ),
              SizedBox(
                width: 1.w,
              ),
              CustomText(
                data: '(124 ${App.tr.ratings})',
                size: 10.sp,
                color: MyColors.placeHolderColor,
                weight: FontWeight.w500,
              ),
              SizedBox(
                width: 1.w,
              ),
              CustomText(
                data: App.tr.resturanttybe,
                size: 10.sp,
                color: MyColors.placeHolderColor,
                weight: FontWeight.w500,
              ),
              Baseline(
                baselineType: TextBaseline.alphabetic,
                baseline: .9.h,
                child: CustomText(
                  data: '.',
                  size: 15.sp,
                  color: MyColors.goldColor,
                  weight: FontWeight.w500,
                ),
              ),
              SizedBox(
                width: 3.w,
              ),
              CustomText(
                data: App.tr.foodtybe,
                size: 10.sp,
                color: MyColors.placeHolderColor,
                weight: FontWeight.w500,
              ),
            ],
          ),
          SizedBox(
            height: 3.h,
          ),
        ],
      ),
    );
  }
}
