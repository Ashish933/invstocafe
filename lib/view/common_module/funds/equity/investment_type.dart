import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:page_transition/page_transition.dart';
import 'package:responsive_deva/responsive_deva.dart';

import '../../../../utility/app_constant.dart';
import '../../../../utility/color_theems.dart';
import '../../../utility_widget/utility_widgets.dart';

class InvestmentType extends StatefulWidget {
  const InvestmentType({super.key});

  @override
  State<InvestmentType> createState() => _InvestmentTypeState();
}

class _InvestmentTypeState extends State<InvestmentType> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backGroundColor,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: UtilityWidgets.MainText(
          "Investment Type",
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
      body:  Padding(
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
                    UtilityWidgets.MainText("How Would You like to invest?",size: 14.sp,color: AppColors.titleText),
                    boxHeight(30),

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
                              child: Image.asset("assets/icons/autotransfer.png",),
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
                                  child: UtilityWidgets.MainText("SET UP AUTOMATED TRANSFER",size: 11.sp,
                                      color: AppColors.backGroundColor
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    boxHeight(15),
                    UtilityWidgets.MainText("Schedule your investments on a date of your choice. "
                        "Your linked Bank Account (Bank - HDFC Bank Ltd."
                        "Account Number xxxxxxxx6063) will be debited automatically on the "
                        "scheduled date.The earliest day on which you can invest is Feb 29,2024 ",
                        size: 8.sp,color: AppColors.titleText),








                    boxHeight(15),
                    UtilityWidgets.MainText("----------OR-----------",size: 12.sp),

                    boxHeight(15),
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
                              child: Image.asset("assets/icons/netbanking.png",),
                            ),
                            Container(
                              width: getWidth(300),

                              decoration: const BoxDecoration(
                                  color: Colors.blueAccent,
                                  borderRadius: BorderRadius.only(bottomRight: Radius.circular(12),
                                      bottomLeft: Radius.circular(12))
                              ),
                              padding: const EdgeInsets.all(12),
                              child:Center(
                                child: UtilityWidgets.MainText("TRANSFER WITH NET BANKING",size: 11.sp,
                                    color: AppColors.backGroundColor
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    boxHeight(15),


                    UtilityWidgets.MainText("If your linked account is enabled for Net Banking, "
                        "you can invest today. you will need to authorised the fund transferby"
                        " logging in to your Bank's website",
                        size: 8.sp,color: AppColors.titleText),



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
