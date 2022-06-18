import '../../../../../../presentaion/widget/customtext.dart';
import '../../../../../../shared/colors.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class InboxItem extends StatelessWidget {
  const InboxItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 1.h),
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(color: Colors.grey.shade200),
          ),
        ),
        height: MediaQuery.of(context).size.height * .085,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              Icons.circle,
              color: MyColors.goldColor,
              size: 4.w,
            ),
            SizedBox(
              width: 4.w,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  data: 'MealMonkey Promotions',
                  color: MyColors.primarColor,
                  weight: FontWeight.w600,
                  size: 12.sp,
                ),
                SizedBox(
                  height: .5.h,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * .7,
                  child: Text(
                    " Lorem ipsum dolor sit amet consectetur adipiscing elit, sed do",
                    style: TextStyle(
                      height: .17.h,
                      fontWeight: FontWeight.w500,
                      fontSize: 12.sp,
                      color: MyColors.placeHolderColor,
                    ),
                    maxLines: 2,
                    textAlign: TextAlign.start,
                    overflow: TextOverflow.visible,
                    softWrap: true,
                  ),
                ),
              ],
            ),
            const Spacer(
              flex: 1,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                  data: '21 july',
                  weight: FontWeight.w400,
                  size: 9.sp,
                  color: MyColors.primarColor,
                ),
                SizedBox(
                  height: 3.h,
                ),
                InkWell(
                    onTap: () {},
                    child: Icon(
                      Icons.star_border_outlined,
                      color: MyColors.goldColor,
                      size: 3.h,
                    )),
                SizedBox(
                  height: .7.h,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
