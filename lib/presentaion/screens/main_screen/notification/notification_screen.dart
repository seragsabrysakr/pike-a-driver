
import 'package:delivery/presentaion/screens/main_screen/notification/widget/notifi_item.dart';

import '../../../../../../presentaion/widget/customtext.dart';
import '../../../../../../shared/functions.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../../main.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({Key? key}) : super(key: key);
  static const String id = 'notifi screen';

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
          data: App.tr.notifications,
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
      body: Column(
        children: [
          SizedBox(
            height: 2.h,
          ),
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return const NotificationItem();
              },
            ),
          ),
        ],
      ),
    );
  }
}
