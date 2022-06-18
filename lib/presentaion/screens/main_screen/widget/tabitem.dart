import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';

import '../../../../shared/colors.dart';

class TabItem extends StatelessWidget {
  final String text;
  final String icon;
  final bool isSelected;
  final VoidCallback onTap;

  const TabItem(
      {Key? key,
      required this.text,
      required this.icon,
      required this.isSelected,
      required this.onTap})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkResponse(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 3.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            SvgPicture.asset(
              icon,
              cacheColorFilter: true,
              color:
                  isSelected ? MyColors.goldColor : MyColors.placeHolderColor,
              height: 7.w,
              width: 7.w,
            ),
            Text(
              text,
              style: TextStyle(
                  color: isSelected
                      ? MyColors.goldColor
                      : MyColors.placeHolderColor,
                  fontWeight: FontWeight.w500,
                  fontSize: 11.sp),
            )
          ],
        ),
      ),
    );
  }
}
