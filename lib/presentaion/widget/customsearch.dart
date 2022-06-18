import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';
import 'package:sizer/sizer.dart';

import '../../../../../../shared/colors.dart';

class CustomSearch extends StatelessWidget {
  final TextEditingController controller;
  final Color? color;
  final Function(String)? onSearchTextChanged;
  const CustomSearch(
      {Key? key,
      required this.controller,
      required this.onSearchTextChanged,
      this.color = MyColors.textFormColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 11.h,
      width: 88.8.w,
      child: TextField(
        style: const TextStyle(
            fontWeight: FontWeight.w500, color: MyColors.placeHolderColor),
        textAlign: TextAlign.start,
        cursorColor: Colors.black,
        controller: controller,
        onChanged: onSearchTextChanged,
        decoration: InputDecoration(
          isDense: true,
          contentPadding: const EdgeInsets.all(4),
          hintText: AppLocalizations.of(context)!.search,
          hintStyle: const TextStyle(color: MyColors.placeHolderColor),
          hintTextDirection: TextDirection.ltr,
          filled: true,
          fillColor: color,
          prefixIcon: Icon(
            Icons.search,
            size: 20.sp,
            color: MyColors.secondryColor,
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: color!),
            borderRadius: BorderRadius.circular(5.h),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: color!),
            borderRadius: BorderRadius.circular(5.h),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: color!),
            borderRadius: BorderRadius.circular(5.h),
          ),
        ),
      ),
    );
  }
}
