import '../../../../../../presentaion/widget/customtext.dart';
import '../../../../../../shared/functions.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../../../../main.dart';

class OurPolicy extends StatelessWidget {
  const OurPolicy({Key? key}) : super(key: key);
  static const String id = 'AboutUs screen';

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
          data: App.tr.aboutUs,
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
      body: const SafeArea(
        child: WebView(
          initialUrl: 'https://flutter.dev',
        ),
      ),
    );
  }
}
