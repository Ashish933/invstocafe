
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:responsive_deva/responsive_deva.dart';

import '../../../../utility/color_theems.dart';
import '../../../utility_widget/utility_widgets.dart';

class KnowFeatureRiskProfile extends StatefulWidget {
  const KnowFeatureRiskProfile({super.key});

  @override
  State<KnowFeatureRiskProfile> createState() => _KnowFeatureRiskProfileState();
}

class _KnowFeatureRiskProfileState extends State<KnowFeatureRiskProfile> {




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backGroundColor,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: UtilityWidgets.MainText(
          "Investor Type",
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
                    boxHeight(20),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        UtilityWidgets.MainText("○",
                            size: 11.sp, color: AppColors.noteHintColor),
                        boxWidth(5),
                        Expanded(
                          child: UtilityWidgets.MainText("Your risk profile suggests thar you are a Moderate risk taking investor",
                              size: 13.sp, color: AppColors.textColor),
                        ),
                      ],
                    ),
                    boxHeight(30),

                    Container(
                      padding: EdgeInsets.zero,
                      decoration: BoxDecoration(
                        color: AppColors.backGroundColor, // Background color
                        border: Border.all(color: AppColors.secondaryColor, width: 1),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5), // Shadow color
                            spreadRadius: 5, // Spread radius
                            blurRadius: 7, // Blur radius
                            offset: Offset(0, 3), // Offset in x and y axes
                          ),
                        ],
                      ),
                      child: Align(
                        alignment: Alignment.center,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 1.0, top: 20, bottom: 20),
                          child: UtilityWidgets.MainText(
                            "A MODERATE INVESTOR IS",
                            size: 10.sp,
                            color: AppColors.titleText,
                          ),
                        ),
                      ),
                    ),
                    boxHeight(30),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        UtilityWidgets.MainText("○",
                            size: 10.sp, color: AppColors.noteHintColor),
                        boxWidth(5),
                        Expanded(
                          child: UtilityWidgets.MainText("Looking for a balance between portfolio stability and portfolio appreciation",
                              size: 11.sp, color: AppColors.noteHintColor),
                        ),
                      ],
                    ),

                    boxHeight(30),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        UtilityWidgets.MainText("○",
                            size: 10.sp, color: AppColors.noteHintColor),
                        boxWidth(5),
                        Expanded(
                          child: UtilityWidgets.MainText("Willing and able to accept a moderate level of risk and return",
                              size: 11.sp, color: AppColors.noteHintColor),
                        ),
                      ],
                    ),

                    boxHeight(30),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        UtilityWidgets.MainText("○",
                            size: 10.sp, color: AppColors.noteHintColor),
                        boxWidth(5),
                        Expanded(
                          child: UtilityWidgets.MainText("An investor focused on growth but looking for great diversification",
                              size: 11.sp, color: AppColors.noteHintColor),
                        ),
                      ],
                    ),

                    boxHeight(30),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        UtilityWidgets.MainText("○",
                            size: 10.sp, color: AppColors.noteHintColor),
                        boxWidth(5),
                        Expanded(
                          child: UtilityWidgets.MainText("Someone with a portfolio that primarily includes a balance of investments in bonds and equities",
                              size: 11.sp, color: AppColors.noteHintColor),
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



    );
  }
}
