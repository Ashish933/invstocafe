import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:investocafe_flutter/view/utility_widget/custom_button.dart';
import 'package:investocafe_flutter/view/utility_widget/custom_dropdown.dart';
import 'package:investocafe_flutter/view/utility_widget/horizental_divider.dart';
import 'package:responsive_deva/responsive_deva.dart';

import '../../../utility/color_theems.dart';
import '../../../utility/date_formate_utility.dart';
import '../../../utility/date_picker_utils.dart';
import '../../../utility/date_time_container.dart';
import '../../utility_widget/utility_widgets.dart';

class STPFirstPlanPage extends StatefulWidget {
  const STPFirstPlanPage({super.key});

  @override
  State<STPFirstPlanPage> createState() => _STPFirstPlanPageState();
}

class _STPFirstPlanPageState extends State<STPFirstPlanPage> {
  TimeOfDay? startTime;
  DateTime? startDate;

  List<String> frequencyList = [
    'EveryDay',
    'Every Week',
    'Every 15 days',
    'Every Month',
  ];


  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: AppColors.backGroundColor,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: UtilityWidgets.MainText(
          "STP",
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
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: AnimationLimiter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: AnimationConfiguration.toStaggeredList(
                  duration: const Duration(milliseconds: 700),
                  childAnimationBuilder: (widget) => SlideAnimation(
                    horizontalOffset: 60.0,
                    // verticalOffset: 50.0,
                    child: FadeInAnimation(
                      child: widget,
                    ),
                  ),
                  children: [
                    boxHeight(20),
                    UtilityWidgets.MainText('Invest',
                        size: 14.sp, color: AppColors.titleText),
                    boxHeight(10),
                    invest(size),

                    boxHeight(20),
                    Horizontal.customDivider(),
                    boxHeight(20),
                    UtilityWidgets.MainText('Funds',
                        size: 14.sp, color: AppColors.titleText),
                    boxHeight(10),
                    funds(size),
                    boxHeight(20),
                    CustomButton.button("Submit",callBack: (){
                      Navigator.pop(context);

                    }),

                    boxHeight(50),




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

  Widget invest(Size? size) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Align(
                  alignment: Alignment.center,
                  child: UtilityWidgets.MainText(
                      "Nippon india Low Duration Fund-Growth Plan-Growth Option",
                      size: 9.sp,
                      color: AppColors.primaryColor),
                ),
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.center,
                  child: UtilityWidgets.MainText("Invest Amount",
                      size: 9.sp, color: AppColors.primaryColor),
                ),
              ),
            ],
          ),
          boxHeight(10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: DateTimeContainerWidget(
                  title: startDate != null
                      ? DateTimeUtil.dealDoxDateFormat(startDate.toString())
                      : 'Start date',
                  icon: Icons.calendar_month_outlined,
                  textColor: startDate != null
                      ? AppColors.titleText
                      : AppColors.textFieldHintText,
                  iconColor: AppColors.primaryColor,
                  onPressed: () async {
                    DateTime? selectedDate = await DatePickerUtils()
                        .showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime.now(),
                      lastDate: DateTime(2040, 01, 01),
                    );
                    if (selectedDate != null) {
                      setState(() {
                        startDate = selectedDate;
                      });
                    }
                  },
                ),

              ),
              boxWidth(13),
              Expanded(
                child: UtilityWidgets.inputField(
                  hintTxt: "Amt(Rs.)",
                  inputType: TextInputType.number,
                  hrMargin: 0.0,
                  size: size,
                ),
              ),
            ],
          ),

          boxHeight(20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: UtilityWidgets.MainText(
                      "Transaction Frequency",
                      size: 9.sp,
                      color: AppColors.primaryColor),
                ),
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.center,
                  child: UtilityWidgets.MainText("Amount use",
                      size: 9.sp, color: AppColors.primaryColor),
                ),
              ),
            ],
          ),
          boxHeight(10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: CustomDropdown(
                  itemList: frequencyList,
                  onChanged: (String? value) {  },
                  hintText: 'EveryDay',

                )
              ),
              boxWidth(13),
              Expanded(
                child: UtilityWidgets.inputField(
                  hintTxt: "Amt(Rs.)",
                  inputType: TextInputType.number,
                  hrMargin: 0.0,
                  size: size,
                ),
              ),
            ],
          ),



        ],
      ),
    );
  }

  Widget funds(Size? size) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Align(
                  alignment: Alignment.center,
                  child: UtilityWidgets.MainText(
                      "Nippon India Small Cap Fund-Gr(Regular Plan)",
                      size: 9.sp,
                      color: AppColors.primaryColor),
                ),
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.center,
                  child: UtilityWidgets.MainText("Nippon India Retirement Fund-Wealth Creation Scheme",
                      size: 9.sp, color: AppColors.primaryColor),
                ),
              ),
            ],
          ),
          boxHeight(10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child:  UtilityWidgets.inputField(
                  hintTxt: "Amt(Rs.)",
                  inputType: TextInputType.number,
                  hrMargin: 0.0,
                  size: size,
                ),
              ),
              boxWidth(13),
              Expanded(
                child: UtilityWidgets.inputField(
                  hintTxt: "Amt(Rs.)",
                  inputType: TextInputType.number,
                  hrMargin: 0.0,
                  size: size,
                ),
              ),
            ],
          ),

          boxHeight(20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: UtilityWidgets.MainText(
                      "Nippon India Tax Saver(ELSS) Fund",
                      size: 9.sp,
                      color: AppColors.primaryColor),
                ),
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.center,
                  child: UtilityWidgets.MainText("Nippon India Growth Fund-Growth",
                      size: 9.sp, color: AppColors.primaryColor),
                ),
              ),
            ],
          ),
          boxHeight(10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                  child:  UtilityWidgets.inputField(
                    hintTxt: "Amt(Rs.)",
                    inputType: TextInputType.number,
                    hrMargin: 0.0,
                    size: size,
                  ),
              ),
              boxWidth(13),
              Expanded(
                child: UtilityWidgets.inputField(
                  hintTxt: "Amt(Rs.)",
                  inputType: TextInputType.number,
                  hrMargin: 0.0,
                  size: size,
                ),
              ),
            ],
          ),
          boxHeight(20),
          Column(
            children: [
              UtilityWidgets.MainText("Nippon India Large Cap Fund-Growth Plan-Growth Option",
                  size: 9.sp, color: AppColors.primaryColor),
              boxHeight(10),

              UtilityWidgets.inputField(
                hintTxt: "Amt(Rs.)",
                inputType: TextInputType.number,
                hrMargin: 0.0,
                size: size,
              ),
            ],
          )




        ],
      ),
    );
  }

}
