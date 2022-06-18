import '../../../../presentaion/widget/custombutton.dart';
import '../../../../presentaion/widget/customtext.dart';
import '../../../../shared/colors.dart';
import '../../../../shared/functions.dart';
import '../../../../shared/resurces.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';
import 'package:sizer/sizer.dart';

class EndOrder extends StatelessWidget {
  const EndOrder({Key? key}) : super(key: key);
  static const String id = 'EndOrder';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.backgroundcolor,
      body: Stack(
        children: [
          SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 5.w),
              child: Column(
                children: [
                  SizedBox(
                    height: 18.h,
                    width: double.infinity,
                  ),
                  _buildOrderStaus(),
                  _orderdetcails(context)
                ],
              ),
            ),
          ),
          _mapheader(context)
        ],
      ),
    );
  }

  _buildOrderStaus() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 3.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(
            data: 'Status',
            // weight: MyFontsWeight.regular,
          ),
          SizedBox(
            height: .5.h,
          ),
          CustomText(
            data: 'Picked Since 40 Min',
            // weight: MyFontsWeight.semibold,
          ),
          SizedBox(
            height: .5.h,
          ),
          Row(
            children: [
              Icon(
                Icons.location_on_rounded,
                color: MyColors.goldColor,
                size: 12.sp,
              ),
              CustomText(
                data: 'No 03, 4th Lane, Newyork',
                color: MyColors.placeHolderColor,
                // weight: MyFontsWeight.regular,
              ),
            ],
          ),
          SizedBox(
            height: .5.h,
          ),
          CustomText(
            data: 'Customer Name : Ahmed Ali',
            // weight: MyFontsWeight.regular,
          ),
          SizedBox(
            height: 2.h,
          ),
        ],
      ),
    );
  }

  _mapheader(context) {
    return Positioned(
      top: 7.h,
      left: 5.w,
      right: 5.w,
      child: Container(
        width: MediaQuery.of(context).size.width * .8,
        height: MediaQuery.of(context).size.height * .08,
        decoration: BoxDecoration(
          color: MyColors.backgroundcolor,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 3,
              blurRadius: 3,
              offset: const Offset(0, 1), // changes position of shadow
            ),
          ],
          borderRadius: BorderRadius.circular(4.h),
        ),
        child: Row(
          children: [
            SizedBox(
              width: 5.w,
            ),
            InkWell(
                onTap: () {
                  navigateback(context: context);
                },
                child: const Icon(Icons.arrow_back_ios)),
            const Spacer(
              flex: 1,
            ),
            CustomText(
              data: 'End Order',
              size: 18.sp,
              weight: FontWeight.w700,
            ),
            SizedBox(
              width: 25.w,
            ),
          ],
        ),
      ),
    );
  }

  _orderdetcails(context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.grey.shade300,
          borderRadius: BorderRadius.circular(5.w)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () {},
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 3.w),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 8.h,
                    width: 8.h,
                    decoration: BoxDecoration(
                      image: const DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(
                            Resurces.offerimg,
                          )),
                      borderRadius: BorderRadius.circular(1.h),
                    ),
                  ),
                  SizedBox(
                    width: 3.w,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        data: AppLocalizations.of(context)!.resturname,
                        size: 12.sp,
                        weight: FontWeight.w800,
                      ),
                      SizedBox(
                        height: .5.h,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.star,
                            color: MyColors.goldColor,
                            size: 9.sp,
                          ),
                          CustomText(
                            data: '4.9',
                            size: 9.sp,
                            weight: FontWeight.w400,
                            color: MyColors.goldColor,
                          ),
                          SizedBox(
                            width: 1.w,
                          ),
                          CustomText(
                            data:
                                '(124 ${AppLocalizations.of(context)!.ratings})',
                            size: 9.sp,
                            color: MyColors.placeHolderColor,
                            weight: FontWeight.w400,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: .5.h,
                      ),
                      Row(
                        children: [
                          CustomText(
                            data: AppLocalizations.of(context)!.resturanttybe,
                            size: 9.sp,
                            color: MyColors.placeHolderColor,
                            weight: FontWeight.w400,
                          ),
                          CustomText(
                            data: '.',
                            size: 9.sp,
                            color: MyColors.goldColor,
                            weight: FontWeight.w400,
                          ),
                          CustomText(
                            data: AppLocalizations.of(context)!.foodtybe,
                            size: 9.sp,
                            color: MyColors.placeHolderColor,
                            weight: FontWeight.w400,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: .5.h,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.location_on_rounded,
                            color: MyColors.goldColor,
                            size: 9.sp,
                          ),
                          CustomText(
                            data: 'No 03, 4th Lane, Newyork',
                            size: 9.sp,
                            color: MyColors.placeHolderColor,
                            weight: FontWeight.w400,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: .5.h,
                      ),
                    ],
                  ),
                  const Spacer(
                    flex: 1,
                  ),
                  //price
                  Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 2.h,
                        ),
                        CustomText(
                          data: AppLocalizations.of(context)!.total,
                          weight: FontWeight.bold,
                          size: 10.sp,
                          color: MyColors.primarColor,
                        ),
                        CustomText(
                          data: '\$50',
                          weight: FontWeight.bold,
                          size: 17.sp,
                          color: MyColors.goldColor,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 3.w,
                  ),
                ],
              ),
            ),
          ),
          _orderitems(context),
          SizedBox(
            height: 2.h,
          ),
        ],
      ),
    );
  }

  _orderitems(
    context,
  ) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              children: [
                SizedBox(
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemBuilder: (context, index) => SizedBox(
                            child: SizedBox(
                              height: MediaQuery.of(context).size.height * .01,
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 3.w),
                                child: CustomText(
                                  data: AppLocalizations.of(context)!.orderitem,
                                  color: MyColors.primarColor,
                                  weight: FontWeight.w500,
                                  size: 10.sp,
                                ),
                              ),
                            ),
                          )),
                  width: MediaQuery.of(context).size.width * .6,
                ),
              ],
            ),
            const Spacer(
              flex: 1,
            ),
            CustomButton(
              ontap: () {},
              // ontap: ,
              fontsize: 12.sp,
              text: 'Cash',
              height: .5.h,

              width: 26.w,
              butcolor: MyColors.goldColor,
            ),
            SizedBox(width: 3.w),
          ],
        ),
        //order items
        SizedBox(
          height: 1.h,
        ),
      ],
    );
  }
}
