import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:investocafe_flutter/view/utility_widget/custom_button.dart';
import 'package:responsive_deva/responsive_deva.dart';

import '../../../../utility/color_theems.dart';
import '../../../utility_widget/utility_widgets.dart';
import '../my_goals.dart';
import 'children_education.dart';


class TaxSavingGoal extends StatefulWidget {
  const TaxSavingGoal({super.key});

  @override
  _TaxSavingGoalState createState() => _TaxSavingGoalState();
}

class _TaxSavingGoalState extends State<TaxSavingGoal> {


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
          "Tax Saving",
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
                        UtilityWidgets.MainText("Total Income of the year",
                            size: 11.sp, color: AppColors.titleText),
                        boxHeight(5),
                        UtilityWidgets.inputField(
                          inputType: TextInputType.number,
                          hintTxt: "Enter Amount",
                          hrMargin: 0.0,
                          size: size,
                        ),


                        boxHeight(15),
                        UtilityWidgets.MainText("Employee Provident Fund(EPF)",
                            size: 11.sp, color: AppColors.titleText),
                        boxHeight(5),
                        UtilityWidgets.inputField(
                          inputType: TextInputType.number,
                          hintTxt: "Enter Amount",
                          hrMargin: 0.0,
                          size: size,
                        ),


                        boxHeight(15),
                        UtilityWidgets.MainText("Public Provident Fund(PPF)",
                            size: 11.sp, color: AppColors.titleText),
                        boxHeight(5),
                        UtilityWidgets.inputField(
                          inputType: TextInputType.number,
                          hintTxt: "Enter Amount",
                          hrMargin: 0.0,
                          size: size,
                        ),


                        boxHeight(15),
                        UtilityWidgets.MainText("Premium for Life Insurance",
                            size: 11.sp, color: AppColors.titleText),
                        boxHeight(5),
                        UtilityWidgets.inputField(
                          inputType: TextInputType.number,
                          hintTxt: "Enter Amount",
                          hrMargin: 0.0,
                          size: size,
                        ),

                        boxHeight(15),
                        UtilityWidgets.MainText("5 Year Bank Fixed Deposit",
                            size: 11.sp, color: AppColors.titleText),
                        boxHeight(5),
                        UtilityWidgets.inputField(
                          inputType: TextInputType.number,
                          hintTxt: "Enter Amount",
                          hrMargin: 0.0,
                          size: size,
                        ),


                        boxHeight(15),
                        UtilityWidgets.MainText("Repayment for House Loan(Principal portion)",
                            size: 11.sp, color: AppColors.titleText),
                        boxHeight(5),
                        UtilityWidgets.inputField(
                          inputType: TextInputType.text,
                          hintTxt: "Enter Amount",
                          hrMargin: 0.0,
                          size: size,
                        ),


                        boxHeight(15),
                        UtilityWidgets.MainText("tuition Fees for children",
                            size: 11.sp, color: AppColors.titleText),
                        boxHeight(5),
                        UtilityWidgets.inputField(
                          inputType: TextInputType.text,
                          hintTxt: "Enter Amount",
                          hrMargin: 0.0,
                          size: size,
                        ),


                        boxHeight(15),
                        UtilityWidgets.MainText("Others",
                            size: 11.sp, color: AppColors.titleText),
                        boxHeight(5),
                        UtilityWidgets.inputField(
                          inputType: TextInputType.text,
                          hintTxt: "Enter Amount",
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
