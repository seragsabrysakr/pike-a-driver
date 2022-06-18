import '../../../../../../shared/colors.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class OtpInput extends StatelessWidget {
  final TextEditingController controller;
  final bool autoFocus;
  const OtpInput(this.controller, this.autoFocus, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 3.5.h,
      backgroundColor: Colors.grey.shade200,
      child: Center(
        child: Baseline(
          baselineType: TextBaseline.alphabetic,
          baseline: 7.h,
          child: TextField(
            obscureText: true,
            obscuringCharacter: '*',
            cursorHeight: 3.h,
            style: TextStyle(
              color: MyColors.placeHolderColor,
              fontSize: 37.sp,
              fontWeight: FontWeight.w400,
            ),
            autofocus: autoFocus,
            textAlign: TextAlign.center,
            textAlignVertical: TextAlignVertical.center,
            dragStartBehavior: DragStartBehavior.down,
            keyboardType: TextInputType.number,
            controller: controller,
            maxLength: 1,
            cursorColor: MyColors.placeHolderColor,
            decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: const BorderSide(color: Colors.transparent),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: const BorderSide(color: Colors.transparent),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: const BorderSide(color: Colors.transparent),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: const BorderSide(color: Colors.red),
                ),
                // border: OutlineInputBorder(),
                counterText: '',
                // hintText: '*',
                isDense: true,
                isCollapsed: true,
                hintStyle: TextStyle(
                    color: MyColors.placeHolderColor,
                    fontSize: 37.sp,
                    fontWeight: FontWeight.bold)),
            onChanged: (value) {
              if (value.length == 1) {
                FocusScope.of(context).nextFocus();
              }
            },
          ),
        ),
      ),
    );
  }
}
