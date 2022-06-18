import '../../../../../../presentaion/widget/customtext.dart';
import '../../../../../../shared/colors.dart';
import '../../../../../../shared/resurces.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class NotificationItem extends StatelessWidget {
  const NotificationItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 1.h),
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(color: Colors.grey.shade200),
          ),
        ),
        height: MediaQuery.of(context).size.height * .07,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 2.w,
            ),
            Icon(
              Icons.circle,
              color: MyColors.goldColor,
              size: 4.w,
            ),
            SizedBox(
              width: 7.w,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 80.w,
                  child: Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                    maxLines: 1,
                    overflow: TextOverflow.visible,
                    style: TextStyle(
                      color: MyColors.primarColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 11.sp,
                      fontFamily: Resurces.mainfont,
                    ),
                  ),
                ),
                SizedBox(
                  height: 1.h,
                ),
                CustomText(
                  data: '1 h ago',
                  weight: FontWeight.w600,
                  size: 11.sp,
                  color: MyColors.placeHolderColor,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
