import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:investocafe_flutter/view/utility_widget/custom_button.dart';
import 'package:responsive_deva/responsive_deva.dart';

import '../../../../utility/color_theems.dart';
import '../../../utility_widget/custom_dropdown.dart';
import '../../../utility_widget/utility_widgets.dart';
import '../my_goals.dart';

List<Map<String, String>> setGoalsDataList = [];

class ChildrenEducation extends StatefulWidget {
  const ChildrenEducation({super.key});

  @override
  _ChildrenEducationState createState() => _ChildrenEducationState();
}

class _ChildrenEducationState extends State<ChildrenEducation> {
  List<String> dropdownItems1 = [
    '5,00,000', '6,00,000', '7,00,000', '8,00,000'
  ];

  List<String> dropdownItems2 = ['1', '2', '3', '4'];
  List<String> dropdownItems3 = ['4', '4.5', '5', '5.5'];
  List<String> dropdownItems4 = ['8', '9', '10', '11'];


  String dropdownValue1 = '5,00,000';
  String dropdownValue2 = '1';
  String dropdownValue3 = '4';
  String dropdownValue4 = '8';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.backGroundColor,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: UtilityWidgets.MainText(
          "Children Education",
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
                        UtilityWidgets.MainText("Cost of course in today's value (Rs.)",
                            size: 11.sp, color: AppColors.titleText),
                        boxHeight(5),

                        CustomDropdown(
                          itemList: dropdownItems1,
                          hintText: 'Select Cost',
                          onChanged: (String? value) {
                            setState(() {
                              dropdownValue1 = value!;
                            });
                            print('Selected item: $value');
                          },
                        ),
                        boxHeight(15),

                        UtilityWidgets.MainText("Number of year(s) to reach goal",
                            size: 11.sp, color: AppColors.titleText),
                        boxHeight(5),
                        CustomDropdown(
                          itemList: dropdownItems2,
                          hintText: 'Select year(s)',
                          onChanged: (String? value) {
                            setState(() {
                              dropdownValue2 = value!;
                            });
                            print('Selected item: $value');
                          },
                        ),
                        boxHeight(15),
                        UtilityWidgets.MainText("Expected inflation (%)",
                            size: 11.sp, color: AppColors.titleText),
                        boxHeight(5),
                        CustomDropdown(
                          itemList: dropdownItems3,
                          hintText: 'Select (%)',
                          onChanged: (String? value) {
                            setState(() {
                              dropdownValue3 = value!;
                            });
                            print('Selected item: $value');
                          },
                        ),
                        boxHeight(15),

                        UtilityWidgets.MainText("Expected return on investment(%)",
                            size: 11.sp, color: AppColors.titleText),
                        boxHeight(5),
                        CustomDropdown(
                          itemList: dropdownItems4,
                          hintText: 'Select (%)',
                          onChanged: (String? value) {
                            setState(() {
                              dropdownValue4 = value!;
                            });
                            print('Selected item: $value');
                          },
                        ),

                                  boxHeight(70),
                                  CustomButton.button("Calculate",callBack: (){
                                    setState(() {
                                      setGoalsDataList.add({
                                        'dropdownValue1': dropdownValue1,
                                         'dropdownValue2': dropdownValue2,
                                        'dropdownValue3': dropdownValue3,
                                         'dropdownValue4': dropdownValue4,
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
