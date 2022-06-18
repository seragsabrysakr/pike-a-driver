import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../shared/colors.dart';
import '../../../main.dart';

class ScreenProgress extends StatelessWidget {
  final int ticks;

  const ScreenProgress({
    Key? key,
    required this.ticks,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            _processText(context, App.tr.approved),
            SizedBox(
              width: 3.5.w,
            ),
            _processText(context, App.tr.settingup),
            SizedBox(
              width: 9.w,
            ),
            _processText(context, App.tr.outofdel),
            SizedBox(
              width: 4.9.w,
            ),
            _processText(context, App.tr.recived),
          ],
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 3.w),
          child: Row(
            children: <Widget>[
              tick1(),
              spacer(),
              line1(),
              spacer(),
              tick2(),
              spacer(),
              line2(),
              spacer(),
              tick3(),
              spacer(),
              line3(),
              spacer(),
              tick4(),
            ],
          ),
        ),
      ],
    );
  }

  Widget tick(bool isChecked) {
    return isChecked
        ? const Icon(
            Icons.circle,
            color: MyColors.goldColor,
          )
        : const Icon(
            Icons.circle,
            color: MyColors.primarColor,
          );
  }

  Widget tick1() {
    return ticks > 0 ? tick(true) : tick(false);
  }

  Widget tick2() {
    return ticks > 1 ? tick(true) : tick(false);
  }

  Widget tick3() {
    return ticks > 2 ? tick(true) : tick(false);
  }

  Widget tick4() {
    return ticks > 3 ? tick(true) : tick(false);
  }

  Widget line1() {
    return ticks > 0 ? line(true) : line(false);
  }

  Widget line2() {
    return ticks > 1 ? line(true) : line(false);
  }

  Widget line3() {
    return ticks > 2 ? line(true) : line(false);
  }

  Widget line4() {
    return ticks > 3 ? line(true) : line(false);
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

_processText(context, String text) {
  return SizedBox(
    width: MediaQuery.of(context).size.width * .165,
    child: Text(
      text,
      style: TextStyle(
        color: MyColors.primarColor,
        fontSize: 9.sp,
      ),
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      softWrap: true,
    ),
  );
}
