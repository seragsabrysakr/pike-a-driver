import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../shared/colors.dart';

class CustomTextField extends StatelessWidget {
  final bool obscure;
  final bool align;
  final String? initialValue;
  final int? max;
  final int? min;
  final double? width;
  final double? hi;
  final String? Function(String?)? validator;
  final String? hint;
  final TextEditingController? controller;
  final Widget suffix;
  final IconData? prefix;
  final TextInputType? type;
  final VoidCallback? visiblpass;
  final VoidCallback? onedit;
  final double radius;

  final VoidCallback? ontap;
  final FocusNode? focusNode;
  final TextInputAction? action;
  const CustomTextField(
      {this.controller,
      this.align = true,
      this.action,
      this.initialValue,
      this.focusNode,
      required this.hint,
      this.max = 1,
      this.min,
      this.obscure = false,
      this.onedit,
      this.suffix =const SizedBox(),
      this.type,
      required this.validator,
      this.visiblpass,
      Key? key,
      this.prefix,
      this.ontap,
      this.radius = 18,
      this.width,
      this.hi = 7.5})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Container(
      decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(radius.h)),
      width: width ?? size.width * .8,
      height: hi?.h,
      child: TextFormField(
        onTap: ontap,
        onEditingComplete: onedit,
        textInputAction: action,
        maxLines: max,
        minLines: min,
        initialValue: initialValue,
        controller: controller,
        style: const TextStyle(
            fontWeight: FontWeight.w500, color: MyColors.placeHolderColor),
        cursorColor: MyColors.placeHolderColor,
        keyboardType: type,
        obscureText: obscure,
        validator: validator,
        textAlign: TextAlign.justify,
        decoration: InputDecoration(
            fillColor: Colors.grey.shade200,
            filled: true,
            alignLabelWithHint: false,
            prefixIcon: Icon(
              prefix,
              color: Colors.grey,
            ),
            suffixIcon: IconButton(
              icon: suffix,
              onPressed: visiblpass,
            ),
            hintText: hint!,
            hintStyle: TextStyle(
              fontSize: 13.sp,
              fontWeight: FontWeight.w500,
              color: MyColors.placeHolderColor,
            ),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(radius.h),
                borderSide: BorderSide(color: Colors.grey.shade200)),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(radius.h),
                borderSide: BorderSide(color: Colors.grey.shade200)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(radius.h),
                borderSide: BorderSide(color: Colors.grey.shade200, width: 2)),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(radius.h),
              borderSide: const BorderSide(color: Colors.red),
            )),
      ),
    );
  }
}
