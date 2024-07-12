import 'package:flutter/material.dart';
import 'package:investocafe_flutter/utility/app_constant.dart';
import 'package:investocafe_flutter/view/utility_widget/utility_widgets.dart';
import 'package:investocafe_flutter/view/common_module/more/other_section/web_view.dart';
import 'package:page_transition/page_transition.dart';
import 'package:responsive_deva/responsive_deva.dart';

import '../../../../utility/color_theems.dart';


class OtherSectionScreen extends StatefulWidget {
  const OtherSectionScreen({Key? key}) : super(key: key);

  @override
  State<OtherSectionScreen> createState() => _OtherSectionScreenState();
}

class _OtherSectionScreenState extends State<OtherSectionScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backGroundColor,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: UtilityWidgets.MainText("Other Section",
            size: 12.sp, color: AppColors.backGroundColor),
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
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 1.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 4.h), // Adjust the height as needed
              InkWell(
                onTap: (){
                  print("calling");
                    goNextScreen(to: const WebViewApp(),side: PageTransitionType.rightToLeft);

                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: AppColors.textFieldHintText,width: 1),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 7,
                        offset: const Offset(0, 2),
                      ),
                    ],
                    borderRadius: const BorderRadius.all(Radius.circular(6)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: UtilityWidgets.MainText("Go Through\n       Extra",
                      size: 12.sp,color: AppColors.secondaryColor),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
