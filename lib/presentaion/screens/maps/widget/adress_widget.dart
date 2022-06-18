import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../presentaion/widget/customtext.dart';
import '../../../../shared/colors.dart';

class Adress extends StatelessWidget {
  final String adress;
  const Adress({
    Key? key,
    required this.adress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: .5.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(
            Icons.location_on_rounded,
            color: MyColors.goldColor,
            size: 10.sp,
          ),
          SizedBox(
            width: 2.w,
          ),
          CustomText(
            data: adress,
            size: 11.sp,
            weight: FontWeight.w400,
            color: MyColors.placeHolderColor,
          ),
        ],
      ),
    );
  }
}
