import '../../../../../shared/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';

import '../../../../widget/customtext.dart';

class SettingItem extends StatelessWidget {
  final String image;
  final String title;
  final VoidCallback ontap;

  const SettingItem(
      {Key? key, required this.image, required this.title, required this.ontap})
      : super(key: key);
  static String id = 'more item';

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          InkWell(
            borderRadius: BorderRadius.circular(10.w),
            onTap: ontap,
            child: Container(
              decoration: BoxDecoration(
                  color: MyColors.textFormColor,
                  borderRadius: BorderRadius.circular(10.w),
                  border: Border.all(color: MyColors.goldColor)),
              height: 8.11.h,
              width: 61.8.w,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 2.w,
                  ),
                  CircleAvatar(
                    backgroundColor: MyColors.moreItemColor,
                    radius: 6.w,
                    child: SvgPicture.asset(
                      image,
                      cacheColorFilter: true,
                      clipBehavior: Clip.none,
                      fit: BoxFit.cover,
                      // height: 16.sp,
                    ),
                  ),
                  SizedBox(
                    width: 3.w,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomText(
                        data: title,
                        color: MyColors.primarColor,
                        size: 10.sp,
                        weight: FontWeight.w700,
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 2.w,
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 1.h,
            bottom: 1.h,
            right: -4.w,
            child: CircleAvatar(
              radius: 4.w,
              backgroundColor: MyColors.goldColor,
              child: Icon(
                Icons.arrow_forward_ios,
                size: 4.w,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
