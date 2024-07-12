import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:investocafe_flutter/utility/color_theems.dart';
import 'package:responsive_deva/responsive_deva.dart';

import '../utility_widget/utility_widgets.dart';




class TermsCondition extends StatefulWidget {
  const TermsCondition({Key? key}) : super(key: key);

  @override
  State<TermsCondition> createState() => _TermsConditionState();
}

class _TermsConditionState extends State<TermsCondition> {
  late final WebViewController controller;

  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..loadRequest(
        Uri.parse('https://www.investocafe.com/termsOfUse'),
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backGroundColor,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: UtilityWidgets.MainText("TERMS & CONDITIONS FOR USE OF WEBSITE & SERVICES",
            size: 9.sp, color: AppColors.backGroundColor),
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context);
          },
          child: Image.asset(
            "assets/images/arrow-narrow-left (1).png",
            scale: 2.9,
            color: Colors.white,
          ),
        ),
        backgroundColor: AppColors.secondaryColor,
      ),

      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: WebViewWidget(
          controller: controller,
        ),
      ),
    );
  }
}
