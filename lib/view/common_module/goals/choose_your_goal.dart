import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:page_transition/page_transition.dart';
import 'package:responsive_deva/responsive_deva.dart';

import '../../../utility/app_constant.dart';
import '../../../utility/color_theems.dart';

import '../../utility_widget/utility_widgets.dart';
import 'goals_all_pages/car_goal.dart';
import 'goals_all_pages/children_education.dart';
import 'goals_all_pages/children_marriage.dart';
import 'goals_all_pages/foreign_tour.dart';
import 'goals_all_pages/house_goal.dart';
import 'goals_all_pages/monthly_investment.dart';
import 'goals_all_pages/my_sip.dart';
import 'goals_all_pages/retirement.dart';
import 'goals_all_pages/tax_saving_goal.dart';

class ChooseYourGoal extends StatelessWidget {


  final List pages = [
    const ChildrenEducation(),
    const ChildrenMarriage(),
    const RetirementGoal(),
    const HouseGoal(),
    const ForeignTourGoal(),
    const TaxSavingGoal(),
    const CarGoal(),
    const MySIPGoal(),
    const MonthlyInvestmentGoal(),

  ];

  List menuList = [
    _MenuItem("assets/icons/education.png", 'Children Education'),
    _MenuItem("assets/icons/marriage.png", 'Children Marriage'),
    _MenuItem("assets/icons/retirement.png", 'Retirement'),
    _MenuItem("assets/icons/house.png", 'House'),
    _MenuItem("assets/icons/foreign_tour.png", 'Foreign Tour'),
    _MenuItem("assets/icons/tax.png", 'Tax Saving'),
    _MenuItem("assets/icons/car.png", 'Car'),
    _MenuItem("assets/icons/sip.png", 'My Sip'),
    _MenuItem("assets/icons/mip.png", 'My Monthly investment'),
  ];

  ChooseYourGoal({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.backGroundColor,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: UtilityWidgets.MainText(
          "Choose Your's Goals",
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
      body: Container(
        margin: EdgeInsets.only(
          left: 3.w,
          right: 3.w,
          // top: 1.h,
        ),
        padding: EdgeInsets.all(2.w),
        decoration: BoxDecoration(
          color: AppColors.backGroundColor,
          boxShadow: [
            BoxShadow(
              color: AppColors.textFieldHintText
                  .withOpacity(0.5), //color of shadow
              spreadRadius: 2, //spread radius
              blurRadius: 7, // blur radius
              offset: const Offset(0, 2), // changes position of shadow
            ),
          ],
          borderRadius: const BorderRadius.all(Radius.circular(6)),
        ),
        child:
        GridView.builder(
          gridDelegate:
           const SliverGridDelegateWithFixedCrossAxisCount(
               crossAxisCount: 2),
          itemBuilder: (context, position,) {
            return Padding(
                padding: const EdgeInsets.all(10.0),
                child: InkWell(
                    onTap: () {
                      goNextScreen(to: pages[position],side: PageTransitionType.topToBottom);

                    },
                    child: Center(
                      child: Column(
                        children: [
                          Center(
                            child: Container(
                              height: height / 8,
                              width: width / 2,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppColors.backGroundColor, // Change color to white or any other color you prefer
                                boxShadow: [
                                  BoxShadow(
                                    color: AppColors.textFieldHintText, // Shadow color
                                    spreadRadius: 1, // Spread radius
                                    blurRadius: 7, // Blur radius
                                    offset: Offset(0, 2), // Offset from the container
                                  ),
                                ],
                              ),
                              child: Padding(
                                padding:  const EdgeInsets.all(10.0),
                                child: Image.asset(
                                  menuList[position].imagePath, // Use Image.asset here
                                 scale: 1,
                                ),
                              ),
                            ),
                          ),
                          boxHeight(20),
                          FittedBox(
                            fit: BoxFit.scaleDown,
                            child: UtilityWidgets.MainText(
                              menuList[position].title,
                              size: 12.sp,
                              color: AppColors.textColor,
                              textAlign: TextAlign.center,
                            ),
                          )

                        ],
                      ),
                    )));
          },
          itemCount: menuList.length,
        ),
      ),

    );
  }
}

class _MenuItem {
  final String imagePath;
  final String title;

  _MenuItem(this.imagePath
  , this.title);
}