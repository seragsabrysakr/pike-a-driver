import '../../../../../main.dart';
import '../../../../../presentaion/screens/main_screen/setting/payment/widget/addcard_widget.dart';
import '../../../../../presentaion/widget/custombutton.dart';
import '../../../../../presentaion/widget/customtext.dart';
import '../../../../../shared/colors.dart';
import '../../../../../shared/functions.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../../shared/resurces.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({Key? key}) : super(key: key);
  static const String id = 'payment screen';

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  bool switshed = true;

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
          data: App.tr.paymentDetails,
          size: 19.sp,
          weight: FontWeight.w800,
        ),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.shopping_cart)),
          SizedBox(
            width: 1.h,
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 3.h),
        child: Column(
          children: [
            //header
            _paymentHeader(context),
            //card
            _cardwidget(),
            SizedBox(
              height: 2.h,
            ),
            _cardwidget(),
            //footer
            SizedBox(
              height: 3.h,
            ),
            //addcard
            _paymentfooter(context),
          ],
        ),
      ),
    );
  }

  _cardwidget() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 1.9.w),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(.3),
                    spreadRadius: 3,
                    blurRadius: 7,
                    offset: const Offset(0, 5), // changes position of shadow
                  ),
                ],
                color: MyColors.textFormColor,
                borderRadius: BorderRadius.circular(10)),
            height: 22.h,
            width: double.infinity,
            child: Padding(
              padding: EdgeInsets.all(2.h),
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                            color: Colors.grey.shade500, width: .1.w),
                      ),
                    ),
                    height: 5.h,
                    child: Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomText(
                              data: App.tr.cardmethod,
                              color: MyColors.primarColor,
                              weight: FontWeight.w700,
                              size: 10.sp,
                            ),
                            Icon(
                              Icons.check_outlined,
                              color: MyColors.goldColor,
                              size: 3.h,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: .5.h,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(color: Colors.grey, width: .1.w),
                      ),
                    ),
                    height: 8.h,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          height: 3.7.h,
                          width: 15.w,
                          decoration: BoxDecoration(
                            image: const DecorationImage(
                                image: AssetImage(Resurces.visa),
                                fit: BoxFit.contain),
                            border: Border(
                              bottom: BorderSide(color: Colors.grey.shade200),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 4.w,
                        ),
                        CustomText(
                          data: App.tr.cardfack,
                          color: MyColors.primarColor,
                          weight: FontWeight.w600,
                          size: 10.sp,
                        ),
                        SizedBox(
                          width: 8.w,
                        ),
                        CustomButton(
                          ontap: () {},
                          // ontap: ,
                          fontsize: 7.sp,
                          text: App.tr.deletecard,
                          height: 4.h,
                          fontweight: FontWeight.w800,
                          width: 22.8.w, txtcolor: MyColors.goldColor,
                          butcolor: Colors.white,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 5.h,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {},
                          child: CustomText(
                            size: 10.sp,
                            data: App.tr.othermethods,
                            color: MyColors.primarColor,
                            weight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 1.5.h,
          ),
        ],
      ),
    );
  }

  _paymentHeader(context) {
    return Column(
      children: [
        SizedBox(
          height: 2.5.h,
        ),
        Container(
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(color: Colors.grey.shade200),
            ),
          ),
          height: MediaQuery.of(context).size.height * .05,
          width: double.infinity,
          child: CustomText(
            data: App.tr.paymentHeader,
            color: MyColors.primarColor,
            weight: FontWeight.w700,
            size: 14.sp,
          ),
        ),
        SizedBox(
          height: 3.h,
        ),
      ],
    );
  }

  _paymentfooter(context) {
    return CustomButton(
      height: 5.5.h,
      width: 73.8.w,
      fontsize: 11.sp,
      fontweight: FontWeight.w600,
      butcolor: Colors.white,
      txtcolor: MyColors.goldColor,
      ontap: () {
        bottomSheet(context, const AddCard());
      },
      text: App.tr.addanothercard,
    );
  }
}
