import 'package:delivery/presentaion/screens/main_screen/myorders/widget/notbox.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';
import 'package:sizer/sizer.dart';

import '../../../../businesslogic/product_cubit/rating_widget.dart';
import '../../../../main.dart';
import '../../../../shared/colors.dart';
import '../../../../shared/functions.dart';
import '../../../../shared/resurces.dart';
import '../../../widget/custombutton.dart';
import '../../../widget/customtext.dart';

class MyOrderScreen extends StatelessWidget {
  const MyOrderScreen({Key? key}) : super(key: key);
  static const String id = 'MyOrder screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appbar(context),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.w),
            child: Column(
              children: [
                _orderdetails(
                    context,
                    _orderdone(
                      context,
                      cancel: () {
                        print('cancel');
                      },
                    )),
                _orderdetails(context, _ordercanceld(context, canceled: () {})),
                SizedBox(
                  height: 4.h,
                ),
                _reiectedorders(),
                SizedBox(
                  height: 2.h,
                ),
                _driverdetails(context),
                SizedBox(
                  height: 5.h,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  AppBar _appbar(BuildContext context) {
    return AppBar(
      leading: InkWell(
        onTap: () {
          navigateback(context: context);
        },
        child: const Icon(Icons.arrow_back_ios),
      ),
      title: CustomText(
        data: AppLocalizations.of(context)!.myOrder,
        size: 19.sp,
        weight: FontWeight.w800,
      ),
      actions: [
        IconButton(onPressed: () {}, icon: const Icon(Icons.shopping_cart)),
        SizedBox(
          width: 1.h,
        ),
      ],
    );
  }

  _orderdetails(context, Widget widget) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 1.h),
      child: Container(
        decoration: BoxDecoration(
            color: MyColors.cardColors,
            borderRadius: BorderRadius.circular(5.w)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 18.w,
                    width: 18.w,
                    decoration: BoxDecoration(
                      image: const DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(
                            Resurces.order,
                          )),
                      borderRadius: BorderRadius.circular(1.5.h),
                      color: Colors.green,
                    ),
                  ),
                  SizedBox(
                    width: 4.w,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        data: App.tr.resturname,
                        size: 11.sp,
                        weight: FontWeight.w800,
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.star,
                            color: MyColors.goldColor,
                            size: 8.sp,
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
                            data: '(124 ${App.tr.ratings})',
                            size: 8.sp,
                            weight: FontWeight.w400,
                            color: MyColors.placeHolderColor,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      Row(
                        children: [
                          CustomText(
                            data: App.tr.resturanttybe,
                            size: 8.sp,
                            color: MyColors.placeHolderColor,
                          ),
                          CustomText(
                            data: '.',
                            size: 8.sp,
                            weight: FontWeight.w400,
                            color: MyColors.goldColor,
                          ),
                          CustomText(
                            data: App.tr.foodtybe,
                            size: 8.sp,
                            weight: FontWeight.w400,
                            color: MyColors.placeHolderColor,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 1.h,
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
                            size: 8.sp,
                            weight: FontWeight.w400,
                            color: MyColors.placeHolderColor,
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 2.h,
                      ),
                      CustomText(
                        data: App.tr.total,
                        weight: FontWeight.w400,
                        size: 11.sp,
                        color: MyColors.primarColor,
                      ),
                      CustomText(
                        data: '\$50',
                        weight: FontWeight.w800,
                        size: 20.sp,
                        color: MyColors.goldColor,
                      ),
                      CustomText(
                        data: 'COD',
                        weight: FontWeight.w800,
                        size: 13.sp,
                        color: MyColors.primarColor,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            _orderProperites(context, widget),
            SizedBox(
              height: 2.h,
            ),
          ],
        ),
      ),
    );
  }

  _orderdone(
    context, {
    VoidCallback? cancel,
  }) {
    return Row(
      children: [
        SizedBox(
          width: 2.w,
        ),
        acceptbutton(context),
        SizedBox(
          width: 1.w,
        ),
        CustomButton(
          ontap: cancel,
          // ontap: ,

          text: AppLocalizations.of(context)!.cancel,
          height: 3.2.h,
          fontsize: 9.sp,
          width: 20.8.w,
          butcolor: MyColors.goldColor,
        ),
      ],
    );
  }

  _ordercanceld(
    context, {
    VoidCallback? canceled,
  }) {
    return Row(
      children: [
        SizedBox(
          width: 2.w,
        ),
        CustomButton(
          ontap: canceled,
          // ontap: ,
          text: 'Canceled',
          height: 3.2.h,
          fontsize: 9.sp,
          width: 23.w,
          butcolor: MyColors.goldColor,
        ),
      ],
    );
  }

  _orderProperites(
    context,
    Widget widget,
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
                      itemCount: 5,
                      shrinkWrap: true,
                      itemBuilder: (context, index) => SizedBox(
                            child: SizedBox(
                              height: MediaQuery.of(context).size.height * .02,
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 3.w),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    CustomText(
                                      data: AppLocalizations.of(context)!
                                          .orderitem,
                                      size: 9.sp,
                                      weight: FontWeight.w500,
                                      color: MyColors.primarColor,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          )),
                  width: MediaQuery.of(context).size.width * .6,
                ),
              ],
            ),
          ],
        ),
        SizedBox(
          height: 1.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            widget,
            const Spacer(
              flex: 1,
            ),
            Icon(
              Icons.add,
              size: 14.sp,
              color: MyColors.goldColor,
            ),
            InkWell(
              onTap: () {
                bottomSheet(context, const NoteBox());
              },
              child: CustomText(
                data: AppLocalizations.of(context)!.addnote,
                size: 9.sp,
                weight: FontWeight.w500,
                color: MyColors.goldColor,
              ),
            ),
            SizedBox(
              width: 2.h,
            ),
          ],
        ),
      ],
    );
  }

  Widget acceptbutton(BuildContext context) {
    return SizedBox(
        height: 3.2.h,
        width: 36.w,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              primary: MyColors.goldColor,
              fixedSize: const Size(300, 100),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50))),
          onPressed: () {},
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CustomText(
                data: 'Accept',
                color: Colors.white,
                size: 12.sp,
              ),
              CustomText(
                data: '30 sec',
                color: MyColors.secondryColor,
                size: 9.sp,
              ),
            ],
          ),
        ));
  }

  _reiectedorders() {
    return Column(
      children: [
        Container(
          height: 5.h,
          width: 60.w,
          decoration: BoxDecoration(
            color: MyColors.textFormColor,
            borderRadius: BorderRadius.circular(3.h),
          ),
          child: Center(
            child: CustomText(
              data: " Rejected Orders   2",
              color: MyColors.placeHolderColor,
              weight: FontWeight.w400,
              size: 9.sp,
            ),
          ),
        ),
        SizedBox(
          height: .5.h,
        ),
        CustomText(
          data: '1 more before Block',
          color: MyColors.goldColor,
          size: 8.sp,
        )
      ],
    );
  }

  _driverdetails(context) {
    return Container(
        height: 12.h,
        width: 80.w,
        decoration: BoxDecoration(
          color: MyColors.cardColors,
          borderRadius: BorderRadius.circular(7.h),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              width: 2.w,
            ),
            CircleAvatar(
              radius: 10.w,
              backgroundColor: MyColors.textFormColor,
              child: Container(
                height: MediaQuery.of(context).size.width * .3,
                width: MediaQuery.of(context).size.width * .3,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: MyColors.textFormColor,
                ),
                child: CircleAvatar(
                  radius: 6.h,
                  backgroundColor: MyColors.textFormColor,
                  backgroundImage: const AssetImage(Resurces.usereimg),
                ),
              ),
            ),
            SizedBox(
              width: 5.w,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CustomText(
                      data: 'Rate',
                      color: MyColors.placeHolderColor,
                      weight: FontWeight.w400,
                      size: 9.sp,
                    ),
                    SizedBox(
                      width: 7.w,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 2.h,
                          // width: 40.w,
                          child: Rating(rate: 3, size: 15.sp),
                        ),
                        SizedBox(
                          height: .5.h,
                        ),
                      ],
                    )
                  ],
                ),
                // SizedBox(
                //   height: .7.h,
                // ),
                Row(
                  children: [
                    CustomText(
                      data: 'Orders',
                      color: MyColors.placeHolderColor,
                      weight: FontWeight.w400,
                      size: 9.sp,
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    CustomText(
                      data: '250',
                      color: MyColors.placeHolderColor,
                      weight: FontWeight.w600,
                      size: 9.sp,
                    ),
                  ],
                ),
                SizedBox(
                  height: .5.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CustomText(
                      data: "credit",
                      color: MyColors.placeHolderColor,
                      weight: FontWeight.w400,
                      size: 9.sp,
                    ),
                    SizedBox(
                      width: 7.w,
                    ),
                    CustomText(
                      data: '250',
                      color: MyColors.placeHolderColor,
                      weight: FontWeight.w600,
                      size: 9.sp,
                    ),
                  ],
                ),
                SizedBox(
                  height: .5.h,
                ),
              ],
            ),
          ],
        ));
  }
}
