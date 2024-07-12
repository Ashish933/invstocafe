import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:responsive_deva/responsive_deva.dart';

import '../../../../utility/color_theems.dart';
import '../../../utility_widget/utility_widgets.dart';

class LogTermPopup extends StatefulWidget {
  const LogTermPopup({super.key});

  @override
  State<LogTermPopup> createState() => _LogTermPopupState();
}

class _LogTermPopupState extends State<LogTermPopup> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backGroundColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        centerTitle: true,
        title: UtilityWidgets.MainText(
          "Equity Funds",
          size: 14.sp,
          color: AppColors.secondaryColor,
        ),
        actions: [
          GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Padding(
                padding: EdgeInsets.only(right: 20),
                child: Icon(
                  Icons.cancel_outlined,
                  color: Colors.red,
                ),
              )),
        ],
        backgroundColor: AppColors.backGroundColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          margin: EdgeInsets.only(
            left: 1.w,
            right: 1.w,
            top: 1.h,
          ),
          padding: EdgeInsets.all(2.w),
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5), //color of shadow
                spreadRadius: 2, //spread radius
                blurRadius: 7, // blur radius
                offset: const Offset(0, 2), // changes position of shadow
              ),
            ],
            borderRadius: const BorderRadius.all(Radius.circular(6)),
          ),
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
                      // boxHeight(20),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          UtilityWidgets.MainText("○",
                              size: 11.sp, color: AppColors.noteHintColor),
                          boxWidth(5),
                          Expanded(
                            child: UtilityWidgets.MainText("An equity fund invests in stocks or we can say that,"
                                "Scheme might have an investment portfolio invested largely in equity shares"
                                "and equity-related investments like convertible debentures. They are also known"
                                "as equity securities or stock funds.The portfolio of a mutual fund scheme will"
                                "be driven by the stated investment objective of the scheme.",
                                size: 10.sp, color: AppColors.noteHintColor),
                          ),
                        ],
                      ),

                      boxHeight(10),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          UtilityWidgets.MainText("○",
                              size: 11.sp, color: AppColors.noteHintColor),
                          boxWidth(5),
                          Expanded(
                            child: UtilityWidgets.MainText("The objective of an equity fund is "
                                "long-term growth through capital gains, although historically"
                                " dividends have also been an important source of total return.",
                                size: 10.sp, color: AppColors.noteHintColor),
                          ),
                        ],
                      ),

                      boxHeight(10),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          UtilityWidgets.MainText("○",
                              size: 11.sp, color: AppColors.noteHintColor),
                          boxWidth(5),
                          Expanded(
                            child: UtilityWidgets.MainText("Specific equity funds may focus "
                                "on a certain sector of the market or may be geared"
                                " toward a certain level of risk.",
                                size: 10.sp, color: AppColors.noteHintColor),
                          ),
                        ],
                      ),

                      boxHeight(10),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          UtilityWidgets.MainText("○",
                              size: 11.sp, color: AppColors.noteHintColor),
                          boxWidth(5),
                          Expanded(
                            child: UtilityWidgets.MainText("Equity funds may have a specific style,"
                                " for example, value or growth.",
                                size: 10.sp, color: AppColors.noteHintColor),
                          ),
                        ],
                      ),

                      boxHeight(10),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          UtilityWidgets.MainText("○",
                              size: 11.sp, color: AppColors.noteHintColor),
                          boxWidth(5),
                          Expanded(
                            child: UtilityWidgets.MainText("Investments in equity funds provide best"
                                " results by beating inflation in long run.",
                                size: 10.sp, color: AppColors.noteHintColor),
                          ),
                        ],
                      ),

                      boxHeight(10),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          UtilityWidgets.MainText("○",
                              size: 11.sp, color: AppColors.noteHintColor),
                          boxWidth(5),
                          Expanded(
                            child: UtilityWidgets.MainText("They have the potential to fulfill all"
                                " the financial goals of the investor when selected with due care"
                                " and research.",
                                size: 10.sp, color: AppColors.noteHintColor),
                          ),
                        ],
                      ),

                      boxHeight(10),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          UtilityWidgets.MainText("○",
                              size: 11.sp, color: AppColors.noteHintColor),
                          boxWidth(5),
                          Expanded(
                            child: UtilityWidgets.MainText("INVESTOCAFE has made it simpler for "
                                "their investor by pre selecting equity funds having an outstanding"
                                " track record of growth over the long period of time.",
                                size: 10.sp, color: AppColors.noteHintColor),
                          ),
                        ],
                      ),

                      boxHeight(10),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          UtilityWidgets.MainText("○",
                              size: 11.sp, color: AppColors.noteHintColor),
                          boxWidth(5),
                          Expanded(
                            child: UtilityWidgets.MainText("Please feel free to call us on 0731-4043703 or write to us on info@investocafe.com for any queries.",
                                size: 10.sp, color: AppColors.noteHintColor),
                          ),
                        ],
                      ),


                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
