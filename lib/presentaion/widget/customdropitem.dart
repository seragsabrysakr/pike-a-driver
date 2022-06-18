import '../../../../../../presentaion/widget/customtext.dart';
import '../../../../../../shared/colors.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CustomDropdownMenu extends StatefulWidget {
  CustomDropdownMenu(
      {Key? key,
      required this.defaultValue,
      required this.values,
      required this.onItemSelected})
      : super(key: key);
  final dynamic Function(String? selectedValue) onItemSelected;
  String defaultValue;
  final List<String> values;
  @override
  _CustomDropdownMenuState createState() => _CustomDropdownMenuState();
}

class _CustomDropdownMenuState extends State<CustomDropdownMenu> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 90.w,
          height: 6.5.h,
          margin: const EdgeInsets.symmetric(horizontal: 10),
          padding: EdgeInsets.symmetric(horizontal: 5.w),
          decoration: BoxDecoration(
              color: MyColors.textFormColor,
              borderRadius: BorderRadius.circular(10.h)),
          child: Flex(direction: Axis.vertical, children: [
            DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                isExpanded: true,
                alignment: Alignment.centerLeft,
                icon: const Icon(
                  Icons.keyboard_arrow_down_outlined,
                  color: MyColors.primarColor,
                ),
                value: widget.defaultValue,
                items: widget.values
                    .map<DropdownMenuItem<String>>((String dropValue) {
                      return DropdownMenuItem<String>(
                        value: dropValue,
                        child: CustomText(
                          weight: FontWeight.w500,
                          size: 12.sp,
                          data: dropValue,
                        ),
                      );
                    })
                    .toSet()
                    .toList(),
                onChanged: (newDropdownValue) {
                  setState(() {
                    widget.defaultValue = newDropdownValue!;
                  });
                  widget.onItemSelected(newDropdownValue);
                },
              ),
            ),
          ]),
        ),
      ],
    );
  }
}
