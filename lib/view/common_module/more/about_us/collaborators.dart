import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:responsive_deva/responsive_deva.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../../../utility/color_theems.dart';
import '../../../utility_widget/utility_widgets.dart';

class Collaborators extends StatefulWidget {
  const Collaborators({super.key});

  @override
  State<Collaborators> createState() => _CollaboratorsState();
}

class _CollaboratorsState extends State<Collaborators> {
  late final WebViewController controller;

  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..loadRequest(
        Uri.parse('https://www.investocafe.com/assets/companyLogo/'),
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backGroundColor,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: UtilityWidgets.MainText("Collaborators",
            size: 14.sp, color: AppColors.backGroundColor),
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
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
