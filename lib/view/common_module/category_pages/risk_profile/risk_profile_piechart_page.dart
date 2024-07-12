
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:investocafe_flutter/utility/app_constant.dart';
import 'package:investocafe_flutter/view/common_module/category_pages/risk_profile/know_feature_risk_profile_page.dart';
import 'package:page_transition/page_transition.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:responsive_deva/responsive_deva.dart';

import '../../../../utility/color_theems.dart';
import '../../../utility_widget/utility_widgets.dart';
import '../../Home/bottom.dart';

class RiskProfilePieChart extends StatefulWidget {
  const RiskProfilePieChart({super.key});

  @override
  State<RiskProfilePieChart> createState() => _RiskProfilePieChartState();
}

class _RiskProfilePieChartState extends State<RiskProfilePieChart> {

  Map<String, double> dataMap = {
    "Debt fund/MIP:62.0": 5,
    "Equity fund/ELSS:37.0": 3,

  };




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backGroundColor,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: UtilityWidgets.MainText(
          "PieChart",
          size: 14.sp,
          color: AppColors.backGroundColor,
        ),
        leading: GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const BottomBarScreen(),));
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
                    Container(
                      padding: EdgeInsets.zero,
                      decoration: BoxDecoration(
                        color: AppColors.backGroundColor, // Background color
                        border: Border.all(color: AppColors.secondaryColor, width: 2),
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
                            "YOU ARE A MODERATE RISK TAKING INVESTOR",
                            size: 10.sp,
                            color: AppColors.titleText,
                          ),
                        ),
                      ),
                    ),

                    boxHeight(20),

                    Center(
                      child: PieChart(
                        colorList: [Colors.yellow.shade400, Colors.orangeAccent.shade400,], // Specify colors here
                        dataMap: dataMap,
                        chartRadius: MediaQuery.of(context).size.width / 1.7,
                        legendOptions: const LegendOptions(
                          showLegendsInRow:true ,
                          legendPosition: LegendPosition.bottom,
                        ),
                        chartValuesOptions: const ChartValuesOptions(
                          showChartValuesInPercentage: true,
                        ),
                      ),
                    ),

                    boxHeight(50),
                    InkWell(
                      onTap: (){
                        goNextScreen(to: const KnowFeatureRiskProfile(),side: PageTransitionType.bottomToTop);
                      },
                      child: UtilityWidgets.MainText(
                          "Click here to know features of your risk profile.",
                          size: 8.sp,color: AppColors.primaryColor,),
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
                    height: 20,
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
