import 'package:delivery/presentaion/screens/main_screen/inbox/widget/inbox_item.dart';

import '../../../../../../presentaion/widget/customtext.dart';
import '../../../../../../shared/functions.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../../main.dart';

class InBoxScreen extends StatelessWidget {
  const InBoxScreen({Key? key}) : super(key: key);
  static const String id = 'my orders screen';

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
          data: App.tr.inbox,
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
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 2.h,
            ),
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return const InboxItem();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
