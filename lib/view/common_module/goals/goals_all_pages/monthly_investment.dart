import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:investocafe_flutter/view/utility_widget/custom_button.dart';
import 'package:responsive_deva/responsive_deva.dart';

import '../../../../utility/color_theems.dart';
import '../../../utility_widget/utility_widgets.dart';
import '../my_goals.dart';
import 'children_education.dart';


class MonthlyInvestmentGoal extends StatefulWidget {
  const MonthlyInvestmentGoal({super.key});

  @override
  _MonthlyInvestmentGoalState createState() => _MonthlyInvestmentGoalState();
}

class _MonthlyInvestmentGoalState extends State<MonthlyInvestmentGoal> {


  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.backGroundColor,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: UtilityWidgets.MainText(
          "Monthly Investment",
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
      body:       Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Container(
          margin: EdgeInsets.only(
            left: 1.w,
            right: 1.w,
            top: 2.h,
          ),
          padding: EdgeInsets.only(left: 2.w,right: 2.w),
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
                        boxHeight(20),
                        UtilityWidgets.MainText("My target is(Rs.)",
                            size: 11.sp, color: AppColors.titleText),
                        boxHeight(5),
                        UtilityWidgets.inputField(
                          inputType: TextInputType.number,
                          hintTxt: "Enter Amount",
                          hrMargin: 0.0,
                          size: size,
                        ),


                        boxHeight(15),
                        UtilityWidgets.MainText("Number of month(s)",
                            size: 11.sp, color: AppColors.titleText),
                        boxHeight(5),
                        UtilityWidgets.inputField(
                          inputType: TextInputType.number,
                          hintTxt: "Enter month(s)",
                          hrMargin: 0.0,
                          size: size,
                        ),


                        boxHeight(15),
                        UtilityWidgets.MainText("Expectation of annual return on investment(in percent,CAGR)",
                            size: 11.sp, color: AppColors.titleText),
                        boxHeight(5),
                        UtilityWidgets.inputField(
                          inputType: TextInputType.number,
                          hintTxt: "Enter percent",
                          hrMargin: 0.0,
                          size: size,
                        ),



                        boxHeight(70),
                        CustomButton.button("Calculate",callBack: (){
                          setState(() {
                            setGoalsDataList.add({

                            });
                          });
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MyGoalSetPage(),
                            ),
                          );
                        }),
                        boxHeight(250),
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
