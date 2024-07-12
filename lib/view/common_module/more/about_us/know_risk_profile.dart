
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:investocafe_flutter/utility/color_theems.dart';
import 'package:responsive_deva/responsive_deva.dart';

import '../../../utility_widget/custom_button.dart';
import '../../../utility_widget/utility_widgets.dart';

class KnowRiskPagePage extends StatefulWidget {
  const KnowRiskPagePage({super.key});

  @override
  State<KnowRiskPagePage> createState() => _KnowRiskPagePageState();
}

class _KnowRiskPagePageState extends State<KnowRiskPagePage> {
  TextEditingController _nameCtr = TextEditingController();
  TextEditingController _emailCtr = TextEditingController();
  TextEditingController _phoneCtr = TextEditingController();

  bool value1 = false;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.backGroundColor,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: UtilityWidgets.MainText(
          "Risk Profile",
          size: 14.sp,
          color: AppColors.backGroundColor,
        ),
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Image.asset(
            "assets/images/arrow-narrow-left (1).png",
            scale: 2.9,
            color: Colors.white,
          ),
        ),
        backgroundColor: AppColors.secondaryColor,
      ),
      body: SingleChildScrollView(
        child: AnimationLimiter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Container(
              // height: double.infinity,
              margin: EdgeInsets.only(
                left: 1.w,
                right: 1.w,
                top: 2.h,
              ),
              padding: EdgeInsets.all(3.w),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5), //color of shadow
                    spreadRadius: 1, //spread radius
                    blurRadius: 7, // blur radius
                    offset: const Offset(0, 1), // changes position of shadow
                  ),
                ],
                borderRadius: const BorderRadius.all(Radius.circular(6)),
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: AnimationConfiguration.toStaggeredList(
                      duration: const Duration(milliseconds: 500),
                      childAnimationBuilder: (widget) => SlideAnimation(
                            horizontalOffset: 50.0,
                            child: FadeInAnimation(
                              child: widget,
                            ),
                          ),
                      children: [
                        Image.asset("assets/logo/splash.png",
                            // color: AppColors.backGroundColor,
                            height: height / 6),
                        UtilityWidgets.inputField(
                          hintTxt: "Enter Name",
                          controller: _nameCtr,
                          hrMargin: 0.0,
                          size: size,
                        ),
                        boxHeight(15),
                        UtilityWidgets.inputField(
                          hintTxt: "Enter Email",
                          controller: _emailCtr,
                          hrMargin: 0.0,
                          size: size,
                        ),
                        boxHeight(15),
                        UtilityWidgets.inputField(
                          hintTxt: "Enter Phone No.",
                          controller: _phoneCtr,
                          hrMargin: 0.0,
                          size: size,
                        ),
                        boxHeight(50),
                        Align(
                          alignment: Alignment.bottomRight,
                            child: CustomButton.button("NEXT", callBack: () {})),
                        boxHeight(400)
                      ]),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
