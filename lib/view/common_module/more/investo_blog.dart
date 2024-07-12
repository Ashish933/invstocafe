import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:investocafe_flutter/utility/color_theems.dart';
import 'package:responsive_deva/responsive_deva.dart';



class InvestoBlog extends StatefulWidget {
  const InvestoBlog({Key? key}) : super(key: key);

  @override
  State<InvestoBlog> createState() => _InvestoBlogState();
}

class _InvestoBlogState extends State<InvestoBlog> {
  late final WebViewController controller;

  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..loadRequest(
        Uri.parse('https://www.investocafe.com/blogs/'),
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.secondaryColor,
        elevation: 0,
        centerTitle: true,
        leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Image.asset(
              "assets/images/arrow-narrow-left (1).png",
              scale: 2.9,
              color: AppColors.backGroundColor,
            )),
        title: Text("Investo Blog",
            style: TextStyle(
                fontSize: 14.sp,
                fontFamily: "Manrope-Bold",
                color: AppColors.backGroundColor)),
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
