import 'package:delivery/presentaion/screens/main_screen/myorders/widget/notbox.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';
import 'package:sizer/sizer.dart';

import '../../../../businesslogic/product_cubit/rating_widget.dart';
import '../../../../shared/colors.dart';
import '../../../../shared/functions.dart';
import '../../../../shared/resurces.dart';
import '../../../widget/custombutton.dart';
import '../../../widget/customtext.dart';
import '../../maps/track_order_map.dart';

class MyOrderScreen extends StatelessWidget {
  const MyOrderScreen({Key? key}) : super(key: key);
  static const String id = 'MyOrder screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            navigateback(context: context);
          },
          child: const Icon(Icons.arrow_back_ios),
        ),
        title: CustomText(
          data: AppLocalizations.of(context)!.myOrder,
          size: 20.sp,
          weight: FontWeight.bold,
        ),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.shopping_cart)),
          SizedBox(
            width: 1.h,
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.w),
            child: Column(
              children: [
                SizedBox(
                  height: 2.h,
                ),
                _orderdetails(
                    context,
                    _orderdone(
                      context,
                      track: () {
                        navigateto(context: context, screen: TrackOrderMap.id);
                      },
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

  _orderdetails(context, Widget widget) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 1.h),
      child: Container(
        decoration: BoxDecoration(
            color: MyColors.textFormColor,
            borderRadius: BorderRadius.circular(5.w)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 10,
            ),
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
                        color: Colors.green,
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
                          weight: FontWeight.bold,
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
                            ),
                            CustomText(
                              data: '.',
                              size: 9.sp,
                              color: MyColors.goldColor,
                            ),
                            CustomText(
                              data: AppLocalizations.of(context)!.foodtybe,
                              size: 9.sp,
                              color: MyColors.placeHolderColor,
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
                    Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 1.h,
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
                          CustomText(
                            data: 'COD',
                            weight: FontWeight.bold,
                            size: 10.sp,
                            color: MyColors.primarColor,
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
            SizedBox(
              height: 1.h,
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
    VoidCallback? track,
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
          fontsize: 14.sp,
          text: AppLocalizations.of(context)!.cancel,
          height: .5.h,

          width: 22.w,
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
          fontsize: 14.sp,
          text: 'Canceled',
          height: .5.h,

          width: 22.w,
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
            const Icon(
              Icons.add,
              color: MyColors.goldColor,
            ),
            InkWell(
              onTap: () {
                showGeneralDialog(
                  context: context,
                  barrierLabel: "withdraw",
                  barrierDismissible: true,
                  barrierColor: Colors.black.withOpacity(0.5),
                  transitionDuration: const Duration(milliseconds: 400),
                  pageBuilder: (context, a1, a2) {
                    return const NoteBox();
                  },
                  transitionBuilder: (context, anim1, anim2, child) {
                    return SlideTransition(
                      position:
                          Tween(begin: const Offset(0, 1), end: Offset.zero)
                              .animate(anim1),
                      child: child,
                    );
                  },
                );
              },
              child: CustomText(
                data: AppLocalizations.of(context)!.addnote,
                size: 9.sp,
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
        height: 4.h,
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
              // weight: FontWeight.w600,
            ),
          ),
        ),
        SizedBox(
          height: 1.h,
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
        height: 13.h,
        width: 80.w,
        decoration: BoxDecoration(
          color: MyColors.textFormColor,
          borderRadius: BorderRadius.circular(7.h),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              width: 2.w,
            ),
            CircleAvatar(
              radius: 6.h,
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
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    SizedBox(
                      height: 2.h,
                      width: 20.w,
                      child: const Rating(rate: 4),
                    )
                  ],
                ),
                SizedBox(
                  height: .5.h,
                ),
                Row(
                  children: [
                    CustomText(
                      data: 'Orders',
                      color: MyColors.placeHolderColor,
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    CustomText(
                      data: '250',
                      color: MyColors.placeHolderColor,
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
                    ),
                    SizedBox(
                      width: 7.w,
                    ),
                    CustomText(
                      data: '250',
                      color: MyColors.placeHolderColor,
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
