import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:investocafe_flutter/utility/app_constant.dart';
import 'package:investocafe_flutter/view/utility_widget/custom_button.dart';
import 'package:investocafe_flutter/view/common_module/funds/equity/begin_investment.dart';
import 'package:page_transition/page_transition.dart';
import 'package:responsive_deva/responsive_deva.dart';

import '../../../../utility/color_theems.dart';
import '../../../utility_widget/otp_dailogbox.dart';
import '../../../utility_widget/utility_widgets.dart';
import '../equity/long_term_popup.dart';

class LiquidPage extends StatefulWidget {
  const LiquidPage({Key? key}) : super(key: key);

  @override
  State<LiquidPage> createState() => _LiquidPageState();
}

class _LiquidPageState extends State<LiquidPage> {

  List<DataRow> _generateRows() {
    List<DataRow> rows = [];

    // Example data, replace this with your actual data
    List<Map<String, String>> data = [
      {'Fund Name': 'Nippon india\nRetirement Fund-\nWealth Creation\nScheme', 'Invest Amt(Rs.)': '1000.00', 'Current Amt(Rs.)': '1200.00'},
      {'Fund Name': 'Nippon india\nRetirement Fund-\nWealth Creation\nScheme', 'Invest Amt(Rs.)': '2000.00', 'Current Amt(Rs.)': '2500.00'},
      {'Fund Name': 'Nippon india\nRetirement Fund-\nWealth Creation\nScheme', 'Invest Amt(Rs.)': '1500.00', 'Current Amt(Rs.)': '1800.00'},
      // Add more data rows as needed
    ];

    // Iterate over the data and create DataRow widgets
    for (int i = 0; i < data.length; i++) {
      rows.add(
        DataRow(
          cells: [
            DataCell(Text(data[i]['Fund Name']!)),
            DataCell(
              Text(data[i]['Invest Amt(Rs.)']!),
            ),
            DataCell(Text(data[i]['Current Amt(Rs.)']!)),
          ],
        ),
      );
    }

    return rows;
  }

  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
        backgroundColor: AppColors.backGroundColor,
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          title: UtilityWidgets.MainText(
            "Liquid",
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
        body:
        Padding(
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
                        children: [
                          UtilityWidgets.MainText("Sort term investments.FD alternatives",
                              size: 11.sp, color: AppColors.noteHintColor),
                          boxWidth(10),
                          InkWell(
                            onTap: () {
                              goNextScreen(
                                  to: const LogTermPopup(),
                                  side: PageTransitionType.bottomToTop);
                            },
                            // onTap: shoPopUp,
                            child: Image.asset(
                              "assets/icons/about-us.png",
                              scale: 2,
                            ),
                          ),
                        ],
                      ),
                      boxHeight(20),
                      UtilityWidgets.MainText("Rs.4017.71",
                          color: AppColors.secondaryColor, size: 14.sp),
                      boxHeight(20),
                      Container(
                        padding: EdgeInsets.all(1.w),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 1,
                              blurRadius: 2,
                              offset: const Offset(0, 1),
                            ),
                          ],
                          borderRadius:
                          const BorderRadius.all(Radius.circular(6)),
                        ),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              DataTable(
                                columnSpacing: 20,
                                dataRowHeight:
                                90, // Set the height of each DataRow
                                columns:  <DataColumn>[
                                  DataColumn(
                                      label: UtilityWidgets.MainText("Fund Name",size: 12.sp)),
                                  DataColumn(
                                      label: UtilityWidgets.MainText("Invest Amt(Rs.)",size: 12.sp)),
                                  DataColumn(
                                    label: UtilityWidgets.MainText("Current Amt(Rs.)",size: 12.sp),
                                  ),
                                ],
                                rows: _generateRows(),
                              ),
                            ],
                          ),
                        ),
                      ),
                      boxHeight(30),
                      UtilityWidgets.MainText(
                          "You have not invested in this category to begin\ninvestment click on begin investment button!!",
                          size: 9.sp,
                          color: AppColors.titleText),
                      boxHeight(50),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                              child: CustomButton.button("INVEST MORE", size: 10.sp,
                                  callBack: () {
                                    goNextScreen(to: BeginInvestment(),side: PageTransitionType.rightToLeft);
                                  })),
                          boxWidth(10),
                          Expanded(
                              child: CustomButton.button(
                                  "WITHDRAW", size: 10.sp,
                                  callBack: () {
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return OTPDialog();
                                      },
                                    );
                                  })),
                        ],
                      ),
                      boxHeight(10),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                              child: CustomButton.button("BACK", size: 10.sp,
                                  callBack: () {
                                    Navigator.pop(context);
                                  })),
                          boxWidth(10),
                          Expanded(
                              child: CustomButton.button(
                                  "CANCEL & MODIFY", size: 10.sp,
                                  callBack: () {})),
                        ],
                      ),
                      boxHeight(10),
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
              ),
            ),
          ),
        ),
      );
  }
}
