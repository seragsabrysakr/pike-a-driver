import '../../../../../../shared/colors.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CustomButton extends StatelessWidget {
  final double width;
  final String text;
  final VoidCallback? ontap;
  final double radius;
  final double height;
  final double fontsize;
  final FontWeight fontweight;
  final Color butcolor;
  final Color borderColor;
  final Widget? icon;
  final Color txtcolor;
  const CustomButton(
      {required this.text,
      this.height = 10,
      this.width = 400,
      this.butcolor = MyColors.goldColor,
      this.fontsize = 18,
      required this.ontap,
      this.radius = 10,
      Key? key,
      this.txtcolor = Colors.white,
      this.fontweight = FontWeight.w600,
      this.icon,
      this.borderColor = MyColors.goldColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(15.h),
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            elevation: 0,
            primary: butcolor,
            // onPrimary: MyColors.goldColor,

            // onSurface: MyColors.goldColor,
            shadowColor: MyColors.goldColor,
            side: BorderSide(color: borderColor, width: 1),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.h))),
        onPressed: ontap,
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              fontSize: fontsize,
              fontWeight: fontweight,
              color: txtcolor,
            ),
          ),
        ),
      ),
    );
  }
}
