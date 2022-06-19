import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../shared/colors.dart';

class Rating extends StatelessWidget {
  final int rate;
  final double size;

  const Rating({
    Key? key,
    required this.rate, required this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        tick1(),
        // spacer(),
        tick2(),
        // spacer(),
        tick3(),
        // spacer(),
        tick4(),
        // spacer(),
        tick5(),
      ],
    );
  }

  Widget tick(bool isChecked) {
    return isChecked
        ? Icon(
            Icons.star_rate,
            color: MyColors.goldColor,
            size: size,
          )
        : Icon(
            Icons.star_border_purple500_outlined,
            color: MyColors.goldColor,
            size:size ,
          );
  }

  Widget tick1() {
    return rate > 0 ? tick(true) : tick(false);
  }

  Widget tick2() {
    return rate > 1 ? tick(true) : tick(false);
  }

  Widget tick3() {
    return rate > 2 ? tick(true) : tick(false);
  }

  Widget tick4() {
    return rate > 3 ? tick(true) : tick(false);
  }

  Widget tick5() {
    return rate > 4 ? tick(true) : tick(false);
  }

  Widget spacer() {
    return const Spacer(
      flex: 1,
    );
  }

  Widget line(bool isChecked) {
    return Container(
      color: isChecked ? MyColors.placeHolderColor : MyColors.primarColor,
      height: .5.h,
      width: 14.w,
    );
  }
}
