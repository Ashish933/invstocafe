import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:page_transition/page_transition.dart';
import 'package:responsive_deva/responsive_deva.dart';

import '../../../../utility/app_constant.dart';
import '../../../../utility/color_theems.dart';
import '../../../utility_widget/utility_widgets.dart';
import '../../funds/equity/investment_type.dart';

class BeginInvestment extends StatefulWidget {
  const BeginInvestment({super.key});

  @override
  State<BeginInvestment> createState() => _BeginInvestmentState();
}

class _BeginInvestmentState extends State<BeginInvestment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backGroundColor,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: UtilityWidgets.MainText(
          "Begin Investment",
          size: 14.sp,
          color: AppColors.backGroundColor,
        ),
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
        child: SingleChildScrollView(
          child: AnimationLimiter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                 crossAxisAlignment: CrossAxisAlignment.center,
                children: AnimationConfiguration.toStaggeredList(
                  duration: const Duration(milliseconds: 700),
                  childAnimationBuilder: (widget) => SlideAnimation(
                    horizontalOffset: 60.0,
                    child: FadeInAnimation(
                      child: widget,
                    ),
                  ),
                  children: [
                    boxHeight(150),
                    Center(
                      child: Container(
                        width: getWidth(300),

                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(12),
                              child: Image.asset("assets/icons/other_funds.png",),
                            ),
                            InkWell(
                              onTap: (){
                                goNextScreen(to: const InvestmentType(),side: PageTransitionType.rightToLeft);
                              },
                              child: Container(
                                width: getWidth(300),

                                decoration: const BoxDecoration(
                                    color: Colors.blueAccent,
                                    borderRadius: BorderRadius.only(bottomRight: Radius.circular(12),
                                        bottomLeft: Radius.circular(12))
                                ),
                                padding: const EdgeInsets.all(12),
                                child:Center(
                                  child: UtilityWidgets.MainText("ONE TIME INVESTMENT",size: 12.sp,
                                    color: AppColors.backGroundColor
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),





                    boxHeight(50),
                    UtilityWidgets.MainText("----------OR-----------",size: 10.sp),

                    boxHeight(50),
                    Center(
                      child: Container(
                        width: getWidth(300),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            Container(
                              child: Image.asset("assets/icons/sip.png",),
                              padding: const EdgeInsets.all(12),
                            ),
                            InkWell(
                              onTap: (){
                                goNextScreen(to: const InvestmentType(),side: PageTransitionType.rightToLeft);
                              },
                              child: Container(
                                width: getWidth(300),

                                decoration: const BoxDecoration(
                                    color: Colors.blueAccent,
                                    borderRadius: BorderRadius.only(bottomRight: Radius.circular(12),
                                        bottomLeft: Radius.circular(12))
                                ),
                                child:Center(
                                  child: UtilityWidgets.MainText("START MONTHLY SIP",size: 12.sp,
                                      color: AppColors.backGroundColor
                                  ),
                                ),
                                padding: const EdgeInsets.all(12),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),


                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(top: 30, left: 20, right: 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  UtilityWidgets.MainText('Privacy Policy',
                      size: 9.sp, color: AppColors.titleText),
                  boxWidth(10),
                  Container(
                    height: 30,
                    width: 3,
                    color: AppColors.titleText,
                  ),
                  boxWidth(10),
                  UtilityWidgets.MainText('Terms of Use',
                      size: 9.sp, color: AppColors.titleText),
                ],
              ),
            ),

          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,

    );
  }
}
